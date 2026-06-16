<?php

use App\Models\Usuario;
use App\Notifications\ResetPasswordNotification;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Password;

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

// ─── Forgot password ────────────────────────────────────────────────────

it('muestra la pagina de forgot-password a invitados', function () {
    $this->get('/forgot-password')->assertStatus(200);
});

it('envia el link de reseteo cuando el email existe', function () {
    Notification::fake();

    $usuario = crearCliente(['email' => 'existe@example.com']);

    $this->post('/forgot-password', ['email' => 'existe@example.com'])
        ->assertRedirect();

    Notification::assertSentTo($usuario, ResetPasswordNotification::class);
});

it('forgot-password con email inexistente devuelve error y no envia notificacion', function () {
    Notification::fake();

    // El proyecto usa el mensaje default de Laravel, que SÍ revela si el
    // email no está registrado (passwords.user no fue customizado).
    $this->post('/forgot-password', ['email' => 'noexiste@example.com'])
        ->assertSessionHasErrors(['email']);

    Notification::assertNothingSent();
});

it('forgot-password valida que el email sea requerido', function () {
    $this->post('/forgot-password', [])->assertSessionHasErrors(['email']);
});

it('forgot-password valida formato de email', function () {
    $this->post('/forgot-password', ['email' => 'not-an-email'])
        ->assertSessionHasErrors(['email']);
});

// ─── Reset password ─────────────────────────────────────────────────────

it('muestra la pagina de reset-password con un token en la URL', function () {
    $this->get('/reset-password/algun-token-cualquiera')->assertStatus(200);
});

it('resetea la password con un token valido y permite loguear con la nueva', function () {
    $usuario = crearCliente(['email' => 'reset@example.com', 'password' => Hash::make('viejaPass123')]);

    $token = Password::createToken($usuario);

    $this->post('/reset-password', [
        'token'                 => $token,
        'email'                 => 'reset@example.com',
        'password'              => 'nuevaPass456',
        'password_confirmation' => 'nuevaPass456',
    ])->assertRedirect(route('login'));

    $this->post('/login', [
        'email'    => 'reset@example.com',
        'password' => 'nuevaPass456',
    ])->assertRedirect('/');

    $this->assertAuthenticatedAs($usuario->fresh());
});

it('rechaza reset-password con token invalido', function () {
    $usuario = crearCliente(['email' => 'tokeninvalido@example.com']);

    $this->post('/reset-password', [
        'token'                 => 'token-que-no-existe',
        'email'                 => 'tokeninvalido@example.com',
        'password'              => 'nuevaPass456',
        'password_confirmation' => 'nuevaPass456',
    ])->assertSessionHasErrors(['email']);
});

it('rechaza reset-password con token expirado', function () {
    $usuario = crearCliente(['email' => 'expirado@example.com']);

    // expire=60 minutos según config/auth.php: generamos el token y
    // simulamos que pasó más tiempo del permitido viajando en el tiempo.
    $token = Password::createToken($usuario);

    $this->travel(61)->minutes();

    $this->post('/reset-password', [
        'token'                 => $token,
        'email'                 => 'expirado@example.com',
        'password'              => 'nuevaPass456',
        'password_confirmation' => 'nuevaPass456',
    ])->assertSessionHasErrors(['email']);
});

it('reset-password valida password minimo 8 caracteres', function () {
    $usuario = crearCliente(['email' => 'corta@example.com']);
    $token   = Password::createToken($usuario);

    $this->post('/reset-password', [
        'token'                 => $token,
        'email'                 => 'corta@example.com',
        'password'              => 'short',
        'password_confirmation' => 'short',
    ])->assertSessionHasErrors(['password']);
});

it('reset-password valida que password y confirmacion coincidan', function () {
    $usuario = crearCliente(['email' => 'nocoincide@example.com']);
    $token   = Password::createToken($usuario);

    $this->post('/reset-password', [
        'token'                 => $token,
        'email'                 => 'nocoincide@example.com',
        'password'              => 'nuevaPass456',
        'password_confirmation' => 'diferente789',
    ])->assertSessionHasErrors(['password']);
});

it('un token de reset ya usado no puede reutilizarse', function () {
    $usuario = crearCliente(['email' => 'reusado@example.com']);
    $token   = Password::createToken($usuario);

    $this->post('/reset-password', [
        'token'                 => $token,
        'email'                 => 'reusado@example.com',
        'password'              => 'primeraPass1',
        'password_confirmation' => 'primeraPass1',
    ])->assertRedirect(route('login'));

    // Intentar reutilizar el mismo token ya consumido
    $this->post('/reset-password', [
        'token'                 => $token,
        'email'                 => 'reusado@example.com',
        'password'              => 'segundaPass2',
        'password_confirmation' => 'segundaPass2',
    ])->assertSessionHasErrors(['email']);
});
