<?php

namespace Database\Factories;

use App\Models\Producto;
use App\Models\VentaCabecera;
use App\Models\VentaDetalle;
use Illuminate\Database\Eloquent\Factories\Factory;

class VentaDetalleFactory extends Factory
{
    protected $model = VentaDetalle::class;

    public function definition(): array
    {
        $cantidad = fake()->numberBetween(1, 5);
        $precio   = fake()->randomFloat(2, 5000, 100000);

        return [
            'venta_id'        => VentaCabecera::factory(),
            'producto_id'     => Producto::factory(),
            'cantidad'        => $cantidad,
            'precio_unitario' => $precio,
            'subtotal'        => $cantidad * $precio,
        ];
    }
}
