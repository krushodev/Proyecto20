{{-- 
  ============================================================
  ARCHIVO: web.php
  PROPÓSITO: Definición de rutas web del proyecto
  DESCRIPCIÓN: Este archivo contiene todas las rutas HTTP
  de la aplicación. Cada ruta define una URL y la vista
  que se debe renderizar. Los datos del catálogo están
  hardcodeados aquí.
  ============================================================
--}}

<?php

use Illuminate\Support\Facades\Route;

/**
 * RUTA: /catalogo
 * Muestra el catálogo de productos/relojes
 * Datos: Array con 3 líneas (Estructural, Terra, Vanguardia)
 * cada una con modelos (nombre, imágenes, precio)
 */
Route::get('/catalogo', function () {
    $catalogo = [
        [
            'nombre' => 'Línea Estructural',
            'modelos' => [
                [
                    'nombre' => 'Monolito',
                    'imagen_lifestyle' => 'assets/monolito1.png',
                    'imagen_studio' => 'assets/monolito2.png',
                    'precio' => 13000
                ],
                [
                    'nombre' => 'Assoluto',
                    'imagen_lifestyle' => 'assets/assoluto1.png',
                    'imagen_studio' => 'assets/assoluto2.png',
                    'precio' => 11500
                ],
                [
                    'nombre' => 'Linea',
                    'imagen_lifestyle' => 'assets/linea1.png',
                    'imagen_studio' => 'assets/linea2.png',
                    'precio' => 9800
                ]
            ]
        ],
        [
            'nombre' => 'Línea Terra',
            'modelos' => [
                [
                    'nombre' => 'Siena',
                    'imagen_lifestyle' => 'assets/siena1.png',
                    'imagen_studio' => 'assets/siena2.png',
                    'precio' => 8500
                ],
                [
                    'nombre' => 'Radice',
                    'imagen_lifestyle' => 'assets/radice1.jpg',
                    'imagen_studio' => 'assets/radice2.png',
                    'precio' => 9200
                ],
                [
                    'nombre' => 'Bronzo',
                    'imagen_lifestyle' => 'assets/bronzo1.jpg',
                    'imagen_studio' => 'assets/bronzo2.jpg',
                    'precio' => 10500
                ]
            ]
        ],
        [
            'nombre' => 'Línea Vanguardia',
            'modelos' => [
                [
                    'nombre' => 'Struttura',
                    'imagen_lifestyle' => 'assets/struttura1.jpg',
                    'imagen_studio' => 'assets/struttura2.jpg',
                    'precio' => 14000
                ],
                [
                    'nombre' => 'Impero',
                    'imagen_lifestyle' => 'assets/impero1.png',
                    'imagen_studio' => 'assets/impero2.jpg',
                    'precio' => 12500
                ],
                [
                    'nombre' => 'Orizzonte',
                    'imagen_lifestyle' => 'assets/orizzonte.png',
                    'imagen_studio' => 'assets/orizzonte2.jpg',
                    'precio' => 11000
                ]
            ]
        ]
    ];

    return view('catalogo', compact('catalogo'));
});

/**
 * RUTA: /comercializacion
 * Muestra información sobre métodos de pago y envíos
 */
Route::get('/comercializacion', function () {
    return view('comercializacion');
});

/**
 * RUTA: /contacto
 * Muestra formulario de contacto y datos de la empresa
 * Named route: 'contacto' para usar en enlaces
 */
Route::get('/contacto', function () {
    return view('contacto');
})->name('contacto');

/**
 * RUTA: /detalle-compra
 * Página de detalle de compra (en construcción)
 */
Route::get('/detalle-compra', function () {
    return view('detalle-compra');
});

/**
 * RUTA: /detalle-producto
 * Página de detalle de producto individual (en construcción)
 */
Route::get('/detalle-producto', function () {
    return view('detalle-producto');
});

/**
 * RUTA: / (raíz)
 * Página de inicio/landing page principal
 */
Route::get('/', function () {
    return view('inicio');
});

/**
 * RUTA: /login
 * Página de inicio de sesión de usuarios
 */
Route::get('/login', function () {
    return view('login');
});

/**
 * RUTA: /nosotros
 * Página "Quiénes Somos" con historia de la empresa
 */
Route::get('/nosotros', function () {
    return view('nosotros');
});

/**
 * RUTA: /registro
 * Página de registro de nuevos usuarios (en construcción)
 */
Route::get('/registro', function () {
    return view('registro');
});

/**
 * RUTA: /terminos-y-condiciones
 * Página con políticas legales y términos de uso
 */
Route::get('/terminos-y-condiciones', function () {
    return view('terminos-y-condiciones');
});
