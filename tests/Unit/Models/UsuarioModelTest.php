<?php

use App\Models\Rol;
use App\Models\Usuario;
use App\Models\VentaCabecera;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(Tests\TestCase::class, RefreshDatabase::class);

it('pertenece a un rol', function () {
    $rol     = crearRol('cliente');
    $usuario = Usuario::factory()->create(['rol_id' => $rol->id]);

    expect($usuario->rol)->toBeInstanceOf(Rol::class);
    expect($usuario->rol->nombre)->toBe('cliente');
});

it('tiene muchas ventas', function () {
    $usuario = crearCliente();
    VentaCabecera::factory()->count(3)->create(['user_id' => $usuario->id]);

    expect($usuario->ventas)->toHaveCount(3);
});

it('tiene muchas direcciones ordenadas por alias', function () {
    $usuario = crearCliente();
    $usuario->direcciones()->createMany([
        ['alias' => 'Trabajo', 'calle' => 'Av. 9 de Julio', 'numero' => '1', 'ciudad' => 'La Plata', 'provincia' => 'BA', 'cp' => '1900'],
        ['alias' => 'Casa',    'calle' => 'Calle 13',       'numero' => '2', 'ciudad' => 'La Plata', 'provincia' => 'BA', 'cp' => '1900'],
    ]);

    $aliases = $usuario->direcciones->pluck('alias')->toArray();

    expect($aliases)->toBe(['Casa', 'Trabajo']);
});

it('oculta password y remember_token en toArray', function () {
    $usuario = crearCliente();
    $array   = $usuario->toArray();

    expect($array)->not->toHaveKey('password');
    expect($array)->not->toHaveKey('remember_token');
});

it('aplica soft delete', function () {
    $usuario = crearCliente();
    $id      = $usuario->id;

    $usuario->delete();

    expect(Usuario::find($id))->toBeNull();
    expect(Usuario::withTrashed()->find($id))->not->toBeNull();
});

it('usuario sin rol tiene rol nulo', function () {
    $usuario = Usuario::factory()->create(['rol_id' => null]);

    expect($usuario->rol)->toBeNull();
});

it('la relacion ventas solo devuelve ventas del usuario', function () {
    $u1 = crearCliente();
    $u2 = crearCliente();

    VentaCabecera::factory()->count(2)->create(['user_id' => $u1->id]);
    VentaCabecera::factory()->count(4)->create(['user_id' => $u2->id]);

    expect($u1->ventas)->toHaveCount(2);
    expect($u2->ventas)->toHaveCount(4);
});
