<?php

use App\Models\Categoria;
use App\Models\Producto;

// ─── Index ────────────────────────────────────────────────────────────────

it('admin puede ver la lista de productos', function () {
    Producto::factory()->count(3)->create();

    $this->actingAs(crearAdmin())->get('/admin/productos')->assertStatus(200);
});

// ─── Create / Store ───────────────────────────────────────────────────────

it('admin puede ver el formulario de creacion de producto', function () {
    $this->actingAs(crearAdmin())->get('/admin/productos/create')->assertStatus(200);
});

it('admin puede crear un producto basico', function () {
    $admin     = crearAdmin();
    $categoria = Categoria::factory()->create();

    $this->actingAs($admin)->post('/admin/productos', [
        'categoria_id' => $categoria->id,
        'nombre'       => 'Reloj Test',
        'slug'         => 'reloj-test',
        'precio'       => 50000,
        'stock'        => 10,
        'activo'       => true,
    ])->assertRedirect(route('productos.index'));

    $this->assertDatabaseHas('productos', ['slug' => 'reloj-test', 'nombre' => 'Reloj Test']);
});

it('admin puede crear un producto con imagenes lifestyle y studio', function () {
    $admin     = crearAdmin();
    $categoria = Categoria::factory()->create();

    $this->actingAs($admin)->post('/admin/productos', [
        'categoria_id'    => $categoria->id,
        'nombre'          => 'Reloj Con Imagenes',
        'slug'            => 'reloj-con-imagenes',
        'precio'          => 80000,
        'stock'           => 5,
        'activo'          => true,
        'imagen_lifestyle'=> 'https://example.com/lifestyle.jpg',
        'imagen_studio'   => 'https://example.com/studio.jpg',
    ])->assertRedirect(route('productos.index'));

    $producto = Producto::where('slug', 'reloj-con-imagenes')->first();

    expect($producto->imagenes)->toHaveCount(2);
    expect($producto->imagen_lifestyle)->toBe('https://example.com/lifestyle.jpg');
    expect($producto->imagen_studio)->toBe('https://example.com/studio.jpg');
});

it('store valida que los campos requeridos esten presentes', function () {
    // prepareForValidation convierte activo ausente a false, por eso no falla required.
    // Los campos que SÍ generan error son los demás.
    $this->actingAs(crearAdmin())->post('/admin/productos', [])
         ->assertSessionHasErrors(['categoria_id', 'nombre', 'slug', 'precio', 'stock']);
});

it('store rechaza slug duplicado', function () {
    $categoria = Categoria::factory()->create();
    Producto::factory()->create(['slug' => 'slug-duplicado', 'categoria_id' => $categoria->id]);

    $this->actingAs(crearAdmin())->post('/admin/productos', [
        'categoria_id' => $categoria->id,
        'nombre'       => 'Otro Reloj',
        'slug'         => 'slug-duplicado',
        'precio'       => 10000,
        'stock'        => 5,
        'activo'       => true,
    ])->assertSessionHasErrors(['slug']);
});

it('store rechaza precio negativo', function () {
    $categoria = Categoria::factory()->create();

    $this->actingAs(crearAdmin())->post('/admin/productos', [
        'categoria_id' => $categoria->id,
        'nombre'       => 'Test',
        'slug'         => 'test-precio',
        'precio'       => -1000,
        'stock'        => 5,
        'activo'       => true,
    ])->assertSessionHasErrors(['precio']);
});

it('store rechaza stock negativo', function () {
    $categoria = Categoria::factory()->create();

    $this->actingAs(crearAdmin())->post('/admin/productos', [
        'categoria_id' => $categoria->id,
        'nombre'       => 'Test',
        'slug'         => 'test-stock',
        'precio'       => 10000,
        'stock'        => -1,
        'activo'       => true,
    ])->assertSessionHasErrors(['stock']);
});

it('store rechaza categoria_id que no existe', function () {
    $this->actingAs(crearAdmin())->post('/admin/productos', [
        'categoria_id' => 99999,
        'nombre'       => 'Test',
        'slug'         => 'test-cat',
        'precio'       => 10000,
        'stock'        => 5,
        'activo'       => true,
    ])->assertSessionHasErrors(['categoria_id']);
});

// ─── Edit / Update ────────────────────────────────────────────────────────

it('admin puede ver el formulario de edicion de producto', function () {
    $producto = Producto::factory()->create();

    $this->actingAs(crearAdmin())->get('/admin/productos/' . $producto->id . '/edit')
         ->assertStatus(200);
});

it('admin puede actualizar nombre y precio de un producto', function () {
    $producto  = Producto::factory()->create(['nombre' => 'Nombre Original']);
    $categoria = Categoria::factory()->create();

    $this->actingAs(crearAdmin())->put('/admin/productos/' . $producto->id, [
        'categoria_id' => $categoria->id,
        'nombre'       => 'Nombre Actualizado',
        'slug'         => $producto->slug,
        'precio'       => 999999,
        'stock'        => $producto->stock,
        'activo'       => true,
    ])->assertRedirect(route('productos.index'));

    $fresh = $producto->fresh();

    expect($fresh->nombre)->toBe('Nombre Actualizado');
    expect((float) $fresh->precio)->toBe(999999.0);
});

it('update permite mismo slug del propio producto (unicidad laxa)', function () {
    $producto = Producto::factory()->create(['slug' => 'mi-slug']);

    $this->actingAs(crearAdmin())->put('/admin/productos/' . $producto->id, [
        'categoria_id' => $producto->categoria_id,
        'nombre'       => $producto->nombre,
        'slug'         => 'mi-slug', // mismo slug, misma instancia
        'precio'       => $producto->precio,
        'stock'        => $producto->stock,
        'activo'       => true,
    ])->assertRedirect(route('productos.index'));

    expect($producto->fresh()->slug)->toBe('mi-slug');
});

it('update elimina imagenes cuando no se proveen URLs nuevas', function () {
    $producto = Producto::factory()->create();
    $producto->imagenes()->createMany([
        ['url' => 'https://old.com/lifestyle.jpg', 'tipo' => 'lifestyle', 'orden' => 0],
        ['url' => 'https://old.com/studio.jpg',    'tipo' => 'studio',    'orden' => 1],
    ]);

    $this->actingAs(crearAdmin())->put('/admin/productos/' . $producto->id, [
        'categoria_id' => $producto->categoria_id,
        'nombre'       => $producto->nombre,
        'slug'         => $producto->slug,
        'precio'       => $producto->precio,
        'stock'        => $producto->stock,
        'activo'       => true,
        // Sin imagen_lifestyle ni imagen_studio
    ]);

    expect($producto->fresh()->imagenes)->toHaveCount(0);
});

it('update reemplaza imagen existente con nueva URL', function () {
    $producto = Producto::factory()->create();
    $producto->imagenes()->create(['url' => 'https://old.com/ls.jpg', 'tipo' => 'lifestyle', 'orden' => 0]);

    $this->actingAs(crearAdmin())->put('/admin/productos/' . $producto->id, [
        'categoria_id'    => $producto->categoria_id,
        'nombre'          => $producto->nombre,
        'slug'            => $producto->slug,
        'precio'          => $producto->precio,
        'stock'           => $producto->stock,
        'activo'          => true,
        'imagen_lifestyle'=> 'https://new.com/ls-nueva.jpg',
    ]);

    $producto->load('imagenes');

    expect($producto->imagenes)->toHaveCount(1);
    expect($producto->imagen_lifestyle)->toBe('https://new.com/ls-nueva.jpg');
});

// ─── Destroy ─────────────────────────────────────────────────────────────

it('admin puede hacer soft delete de un producto', function () {
    $producto = Producto::factory()->create();
    $id       = $producto->id;

    $this->actingAs(crearAdmin())->delete('/admin/productos/' . $id)
         ->assertRedirect(route('productos.index'));

    expect(Producto::find($id))->toBeNull();
    expect(Producto::withTrashed()->find($id))->not->toBeNull();
});

it('producto soft-deleted ya no es accesible desde el catalogo publico', function () {
    $producto = crearProducto(['activo' => true]);
    $slug     = $producto->slug;

    $this->actingAs(crearAdmin())->delete('/admin/productos/' . $producto->id);

    // Verificar que no existe en la busqueda activa
    expect(Producto::where('slug', $slug)->where('activo', true)->first())->toBeNull();
});

// ─── Control de acceso ────────────────────────────────────────────────────

it('cliente recibe 403 al intentar crear producto', function () {
    $this->actingAs(crearCliente())->post('/admin/productos', [])->assertStatus(403);
});

it('cliente recibe 403 al intentar editar producto', function () {
    $producto = Producto::factory()->create();
    $this->actingAs(crearCliente())->get('/admin/productos/' . $producto->id . '/edit')->assertStatus(403);
});

it('cliente recibe 403 al intentar eliminar producto', function () {
    $producto = Producto::factory()->create();
    $this->actingAs(crearCliente())->delete('/admin/productos/' . $producto->id)->assertStatus(403);
});
