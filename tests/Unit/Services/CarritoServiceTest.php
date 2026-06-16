<?php

use App\Models\VentaCabecera;
use App\Services\CarritoService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

uses(Tests\TestCase::class, RefreshDatabase::class);

beforeEach(function () {
    $this->service = new CarritoService();
    $this->cliente = crearCliente();
    $this->actingAs($this->cliente);
});

// ─── obtenerCarrito ───────────────────────────────────────────────────────

it('crea un carrito nuevo para el usuario si no existe', function () {
    $carrito = $this->service->obtenerCarrito();

    expect($carrito)->toBeInstanceOf(VentaCabecera::class);
    expect($carrito->user_id)->toBe($this->cliente->id);
    expect($carrito->estado)->toBe('carrito');
});

it('reutiliza el carrito existente en lugar de crear uno nuevo', function () {
    $c1 = $this->service->obtenerCarrito();
    $c2 = $this->service->obtenerCarrito();

    expect($c1->id)->toBe($c2->id);
});

// ─── agregarProducto ──────────────────────────────────────────────────────

it('crea detalle con subtotal correcto al agregar producto nuevo', function () {
    $producto = crearProducto(['precio' => 10000, 'stock' => 5]);

    $detalle = $this->service->agregarProducto([
        'producto_id' => $producto->id,
        'cantidad'    => 2,
    ]);

    expect($detalle->cantidad)->toBe(2);
    expect((float) $detalle->precio_unitario)->toBe(10000.00);
    expect((float) $detalle->subtotal)->toBe(20000.00);
});

it('acumula cantidad si el producto ya existe en el carrito', function () {
    $producto = crearProducto(['precio' => 5000, 'stock' => 10]);

    $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 2]);
    $detalle = $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 3]);

    expect($detalle->cantidad)->toBe(5);
    expect((float) $detalle->subtotal)->toBe(25000.00);
});

it('recalcula el total del carrito al agregar multiples productos', function () {
    $p1 = crearProducto(['precio' => 10000, 'stock' => 5]);
    $p2 = crearProducto(['precio' => 5000,  'stock' => 5]);

    $this->service->agregarProducto(['producto_id' => $p1->id, 'cantidad' => 1]);
    $this->service->agregarProducto(['producto_id' => $p2->id, 'cantidad' => 2]);

    $carrito = $this->service->obtenerCarrito();

    expect((float) $carrito->total)->toBe(20000.00);
});

it('lanza RuntimeException cuando stock es insuficiente en primer agregado', function () {
    $producto = crearProducto(['stock' => 2]);

    expect(fn () => $this->service->agregarProducto([
        'producto_id' => $producto->id,
        'cantidad'    => 5,
    ]))->toThrow(\RuntimeException::class, 'Stock insuficiente');
});

it('lanza RuntimeException cuando la cantidad acumulada supera el stock', function () {
    $producto = crearProducto(['stock' => 3]);

    $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 2]);

    expect(fn () => $this->service->agregarProducto([
        'producto_id' => $producto->id,
        'cantidad'    => 2,
    ]))->toThrow(\RuntimeException::class, 'Stock insuficiente');
});

it('permite agregar cuando la cantidad solicitada es exactamente igual al stock disponible', function () {
    $producto = crearProducto(['stock' => 4]);

    $detalle = $this->service->agregarProducto([
        'producto_id' => $producto->id,
        'cantidad'    => 4,
    ]);

    expect($detalle->cantidad)->toBe(4);
});

it('lanza RuntimeException al agregar un producto inactivo', function () {
    $producto = crearProducto(['stock' => 5, 'activo' => false]);

    expect(fn () => $this->service->agregarProducto([
        'producto_id' => $producto->id,
        'cantidad'    => 1,
    ]))->toThrow(\RuntimeException::class, 'ya no está disponible');
});

it('mensaje de error incluye el nombre del producto y stock disponible', function () {
    $producto = crearProducto(['nombre' => 'Reloj Especial', 'stock' => 1]);

    try {
        $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 99]);
        $this->fail('Se esperaba RuntimeException');
    } catch (\RuntimeException $e) {
        expect($e->getMessage())->toContain('Reloj Especial');
        expect($e->getMessage())->toContain('1');
    }
});

// ─── eliminarProducto ─────────────────────────────────────────────────────

it('elimina un detalle del carrito y recalcula el total', function () {
    $p1 = crearProducto(['precio' => 10000, 'stock' => 5]);
    $p2 = crearProducto(['precio' => 5000,  'stock' => 5]);

    $this->service->agregarProducto(['producto_id' => $p1->id, 'cantidad' => 1]);
    $detalle2 = $this->service->agregarProducto(['producto_id' => $p2->id, 'cantidad' => 1]);

    $this->service->eliminarProducto($detalle2->id);

    $carrito = $this->service->obtenerCarrito();

    expect((float) $carrito->total)->toBe(10000.00);
    expect($carrito->detalles)->toHaveCount(1);
});

it('lanza ModelNotFoundException al eliminar detalle que no pertenece al carrito', function () {
    expect(fn () => $this->service->eliminarProducto(99999))
        ->toThrow(\Illuminate\Database\Eloquent\ModelNotFoundException::class);
});

// ─── vaciarCarrito ────────────────────────────────────────────────────────

it('vacia todos los detalles y pone total en cero', function () {
    $producto = crearProducto(['precio' => 10000, 'stock' => 5]);
    $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 2]);

    $this->service->vaciarCarrito();

    $carrito = $this->service->obtenerCarrito();

    expect($carrito->detalles)->toHaveCount(0);
    expect((float) $carrito->total)->toBe(0.00);
});

// ─── confirmarCompra ──────────────────────────────────────────────────────

it('lanza RuntimeException al confirmar carrito vacio', function () {
    expect(fn () => $this->service->confirmarCompra())
        ->toThrow(\RuntimeException::class, 'vacío');
});

it('cambia estado a confirmado y aprobado tras confirmar', function () {
    Mail::fake();

    $producto = crearProducto(['precio' => 10000, 'stock' => 5]);
    $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 1]);

    $venta = $this->service->confirmarCompra();

    expect($venta->estado)->toBe('confirmado');
    expect($venta->estado_pago)->toBe('aprobado');
    expect($venta->fecha_venta)->not->toBeNull();
});

it('decrementa el stock del producto al confirmar', function () {
    Mail::fake();

    $producto = crearProducto(['precio' => 10000, 'stock' => 10]);
    $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 3]);

    $this->service->confirmarCompra();

    expect($producto->fresh()->stock)->toBe(7);
});

it('lanza RuntimeException si el stock se agota entre agregar y confirmar', function () {
    $producto = crearProducto(['precio' => 10000, 'stock' => 5]);
    $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 5]);

    // Simular que otro proceso agoto el stock
    $producto->update(['stock' => 0]);

    expect(fn () => $this->service->confirmarCompra())
        ->toThrow(\RuntimeException::class, 'Stock insuficiente');
});

it('permite confirmar cuando la cantidad en el carrito es exactamente igual al stock', function () {
    Mail::fake();

    $producto = crearProducto(['precio' => 10000, 'stock' => 3]);
    $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 3]);

    $venta = $this->service->confirmarCompra();

    expect($venta->estado)->toBe('confirmado');
    expect($producto->fresh()->stock)->toBe(0);
});

it('lanza RuntimeException al confirmar si el producto fue desactivado luego de agregarlo', function () {
    $producto = crearProducto(['precio' => 10000, 'stock' => 5]);
    $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 2]);

    $producto->update(['activo' => false]);

    expect(fn () => $this->service->confirmarCompra())
        ->toThrow(\RuntimeException::class, 'ya no está disponible');
});

it('simula concurrencia: dos clientes reservan el ultimo stock pero solo uno confirma la compra', function () {
    Mail::fake();

    $producto = crearProducto(['precio' => 10000, 'stock' => 1]);
    $clienteB = crearCliente();

    // Ambos clientes alcanzan a agregar el unico item disponible a sus carritos
    // (cada carrito es independiente, el stock real recien se descuenta al confirmar).
    $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 1]);

    Auth::login($clienteB);
    $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 1]);

    // Cliente A confirma primero: lockForUpdate() + decrement deja stock en 0.
    Auth::login($this->cliente);
    $ventaA = $this->service->confirmarCompra();

    // Cliente B intenta confirmar despues: la revalidacion de stock en backend
    // detecta que ya no hay disponibilidad y bloquea la operacion.
    Auth::login($clienteB);
    expect(fn () => $this->service->confirmarCompra())
        ->toThrow(\RuntimeException::class, 'Stock insuficiente');

    expect($ventaA->estado)->toBe('confirmado');
    expect($producto->fresh()->stock)->toBe(0);
});

it('retorna la venta confirmada incluso cuando el envio de email falla', function () {
    // El try/catch en confirmarCompra garantiza que un fallo de PDF/email
    // no interrumpe la transaccion de compra.
    Mail::fake();

    $producto = crearProducto(['precio' => 5000, 'stock' => 5]);
    $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 1]);

    // Forzar fallo en el mailer
    Mail::shouldReceive('to')->once()->andThrow(new \Exception('SMTP error'));

    $venta = $this->service->confirmarCompra();

    expect($venta->estado)->toBe('confirmado');
});

it('merge de datos extra se guarda en la venta al confirmar', function () {
    Mail::fake();

    $producto = crearProducto(['precio' => 15000, 'stock' => 5]);
    $this->service->agregarProducto(['producto_id' => $producto->id, 'cantidad' => 1]);

    $venta = $this->service->confirmarCompra([
        'metodo_pago'         => 'transferencia',
        'nombre_destinatario' => 'Juan Pérez',
        'calle'               => 'Calle 50',
        'numero'              => '123',
        'ciudad'              => 'La Plata',
        'provincia'           => 'Buenos Aires',
        'codigo_postal'       => '1900',
        'costo_envio'         => 2500,
    ]);

    expect($venta->metodo_pago)->toBe('transferencia');
    expect($venta->nombre_destinatario)->toBe('Juan Pérez');
    expect((float) $venta->costo_envio)->toBe(2500.00);
});

// ─── Carrito guest (session) ──────────────────────────────────────────────

it('agrega producto a carrito de sesion de guest', function () {
    Auth::logout();

    $producto = crearProducto(['precio' => 15000, 'stock' => 10]);

    $this->service->agregarProductoGuest(['producto_id' => $producto->id, 'cantidad' => 2]);

    $carrito = $this->service->obtenerCarritoGuest();

    expect($carrito['items'])->toHaveCount(1);
    expect($carrito['total'])->toBe(30000.0);
    expect($carrito['items'][0]['cantidad'])->toBe(2);
});

it('acumula cantidad en sesion si el producto ya existe en el carrito guest', function () {
    Auth::logout();

    $producto = crearProducto(['precio' => 5000, 'stock' => 10]);

    $this->service->agregarProductoGuest(['producto_id' => $producto->id, 'cantidad' => 1]);
    $this->service->agregarProductoGuest(['producto_id' => $producto->id, 'cantidad' => 2]);

    $carrito = $this->service->obtenerCarritoGuest();

    expect($carrito['items'][0]['cantidad'])->toBe(3);
    expect($carrito['total'])->toBe(15000.0);
});

it('lanza RuntimeException por stock insuficiente en carrito guest', function () {
    Auth::logout();

    $producto = crearProducto(['stock' => 2]);

    expect(fn () => $this->service->agregarProductoGuest([
        'producto_id' => $producto->id,
        'cantidad'    => 5,
    ]))->toThrow(\RuntimeException::class, 'Stock insuficiente');
});

it('lanza RuntimeException al agregar un producto inactivo en carrito guest', function () {
    Auth::logout();

    $producto = crearProducto(['stock' => 5, 'activo' => false]);

    expect(fn () => $this->service->agregarProductoGuest([
        'producto_id' => $producto->id,
        'cantidad'    => 1,
    ]))->toThrow(\RuntimeException::class, 'ya no está disponible');
});

it('elimina producto del carrito guest por productoId', function () {
    Auth::logout();

    $p1 = crearProducto(['precio' => 5000, 'stock' => 5]);
    $p2 = crearProducto(['precio' => 8000, 'stock' => 5]);

    $this->service->agregarProductoGuest(['producto_id' => $p1->id, 'cantidad' => 1]);
    $this->service->agregarProductoGuest(['producto_id' => $p2->id, 'cantidad' => 1]);

    $this->service->eliminarProductoGuest($p1->id);

    $carrito = $this->service->obtenerCarritoGuest();

    expect($carrito['items'])->toHaveCount(1);
    expect($carrito['items'][0]['producto_id'])->toBe($p2->id);
});

it('vaciar carrito guest limpia la sesion', function () {
    Auth::logout();

    $producto = crearProducto(['stock' => 5]);
    $this->service->agregarProductoGuest(['producto_id' => $producto->id, 'cantidad' => 1]);

    $this->service->vaciarCarritoGuest();

    expect(session()->has('carrito'))->toBeFalse();
});

// ─── transferirCarritoSesionADB ───────────────────────────────────────────

it('transfiere items del carrito guest al carrito DB al autenticarse', function () {
    Auth::logout();

    $producto = crearProducto(['precio' => 8000, 'stock' => 10]);
    $this->service->agregarProductoGuest(['producto_id' => $producto->id, 'cantidad' => 2]);

    Auth::login($this->cliente);
    $this->service->transferirCarritoSesionADB($this->cliente->id);

    $carrito = $this->service->obtenerCarrito();

    expect($carrito->detalles)->toHaveCount(1);
    expect((float) $carrito->total)->toBe(16000.00);
    expect(session()->has('carrito'))->toBeFalse();
});

it('mergea items guest con items existentes en DB al transferir', function () {
    $p1 = crearProducto(['precio' => 10000, 'stock' => 10]);
    $p2 = crearProducto(['precio' => 5000,  'stock' => 10]);

    // Hay un item en DB
    $this->service->agregarProducto(['producto_id' => $p1->id, 'cantidad' => 1]);

    // Agregar p2 en sesion guest
    Auth::logout();
    $this->service->agregarProductoGuest(['producto_id' => $p2->id, 'cantidad' => 2]);

    Auth::login($this->cliente);
    $this->service->transferirCarritoSesionADB($this->cliente->id);

    $carrito = $this->service->obtenerCarrito();

    expect($carrito->detalles)->toHaveCount(2);
    expect((float) $carrito->total)->toBe(20000.00);
});

it('no falla si el carrito guest esta vacio al transferir', function () {
    // Sin items en sesion — no debe lanzar excepcion
    $this->service->transferirCarritoSesionADB($this->cliente->id);

    $carrito = $this->service->obtenerCarrito();

    expect($carrito->detalles)->toHaveCount(0);
});
