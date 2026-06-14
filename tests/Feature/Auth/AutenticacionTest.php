<?php

use Illuminate\Support\Facades\Hash;

// ─── Login ────────────────────────────────────────────────────────────────

it('muestra la pagina de login a invitados', function () {
    $this->get('/login')->assertStatus(200);
});

it('redirige al usuario ya autenticado que intenta acceder a /login', function () {
    $this->actingAs(crearCliente())->get('/login')->assertRedirect();
});

it('autentica a un cliente y lo redirige al home', function () {
    $cliente = crearCliente(['password' => Hash::make('password123')]);

    $this->post('/login', [
        'email'    => $cliente->email,
        'password' => 'password123',
    ])->assertRedirect('/');

    $this->assertAuthenticatedAs($cliente);
});

it('autentica a un admin y lo redirige al panel de admin', function () {
    $admin = crearAdmin(['password' => Hash::make('password123')]);

    $this->post('/login', [
        'email'    => $admin->email,
        'password' => 'password123',
    ])->assertRedirect(route('admin.panel'));

    $this->assertAuthenticatedAs($admin);
});

it('rechaza credenciales incorrectas y mantiene al usuario como invitado', function () {
    crearCliente(['email' => 'user@test.com', 'password' => Hash::make('correctpass')]);

    $this->post('/login', [
        'email'    => 'user@test.com',
        'password' => 'wrongpass',
    ])->assertSessionHasErrors(['email']);

    $this->assertGuest();
});

it('valida que email y password son requeridos en el login', function () {
    $this->post('/login', [])->assertSessionHasErrors(['email', 'password']);
});

it('valida que el email tiene formato valido', function () {
    $this->post('/login', [
        'email'    => 'not-an-email',
        'password' => 'password',
    ])->assertSessionHasErrors(['email']);
});

it('valida que el password tiene minimo 8 caracteres', function () {
    $this->post('/login', [
        'email'    => 'test@test.com',
        'password' => 'short',
    ])->assertSessionHasErrors(['password']);
});

// ─── Registro ─────────────────────────────────────────────────────────────

it('muestra la pagina de registro a invitados', function () {
    $this->get('/registro')->assertStatus(200);
});

it('redirige al usuario ya autenticado que intenta acceder a /registro', function () {
    $this->actingAs(crearCliente())->get('/registro')->assertRedirect();
});

it('registra un nuevo cliente, lo loguea y redirige al home', function () {
    crearRol('cliente');

    $this->post('/registro', [
        'nombre'                => 'Nuevo Usuario',
        'email'                 => 'nuevo@example.com',
        'password'              => 'password123',
        'password_confirmation' => 'password123',
    ])->assertRedirect('/');

    $this->assertAuthenticated();
    $this->assertDatabaseHas('usuarios', ['email' => 'nuevo@example.com']);
});

it('registra al usuario con rol cliente automaticamente', function () {
    $rolCliente = crearRol('cliente');

    $this->post('/registro', [
        'nombre'                => 'Nuevo Cliente',
        'email'                 => 'cliente@example.com',
        'password'              => 'password123',
        'password_confirmation' => 'password123',
    ]);

    $usuario = \App\Models\Usuario::where('email', 'cliente@example.com')->first();

    expect($usuario->rol_id)->toBe($rolCliente->id);
});

it('rechaza email duplicado en el registro', function () {
    crearCliente(['email' => 'existing@example.com']);

    $this->post('/registro', [
        'nombre'                => 'Otro',
        'email'                 => 'existing@example.com',
        'password'              => 'password123',
        'password_confirmation' => 'password123',
    ])->assertSessionHasErrors(['email']);

    $this->assertGuest();
});

it('rechaza cuando password y confirmacion no coinciden', function () {
    $this->post('/registro', [
        'nombre'                => 'Test',
        'email'                 => 'test@example.com',
        'password'              => 'password123',
        'password_confirmation' => 'diferente456',
    ])->assertSessionHasErrors(['password']);
});

it('valida que el nombre tiene al menos 2 caracteres', function () {
    $this->post('/registro', [
        'nombre'                => 'A',
        'email'                 => 'test@example.com',
        'password'              => 'password123',
        'password_confirmation' => 'password123',
    ])->assertSessionHasErrors(['nombre']);
});

// ─── Logout ───────────────────────────────────────────────────────────────

it('desloguea al usuario autenticado y redirige al home', function () {
    $this->actingAs(crearCliente());

    $this->post('/logout')->assertRedirect('/');

    $this->assertGuest();
});

it('un invitado que intenta hacer logout es redirigido al login', function () {
    $this->post('/logout')->assertRedirect('/login');
});
