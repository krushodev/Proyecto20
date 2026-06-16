<?php

use App\Models\VentaCabecera;
use Illuminate\Support\Facades\Mail;

// ─── AJAX: costo de envio ─────────────────────────────────────────────────

it('devuelve JSON con costo de envio Zona A para CP 1000-1999', function () {
    $this->actingAs(crearCliente())
         ->get('/checkout/costo-envio?cp=1900')
         ->assertStatus(200)
         ->assertJsonStructure(['costo', 'costo_fmt', 'zona'])
         ->assertJson(['costo' => 2500.0]);
});

it('devuelve JSON con costo de envio Zona B para CP 2000-5999', function () {
    $this->actingAs(crearCliente())
         ->get('/checkout/costo-envio?cp=5000')
         ->assertJson(['costo' => 5000.0]);
});

it('devuelve JSON con costo de envio Zona C para CP fuera de rangos AB', function () {
    $this->actingAs(crearCliente())
         ->get('/checkout/costo-envio?cp=9410')
         ->assertJson(['costo' => 8500.0]);
});

it('el endpoint costo-envio es accesible por clientes autenticados', function () {
    $this->actingAs(crearCliente())
         ->get('/checkout/costo-envio?cp=3000')
         ->assertStatus(200);
});

it('el endpoint costo-envio requiere autenticacion', function () {
    $this->get('/checkout/costo-envio?cp=1000')
         ->assertRedirect('/login');
});

// ─── Paso 0: carrito vacio redirige ──────────────────────────────────────

it('acceder a checkout/envio con carrito vacio redirige al carrito', function () {
    $this->actingAs(crearCliente())
         ->get('/checkout/envio')
         ->assertRedirect(route('carrito'));
});

// ─── Paso 1: Guardar direccion de envio ──────────────────────────────────

it('guardar envio almacena datos en sesion y redirige al paso de pago', function () {
    $cliente  = crearCliente();
    $carrito  = VentaCabecera::factory()->create(['user_id' => $cliente->id, 'estado' => 'carrito']);
    $producto = crearProducto(['stock' => 5]);
    $carrito->detalles()->create([
        'producto_id'     => $producto->id,
        'cantidad'        => 1,
        'precio_unitario' => $producto->precio,
        'subtotal'        => $producto->precio,
    ]);

    $this->actingAs($cliente)
         ->post('/checkout/envio', [
             'calle'             => 'Av. Siempre Viva',
             'numero'            => '742',
             'ciudad'            => 'La Plata',
             'provincia'         => 'Buenos Aires',
             'cp'                => '1900',
             'alias'             => 'Casa',
             'guardar_direccion' => false,
         ])
         ->assertRedirect(route('checkout.pago'));

    $envio = session('checkout_envio');

    expect($envio)->not->toBeNull();
    expect($envio['costo_envio'])->toBe(2500.0);
    expect($envio['ciudad'])->toBe('La Plata');
});

it('guardar envio con CP zona B almacena costo correcto', function () {
    $cliente  = crearCliente();
    $carrito  = VentaCabecera::factory()->create(['user_id' => $cliente->id, 'estado' => 'carrito']);
    $producto = crearProducto(['stock' => 5]);
    $carrito->detalles()->create([
        'producto_id'     => $producto->id,
        'cantidad'        => 1,
        'precio_unitario' => $producto->precio,
        'subtotal'        => $producto->precio,
    ]);

    $this->actingAs($cliente)
         ->post('/checkout/envio', [
             'calle'             => 'Calle Test',
             'numero'            => '1',
             'ciudad'            => 'Córdoba',
             'provincia'         => 'Córdoba',
             'cp'                => '5000',
             'alias'             => 'Casa',
             'guardar_direccion' => false,
         ]);

    expect(session('checkout_envio.costo_envio'))->toBe(5000.0);
});

it('guardar envio con direccion guardada crea UserDireccion en BD', function () {
    $cliente  = crearCliente();
    $carrito  = VentaCabecera::factory()->create(['user_id' => $cliente->id, 'estado' => 'carrito']);
    $producto = crearProducto(['stock' => 5]);
    $carrito->detalles()->create([
        'producto_id'     => $producto->id,
        'cantidad'        => 1,
        'precio_unitario' => $producto->precio,
        'subtotal'        => $producto->precio,
    ]);

    $this->actingAs($cliente)
         ->post('/checkout/envio', [
             'calle'             => 'Calle 50',
             'numero'            => '300',
             'ciudad'            => 'La Plata',
             'provincia'         => 'Buenos Aires',
             'cp'                => '1900',
             'alias'             => 'Trabajo',
             'guardar_direccion' => true,
         ]);

    $this->assertDatabaseHas('user_direcciones', [
        'user_id' => $cliente->id,
        'alias'   => 'Trabajo',
    ]);
});

it('checkout/pago redirige a checkout/envio si no hay sesion de envio', function () {
    $this->actingAs(crearCliente())
         ->get('/checkout/pago')
         ->assertRedirect(route('checkout.envio'));
});

// ─── Paso 2: Procesamiento de pago ───────────────────────────────────────

it('pago con transferencia confirma la compra y redirige a confirmacion', function () {
    Mail::fake();

    $cliente  = crearCliente();
    $producto = crearProducto(['precio' => 25000, 'stock' => 5]);

    $carrito = VentaCabecera::factory()->create(['user_id' => $cliente->id, 'estado' => 'carrito']);
    $carrito->detalles()->create([
        'producto_id'     => $producto->id,
        'cantidad'        => 2,
        'precio_unitario' => 25000,
        'subtotal'        => 50000,
    ]);

    $this->actingAs($cliente)->withSession(['checkout_envio' => [
        'direccion_id'   => null,
        'alias'          => 'Casa',
        'calle'          => 'Calle Test',
        'numero'         => '123',
        'ciudad'         => 'La Plata',
        'provincia'      => 'Buenos Aires',
        'cp'             => '1900',
        'observaciones'  => null,
        'costo_envio'    => 2500.0,
    ]])->post('/checkout/pago', ['metodo_pago' => 'transferencia'])
       ->assertRedirect(route('checkout.confirmacion'));

    $venta = VentaCabecera::where('user_id', $cliente->id)->where('estado', 'confirmado')->first();

    expect($venta)->not->toBeNull();
    expect($venta->metodo_pago)->toBe('transferencia');
    expect((float) $venta->costo_envio)->toBe(2500.0);
    expect($producto->fresh()->stock)->toBe(3);
});

it('pago con tarjeta confirma la compra correctamente', function () {
    Mail::fake();

    $cliente  = crearCliente();
    $producto = crearProducto(['precio' => 10000, 'stock' => 5]);

    $carrito = VentaCabecera::factory()->create(['user_id' => $cliente->id, 'estado' => 'carrito']);
    $carrito->detalles()->create([
        'producto_id'     => $producto->id,
        'cantidad'        => 1,
        'precio_unitario' => 10000,
        'subtotal'        => 10000,
    ]);

    $this->actingAs($cliente)->withSession(['checkout_envio' => [
        'direccion_id'  => null,
        'alias'         => 'Casa',
        'calle'         => 'Calle A',
        'numero'        => '1',
        'ciudad'        => 'CABA',
        'provincia'     => 'Buenos Aires',
        'cp'            => '1001',
        'observaciones' => null,
        'costo_envio'   => 2500.0,
    ]])->post('/checkout/pago', ['metodo_pago' => 'tarjeta'])
       ->assertRedirect(route('checkout.confirmacion'));

    $venta = VentaCabecera::where('user_id', $cliente->id)->where('estado', 'confirmado')->first();

    expect($venta->metodo_pago)->toBe('tarjeta');
});

it('metodo de pago invalido retorna error de validacion', function () {
    $cliente = crearCliente();

    $this->actingAs($cliente)->withSession(['checkout_envio' => [
        'calle' => 'Test', 'numero' => '1', 'ciudad' => 'City',
        'provincia' => 'BA', 'cp' => '1000', 'costo_envio' => 2500,
        'alias' => 'Casa', 'observaciones' => null, 'direccion_id' => null,
    ]])->post('/checkout/pago', ['metodo_pago' => 'bitcoin'])
       ->assertSessionHasErrors(['metodo_pago']);
});

it('procesar pago sin sesion de envio redirige a checkout/envio', function () {
    $this->actingAs(crearCliente())
         ->post('/checkout/pago', ['metodo_pago' => 'transferencia'])
         ->assertRedirect(route('checkout.envio'));
});

it('el session checkout_envio se limpia despues de confirmar pago', function () {
    Mail::fake();

    $cliente  = crearCliente();
    $producto = crearProducto(['precio' => 5000, 'stock' => 5]);

    $carrito = VentaCabecera::factory()->create(['user_id' => $cliente->id, 'estado' => 'carrito']);
    $carrito->detalles()->create([
        'producto_id'     => $producto->id,
        'cantidad'        => 1,
        'precio_unitario' => 5000,
        'subtotal'        => 5000,
    ]);

    $this->actingAs($cliente)->withSession(['checkout_envio' => [
        'direccion_id'  => null,
        'alias'         => 'Casa',
        'calle'         => 'Calle X',
        'numero'        => '1',
        'ciudad'        => 'La Plata',
        'provincia'     => 'Buenos Aires',
        'cp'            => '1900',
        'observaciones' => null,
        'costo_envio'   => 2500.0,
    ]])->post('/checkout/pago', ['metodo_pago' => 'transferencia']);

    expect(session()->has('checkout_envio'))->toBeFalse();
});

// ─── Paso 3: Confirmacion ────────────────────────────────────────────────

it('muestra pagina de confirmacion cuando venta_confirmada_id esta en sesion', function () {
    $cliente = crearCliente();
    $venta   = VentaCabecera::factory()->confirmada()->create(['user_id' => $cliente->id]);

    $this->actingAs($cliente)
         ->withSession(['venta_confirmada_id' => $venta->id])
         ->get('/checkout/confirmacion')
         ->assertStatus(200);
});

it('redirige a mis-compras en confirmacion si no hay sesion activa', function () {
    $this->actingAs(crearCliente())
         ->get('/checkout/confirmacion')
         ->assertRedirect(route('mis-compras'));
});

it('redirige a mis-compras si venta_confirmada_id pertenece a otro usuario', function () {
    $c1    = crearCliente();
    $c2    = crearCliente();
    $venta = VentaCabecera::factory()->confirmada()->create(['user_id' => $c1->id]);

    $this->actingAs($c2)
         ->withSession(['venta_confirmada_id' => $venta->id])
         ->get('/checkout/confirmacion')
         ->assertRedirect(route('mis-compras'));
});

// ─── Retorno desde MercadoPago (status != approved) ───────────────────────

it('retorno MP con status pending redirige a pago con error', function () {
    $cliente = crearCliente();
    $carrito = VentaCabecera::factory()->create(['user_id' => $cliente->id, 'estado' => 'carrito']);

    $this->actingAs($cliente)
         ->withSession(['checkout_envio' => [
             'direccion_id'  => null,
             'alias'         => 'Casa',
             'calle'         => 'Calle X',
             'numero'        => '1',
             'ciudad'        => 'LP',
             'provincia'     => 'BA',
             'cp'            => '1900',
             'observaciones' => null,
             'costo_envio'   => 2500.0,
             'metodo_pago'   => 'mercadopago',
         ]])
         ->get('/checkout/confirmacion?external_reference=' . $carrito->id . '&status=pending')
         ->assertRedirect(route('checkout.pago'))
         ->assertSessionHasErrors(['pago']);
});

it('retorno MP sin sesion de envio redirige a mis-compras', function () {
    $cliente = crearCliente();
    $carrito = VentaCabecera::factory()->create(['user_id' => $cliente->id, 'estado' => 'carrito']);

    $this->actingAs($cliente)
         ->get('/checkout/confirmacion?external_reference=' . $carrito->id . '&status=approved')
         ->assertRedirect(route('mis-compras'));
});

it('retorno MP con carrito de otro usuario redirige a mis-compras', function () {
    $c1      = crearCliente();
    $c2      = crearCliente();
    $carrito = VentaCabecera::factory()->create(['user_id' => $c1->id, 'estado' => 'carrito']);

    $this->actingAs($c2)
         ->withSession(['checkout_envio' => [
             'direccion_id'  => null,
             'alias'         => 'Casa',
             'calle'         => 'Calle X',
             'numero'        => '1',
             'ciudad'        => 'LP',
             'provincia'     => 'BA',
             'cp'            => '1900',
             'observaciones' => null,
             'costo_envio'   => 2500.0,
             'metodo_pago'   => 'mercadopago',
         ]])
         ->get('/checkout/confirmacion?external_reference=' . $carrito->id . '&status=approved')
         ->assertRedirect(route('mis-compras'));
});

it('retorno MP con carrito ya confirmado (no en estado carrito) redirige a mis-compras', function () {
    $cliente = crearCliente();
    $venta   = VentaCabecera::factory()->confirmada()->create(['user_id' => $cliente->id]);

    $this->actingAs($cliente)
         ->withSession(['checkout_envio' => [
             'direccion_id'  => null,
             'alias'         => 'Casa',
             'calle'         => 'Calle X',
             'numero'        => '1',
             'ciudad'        => 'LP',
             'provincia'     => 'BA',
             'cp'            => '1900',
             'observaciones' => null,
             'costo_envio'   => 2500.0,
             'metodo_pago'   => 'mercadopago',
         ]])
         ->get('/checkout/confirmacion?external_reference=' . $venta->id . '&status=approved')
         ->assertRedirect(route('mis-compras'));
});

it('retorno MP con status approved confirma la compra, descuenta stock y muestra confirmacion', function () {
    Mail::fake();

    $cliente  = crearCliente();
    $producto = crearProducto(['precio' => 15000, 'stock' => 5]);

    $carrito = VentaCabecera::factory()->create(['user_id' => $cliente->id, 'estado' => 'carrito']);
    $carrito->detalles()->create([
        'producto_id'     => $producto->id,
        'cantidad'        => 2,
        'precio_unitario' => 15000,
        'subtotal'        => 30000,
    ]);

    $this->actingAs($cliente)
         ->withSession(['checkout_envio' => [
             'direccion_id'  => null,
             'alias'         => 'Casa',
             'calle'         => 'Calle X',
             'numero'        => '1',
             'ciudad'        => 'La Plata',
             'provincia'     => 'Buenos Aires',
             'cp'            => '1900',
             'observaciones' => null,
             'costo_envio'   => 2500.0,
             'metodo_pago'   => 'mercadopago',
         ]])
         ->get('/checkout/confirmacion?external_reference=' . $carrito->id . '&status=approved')
         ->assertStatus(200);

    $venta = VentaCabecera::where('user_id', $cliente->id)->where('estado', 'confirmado')->first();

    expect($venta)->not->toBeNull();
    expect($venta->metodo_pago)->toBe('mercadopago');
    expect($producto->fresh()->stock)->toBe(3);
    expect(session()->has('checkout_envio'))->toBeFalse();
});
