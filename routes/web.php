<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\RolController;
use App\Http\Controllers\UsuarioController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Rutas públicas
|--------------------------------------------------------------------------
*/

Route::get('/', fn () => view('inicio'))->name('home');

Route::get('/catalogo', function () {
    $catalogo = [
        [
            'nombre' => 'Línea Estructural',
            'modelos' => [
                ['nombre' => 'Monolito',  'imagen_lifestyle' => 'assets/monolito1.png',   'imagen_studio' => 'assets/monolito2.png',   'precio' => 13000],
                ['nombre' => 'Assoluto', 'imagen_lifestyle' => 'assets/assoluto1.png',  'imagen_studio' => 'assets/assoluto2.png',  'precio' => 11500],
                ['nombre' => 'Linea',    'imagen_lifestyle' => 'assets/linea1.png',     'imagen_studio' => 'assets/linea2.png',     'precio' => 9800],
            ],
        ],
        [
            'nombre' => 'Línea Terra',
            'modelos' => [
                ['nombre' => 'Siena',  'imagen_lifestyle' => 'assets/siena1.png',     'imagen_studio' => 'assets/siena2.png',     'precio' => 8500],
                ['nombre' => 'Radice', 'imagen_lifestyle' => 'assets/radice1.jpg',    'imagen_studio' => 'assets/radice2.png',    'precio' => 9200],
                ['nombre' => 'Bronzo', 'imagen_lifestyle' => 'assets/bronzo1.jpg',    'imagen_studio' => 'assets/bronzo2.jpg',    'precio' => 10500],
            ],
        ],
        [
            'nombre' => 'Línea Vanguardia',
            'modelos' => [
                ['nombre' => 'Struttura', 'imagen_lifestyle' => 'assets/struttura1.jpg', 'imagen_studio' => 'assets/struttura2.jpg', 'precio' => 14000],
                ['nombre' => 'Impero',    'imagen_lifestyle' => 'assets/impero1.png',    'imagen_studio' => 'assets/impero2.jpg',    'precio' => 12500],
                ['nombre' => 'Orizzonte', 'imagen_lifestyle' => 'assets/orizzonte.png',  'imagen_studio' => 'assets/orizzonte2.jpg', 'precio' => 11000],
            ],
        ],
    ];

    return view('catalogo', compact('catalogo'));
});

Route::get('/comercializacion',       fn () => view('comercializacion'));
Route::get('/contacto',               fn () => view('contacto'))->name('contacto');
Route::get('/nosotros',               fn () => view('nosotros'));
Route::get('/terminos-y-condiciones', fn () => view('terminos-y-condiciones'));
Route::get('/detalle-producto',       fn () => view('detalle-producto'));
Route::get('/detalle-compra',         fn () => view('detalle-compra'));

/*
|--------------------------------------------------------------------------
| Rutas de autenticación (solo invitados)
|--------------------------------------------------------------------------
*/

Route::middleware('guest')->group(function () {
    Route::get('/login',    [AuthController::class, 'mostrarLogin'])->name('login');
    Route::post('/login',   [AuthController::class, 'autenticar']);
    Route::get('/registro', [AuthController::class, 'mostrarRegistro'])->name('registro');
    Route::post('/registro',[AuthController::class, 'registrar']);
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

/*
|--------------------------------------------------------------------------
| Área de cliente (auth + rol cliente)
|--------------------------------------------------------------------------
*/

Route::middleware(['auth', 'check.rol:cliente'])->group(function () {
    Route::get('/carrito', [ClienteController::class, 'index'])->name('carrito');
});
