<?php

use App\Http\Controllers\AdminContactoController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\AdminVentaController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CarritoController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\ForgotPasswordController;
use App\Http\Controllers\PerfilController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\PublicController;
use App\Http\Controllers\ResetPasswordController;
use App\Http\Controllers\RolController;
use App\Http\Controllers\UsuarioController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Rutas públicas
|--------------------------------------------------------------------------
*/

Route::get('/',                      [PublicController::class, 'inicio'])->name('home');
Route::get('/catalogo',              [PublicController::class, 'catalogo'])->name('catalogo');
Route::get('/nosotros',              [PublicController::class, 'nosotros']);
Route::get('/comercializacion',      [PublicController::class, 'comercializacion']);
Route::get('/contacto',              [PublicController::class, 'contacto'])->name('contacto');
Route::post('/contacto',             [PublicController::class, 'enviarContacto'])->name('contacto.enviar');
Route::get('/terminos-y-condiciones',[PublicController::class, 'terminosYCondiciones']);
Route::get('/detalle-producto/{slug}', [PublicController::class, 'detalleProducto'])->name('detalle-producto');

/*
|--------------------------------------------------------------------------
| Rutas de autenticación (solo invitados)
|--------------------------------------------------------------------------
*/

Route::middleware('guest')->group(function () {
    Route::get('/login',     [AuthController::class, 'mostrarLogin'])->name('login');
    Route::post('/login',    [AuthController::class, 'autenticar']);
    Route::get('/registro',  [AuthController::class, 'mostrarRegistro'])->name('registro');
    Route::post('/registro', [AuthController::class, 'registrar']);

    Route::get('/forgot-password',        [ForgotPasswordController::class, 'mostrar'])->name('password.request');
    Route::post('/forgot-password',       [ForgotPasswordController::class, 'enviar'])->name('password.email');
    Route::get('/reset-password/{token}', [ResetPasswordController::class, 'mostrar'])->name('password.reset');
    Route::post('/reset-password',        [ResetPasswordController::class, 'resetear'])->name('password.update');
});

/*
|--------------------------------------------------------------------------
| Logout (cualquier usuario autenticado)
|--------------------------------------------------------------------------
*/

Route::post('/logout', [AuthController::class, 'logout'])
    ->middleware('auth')
    ->name('logout');

/*
|--------------------------------------------------------------------------
| Perfil de usuario (requiere autenticación)
|--------------------------------------------------------------------------
*/

Route::middleware('auth')->group(function () {
    Route::get('/perfil', [PerfilController::class, 'ver'])->name('perfil.ver');
    Route::get('/perfil/editar', [PerfilController::class, 'editar'])
        ->middleware('check.rol:!admin')
        ->name('perfil.editar');

    Route::put('/perfil', [PerfilController::class, 'actualizar'])
        ->middleware('check.rol:!admin')
        ->name('perfil.actualizar');
});

/*
|--------------------------------------------------------------------------
| Carrito de compras (acceso público — guests usan sesión)
|--------------------------------------------------------------------------
*/

Route::get('/carrito',                       [CarritoController::class, 'index'])->name('carrito');
Route::post('/carrito/agregar',              [CarritoController::class, 'agregar'])->name('carrito.agregar');
Route::delete('/carrito/eliminar/{detalle}', [CarritoController::class, 'eliminar'])->name('carrito.eliminar');
Route::delete('/carrito/vaciar',             [CarritoController::class, 'vaciar'])->name('carrito.vaciar');

// Rutas del carrito que requieren autenticación
Route::middleware(['auth', 'check.rol:!admin'])->group(function () {
    Route::post('/carrito/confirmar', [CarritoController::class, 'confirmar'])->name('carrito.confirmar');
    Route::get('/detalle-compra',     [CarritoController::class, 'detalleCompra'])->name('detalle-compra');
    Route::get('/mis-compras',        [CarritoController::class, 'misCompras'])->name('mis-compras');
});

/*
|--------------------------------------------------------------------------
| Flujo de Checkout (requiere autenticación)
|--------------------------------------------------------------------------
*/

Route::middleware(['auth', 'check.rol:!admin'])->prefix('checkout')->group(function () {
    Route::get('/envio',         [CheckoutController::class, 'envio'])->name('checkout.envio');
    Route::post('/envio',        [CheckoutController::class, 'guardarEnvio'])->name('checkout.envio.guardar');
    Route::get('/costo-envio',   [CheckoutController::class, 'costoEnvio'])->name('checkout.costo-envio');
    Route::get('/pago',          [CheckoutController::class, 'pago'])->name('checkout.pago');
    Route::post('/pago',         [CheckoutController::class, 'procesarPago'])->name('checkout.pago.procesar');
    Route::get('/confirmacion',  [CheckoutController::class, 'confirmacion'])->name('checkout.confirmacion');
});

/*
|--------------------------------------------------------------------------
| Área de administración (auth + rol admin)
|--------------------------------------------------------------------------
*/

Route::middleware(['auth', 'check.rol:admin'])
    ->prefix('admin')
    ->group(function () {
        Route::get('/', [AdminController::class, 'index'])->name('admin.panel');

        Route::get('perfil',  [PerfilController::class, 'mostrarAdmin'])->name('admin.perfil');
        Route::put('perfil',  [PerfilController::class, 'actualizarAdmin'])->name('admin.perfil.actualizar');

        Route::resource('usuarios', UsuarioController::class)
            ->only(['index', 'create', 'store', 'edit', 'update', 'destroy']);

        Route::resource('roles', RolController::class)
            ->only(['index', 'store', 'destroy']);

        Route::resource('productos', ProductoController::class)
            ->only(['index', 'create', 'store', 'edit', 'update', 'destroy']);

        Route::resource('ventas', AdminVentaController::class)
            ->only(['index', 'show']);

        Route::get('contactos', [AdminContactoController::class, 'index'])->name('contactos.index');
        Route::patch('contactos/{id}/leido', [AdminContactoController::class, 'marcarLeido'])->name('contactos.leido');
    });
