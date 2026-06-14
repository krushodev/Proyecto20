<?php

use App\Models\VentaCabecera;

// ─── Visitantes (guests) ──────────────────────────────────────────────────

it('invitado puede visitar la home', function () {
    $this->get('/')->assertStatus(200);
});

it('invitado puede visitar el catalogo', function () {
    $this->get('/catalogo')->assertStatus(200);
});

it('invitado puede ver el carrito vacio', function () {
    $this->get('/carrito')->assertStatus(200);
});

it('invitado es redirigido al login al intentar acceder a checkout', function () {
    $this->get('/checkout/envio')->assertRedirect('/login');
});

it('invitado es redirigido al login al intentar acceder a mis-compras', function () {
    $this->get('/mis-compras')->assertRedirect('/login');
});

it('invitado es redirigido al login al intentar confirmar la compra', function () {
    $this->post('/carrito/confirmar')->assertRedirect('/login');
});

it('invitado es redirigido al login al intentar acceder al panel admin', function () {
    $this->get('/admin')->assertRedirect('/login');
});

it('invitado es redirigido al login al intentar acceder a admin/usuarios', function () {
    $this->get('/admin/usuarios')->assertRedirect('/login');
});

it('invitado es redirigido al login al intentar acceder a admin/productos', function () {
    $this->get('/admin/productos')->assertRedirect('/login');
});

// ─── Cliente ──────────────────────────────────────────────────────────────

it('cliente puede visitar la home', function () {
    $this->actingAs(crearCliente())->get('/')->assertStatus(200);
});

it('cliente puede ver el catalogo', function () {
    $this->actingAs(crearCliente())->get('/catalogo')->assertStatus(200);
});

it('cliente puede acceder a su perfil', function () {
    $this->actingAs(crearCliente())->get('/perfil')->assertStatus(200);
});

it('cliente puede acceder a la edicion de su perfil', function () {
    $this->actingAs(crearCliente())->get('/perfil/editar')->assertStatus(200);
});

it('cliente puede acceder a mis-compras', function () {
    $this->actingAs(crearCliente())->get('/mis-compras')->assertStatus(200);
});

it('cliente recibe 403 al intentar acceder al panel admin', function () {
    $this->actingAs(crearCliente())->get('/admin')->assertStatus(403);
});

it('cliente recibe 403 al intentar acceder a admin/usuarios', function () {
    $this->actingAs(crearCliente())->get('/admin/usuarios')->assertStatus(403);
});

it('cliente recibe 403 al intentar acceder a admin/productos', function () {
    $this->actingAs(crearCliente())->get('/admin/productos')->assertStatus(403);
});

it('cliente recibe 403 al intentar acceder a admin/ventas', function () {
    $this->actingAs(crearCliente())->get('/admin/ventas')->assertStatus(403);
});

it('cliente recibe 403 al intentar acceder a admin/contactos', function () {
    $this->actingAs(crearCliente())->get('/admin/contactos')->assertStatus(403);
});

it('cliente puede acceder a checkout/envio con carrito con items', function () {
    $cliente  = crearCliente();
    $carrito  = VentaCabecera::factory()->create(['user_id' => $cliente->id, 'estado' => 'carrito']);
    $producto = crearProducto(['stock' => 5]);
    $carrito->detalles()->create([
        'producto_id'     => $producto->id,
        'cantidad'        => 1,
        'precio_unitario' => $producto->precio,
        'subtotal'        => $producto->precio,
    ]);

    $this->actingAs($cliente)->get('/checkout/envio')->assertStatus(200);
});

// ─── Administrador ────────────────────────────────────────────────────────

it('admin es redirigido desde la home al panel de admin', function () {
    $this->actingAs(crearAdmin())->get('/')->assertRedirect(route('admin.panel'));
});

it('admin es redirigido desde el catalogo al panel de admin', function () {
    $this->actingAs(crearAdmin())->get('/catalogo')->assertRedirect(route('admin.panel'));
});

it('admin es redirigido desde /carrito al panel de admin', function () {
    $this->actingAs(crearAdmin())->get('/carrito')->assertRedirect(route('admin.panel'));
});

it('admin es redirigido desde checkout al panel de admin', function () {
    $this->actingAs(crearAdmin())->get('/checkout/envio')->assertRedirect(route('admin.panel'));
});

it('admin es redirigido desde /perfil/editar al panel de admin', function () {
    $this->actingAs(crearAdmin())->get('/perfil/editar')->assertRedirect(route('admin.panel'));
});

it('admin puede acceder al panel de admin', function () {
    $this->actingAs(crearAdmin())->get('/admin')->assertStatus(200);
});

it('admin puede acceder a la lista de usuarios', function () {
    $this->actingAs(crearAdmin())->get('/admin/usuarios')->assertStatus(200);
});

it('admin puede acceder a la lista de productos', function () {
    $this->actingAs(crearAdmin())->get('/admin/productos')->assertStatus(200);
});

it('admin puede acceder a la lista de ventas', function () {
    $this->actingAs(crearAdmin())->get('/admin/ventas')->assertStatus(200);
});

it('admin puede acceder a la lista de contactos', function () {
    $this->actingAs(crearAdmin())->get('/admin/contactos')->assertStatus(200);
});

it('admin puede acceder a su propio perfil de admin', function () {
    $this->actingAs(crearAdmin())->get('/admin/perfil')->assertStatus(200);
});

it('admin es redirigido a admin.panel al intentar acceder a /perfil', function () {
    $this->actingAs(crearAdmin())->get('/perfil')->assertRedirect(route('admin.panel'));
});

// ─── Middleware CheckRol — logica de negacion ─────────────────────────────

it('usuario sin ningun rol recibe 403 al acceder a ruta protegida por check.rol:admin', function () {
    $sinRol = \App\Models\Usuario::factory()->create(['rol_id' => null]);

    $this->actingAs($sinRol)->get('/admin')->assertStatus(403);
});

it('cliente con rol equivocado recibe 403 para rutas de admin', function () {
    // Un rol personalizado que no es ni admin ni cliente no deberia tener acceso
    $rolOtro = crearRol('supervisor');
    $usuario = \App\Models\Usuario::factory()->create(['rol_id' => $rolOtro->id]);

    $this->actingAs($usuario)->get('/admin')->assertStatus(403);
});
