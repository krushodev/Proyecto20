<?php

namespace Database\Seeders;

use App\Models\Producto;
use App\Models\Usuario;
use App\Models\VentaCabecera;
use App\Models\VentaDetalle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

/**
 * Carrito activo (estado 'carrito') con productos, asociado al primer
 * cliente de demo, para poder probar el flujo de checkout sin armarlo a mano.
 */
class CarritoDemoSeeder extends Seeder
{
    public function run(): void
    {
        $cliente = Usuario::where('email', UsuariosSeeder::CLIENTES_DEMO[0]['email'])->first();

        if (!$cliente) {
            return;
        }

        $productos = Producto::activo()->where('stock', '>', 0)->inRandomOrder()->limit(2)->get();

        if ($productos->isEmpty()) {
            return;
        }

        DB::transaction(function () use ($cliente, $productos) {
            $carrito = VentaCabecera::firstOrCreate(
                ['user_id' => $cliente->id, 'estado' => 'carrito'],
                ['total' => 0, 'costo_envio' => 0]
            );

            $total = 0;

            foreach ($productos as $producto) {
                $cantidad = 1;
                $subtotal = $producto->precio * $cantidad;
                $total += $subtotal;

                VentaDetalle::firstOrCreate(
                    ['venta_id' => $carrito->id, 'producto_id' => $producto->id],
                    [
                        'cantidad'        => $cantidad,
                        'precio_unitario' => $producto->precio,
                        'subtotal'        => $subtotal,
                    ]
                );
            }

            $carrito->update(['total' => $total]);
        });
    }
}
