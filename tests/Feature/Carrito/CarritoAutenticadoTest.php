<?php

use App\Models\VentaCabecera;
use Illuminate\Support\Facades\Mail;

// ─── Carrito DB — usuarios autenticados ───────────────────────────────────

it('cliente puede ver su carrito DB', function () {
    $this->actingAs(crearCliente())->get('/carrito')->assertStatus(200);
});

it('cliente puede agregar un producto al carrito DB', function () {
    $cliente  = crearCliente();
    $producto = crearProducto(['precio' => 20000, 'stock' => 10]);

    $this->actingAs($cliente)
         ->post('/carrito/agregar', ['producto_id' => $producto->id, 'cantidad' => 3])
         ->assertRedirect(route('carrito'));

    $carrito = VentaCabecera::where('user_id', $cliente->id)->where('estado', 'carrito')->first();

    expect($carrito)->not->toBeNull();
    expect($carrito->detalles)->toHaveCount(1);
    expect($carrito->detalles->first()->cantidad)->toBe(3);
    expect((float) $carrito->detalles->first()->subtotal)->toBe(60000.00);
});

it('el total del carrito se recalcula tras agregar productos', function () {
    $cliente = crearCliente();
    $p1      = crearProducto(['precio' => 10000, 'stock' => 5]);
    $p2      = crearProducto(['precio' => 5000,  'stock' => 5]);

    $this->actingAs($cliente)->post('/carrito/agregar', ['producto_id' => $p1->id, 'cantidad' => 1]);
    $this->actingAs($cliente)->post('/carrito/agregar', ['producto_id' => $p2->id, 'cantidad' => 2]);

    $carrito = VentaCabecera::where('user_id', $cliente->id)->where('estado', 'carrito')->first();

    expect((float) $carrito->total)->toBe(20000.00);
});

it('cliente recibe error stock al agregar mas unidades de las disponibles', function () {
    $cliente  = crearCliente();
    $producto = crearProducto(['stock' => 3]);

    $this->actingAs($cliente)
         ->post('/carrito/agregar', ['producto_id' => $producto->id, 'cantidad' => 10])
         ->assertSessionHasErrors(['stock']);
});

it('cliente no puede agregar un producto soft-deleted', function () {
    $cliente  = crearCliente();
    $producto = crearProducto(['stock' => 5]);
    $producto->delete();

    $this->actingAs($cliente)
         ->post('/carrito/agregar', ['producto_id' => $producto->id, 'cantidad' => 1])
         ->assertSessionHasErrors();
});

it('cliente puede eliminar un producto de su carrito DB', function () {
    $cliente  = crearCliente();
    $producto = crearProducto(['precio' => 10000, 'stock' => 5]);

    $this->actingAs($cliente)->post('/carrito/agregar', ['producto_id' => $producto->id, 'cantidad' => 1]);

    $carrito = VentaCabecera::where('user_id', $cliente->id)->where('estado', 'carrito')->first();
    $detalle = $carrito->detalles()->first();

    $this->actingAs($cliente)
         ->delete('/carrito/eliminar/' . $detalle->id)
         ->assertRedirect(route('carrito'));

    expect($carrito->fresh()->detalles)->toHaveCount(0);
});

it('cliente no puede eliminar el detalle de otro usuario', function () {
    $c1    = crearCliente();
    $c2    = crearCliente();
    $prod  = crearProducto(['stock' => 5]);

    // c1 agrega un producto
    $this->actingAs($c1)->post('/carrito/agregar', ['producto_id' => $prod->id, 'cantidad' => 1]);
    $detalleC1 = VentaCabecera::where('user_id', $c1->id)->where('estado', 'carrito')->first()->detalles()->first();

    // c2 intenta eliminar el detalle de c1
    $this->actingAs($c2)->delete('/carrito/eliminar/' . $detalleC1->id)
         ->assertStatus(404);
});

it('cliente puede vaciar su carrito DB', function () {
    $cliente  = crearCliente();
    $producto = crearProducto(['stock' => 5]);

    $this->actingAs($cliente)->post('/carrito/agregar', ['producto_id' => $producto->id, 'cantidad' => 2]);

    $this->actingAs($cliente)->delete('/carrito/vaciar')
         ->assertRedirect(route('carrito'));

    $carrito = VentaCabecera::where('user_id', $cliente->id)->where('estado', 'carrito')->first();

    expect($carrito->detalles)->toHaveCount(0);
    expect((float) $carrito->total)->toBe(0.00);
});

// ─── Confirmacion de compra ───────────────────────────────────────────────

it('confirmar compra crea venta confirmada y decrementa stock', function () {
    Mail::fake();

    $cliente  = crearCliente();
    $producto = crearProducto(['precio' => 15000, 'stock' => 5]);

    $this->actingAs($cliente)->post('/carrito/agregar', ['producto_id' => $producto->id, 'cantidad' => 2]);

    $this->actingAs($cliente)->post('/carrito/confirmar')
         ->assertRedirect(route('detalle-compra'));

    $venta = VentaCabecera::where('user_id', $cliente->id)->where('estado', 'confirmado')->first();

    expect($venta)->not->toBeNull();
    expect($venta->estado_pago)->toBe('aprobado');
    expect($producto->fresh()->stock)->toBe(3);
});

it('tras confirmar la compra no queda ningun carrito activo', function () {
    Mail::fake();

    $cliente  = crearCliente();
    $producto = crearProducto(['precio' => 5000, 'stock' => 10]);

    $this->actingAs($cliente)->post('/carrito/agregar', ['producto_id' => $producto->id, 'cantidad' => 1]);
    $this->actingAs($cliente)->post('/carrito/confirmar');

    $carritoActivo = VentaCabecera::where('user_id', $cliente->id)->where('estado', 'carrito')->first();

    expect($carritoActivo)->toBeNull();
});

it('confirmacion redirige correctamente aunque el email de factura falle', function () {
    // El try/catch en CarritoService::confirmarCompra garantiza esto.
    // MAIL_MAILER=array en phpunit.xml captura el mail sin enviarlo realmente.
    Mail::fake();

    $cliente  = crearCliente();
    $producto = crearProducto(['precio' => 5000, 'stock' => 5]);

    $this->actingAs($cliente)->post('/carrito/agregar', ['producto_id' => $producto->id, 'cantidad' => 1]);

    $this->actingAs($cliente)->post('/carrito/confirmar')
         ->assertRedirect(route('detalle-compra'));
});

it('confirmar carrito vacio retorna error de validacion', function () {
    $this->actingAs(crearCliente())
         ->post('/carrito/confirmar')
         ->assertSessionHasErrors(['carrito']);
});

it('el session_id de venta_confirmada se almacena tras confirmar', function () {
    Mail::fake();

    $cliente  = crearCliente();
    $producto = crearProducto(['precio' => 5000, 'stock' => 5]);

    $this->actingAs($cliente)->post('/carrito/agregar', ['producto_id' => $producto->id, 'cantidad' => 1]);

    $response = $this->actingAs($cliente)->post('/carrito/confirmar');
    $response->assertSessionHas('venta_confirmada_id');
});

it('cliente puede ver sus compras en mis-compras', function () {
    $cliente = crearCliente();
    VentaCabecera::factory()->confirmada()->create(['user_id' => $cliente->id]);

    $this->actingAs($cliente)->get('/mis-compras')->assertStatus(200);
});

// ─── Descarga de factura ──────────────────────────────────────────────────

it('cliente no puede descargar la factura de otro usuario', function () {
    $c1   = crearCliente();
    $c2   = crearCliente();
    $venta = VentaCabecera::factory()->confirmada()->create(['user_id' => $c1->id]);

    $this->actingAs($c2)
         ->get('/compras/' . $venta->id . '/factura')
         ->assertStatus(403);
});

// ─── Admin bloqueado del carrito ──────────────────────────────────────────

it('admin que accede a /carrito es redirigido al panel admin', function () {
    $this->actingAs(crearAdmin())->get('/carrito')->assertRedirect(route('admin.panel'));
});

it('admin que intenta agregar al carrito es redirigido al panel admin', function () {
    $producto = crearProducto(['stock' => 5]);

    $this->actingAs(crearAdmin())
         ->post('/carrito/agregar', ['producto_id' => $producto->id, 'cantidad' => 1])
         ->assertRedirect(route('admin.panel'));
});
