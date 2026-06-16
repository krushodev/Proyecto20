<?php

use App\Models\VentaCabecera;

// ─── Index sin filtros ──────────────────────────────────────────────────

it('admin ve todas las ventas confirmadas sin filtros', function () {
    VentaCabecera::factory()->confirmada()->create();
    VentaCabecera::factory()->confirmada()->create();
    VentaCabecera::factory()->create(); // carrito, no confirmada

    $response = $this->actingAs(crearAdmin())->get('/admin/ventas');

    $response->assertStatus(200);
    $response->assertViewHas('ventas', function ($ventas) {
        return $ventas->count() === 2;
    });
});

// ─── Filtro por estado ───────────────────────────────────────────────────

it('filtra ventas por estado', function () {
    VentaCabecera::factory()->confirmada()->create();
    VentaCabecera::factory()->create(['estado' => 'carrito']);

    $response = $this->actingAs(crearAdmin())->get('/admin/ventas?estado=carrito');

    $response->assertStatus(200);
    $response->assertViewHas('ventas', function ($ventas) {
        return $ventas->count() === 1 && $ventas->first()->estado === 'carrito';
    });
});

// ─── Filtro por rango de fechas ──────────────────────────────────────────

it('filtra ventas por rango de fechas', function () {
    VentaCabecera::factory()->confirmada()->create(['fecha_venta' => '2026-01-10']);
    VentaCabecera::factory()->confirmada()->create(['fecha_venta' => '2026-06-15']);

    $response = $this->actingAs(crearAdmin())->get('/admin/ventas?desde=2026-06-01&hasta=2026-06-30');

    $response->assertStatus(200);
    $response->assertViewHas('ventas', function ($ventas) {
        return $ventas->count() === 1
            && $ventas->first()->fecha_venta->format('Y-m-d') === '2026-06-15';
    });
});

// ─── Combinación de filtros ──────────────────────────────────────────────

it('combina filtro de estado y rango de fechas', function () {
    VentaCabecera::factory()->confirmada()->create(['fecha_venta' => '2026-06-10']);
    VentaCabecera::factory()->create(['estado' => 'carrito', 'fecha_venta' => '2026-06-12']);

    $response = $this->actingAs(crearAdmin())
        ->get('/admin/ventas?estado=confirmado&desde=2026-06-01&hasta=2026-06-30');

    $response->assertStatus(200);
    $response->assertViewHas('ventas', function ($ventas) {
        return $ventas->count() === 1 && $ventas->first()->estado === 'confirmado';
    });
});

// ─── Validación de filtros inválidos ─────────────────────────────────────

it('rechaza un estado de filtro invalido', function () {
    $this->actingAs(crearAdmin())
        ->get('/admin/ventas?estado=inexistente')
        ->assertSessionHasErrors(['estado']);
});

it('rechaza una fecha desde invalida', function () {
    $this->actingAs(crearAdmin())
        ->get('/admin/ventas?desde=no-es-fecha')
        ->assertSessionHasErrors(['desde']);
});

it('rechaza cuando hasta es anterior a desde', function () {
    $this->actingAs(crearAdmin())
        ->get('/admin/ventas?desde=2026-06-15&hasta=2026-06-01')
        ->assertSessionHasErrors(['hasta']);
});

// ─── Control de acceso ────────────────────────────────────────────────────

it('cliente recibe 403 al intentar ver la lista de ventas', function () {
    $this->actingAs(crearCliente())->get('/admin/ventas')->assertStatus(403);
});
