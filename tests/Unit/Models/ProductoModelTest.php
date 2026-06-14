<?php

use App\Models\Categoria;
use App\Models\Producto;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(Tests\TestCase::class, RefreshDatabase::class);

it('pertenece a una categoria', function () {
    $categoria = Categoria::factory()->create();
    $producto  = Producto::factory()->create(['categoria_id' => $categoria->id]);

    expect($producto->categoria)->toBeInstanceOf(Categoria::class);
    expect($producto->categoria->id)->toBe($categoria->id);
});

it('tiene muchas imagenes ordenadas por orden', function () {
    $producto = Producto::factory()->create();
    $producto->imagenes()->createMany([
        ['url' => 'https://example.com/studio.jpg',    'tipo' => 'studio',    'orden' => 1],
        ['url' => 'https://example.com/lifestyle.jpg', 'tipo' => 'lifestyle', 'orden' => 0],
    ]);

    $tipos = $producto->imagenes->pluck('tipo')->toArray();

    expect($tipos[0])->toBe('lifestyle');
    expect($tipos[1])->toBe('studio');
});

it('accessor imagen_lifestyle devuelve url correcta con relacion cargada', function () {
    $producto = Producto::factory()->create();
    $producto->imagenes()->create(['url' => 'https://example.com/lifestyle.jpg', 'tipo' => 'lifestyle', 'orden' => 0]);

    $producto->load('imagenes');

    expect($producto->imagen_lifestyle)->toBe('https://example.com/lifestyle.jpg');
});

it('accessor imagen_studio devuelve url correcta con relacion cargada', function () {
    $producto = Producto::factory()->create();
    $producto->imagenes()->create(['url' => 'https://example.com/studio.jpg', 'tipo' => 'studio', 'orden' => 1]);

    $producto->load('imagenes');

    expect($producto->imagen_studio)->toBe('https://example.com/studio.jpg');
});

it('accessor imagen_lifestyle retorna null si no existe imagen', function () {
    $producto = Producto::factory()->create();
    $producto->load('imagenes');

    expect($producto->imagen_lifestyle)->toBeNull();
});

it('accessor imagen_studio retorna null si no existe imagen', function () {
    $producto = Producto::factory()->create();
    $producto->load('imagenes');

    expect($producto->imagen_studio)->toBeNull();
});

it('accessor imagen_lifestyle consulta BD cuando la relacion no esta cargada', function () {
    $producto = Producto::factory()->create();
    $producto->imagenes()->create(['url' => 'https://example.com/ls.jpg', 'tipo' => 'lifestyle', 'orden' => 0]);

    // No cargar la relacion — debe consultar DB igualmente
    $fresh = Producto::find($producto->id);

    expect($fresh->imagen_lifestyle)->toBe('https://example.com/ls.jpg');
});

it('aplica soft delete', function () {
    $producto = Producto::factory()->create();
    $id       = $producto->id;

    $producto->delete();

    expect(Producto::find($id))->toBeNull();
    expect(Producto::withTrashed()->find($id))->not->toBeNull();
});

it('castea precio como decimal', function () {
    $producto = Producto::factory()->create(['precio' => 12345.678]);

    expect((float) $producto->precio)->toBe(12345.68);
});

it('castea activo como boolean', function () {
    $activo   = Producto::factory()->create(['activo' => 1]);
    $inactivo = Producto::factory()->create(['activo' => 0]);

    expect($activo->activo)->toBeTrue();
    expect($inactivo->activo)->toBeFalse();
});

it('castea stock como integer', function () {
    $producto = Producto::factory()->create(['stock' => '42']);

    expect($producto->stock)->toBeInt();
    expect($producto->stock)->toBe(42);
});
