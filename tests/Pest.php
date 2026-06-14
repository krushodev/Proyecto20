<?php

use App\Models\Categoria;
use App\Models\Producto;
use App\Models\Rol;
use App\Models\Usuario;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

pest()->extend(TestCase::class)
    ->use(RefreshDatabase::class)
    ->in('Feature');

expect()->extend('toBeOne', function () {
    return $this->toBe(1);
});

// ─── Helpers globales ──────────────────────────────────────────────────────

function crearRol(string $nombre): Rol
{
    return Rol::firstOrCreate(['nombre' => $nombre]);
}

function crearCliente(array $attrs = []): Usuario
{
    $rol = crearRol('cliente');

    return Usuario::factory()->create(array_merge(['rol_id' => $rol->id], $attrs));
}

function crearAdmin(array $attrs = []): Usuario
{
    $rol = crearRol('admin');

    return Usuario::factory()->create(array_merge(['rol_id' => $rol->id], $attrs));
}

function crearCategoria(array $attrs = []): Categoria
{
    return Categoria::factory()->create($attrs);
}

function crearProducto(array $attrs = []): Producto
{
    $categoriaId = $attrs['categoria_id'] ?? crearCategoria()->id;

    return Producto::factory()->create(array_merge(['categoria_id' => $categoriaId], $attrs));
}
