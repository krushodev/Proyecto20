<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;

class PublicController extends Controller
{
    public function inicio(): View
    {
        return view('paginas.inicio');
    }

    public function catalogo(): View
    {
        $catalogo = $this->obtenerCatalogo();

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

    public function detalleProducto(string $productoSlug): View
    {
        $catalogo = $this->obtenerCatalogo();
        $producto = null;

        foreach ($catalogo as $categoria) {
            foreach ($categoria['modelos'] as $modelo) {
                if ($modelo['slug'] === $productoSlug) {
                    $producto = $modelo;
                    break 2;
                }
            }
        }

        if (! $producto) {
            abort(404);
        }

        return view('paginas.detalle-producto', compact('producto'));
    }

    public function carrito(): View
    {
        return view('paginas.carrito');
    }

    public function detalleCompra(): View
    {
        return view('paginas.detalle-compra');
    }

    private function obtenerCatalogo(): array
    {
        return [
            [
                'nombre' => 'Línea Estructural',
                'modelos' => [
                    [
                        'slug' => 'monolito',
                        'nombre' => 'Monolito',
                        'imagen_lifestyle' => 'assets/monolito1.png',
                        'imagen_studio' => 'assets/monolito2.png',
                        'precio' => 13000,
                        'descripcion' => 'Un reloj escultórico con líneas puras y presencia estructural, creado para destacar en cualquier entorno.',
                        'especificaciones' => [
                            'Caja' => 'Titanio cepillado 42mm',
                            'Movimiento' => 'Automático Vittorio 21',
                            'Cristal' => 'Zafiro antirreflejo',
                            'Resistencia' => '10 ATM',
                            'Correa' => 'Silicona técnica negra',
                        ],
                    ],
                    [
                        'slug' => 'assoluto',
                        'nombre' => 'Assoluto',
                        'imagen_lifestyle' => 'assets/assoluto1.png',
                        'imagen_studio' => 'assets/assoluto2.png',
                        'precio' => 11500,
                        'descripcion' => 'Diseño minimalista y poderoso, con acabado oscuro y detalles que combinan modernidad con manufactura tradicional.',
                        'especificaciones' => [
                            'Caja' => 'Acero PVD negro 40mm',
                            'Movimiento' => 'Cuarzo suizo Ronda 6004B',
                            'Cristal' => 'Mineral endurecido',
                            'Resistencia' => '5 ATM',
                            'Correa' => 'Cuero vegano premium',
                        ],
                    ],
                    [
                        'slug' => 'linea',
                        'nombre' => 'Linea',
                        'imagen_lifestyle' => 'assets/linea1.png',
                        'imagen_studio' => 'assets/linea2.png',
                        'precio' => 9800,
                        'descripcion' => 'Una pieza sobria y versátil, con una carátula limpia y una estética atemporal para uso diario y ocasiones especiales.',
                        'especificaciones' => [
                            'Caja' => 'Acero pulido 38mm',
                            'Movimiento' => 'Miyota 2035',
                            'Cristal' => 'Mineral endurecido',
                            'Resistencia' => '3 ATM',
                            'Correa' => 'Malla milanesa de acero',
                        ],
                    ],
                ],
            ],
            [
                'nombre' => 'Línea Terra',
                'modelos' => [
                    [
                        'slug' => 'siena',
                        'nombre' => 'Siena',
                        'imagen_lifestyle' => 'assets/siena1.png',
                        'imagen_studio' => 'assets/siena2.png',
                        'precio' => 8500,
                        'descripcion' => 'Inspirado en paisajes cálidos, Siena equilibra textura y color en una propuesta robusta y elegante.',
                        'especificaciones' => [
                            'Caja' => 'Bronce cepillado 42mm',
                            'Movimiento' => 'Sellita SW200',
                            'Cristal' => 'Zafiro antirreflejo',
                            'Resistencia' => '8 ATM',
                            'Correa' => 'Piel color arena',
                        ],
                    ],
                    [
                        'slug' => 'radice',
                        'nombre' => 'Radice',
                        'imagen_lifestyle' => 'assets/radice1.jpg',
                        'imagen_studio' => 'assets/radice2.png',
                        'precio' => 9200,
                        'descripcion' => 'Con un aire vintage y detalles clásicos, Radice ofrece sabor tradicional con precisión moderna.',
                        'especificaciones' => [
                            'Caja' => 'Bronce patinado 41mm',
                            'Movimiento' => 'Miyota 9015',
                            'Cristal' => 'Mineral endurecido',
                            'Resistencia' => '10 ATM',
                            'Correa' => 'Cuero natural marrón',
                        ],
                    ],
                    [
                        'slug' => 'bronzo',
                        'nombre' => 'Bronzo',
                        'imagen_lifestyle' => 'assets/bronzo1.jpg',
                        'imagen_studio' => 'assets/bronzo2.jpg',
                        'precio' => 10500,
                        'descripcion' => 'Un cronógrafo de elevado carácter, con tonos cálidos y una presencia deportiva refinada.',
                        'especificaciones' => [
                            'Caja' => 'Acero con baño bronce 44mm',
                            'Movimiento' => 'Cuarzo cronógrafo',
                            'Cristal' => 'Zafiro plano',
                            'Resistencia' => '10 ATM',
                            'Correa' => 'Nylon técnico',
                        ],
                    ],
                ],
            ],
            [
                'nombre' => 'Línea Vanguardia',
                'modelos' => [
                    [
                        'slug' => 'struttura',
                        'nombre' => 'Struttura',
                        'imagen_lifestyle' => 'assets/struttura1.jpg',
                        'imagen_studio' => 'assets/struttura2.jpg',
                        'precio' => 14000,
                        'descripcion' => 'Estructura abierta, geometría de impacto y un alma técnica para quienes buscan un reloj con carácter arquitectónico.',
                        'especificaciones' => [
                            'Caja' => 'Acero satinado 43mm',
                            'Movimiento' => 'Sellita SW300',
                            'Cristal' => 'Zafiro antirreflejo',
                            'Resistencia' => '12 ATM',
                            'Correa' => 'Caucho texturado',
                        ],
                    ],
                    [
                        'slug' => 'impero',
                        'nombre' => 'Impero',
                        'imagen_lifestyle' => 'assets/impero1.png',
                        'imagen_studio' => 'assets/impero2.jpg',
                        'precio' => 12500,
                        'descripcion' => 'Líneas nobles y una estética refinada que convierten a Impero en un reloj de lujo contemporáneo para uso formal.',
                        'especificaciones' => [
                            'Caja' => 'Oro rosa IP 40mm',
                            'Movimiento' => 'Cuarzo suizo',
                            'Cristal' => 'Mineral endurecido',
                            'Resistencia' => '5 ATM',
                            'Correa' => 'Cuero negro estructurado',
                        ],
                    ],
                    [
                        'slug' => 'orizzonte',
                        'nombre' => 'Orizzonte',
                        'imagen_lifestyle' => 'assets/orizzonte.png',
                        'imagen_studio' => 'assets/orizzonte2.jpg',
                        'precio' => 11000,
                        'descripcion' => 'Una pieza deportiva con detalles técnicos, ideal para quienes buscan estilo y rendimiento por igual.',
                        'especificaciones' => [
                            'Caja' => 'Acero negro 44mm',
                            'Movimiento' => 'Seiko NH35A',
                            'Cristal' => 'Zafiro antirreflejo',
                            'Resistencia' => '20 ATM',
                            'Correa' => 'Silicona deportiva',
                        ],
                    ],
                ],
            ],
        ];
    }
}
