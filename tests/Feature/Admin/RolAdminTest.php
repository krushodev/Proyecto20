<?php

use App\Models\Rol;
use App\Models\Usuario;

// ─── Index ────────────────────────────────────────────────────────────────

it('admin puede ver la lista de roles', function () {
    crearRol('cliente');
    crearRol('admin');

    $this->actingAs(crearAdmin())->get('/admin/roles')->assertStatus(200);
});

// ─── Store ────────────────────────────────────────────────────────────────

it('admin puede crear un nuevo rol', function () {
    $this->actingAs(crearAdmin())->post('/admin/roles', [
        'nombre' => 'supervisor',
    ])->assertRedirect(route('roles.index'));

    $this->assertDatabaseHas('roles', ['nombre' => 'supervisor']);
});

it('store valida que el nombre sea requerido', function () {
    $this->actingAs(crearAdmin())->post('/admin/roles', [])
        ->assertSessionHasErrors(['nombre']);
});

it('store rechaza nombre de rol duplicado', function () {
    crearRol('supervisor');

    $this->actingAs(crearAdmin())->post('/admin/roles', [
        'nombre' => 'supervisor',
    ])->assertSessionHasErrors(['nombre']);
});

// ─── Destroy ─────────────────────────────────────────────────────────────

it('admin puede eliminar (soft delete) un rol sin usuarios asociados', function () {
    $rol = crearRol('temporal');
    $id  = $rol->id;

    $this->actingAs(crearAdmin())->delete('/admin/roles/' . $id)
        ->assertRedirect(route('roles.index'));

    $this->assertSoftDeleted('roles', ['id' => $id]);
});

it('eliminar un rol con usuarios asociados no elimina ni rompe a esos usuarios', function () {
    $rol     = crearRol('con-usuarios');
    $usuario = Usuario::factory()->create(['rol_id' => $rol->id]);

    $this->actingAs(crearAdmin())->delete('/admin/roles/' . $rol->id)
        ->assertRedirect(route('roles.index'));

    expect(Rol::find($rol->id))->toBeNull();
    // El usuario sigue existiendo y conserva la referencia al rol (soft-deleted).
    expect(Usuario::find($usuario->id))->not->toBeNull();
    expect($usuario->fresh()->rol_id)->toBe($rol->id);
});

it('eliminar rol inexistente retorna 404', function () {
    $this->actingAs(crearAdmin())->delete('/admin/roles/99999')
        ->assertStatus(404);
});

// ─── Control de acceso ────────────────────────────────────────────────────

it('cliente recibe 403 al intentar ver la lista de roles', function () {
    $this->actingAs(crearCliente())->get('/admin/roles')->assertStatus(403);
});

it('cliente recibe 403 al intentar crear un rol', function () {
    $this->actingAs(crearCliente())->post('/admin/roles', ['nombre' => 'hack'])
        ->assertStatus(403);
});

it('cliente recibe 403 al intentar eliminar un rol', function () {
    $rol = crearRol('protegido');

    $this->actingAs(crearCliente())->delete('/admin/roles/' . $rol->id)
        ->assertStatus(403);
});

it('invitado es redirigido al login al intentar ver la lista de roles', function () {
    $this->get('/admin/roles')->assertRedirect('/login');
});
