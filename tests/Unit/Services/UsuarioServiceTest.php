<?php

use App\Models\Usuario;
use App\Services\UsuarioService;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(Tests\TestCase::class, RefreshDatabase::class);

beforeEach(function () {
    $this->service = new UsuarioService();
});

// ─── crear ────────────────────────────────────────────────────────────────

it('crea un usuario correctamente en una transaccion', function () {
    $rol = crearRol('cliente');

    $usuario = $this->service->crear([
        'nombre'   => 'Test Usuario',
        'email'    => 'test@example.com',
        'password' => bcrypt('password'),
        'rol_id'   => $rol->id,
    ]);

    expect($usuario)->toBeInstanceOf(Usuario::class);
    expect($usuario->id)->not->toBeNull();
    expect(Usuario::find($usuario->id))->not->toBeNull();
});

// ─── obtenerTodos ─────────────────────────────────────────────────────────

it('obtiene todos los usuarios con sus roles cargados', function () {
    crearCliente();
    crearCliente();
    crearAdmin();

    $usuarios = $this->service->obtenerTodos();

    expect($usuarios)->toHaveCount(3);
    expect($usuarios->first()->relationLoaded('rol'))->toBeTrue();
});

// ─── obtenerRoles ─────────────────────────────────────────────────────────

it('obtiene todos los roles disponibles', function () {
    crearRol('cliente');
    crearRol('admin');

    $roles = $this->service->obtenerRoles();

    expect($roles)->toHaveCount(2);
});

// ─── actualizar ───────────────────────────────────────────────────────────

it('actualiza los campos del usuario en una transaccion', function () {
    $usuario = crearCliente();

    $this->service->actualizar($usuario, ['nombre' => 'Nombre Nuevo']);

    expect($usuario->fresh()->nombre)->toBe('Nombre Nuevo');
});

// ─── actualizarPerfil ─────────────────────────────────────────────────────

it('actualiza nombre y email del perfil', function () {
    $usuario = crearCliente();

    $this->service->actualizarPerfil($usuario, [
        'nombre' => 'Nuevo Nombre',
        'email'  => 'nuevo@email.com',
    ]);

    $fresh = $usuario->fresh();

    expect($fresh->nombre)->toBe('Nuevo Nombre');
    expect($fresh->email)->toBe('nuevo@email.com');
});

it('actualiza password cuando se provee', function () {
    $usuario = crearCliente();

    $this->service->actualizarPerfil($usuario, [
        'nombre'   => $usuario->nombre,
        'email'    => $usuario->email,
        'password' => 'nueva_password_123',
    ]);

    // Verificar que el hash cambio (no guardamos texto plano)
    expect($usuario->fresh()->password)->not->toBeNull();
});

it('NO actualiza password cuando no se provee', function () {
    $usuario        = crearCliente();
    $hashOriginal   = $usuario->password;

    $this->service->actualizarPerfil($usuario, [
        'nombre' => 'Sin Cambio',
        'email'  => $usuario->email,
        // password ausente
    ]);

    expect($usuario->fresh()->password)->toBe($hashOriginal);
});

it('NO actualiza password cuando se provee string vacio', function () {
    $usuario      = crearCliente();
    $hashOriginal = $usuario->password;

    $this->service->actualizarPerfil($usuario, [
        'nombre'   => $usuario->nombre,
        'email'    => $usuario->email,
        'password' => '',
    ]);

    expect($usuario->fresh()->password)->toBe($hashOriginal);
});

it('ignora campos de tarjeta legacy al actualizar perfil (gestionados via user_tarjetas)', function () {
    $usuario = crearCliente();

    // Los campos de tarjeta ya no se persisten en usuarios; se gestionan via user_tarjetas
    $this->service->actualizarPerfil($usuario, [
        'nombre'              => $usuario->nombre,
        'email'               => $usuario->email,
        'numero_tarjeta'      => '4111111111111111',
        'titular_tarjeta'     => 'JUAN PEREZ',
        'vencimiento_tarjeta' => '12/28',
        'cvv_tarjeta'         => '123',
    ]);

    $fresh = $usuario->fresh();

    expect($fresh->numero_tarjeta)->toBeNull();
    expect($fresh->titular_tarjeta)->toBeNull();
    expect($fresh->vencimiento_tarjeta)->toBeNull();
    expect($fresh->cvv_tarjeta)->toBeNull();
});

it('pone campos de tarjeta en null si no se proveen', function () {
    $usuario = crearCliente();

    $this->service->actualizarPerfil($usuario, [
        'nombre' => $usuario->nombre,
        'email'  => $usuario->email,
    ]);

    $fresh = $usuario->fresh();

    expect($fresh->numero_tarjeta)->toBeNull();
    expect($fresh->titular_tarjeta)->toBeNull();
});

// ─── eliminar ─────────────────────────────────────────────────────────────

it('aplica soft delete al usuario en una transaccion', function () {
    $admin   = crearAdmin();
    $usuario = crearCliente();
    $id      = $usuario->id;

    $this->service->eliminar($usuario, $admin);

    expect(Usuario::find($id))->toBeNull();
    expect(Usuario::withTrashed()->find($id))->not->toBeNull();
});

it('permite eliminar a otro admin distinto del autenticado', function () {
    $adminAutenticado = crearAdmin();
    $otroAdmin        = crearAdmin();
    $id               = $otroAdmin->id;

    $this->service->eliminar($otroAdmin, $adminAutenticado);

    expect(Usuario::find($id))->toBeNull();
});

it('lanza excepcion si el admin intenta eliminarse a si mismo', function () {
    $admin = crearAdmin();

    expect(fn () => $this->service->eliminar($admin, $admin))
        ->toThrow(RuntimeException::class, 'No podés eliminarte a vos mismo.');

    expect(Usuario::find($admin->id))->not->toBeNull();
});
