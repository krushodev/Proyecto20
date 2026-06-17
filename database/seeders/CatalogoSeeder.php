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
                        'precio'          => 250000.00,
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
                        'precio'          => 210000.00,
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
                        'precio'          => 180000.00,
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
                    [
                        'nombre'          => 'Geometra',
                        'slug'            => 'geometra',
                        'precio'          => 280000.00,
                        'descripcion'     => 'Arquitectura de vanguardia en tu muñeca. Ángulos marcados en titanio y un dial oscuro que define el lujo minimalista.',
                        'imagen_lifestyle' => 'assets/geometra1.png',
                        'imagen_studio'   => 'assets/geometra2.png',
                        'caja'            => 'Titanio cepillado angular 41mm',
                        'movimiento'      => 'Automático Suizo Sellita SW200-1',
                        'cristal'         => 'Zafiro con recubrimiento AR doble',
                        'resistencia'     => '10 ATM',
                        'correa'          => 'Acero integrado',
                        'stock'           => 0,
                    ],
                    [
                        'nombre'          => 'Cubo',
                        'slug'            => 'cubo',
                        'precio'          => 190000.00,
                        'descripcion'     => 'Estética cuadrada y pura. Una pieza que desafía lo convencional con un dial blanco inmaculado.',
                        'imagen_lifestyle' => 'assets/cubo1.png',
                        'imagen_studio'   => 'assets/cubo2.png',
                        'caja'            => 'Acero cepillado cuadrado 39mm',
                        'movimiento'      => 'Cuarzo Suizo',
                        'cristal'         => 'Zafiro plano',
                        'resistencia'     => '5 ATM',
                        'correa'          => 'Cuero negro premium',
                        'stock'           => 14,
                    ],
                    [
                        'nombre'          => 'Prisma',
                        'slug'            => 'prisma',
                        'precio'          => 310000.00,
                        'descripcion'     => 'Bisel octogonal y brazalete integrado. El pináculo de la línea estructural en una silueta icónica.',
                        'imagen_lifestyle' => 'assets/prisma1.png',
                        'imagen_studio'   => 'assets/prisma2.png',
                        'caja'            => 'Acero pulido 42mm',
                        'movimiento'      => 'Automático Miyota 9015',
                        'cristal'         => 'Zafiro con bisel octogonal',
                        'resistencia'     => '10 ATM',
                        'correa'          => 'Brazalete de acero integrado',
                        'stock'           => 8,
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
                        'precio'          => 160000.00,
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
                        'precio'          => 175000.00,
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
                        'precio'          => 220000.00,
                        'descripcion'     => 'Un cronógrafo de elevado carácter, con tonos cálidos y una presencia deportiva refinada.',
                        'imagen_lifestyle' => 'assets/bronzo1.png',
                        'imagen_studio'   => 'assets/bronzo2.jpg',
                        'caja'            => 'Acero con baño bronce 44mm',
                        'movimiento'      => 'Cuarzo cronógrafo',
                        'cristal'         => 'Zafiro plano',
                        'resistencia'     => '10 ATM',
                        'correa'          => 'Nylon técnico',
                        'stock'           => 7,
                    ],
                    [
                        'nombre'          => 'Deserto',
                        'slug'            => 'deserto',
                        'precio'          => 195000.00,
                        'descripcion'     => 'Diseñado para la exploración con estética heritage. Combina bronce patinado con una textura granulada de arena fina.',
                        'imagen_lifestyle' => 'assets/deserto1.png',
                        'imagen_studio'   => 'assets/deserto2.png',
                        'caja'            => 'Bronce patinado 40mm',
                        'movimiento'      => 'Automático Miyota 8215',
                        'cristal'         => 'Zafiro abombado',
                        'resistencia'     => '15 ATM',
                        'correa'          => 'Lona canvas verde oliva',
                        'stock'           => 9,
                    ],
                    [
                        'nombre'          => 'Foresta',
                        'slug'            => 'foresta',
                        'precio'          => 150000.00,
                        'descripcion'     => 'Un reloj de campo genuino. Dial verde bosque mate contrastado con cuero marrón rústico de alta durabilidad.',
                        'imagen_lifestyle' => 'assets/foresta1.png',
                        'imagen_studio'   => 'assets/foresta2.png',
                        'caja'            => 'Acero cepillado 39mm',
                        'movimiento'      => 'Cuarzo de alta precisión',
                        'cristal'         => 'Mineral endurecido',
                        'resistencia'     => '10 ATM',
                        'correa'          => 'Cuero marrón desgastado',
                        'stock'           => 18,
                    ],
                    [
                        'nombre'          => 'Vulcano',
                        'slug'            => 'vulcano',
                        'precio'          => 205000.00,
                        'descripcion'     => 'Tonos oscuros y cálidos de roca volcánica. Caja mate robusta pensada para resistir los elementos.',
                        'imagen_lifestyle' => 'assets/vulcano1.png',
                        'imagen_studio'   => 'assets/vulcano2.png',
                        'caja'            => 'Acero negro mate 43mm',
                        'movimiento'      => 'Automático NH35',
                        'cristal'         => 'Zafiro abombado',
                        'resistencia'     => '20 ATM',
                        'correa'          => 'Cuero grueso marrón rojizo',
                        'stock'           => 5,
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
                        'precio'          => 320000.00,
                        'descripcion'     => 'Estructura abierta, geometría de impacto y un alma técnica para quienes buscan un reloj con carácter arquitectónico.',
                        'imagen_lifestyle' => 'assets/struttura1.png',
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
                        'precio'          => 290000.00,
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
                        'precio'          => 270000.00,
                        'descripcion'     => 'Una pieza deportiva con detalles técnicos, ideal para quienes buscan estilo y rendimiento por igual.',
                        'imagen_lifestyle' => 'assets/orizzonte1.png',
                        'imagen_studio'   => 'assets/orizzonte2.jpg',
                        'caja'            => 'Acero negro 44mm',
                        'movimiento'      => 'Seiko NH35A',
                        'cristal'         => 'Zafiro antirreflejo',
                        'resistencia'     => '20 ATM',
                        'correa'          => 'Silicona deportiva',
                        'stock'           => 11,
                    ],
                    [
                        'nombre'          => 'Eclissi',
                        'slug'            => 'eclissi',
                        'precio'          => 380000.00,
                        'descripcion'     => 'El pináculo del diseño stealth. Acabados en negro PVD mate con un dial esqueletizado que revela el corazón mecánico del reloj.',
                        'imagen_lifestyle' => 'assets/eclissi1.png',
                        'imagen_studio'   => 'assets/eclissi2.png',
                        'caja'            => 'Acero PVD negro mate 42mm',
                        'movimiento'      => 'Automático Esqueletizado',
                        'cristal'         => 'Zafiro plano con tratamiento AR',
                        'resistencia'     => '10 ATM',
                        'correa'          => 'Cuero negro mate',
                        'stock'           => 4,
                    ],
                    [
                        'nombre'          => 'Crono-Tech',
                        'slug'            => 'crono-tech',
                        'precio'          => 350000.00,
                        'descripcion'     => 'Precisión de carreras. Dial de fibra de carbono real, detalles en rojo brillante y caja aerodinámica.',
                        'imagen_lifestyle' => 'assets/crono-tech1.png',
                        'imagen_studio'   => 'assets/crono-tech2.png',
                        'caja'            => 'Acero y PVD negro 44mm',
                        'movimiento'      => 'Cronógrafo Meca-Quartz',
                        'cristal'         => 'Zafiro',
                        'resistencia'     => '10 ATM',
                        'correa'          => 'Caucho integrado',
                        'stock'           => 10,
                    ],
                    [
                        'nombre'          => 'Aero',
                        'slug'            => 'aero',
                        'precio'          => 240000.00,
                        'descripcion'     => 'Legibilidad pura bajo cualquier condición. Inspirado en los instrumentos de vuelo con acabados utilitarios mate.',
                        'imagen_lifestyle' => 'assets/aero1.png',
                        'imagen_studio'   => 'assets/aero2.png',
                        'caja'            => 'Acero granallado gris mate 45mm',
                        'movimiento'      => 'Automático Suizo',
                        'cristal'         => 'Zafiro abombado',
                        'resistencia'     => '5 ATM',
                        'correa'          => 'Nylon NATO negra resistente',
                        'stock'           => 7,
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
