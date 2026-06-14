<?php

namespace Database\Factories;

use App\Models\Usuario;
use App\Models\VentaCabecera;
use Illuminate\Database\Eloquent\Factories\Factory;

class VentaCabeceraFactory extends Factory
{
    protected $model = VentaCabecera::class;

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
        return $this->state([
            'estado'              => 'confirmado',
            'fecha_venta'         => now(),
            'estado_pago'         => 'aprobado',
            'metodo_pago'         => 'transferencia',
            'nombre_destinatario' => fake()->name(),
            'calle'               => fake()->streetName(),
            'numero'              => (string) fake()->numberBetween(1, 9999),
            'ciudad'              => fake()->city(),
            'provincia'           => 'Buenos Aires',
            'codigo_postal'       => '1900',
            'costo_envio'         => 2500.00,
        ]);
    }
}
