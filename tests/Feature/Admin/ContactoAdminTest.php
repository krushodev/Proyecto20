<?php

use App\Models\Contacto;
use Illuminate\Support\Facades\Mail;

// ─── Formulario publico de contacto ──────────────────────────────────────

it('invitado puede ver la pagina de contacto', function () {
    $this->get('/contacto')->assertStatus(200);
});

it('cliente puede ver la pagina de contacto', function () {
    $this->actingAs(crearCliente())->get('/contacto')->assertStatus(200);
});

it('invitado puede enviar el formulario de contacto', function () {
    Mail::fake();

    $this->post('/contacto', [
        'nombre'  => 'Juan Pérez',
        'email'   => 'juan@example.com',
        'asunto'  => 'Consulta de producto',
        'mensaje' => 'Quería consultar sobre disponibilidad...',
    ])->assertRedirect();

    $this->assertDatabaseHas('contactos', [
        'email'  => 'juan@example.com',
        'asunto' => 'Consulta de producto',
        'leido'  => false,
    ]);
});

it('formulario de contacto valida que nombre, email y asunto son requeridos', function () {
    $this->post('/contacto', [])
         ->assertSessionHasErrors(['nombre', 'email', 'asunto']);
});

it('formulario de contacto rechaza email invalido', function () {
    $this->post('/contacto', [
        'nombre'  => 'Juan',
        'email'   => 'not-an-email',
        'asunto'  => 'Consulta',
    ])->assertSessionHasErrors(['email']);
});

it('formulario de contacto rechaza nombre mayor a 100 caracteres', function () {
    $this->post('/contacto', [
        'nombre'  => str_repeat('A', 101),
        'email'   => 'test@test.com',
        'asunto'  => 'Consulta',
    ])->assertSessionHasErrors(['nombre']);
});

it('formulario de contacto rechaza mensaje vacio o faltante', function () {
    $this->post('/contacto', [
        'nombre' => 'Test',
        'email'  => 'test@test.com',
        'asunto' => 'Sin mensaje',
        // mensaje omitido
    ])->assertSessionHasErrors(['mensaje']);
});

it('contacto nuevo se guarda con leido=false por defecto', function () {
    Mail::fake();

    $this->post('/contacto', [
        'nombre'  => 'Ana García',
        'email'   => 'ana@example.com',
        'asunto'  => 'Pedido',
        'mensaje' => 'Quiero hacer un pedido.',
    ]);

    $contacto = Contacto::where('email', 'ana@example.com')->first();

    expect($contacto->leido)->toBeFalse();
});

// ─── Admin: lista de contactos ────────────────────────────────────────────

it('admin puede ver la lista de mensajes de contacto', function () {
    Contacto::factory()->count(3)->create();

    $this->actingAs(crearAdmin())->get('/admin/contactos')->assertStatus(200);
});

it('cliente recibe 403 al intentar ver contactos desde admin', function () {
    $this->actingAs(crearCliente())->get('/admin/contactos')->assertStatus(403);
});

it('invitado es redirigido al login al intentar ver contactos admin', function () {
    $this->get('/admin/contactos')->assertRedirect('/login');
});

// ─── Admin: marcar como leido / no leido ─────────────────────────────────

it('admin puede marcar un contacto como leido', function () {
    $contacto = Contacto::factory()->create(['leido' => false]);

    $this->actingAs(crearAdmin())
         ->patch('/admin/contactos/' . $contacto->id . '/leido')
         ->assertRedirect();

    expect($contacto->fresh()->leido)->toBeTrue();
});

it('admin puede marcar un contacto como no leido (toggle)', function () {
    $contacto = Contacto::factory()->leido()->create();

    $this->actingAs(crearAdmin())
         ->patch('/admin/contactos/' . $contacto->id . '/leido')
         ->assertRedirect();

    expect($contacto->fresh()->leido)->toBeFalse();
});

it('cliente recibe 403 al intentar marcar contacto como leido', function () {
    $contacto = Contacto::factory()->create();

    $this->actingAs(crearCliente())
         ->patch('/admin/contactos/' . $contacto->id . '/leido')
         ->assertStatus(403);
});

it('marcar leido de contacto inexistente retorna 404', function () {
    $this->actingAs(crearAdmin())
         ->patch('/admin/contactos/99999/leido')
         ->assertStatus(404);
});
