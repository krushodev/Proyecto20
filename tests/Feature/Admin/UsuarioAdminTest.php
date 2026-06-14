<?php

use App\Models\Usuario;

// ─── Index ────────────────────────────────────────────────────────────────

it('admin puede ver la lista de usuarios', function () {
    crearCliente();
    crearCliente();

    $this->actingAs(crearAdmin())->get('/admin/usuarios')->assertStatus(200);
});

// ─── Create / Store ───────────────────────────────────────────────────────

it('admin puede ver el formulario de creacion de usuario', function () {
    $this->actingAs(crearAdmin())->get('/admin/usuarios/create')->assertStatus(200);
});

it('admin puede crear un nuevo usuario', function () {
    $admin = crearAdmin();
    $rol   = crearRol('cliente');

    $this->actingAs($admin)->post('/admin/usuarios', [
        'nombre'                => 'Nuevo Cliente',
        'email'                 => 'nuevo@test.com',
        'password'              => 'password123',
        'password_confirmation' => 'password123',
        'rol_id'                => $rol->id,
    ])->assertRedirect(route('usuarios.index'));

    $this->assertDatabaseHas('usuarios', ['email' => 'nuevo@test.com']);
});

it('store valida que los campos requeridos esten presentes', function () {
    $this->actingAs(crearAdmin())->post('/admin/usuarios', [])
         ->assertSessionHasErrors(['nombre', 'email', 'password', 'rol_id']);
});

it('store rechaza email duplicado', function () {
    crearCliente(['email' => 'duplicado@test.com']);
    $rol = crearRol('cliente');

    $this->actingAs(crearAdmin())->post('/admin/usuarios', [
        'nombre'                => 'Otro',
        'email'                 => 'duplicado@test.com',
        'password'              => 'password123',
        'password_confirmation' => 'password123',
        'rol_id'                => $rol->id,
    ])->assertSessionHasErrors(['email']);
});

it('store rechaza password menor a 8 caracteres', function () {
    $rol = crearRol('cliente');

    $this->actingAs(crearAdmin())->post('/admin/usuarios', [
        'nombre'                => 'Test',
        'email'                 => 'test@test.com',
        'password'              => 'short',
        'password_confirmation' => 'short',
        'rol_id'                => $rol->id,
    ])->assertSessionHasErrors(['password']);
});

it('store rechaza rol_id que no existe', function () {
    $this->actingAs(crearAdmin())->post('/admin/usuarios', [
        'nombre'                => 'Test',
        'email'                 => 'test@test.com',
        'password'              => 'password123',
        'password_confirmation' => 'password123',
        'rol_id'                => 99999,
    ])->assertSessionHasErrors(['rol_id']);
});

// ─── Edit / Update ────────────────────────────────────────────────────────

it('admin puede ver el formulario de edicion de usuario', function () {
    $usuario = crearCliente();

    $this->actingAs(crearAdmin())->get('/admin/usuarios/' . $usuario->id . '/edit')
         ->assertStatus(200);
});

it('admin puede actualizar nombre y rol de un usuario', function () {
    $usuario  = crearCliente(['nombre' => 'Original']);
    $rolAdmin = crearRol('admin');

    $this->actingAs(crearAdmin())->put('/admin/usuarios/' . $usuario->id, [
        'nombre' => 'Actualizado',
        'email'  => $usuario->email,
        'rol_id' => $rolAdmin->id,
    ])->assertRedirect(route('usuarios.index'));

    $fresh = $usuario->fresh();

    expect($fresh->nombre)->toBe('Actualizado');
    expect($fresh->rol_id)->toBe($rolAdmin->id);
});

it('update valida campos requeridos', function () {
    $usuario = crearCliente();

    $this->actingAs(crearAdmin())->put('/admin/usuarios/' . $usuario->id, [])
         ->assertSessionHasErrors(['nombre', 'email', 'rol_id']);
});

it('update permite mismo email del propio usuario (unicidad laxa)', function () {
    $usuario = crearCliente(['email' => 'mi@email.com']);
    $rol     = crearRol('cliente');

    $this->actingAs(crearAdmin())->put('/admin/usuarios/' . $usuario->id, [
        'nombre' => $usuario->nombre,
        'email'  => 'mi@email.com',
        'rol_id' => $rol->id,
    ])->assertRedirect(route('usuarios.index'));
});

// ─── Destroy ─────────────────────────────────────────────────────────────

it('admin puede eliminar (soft delete) a otro usuario', function () {
    $admin   = crearAdmin();
    $cliente = crearCliente();
    $id      = $cliente->id;

    $this->actingAs($admin)->delete('/admin/usuarios/' . $id)
         ->assertRedirect(route('usuarios.index'));

    expect(Usuario::find($id))->toBeNull();
    expect(Usuario::withTrashed()->find($id))->not->toBeNull();
});

it('admin NO puede eliminarse a si mismo', function () {
    $admin = crearAdmin();

    $this->actingAs($admin)->delete('/admin/usuarios/' . $admin->id)
         ->assertSessionHasErrors(['delete']);

    expect(Usuario::find($admin->id))->not->toBeNull();
});

it('la proteccion de auto-eliminacion devuelve el mensaje correcto', function () {
    $admin = crearAdmin();

    $response = $this->actingAs($admin)->delete('/admin/usuarios/' . $admin->id);

    $response->assertSessionHasErrors(['delete' => 'No podés eliminarte a vos mismo.']);
});

// ─── Control de acceso ────────────────────────────────────────────────────

it('cliente recibe 403 al intentar ver la lista de usuarios admin', function () {
    $this->actingAs(crearCliente())->get('/admin/usuarios')->assertStatus(403);
});

it('cliente recibe 403 al intentar crear usuario desde admin', function () {
    $this->actingAs(crearCliente())->post('/admin/usuarios', [])->assertStatus(403);
});

it('cliente recibe 403 al intentar eliminar usuario desde admin', function () {
    $usuario = crearCliente();
    $this->actingAs(crearCliente())->delete('/admin/usuarios/' . $usuario->id)->assertStatus(403);
});

// ─── Admin: perfil propio ─────────────────────────────────────────────────

it('admin puede ver su perfil de administrador', function () {
    $this->actingAs(crearAdmin())->get('/admin/perfil')->assertStatus(200);
});

it('admin puede actualizar su propio perfil', function () {
    $admin = crearAdmin(['nombre' => 'Admin Original']);

    $this->actingAs($admin)->put('/admin/perfil', [
        'nombre' => 'Admin Actualizado',
        'email'  => $admin->email,
    ])->assertRedirect();

    expect($admin->fresh()->nombre)->toBe('Admin Actualizado');
});
