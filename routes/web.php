<?php

use Illuminate\Support\Facades\Route;

Route::get('/catalogo', function () {
    return view('catalogo');
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
