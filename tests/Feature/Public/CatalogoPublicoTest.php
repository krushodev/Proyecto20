<?php

use App\Models\Categoria;
use App\Models\Producto;

// ─── Catálogo ─────────────────────────────────────────────────────────────

it('el catalogo lista productos activos', function () {
    $categoria = crearCategoria();
    $producto  = crearProducto(['categoria_id' => $categoria->id, 'nombre' => 'Reloj Visible']);

    $response = $this->get(route('catalogo'));

    $response->assertStatus(200);
    expect($response->getContent())->toContain('Reloj Visible');
});

it('el catalogo no lista productos inactivos', function () {
    $categoria = crearCategoria();
    crearProducto(['categoria_id' => $categoria->id, 'nombre' => 'Reloj Inactivo', 'activo' => false]);

    $response = $this->get(route('catalogo'));

    $response->assertStatus(200);
    expect($response->getContent())->not->toContain('Reloj Inactivo');
});

it('el catalogo no lista productos eliminados (soft delete)', function () {
    $categoria = crearCategoria();
    $producto  = crearProducto(['categoria_id' => $categoria->id, 'nombre' => 'Reloj Eliminado']);
    $producto->delete();

    $response = $this->get(route('catalogo'));

    $response->assertStatus(200);
    expect($response->getContent())->not->toContain('Reloj Eliminado');
});

it('el catalogo no lista categorias inactivas aunque tengan productos activos', function () {
    $categoria = crearCategoria(['nombre' => 'Linea Oculta', 'activo' => false]);
    crearProducto(['categoria_id' => $categoria->id, 'nombre' => 'Reloj De Linea Oculta']);

    $response = $this->get(route('catalogo'));

    $response->assertStatus(200);
    expect($response->getContent())->not->toContain('Reloj De Linea Oculta');
});

it('el filtro por linea no lista productos inactivos de esa linea', function () {
    $categoria = crearCategoria(['slug' => 'linea-test']);
    crearProducto(['categoria_id' => $categoria->id, 'nombre' => 'Reloj Filtro Inactivo', 'activo' => false]);

    $response = $this->get(route('catalogo', ['linea' => 'linea-test']));

    $response->assertStatus(200);
    expect($response->getContent())->not->toContain('Reloj Filtro Inactivo');
});

// ─── Detalle de producto ────────────────────────────────────────────────────

it('el detalle de producto activo es visible', function () {
    $producto = crearProducto(['nombre' => 'Reloj Detalle Visible']);

    $response = $this->get(route('detalle-producto', $producto->slug));

    $response->assertStatus(200);
    expect($response->getContent())->toContain('Reloj Detalle Visible');
});

it('el detalle de un producto inactivo devuelve 404', function () {
    $producto = crearProducto(['nombre' => 'Reloj Detalle Inactivo', 'activo' => false]);

    $response = $this->get(route('detalle-producto', $producto->slug));

    $response->assertStatus(404);
});

it('el detalle de un producto eliminado (soft delete) devuelve 404', function () {
    $producto = crearProducto(['nombre' => 'Reloj Detalle Eliminado']);
    $slug     = $producto->slug;
    $producto->delete();

    $response = $this->get(route('detalle-producto', $slug));

    $response->assertStatus(404);
});

it('el detalle de un producto desactivado luego de ser visible deja de estar accesible', function () {
    $producto = crearProducto(['nombre' => 'Reloj Que Se Desactiva']);

    $this->get(route('detalle-producto', $producto->slug))->assertStatus(200);

    $producto->update(['activo' => false]);

    $this->get(route('detalle-producto', $producto->slug))->assertStatus(404);
});
