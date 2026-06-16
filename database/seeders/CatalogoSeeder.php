<?php

namespace Database\Seeders;

use App\Models\Categoria;
use App\Models\Producto;
use App\Models\ProductoImagen;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CatalogoSeeder extends Seeder
{
    private const R2_BASE = 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/';

    public function run(): void
    {
        DB::transaction(function () {
            $this->seedLineasYModelos();
        });
    }

    private function seedLineasYModelos(): void
    {
        $catalogo = [
            [
                'nombre'      => 'Línea Estructural',
                'slug'        => 'linea-estructural',
                'descripcion' => 'Diseños escultóricos con líneas puras y presencia estructural.',
                'modelos'     => [
                    [
                        'nombre'          => 'Monolito',
                        'slug'            => 'monolito',
                        'precio'          => 13000.00,
                        'descripcion'     => 'Un reloj escultórico con líneas puras y presencia estructural, creado para destacar en cualquier entorno.',
                        'imagen_lifestyle' => 'assets/monolito1.png',
                        'imagen_studio'   => 'assets/monolito2.png',
                        'caja'            => 'Titanio cepillado 42mm',
                        'movimiento'      => 'Automático Vittorio 21',
                        'cristal'         => 'Zafiro antirreflejo',
                        'resistencia'     => '10 ATM',
                        'correa'          => 'Silicona técnica negra',
                        'stock'           => 12,
                    ],
                    [
                        'nombre'          => 'Assoluto',
                        'slug'            => 'assoluto',
                        'precio'          => 11500.00,
                        'descripcion'     => 'Diseño minimalista y poderoso, con acabado oscuro y detalles que combinan modernidad con manufactura tradicional.',
                        'imagen_lifestyle' => 'assets/assoluto1.png',
                        'imagen_studio'   => 'assets/assoluto2.png',
                        'caja'            => 'Acero PVD negro 40mm',
                        'movimiento'      => 'Cuarzo suizo Ronda 6004B',
                        'cristal'         => 'Mineral endurecido',
                        'resistencia'     => '5 ATM',
                        'correa'          => 'Cuero vegano premium',
                        'stock'           => 15,
                    ],
                    [
                        'nombre'          => 'Linea',
                        'slug'            => 'linea',
                        'precio'          => 9800.00,
                        'descripcion'     => 'Una pieza sobria y versátil, con una carátula limpia y una estética atemporal para uso diario y ocasiones especiales.',
                        'imagen_lifestyle' => 'assets/linea1.png',
                        'imagen_studio'   => 'assets/linea2.png',
                        'caja'            => 'Acero pulido 38mm',
                        'movimiento'      => 'Miyota 2035',
                        'cristal'         => 'Mineral endurecido',
                        'resistencia'     => '3 ATM',
                        'correa'          => 'Malla milanesa de acero',
                        'stock'           => 20,
                    ],
                ],
            ],
            [
                'nombre'      => 'Línea Terra',
                'slug'        => 'linea-terra',
                'descripcion' => 'Inspirada en paisajes naturales, combina textura, color y robustez.',
                'modelos'     => [
                    [
                        'nombre'          => 'Siena',
                        'slug'            => 'siena',
                        'precio'          => 8500.00,
                        'descripcion'     => 'Inspirado en paisajes cálidos, Siena equilibra textura y color en una propuesta robusta y elegante.',
                        'imagen_lifestyle' => 'assets/siena1.png',
                        'imagen_studio'   => 'assets/siena2.png',
                        'caja'            => 'Bronce cepillado 42mm',
                        'movimiento'      => 'Sellita SW200',
                        'cristal'         => 'Zafiro antirreflejo',
                        'resistencia'     => '8 ATM',
                        'correa'          => 'Piel color arena',
                        'stock'           => 8,
                    ],
                    [
                        'nombre'          => 'Radice',
                        'slug'            => 'radice',
                        'precio'          => 9200.00,
                        'descripcion'     => 'Con un aire vintage y detalles clásicos, Radice ofrece sabor tradicional con precisión moderna.',
                        'imagen_lifestyle' => 'assets/radice1.jpg',
                        'imagen_studio'   => 'assets/radice2.png',
                        'caja'            => 'Bronce patinado 41mm',
                        'movimiento'      => 'Miyota 9015',
                        'cristal'         => 'Mineral endurecido',
                        'resistencia'     => '10 ATM',
                        'correa'          => 'Cuero natural marrón',
                        'stock'           => 10,
                    ],
                    [
                        'nombre'          => 'Bronzo',
                        'slug'            => 'bronzo',
                        'precio'          => 10500.00,
                        'descripcion'     => 'Un cronógrafo de elevado carácter, con tonos cálidos y una presencia deportiva refinada.',
                        'imagen_lifestyle' => 'assets/bronzo1.jpg',
                        'imagen_studio'   => 'assets/bronzo2.jpg',
                        'caja'            => 'Acero con baño bronce 44mm',
                        'movimiento'      => 'Cuarzo cronógrafo',
                        'cristal'         => 'Zafiro plano',
                        'resistencia'     => '10 ATM',
                        'correa'          => 'Nylon técnico',
                        'stock'           => 7,
                    ],
                ],
            ],
            [
                'nombre'      => 'Línea Vanguardia',
                'slug'        => 'linea-vanguardia',
                'descripcion' => 'Geometría de impacto y alma técnica para quienes buscan carácter arquitectónico.',
                'modelos'     => [
                    [
                        'nombre'          => 'Struttura',
                        'slug'            => 'struttura',
                        'precio'          => 14000.00,
                        'descripcion'     => 'Estructura abierta, geometría de impacto y un alma técnica para quienes buscan un reloj con carácter arquitectónico.',
                        'imagen_lifestyle' => 'assets/struttura1.jpg',
                        'imagen_studio'   => 'assets/struttura2.jpg',
                        'caja'            => 'Acero satinado 43mm',
                        'movimiento'      => 'Sellita SW300',
                        'cristal'         => 'Zafiro antirreflejo',
                        'resistencia'     => '12 ATM',
                        'correa'          => 'Caucho texturado',
                        'stock'           => 0,
                    ],
                    [
                        'nombre'          => 'Impero',
                        'slug'            => 'impero',
                        'precio'          => 12500.00,
                        'descripcion'     => 'Líneas nobles y una estética refinada que convierten a Impero en un reloj de lujo contemporáneo para uso formal.',
                        'imagen_lifestyle' => 'assets/impero1.png',
                        'imagen_studio'   => 'assets/impero2.jpg',
                        'caja'            => 'Oro rosa IP 40mm',
                        'movimiento'      => 'Cuarzo suizo',
                        'cristal'         => 'Mineral endurecido',
                        'resistencia'     => '5 ATM',
                        'correa'          => 'Cuero negro estructurado',
                        'stock'           => 9,
                    ],
                    [
                        'nombre'          => 'Orizzonte',
                        'slug'            => 'orizzonte',
                        'precio'          => 11000.00,
                        'descripcion'     => 'Una pieza deportiva con detalles técnicos, ideal para quienes buscan estilo y rendimiento por igual.',
                        'imagen_lifestyle' => 'assets/orizzonte.png',
                        'imagen_studio'   => 'assets/orizzonte2.jpg',
                        'caja'            => 'Acero negro 44mm',
                        'movimiento'      => 'Seiko NH35A',
                        'cristal'         => 'Zafiro antirreflejo',
                        'resistencia'     => '20 ATM',
                        'correa'          => 'Silicona deportiva',
                        'stock'           => 11,
                    ],
                ],
            ],
        ];

        foreach ($catalogo as $lineaData) {
            $modelos = $lineaData['modelos'];

            $categoria = Categoria::firstOrCreate(
                ['slug' => $lineaData['slug']],
                [
                    'nombre'      => $lineaData['nombre'],
                    'descripcion' => $lineaData['descripcion'],
                    'activo'      => $lineaData['activo'] ?? true,
                ]
            );

            foreach ($modelos as $modeloData) {
                $imagenLifestyle = self::R2_BASE . $modeloData['imagen_lifestyle'];
                $imagenStudio    = self::R2_BASE . $modeloData['imagen_studio'];
                unset($modeloData['imagen_lifestyle'], $modeloData['imagen_studio']);

                $modeloData['categoria_id'] = $categoria->id;
                $modeloData['activo']       = true;

                $producto = Producto::firstOrCreate(
                    ['slug' => $modeloData['slug']],
                    $modeloData
                );

                ProductoImagen::firstOrCreate(
                    ['producto_id' => $producto->id, 'tipo' => 'lifestyle'],
                    ['url' => $imagenLifestyle, 'orden' => 0]
                );

                ProductoImagen::firstOrCreate(
                    ['producto_id' => $producto->id, 'tipo' => 'studio'],
                    ['url' => $imagenStudio, 'orden' => 1]
                );
            }
        }
    }
}
