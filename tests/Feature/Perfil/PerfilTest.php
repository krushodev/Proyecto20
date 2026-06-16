<?php

use Illuminate\Support\Facades\Hash;

// ─── Ver / Editar ─────────────────────────────────────────────────────────

it('cliente puede ver su perfil', function () {
    $this->actingAs(crearCliente())->get('/perfil')->assertStatus(200);
});

it('cliente puede ver el formulario de edicion de su perfil', function () {
    $this->actingAs(crearCliente())->get('/perfil/editar')->assertStatus(200);
});

it('invitado es redirigido al login al intentar ver su perfil', function () {
    $this->get('/perfil')->assertRedirect('/login');
});

// ─── Actualizar ─────────────────────────────────────────────────────────

it('cliente puede actualizar nombre y email de su perfil', function () {
    $cliente = crearCliente(['nombre' => 'Nombre Viejo', 'email' => 'viejo@example.com']);

    $this->actingAs($cliente)->put('/perfil', [
        'nombre' => 'Nombre Nuevo',
        'email'  => 'nuevo@example.com',
    ])->assertRedirect(route('perfil.ver'));

    $fresh = $cliente->fresh();
    expect($fresh->nombre)->toBe('Nombre Nuevo');
    expect($fresh->email)->toBe('nuevo@example.com');
});

it('actualizar perfil sin password no modifica la password actual', function () {
    $cliente = crearCliente(['password' => Hash::make('passwordOriginal1')]);
    $hashOriginal = $cliente->password;

    $this->actingAs($cliente)->put('/perfil', [
        'nombre' => $cliente->nombre,
        'email'  => $cliente->email,
    ])->assertRedirect(route('perfil.ver'));

    expect($cliente->fresh()->password)->toBe($hashOriginal);
});

it('cliente puede cambiar su password desde el perfil', function () {
    $cliente = crearCliente(['password' => Hash::make('passwordVieja1')]);

    $this->actingAs($cliente)->put('/perfil', [
        'nombre'                => $cliente->nombre,
        'email'                 => $cliente->email,
        'password'              => 'passwordNueva2',
        'password_confirmation' => 'passwordNueva2',
    ])->assertRedirect(route('perfil.ver'));

    expect(Hash::check('passwordNueva2', $cliente->fresh()->password))->toBeTrue();
});

it('actualizar perfil permite mantener el mismo email (unicidad laxa)', function () {
    $cliente = crearCliente(['email' => 'mismo@example.com']);

    $this->actingAs($cliente)->put('/perfil', [
        'nombre' => 'Otro Nombre',
        'email'  => 'mismo@example.com',
    ])->assertRedirect(route('perfil.ver'));

    expect($cliente->fresh()->nombre)->toBe('Otro Nombre');
});

it('actualizar perfil rechaza email ya usado por otro usuario', function () {
    crearCliente(['email' => 'ocupado@example.com']);
    $cliente = crearCliente(['email' => 'mio@example.com']);

    $this->actingAs($cliente)->put('/perfil', [
        'nombre' => $cliente->nombre,
        'email'  => 'ocupado@example.com',
    ])->assertSessionHasErrors(['email']);

    expect($cliente->fresh()->email)->toBe('mio@example.com');
});

it('actualizar perfil valida que nombre y email sean requeridos', function () {
    $this->actingAs(crearCliente())->put('/perfil', [])
        ->assertSessionHasErrors(['nombre', 'email']);
});

it('actualizar perfil rechaza password menor a 8 caracteres', function () {
    $cliente = crearCliente();

    $this->actingAs($cliente)->put('/perfil', [
        'nombre'                => $cliente->nombre,
        'email'                 => $cliente->email,
        'password'              => 'short',
        'password_confirmation' => 'short',
    ])->assertSessionHasErrors(['password']);
});

it('actualizar perfil rechaza password y confirmacion que no coinciden', function () {
    $cliente = crearCliente();

    $this->actingAs($cliente)->put('/perfil', [
        'nombre'                => $cliente->nombre,
        'email'                 => $cliente->email,
        'password'              => 'passwordNueva2',
        'password_confirmation' => 'otraDistinta3',
    ])->assertSessionHasErrors(['password']);
});

it('actualizar perfil rechaza numero de tarjeta con formato invalido', function () {
    $cliente = crearCliente();

    $this->actingAs($cliente)->put('/perfil', [
        'nombre'         => $cliente->nombre,
        'email'          => $cliente->email,
        'numero_tarjeta' => 'no-es-una-tarjeta',
    ])->assertSessionHasErrors(['numero_tarjeta']);
});

it('actualizar perfil acepta numero de tarjeta con formato valido', function () {
    $cliente = crearCliente();

    $this->actingAs($cliente)->put('/perfil', [
        'nombre'         => $cliente->nombre,
        'email'          => $cliente->email,
        'numero_tarjeta' => '4111 1111 1111 1111',
    ])->assertRedirect(route('perfil.ver'));

    expect($cliente->fresh()->numero_tarjeta)->toBe('4111 1111 1111 1111');
});

it('actualizar perfil rechaza vencimiento de tarjeta con formato invalido', function () {
    $cliente = crearCliente();

    $this->actingAs($cliente)->put('/perfil', [
        'nombre'              => $cliente->nombre,
        'email'               => $cliente->email,
        'vencimiento_tarjeta' => '2030',
    ])->assertSessionHasErrors(['vencimiento_tarjeta']);
});

it('actualizar perfil rechaza cvv con formato invalido', function () {
    $cliente = crearCliente();

    $this->actingAs($cliente)->put('/perfil', [
        'nombre'    => $cliente->nombre,
        'email'     => $cliente->email,
        'cvv_tarjeta' => 'abcd',
    ])->assertSessionHasErrors(['cvv_tarjeta']);
});

it('invitado es redirigido al login al intentar actualizar perfil', function () {
    $this->put('/perfil', ['nombre' => 'X', 'email' => 'x@x.com'])
        ->assertRedirect('/login');
});

// ─── Control de acceso (admin no usa rutas de cliente) ────────────────────

it('admin es redirigido al panel al intentar acceder a /perfil de cliente', function () {
    $this->actingAs(crearAdmin())->get('/perfil')->assertRedirect(route('admin.panel'));
});
