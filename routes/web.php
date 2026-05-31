<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CarritoController;
use App\Http\Controllers\PublicController;
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
| Carrito de compras (requiere autenticación)
|--------------------------------------------------------------------------
*/

Route::middleware(['auth', 'es.cliente'])->group(function () {
    Route::get('/carrito',                          [CarritoController::class, 'index'])->name('carrito');
    Route::post('/carrito/agregar',                 [CarritoController::class, 'agregar'])->name('carrito.agregar');
    Route::delete('/carrito/eliminar/{detalle}',    [CarritoController::class, 'eliminar'])->name('carrito.eliminar');
    Route::post('/carrito/confirmar',               [CarritoController::class, 'confirmar'])->name('carrito.confirmar');
    Route::get('/detalle-compra',                   [CarritoController::class, 'detalleCompra'])->name('detalle-compra');
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

        Route::resource('usuarios', UsuarioController::class)
            ->only(['index', 'edit', 'update', 'destroy']);

        Route::resource('roles', RolController::class)
            ->only(['index', 'store', 'destroy']);
    });
