<?php

namespace App\Http\Controllers;

use Illuminate\View\View;

class PublicController extends Controller
{
    public function inicio(): View
    {
        return view('paginas.inicio');
    }

    public function catalogo(): View
    {
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
                    ['nombre' => 'Siena',  'imagen_lifestyle' => 'assets/siena1.png',  'imagen_studio' => 'assets/siena2.png',  'precio' => 8500],
                    ['nombre' => 'Radice', 'imagen_lifestyle' => 'assets/radice1.jpg', 'imagen_studio' => 'assets/radice2.png', 'precio' => 9200],
                    ['nombre' => 'Bronzo', 'imagen_lifestyle' => 'assets/bronzo1.jpg', 'imagen_studio' => 'assets/bronzo2.jpg', 'precio' => 10500],
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

        return view('paginas.catalogo', compact('catalogo'));
    }

    public function nosotros(): View
    {
        return view('paginas.nosotros');
    }

    public function comercializacion(): View
    {
        return view('paginas.comercializacion');
    }

    public function contacto(): View
    {
        return view('paginas.contacto');
    }

    public function terminosYCondiciones(): View
    {
        return view('paginas.terminos-y-condiciones');
    }

    public function detalleProducto(): View
    {
        return view('paginas.detalle-producto');
    }

    public function detalleCompra(): View
    {
        return view('paginas.detalle-compra');
    }
}
