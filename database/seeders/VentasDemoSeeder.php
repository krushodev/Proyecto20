<?php

namespace Database\Seeders;

use App\Models\Producto;
use App\Models\Usuario;
use App\Models\VentaCabecera;
use App\Models\VentaDetalle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

/**
 * Volumen representativo de compras previas (VentaCabecera 'confirmado' +
 * VentaDetalle), con fechas distribuidas en los últimos ~3 años y variedad
 * de métodos de pago, para poder probar los filtros de fecha del panel admin.
 */
class VentasDemoSeeder extends Seeder
{
    private const METODOS_PAGO = ['transferencia', 'tarjeta', 'mercadopago'];

    private const CANTIDAD_VENTAS = 500;

    public function run(): void
    {
        $clientes = Usuario::whereHas('rol', fn ($q) => $q->where('nombre', 'cliente'))->get();
        $productos = Producto::activo()->where('stock', '>', 0)->get();

        if ($clientes->isEmpty() || $productos->isEmpty()) {
            return;
        }

        DB::transaction(function () use ($clientes, $productos) {
            for ($i = 0; $i < self::CANTIDAD_VENTAS; $i++) {
                $cliente    = $clientes->random();
                $fechaVenta = now()->subDays(rand(0, 3 * 365))->subHours(rand(0, 23));
                $metodoPago = self::METODOS_PAGO[$i % count(self::METODOS_PAGO)];

                $venta = VentaCabecera::factory()
                    ->confirmada()
                    ->for($cliente, 'usuario')
                    ->create([
                        'fecha_venta' => $fechaVenta,
                        'metodo_pago' => $metodoPago,
                        'created_at'  => $fechaVenta,
                        'updated_at'  => $fechaVenta,
                    ]);

                $detalles = $productos->random(min(rand(1, 3), $productos->count()));
                $total    = 0;
                $filasDetalle = [];

                foreach ($detalles as $producto) {
                    $cantidad = rand(1, 3);
                    $subtotal = $producto->precio * $cantidad;
                    $total += $subtotal;

                    $filasDetalle[] = [
                        'venta_id'        => $venta->id,
                        'producto_id'     => $producto->id,
                        'cantidad'        => $cantidad,
                        'precio_unitario' => $producto->precio,
                        'subtotal'        => $subtotal,
                        'created_at'      => $fechaVenta,
                        'updated_at'      => $fechaVenta,
                    ];
                }

                VentaDetalle::insert($filasDetalle);

                $venta->update(['total' => $total]);
            }
        });
    }
}
