<?php

namespace Database\Factories;

use App\Models\Usuario;
use App\Models\VentaCabecera;
use Illuminate\Database\Eloquent\Factories\Factory;

class VentaCabeceraFactory extends Factory
{
    protected $model = VentaCabecera::class;

    private static array $callesLaPlata = [
        '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
        '11', '12', '13', '14', '32', '38', '44', '51', '57', '60',
        '63', '66', '72', '76', '81', '84', '90', '116', '122', '137',
        'Avenida 7', 'Avenida 13', 'Avenida 32', 'Avenida 44', 'Avenida 66',
        'Diagonal 73', 'Diagonal 74', 'Diagonal 79', 'Diagonal 80',
    ];

    private static array $barrios = [
        'Centro', 'Los Hornos', 'Villa Elvira', 'Gonnet', 'City Bell',
        'Tolosa', 'Ringuelet', 'Berisso', 'Ensenada', 'Altos de San Lorenzo',
        'Villa Elisa', 'Melchor Romero', 'Abasto', 'Ángel Etcheverry',
    ];

    private static array $codigosPostales = [
        '1900', '1902', '1904', '1905', '1906', '1987', '1923',
    ];

    private static array $nombresDestinatario = [
        'Valentina Rodríguez', 'Martín Fernández', 'Lucía Acosta', 'Gonzalo Sánchez',
        'Camila López', 'Federico García', 'Agustina Martínez', 'Nicolás Pérez',
        'Florencia Díaz', 'Tomás Álvarez', 'Sofía Romero', 'Matías Torres',
        'Micaela Gutiérrez', 'Sebastián Herrera', 'Julieta Castro', 'Facundo Ruiz',
        'Natalia Moreno', 'Diego Jiménez', 'Paula Vargas', 'Leandro Ortiz',
    ];

    public function definition(): array
    {
        return [
            'user_id'     => Usuario::factory(),
            'estado'      => 'carrito',
            'total'       => 0,
            'costo_envio' => 0,
        ];
    }

    public function confirmada(): static
    {
        $calle  = self::$callesLaPlata[array_rand(self::$callesLaPlata)];
        $barrio = self::$barrios[array_rand(self::$barrios)];
        $cp     = self::$codigosPostales[array_rand(self::$codigosPostales)];

        return $this->state([
            'estado'              => 'confirmado',
            'fecha_venta'         => now(),
            'estado_pago'         => 'aprobado',
            'metodo_pago'         => 'transferencia',
            'nombre_destinatario' => self::$nombresDestinatario[array_rand(self::$nombresDestinatario)],
            'calle'               => 'Calle ' . $calle,
            'numero'              => (string) fake()->numberBetween(100, 3000),
            'ciudad'              => 'La Plata - ' . $barrio,
            'provincia'           => 'Buenos Aires',
            'codigo_postal'       => $cp,
            'costo_envio'         => fake()->randomElement([0, 1800, 2500, 3200]),
        ]);
    }
}
