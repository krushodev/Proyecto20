<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
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
Route::get('/detalle-producto/{producto}', [PublicController::class, 'detalleProducto'])->name('detalle-producto');
Route::get('/carrito',               [PublicController::class, 'carrito'])->name('carrito');
Route::get('/detalle-compra',        [PublicController::class, 'detalleCompra']);

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

