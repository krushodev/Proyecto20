<?php

use Illuminate\Support\Facades\Route;

Route::get('/catalogo', function () {
    $catalogo = [
        [
            'nombre' => 'Línea Estructural',
            'modelos' => [
                [
                    'nombre' => 'Monolito',
                    'imagen_lifestyle' => 'assets/monolito1.png',
                    'imagen_studio' => 'assets/monolito2.png'
                ],
                [
                    'nombre' => 'Assoluto',
                    'imagen_lifestyle' => 'assets/assoluto1.png',
                    'imagen_studio' => 'assets/assoluto2.png'
                ],
                [
                    'nombre' => 'Linea',
                    'imagen_lifestyle' => 'assets/linea1.png',
                    'imagen_studio' => 'assets/linea2.png'
                ]
            ]
        ],
        [
            'nombre' => 'Línea Terra',
            'modelos' => [
                [
                    'nombre' => 'Siena',
                    'imagen_lifestyle' => 'assets/siena1.png',
                    'imagen_studio' => 'assets/siena2.png'
                ],
                [
                    'nombre' => 'Radice',
                    'imagen_lifestyle' => 'assets/radice1.jpg',
                    'imagen_studio' => 'assets/radice2.png'
                ],
                [
                    'nombre' => 'Bronzo',
                    'imagen_lifestyle' => 'assets/bronzo1.jpg',
                    'imagen_studio' => 'assets/bronzo2.jpg'
                ]
            ]
        ],
        [
            'nombre' => 'Línea Vanguardia',
            'modelos' => [
                [
                    'nombre' => 'Struttura',
                    'imagen_lifestyle' => 'assets/struttura1.jpg',
                    'imagen_studio' => 'assets/struttura2.jpg'
                ],
                [
                    'nombre' => 'Impero',
                    'imagen_lifestyle' => 'assets/impero1.png',
                    'imagen_studio' => 'assets/impero2.jpg'
                ],
                [
                    'nombre' => 'Orizzonte',
                    'imagen_lifestyle' => 'assets/orizzonte.png',
                    'imagen_studio' => 'assets/orizzonte2.jpg'
                ]
            ]
        ]
    ];

    return view('catalogo', compact('catalogo'));
});

Route::get('/comercializacion', function () {
    return view('comercializacion');
});

Route::get('/contacto', function () {
    return view('contacto');
});

Route::get('/detalle-compra', function () {
    return view('detalle-compra');
});

Route::get('/detalle-producto', function () {
    return view('detalle-producto');
});

Route::get('/', function () {
    return view('inicio');
});

Route::get('/login', function () {
    return view('login');
});

Route::get('/nosotros', function () {
    return view('nosotros');
});

Route::get('/registro', function () {
    return view('registro');
});

Route::get('/terminos-y-condiciones', function () {
    return view('terminos-y-condiciones');
});
