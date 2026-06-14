<?php

use App\Models\Producto;
use App\Models\Usuario;
use App\Models\VentaCabecera;
use App\Models\VentaDetalle;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(Tests\TestCase::class, RefreshDatabase::class);

it('pertenece a un usuario', function () {
    $usuario = crearCliente();
    $venta   = VentaCabecera::factory()->create(['user_id' => $usuario->id]);

    expect($venta->usuario)->toBeInstanceOf(Usuario::class);
    expect($venta->usuario->id)->toBe($usuario->id);
});

it('tiene muchos detalles', function () {
    $usuario  = crearCliente();
    $venta    = VentaCabecera::factory()->create(['user_id' => $usuario->id]);
    $producto = Producto::factory()->create();

    VentaDetalle::factory()->count(3)->create([
        'venta_id'    => $venta->id,
        'producto_id' => $producto->id,
    ]);

    expect($venta->detalles)->toHaveCount(3);
});

it('VentaDetalle pertenece a VentaCabecera', function () {
    $usuario  = crearCliente();
    $venta    = VentaCabecera::factory()->create(['user_id' => $usuario->id]);
    $producto = Producto::factory()->create();
    $detalle  = VentaDetalle::factory()->create(['venta_id' => $venta->id, 'producto_id' => $producto->id]);

    expect($detalle->venta)->toBeInstanceOf(VentaCabecera::class);
    expect($detalle->venta->id)->toBe($venta->id);
});

it('VentaDetalle pertenece a un Producto', function () {
    $venta    = VentaCabecera::factory()->create(['user_id' => crearCliente()->id]);
    $producto = Producto::factory()->create();
    $detalle  = VentaDetalle::factory()->create(['venta_id' => $venta->id, 'producto_id' => $producto->id]);

    expect($detalle->producto)->toBeInstanceOf(Producto::class);
    expect($detalle->producto->id)->toBe($producto->id);
});

it('castea total y costo_envio como decimal', function () {
    $venta = VentaCabecera::factory()->create([
        'user_id'     => crearCliente()->id,
        'total'       => 12500.50,
        'costo_envio' => 2500.00,
    ]);

    expect((float) $venta->total)->toBe(12500.50);
    expect((float) $venta->costo_envio)->toBe(2500.00);
});

it('castea fecha_venta como datetime', function () {
    $venta = VentaCabecera::factory()->confirmada()->create(['user_id' => crearCliente()->id]);

    expect($venta->fecha_venta)->toBeInstanceOf(\Illuminate\Support\Carbon::class);
});

it('la relacion detalles solo devuelve los propios', function () {
    $u1 = crearCliente();
    $u2 = crearCliente();
    $v1 = VentaCabecera::factory()->create(['user_id' => $u1->id]);
    $v2 = VentaCabecera::factory()->create(['user_id' => $u2->id]);

    VentaDetalle::factory()->count(2)->create(['venta_id' => $v1->id, 'producto_id' => Producto::factory()]);
    VentaDetalle::factory()->count(5)->create(['venta_id' => $v2->id, 'producto_id' => Producto::factory()]);

    expect($v1->detalles)->toHaveCount(2);
    expect($v2->detalles)->toHaveCount(5);
});
