<?php

// ─── Carrito de sesion — usuarios no autenticados ─────────────────────────

it('invitado puede ver la pagina del carrito vacio', function () {
    $this->get('/carrito')->assertStatus(200);
});

it('invitado puede agregar un producto activo al carrito de sesion', function () {
    $producto = crearProducto(['precio' => 10000, 'stock' => 5]);

    $this->post('/carrito/agregar', [
        'producto_id' => $producto->id,
        'cantidad'    => 2,
    ])->assertRedirect(route('carrito'));

    $carrito = session('carrito');

    expect($carrito)->not->toBeNull();
    expect($carrito['items'])->toHaveCount(1);
    expect($carrito['items'][0]['cantidad'])->toBe(2);
    expect($carrito['total'])->toBe(20000.0);
});

it('invitado ve el error stock cuando intenta agregar mas unidades de las disponibles', function () {
    $producto = crearProducto(['stock' => 2]);

    $this->post('/carrito/agregar', [
        'producto_id' => $producto->id,
        'cantidad'    => 5,
    ])->assertSessionHasErrors(['stock']);
});

it('invitado no puede agregar un producto soft-deleted (falla en validacion)', function () {
    $producto = crearProducto(['stock' => 5]);
    $producto->delete();

    $this->post('/carrito/agregar', [
        'producto_id' => $producto->id,
        'cantidad'    => 1,
    ])->assertSessionHasErrors();
});

it('validacion rechaza producto_id faltante', function () {
    $this->post('/carrito/agregar', ['cantidad' => 1])
         ->assertSessionHasErrors(['producto_id']);
});

it('validacion rechaza cantidad cero o negativa', function () {
    $producto = crearProducto(['stock' => 5]);

    $this->post('/carrito/agregar', [
        'producto_id' => $producto->id,
        'cantidad'    => 0,
    ])->assertSessionHasErrors(['cantidad']);
});

it('agregar el mismo producto acumula cantidad en sesion', function () {
    $producto = crearProducto(['precio' => 5000, 'stock' => 10]);

    $this->post('/carrito/agregar', ['producto_id' => $producto->id, 'cantidad' => 1]);
    $this->post('/carrito/agregar', ['producto_id' => $producto->id, 'cantidad' => 2]);

    $carrito = session('carrito');

    expect($carrito['items'])->toHaveCount(1);
    expect($carrito['items'][0]['cantidad'])->toBe(3);
    expect($carrito['total'])->toBe(15000.0);
});

it('invitado puede eliminar un producto del carrito de sesion', function () {
    $producto = crearProducto(['precio' => 5000, 'stock' => 5]);

    session()->put('carrito', [
        'items' => [[
            'producto_id'     => $producto->id,
            'nombre'          => $producto->nombre,
            'precio_unitario' => 5000.0,
            'cantidad'        => 1,
            'subtotal'        => 5000.0,
            'imagen_studio'   => null,
        ]],
        'total' => 5000.0,
    ]);

    $this->delete('/carrito/eliminar/' . $producto->id)
         ->assertRedirect(route('carrito'));

    $carrito = session('carrito');

    expect($carrito['items'])->toHaveCount(0);
    expect((float) $carrito['total'])->toBe(0.0);
});

it('invitado puede vaciar el carrito de sesion', function () {
    session()->put('carrito', [
        'items' => [['producto_id' => 1, 'nombre' => 'x', 'precio_unitario' => 1, 'cantidad' => 1, 'subtotal' => 1, 'imagen_studio' => null]],
        'total' => 1.0,
    ]);

    $this->delete('/carrito/vaciar')
         ->assertRedirect(route('carrito'));

    expect(session()->has('carrito'))->toBeFalse();
});

it('invitado que intenta confirmar compra es redirigido al login', function () {
    $this->post('/carrito/confirmar')->assertRedirect('/login');
});
