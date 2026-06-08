<?php

namespace App\Services;

use App\Jobs\GenerarYEnviarFacturaJob;
use App\Models\Producto;
use App\Models\VentaCabecera;
use App\Models\VentaDetalle;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CarritoService
{
    public function obtenerCarrito(): VentaCabecera
    {
        return VentaCabecera::firstOrCreate([
            'user_id' => Auth::id(),
            'estado'  => 'carrito',
        ]);
    }

    public function agregarProducto(array $datos): VentaDetalle
    {
        return DB::transaction(function () use ($datos) {
            $producto = Producto::findOrFail($datos['producto_id']);
            $cantidad = (int) $datos['cantidad'];

            $carrito = $this->obtenerCarrito();

            $detalle = $carrito->detalles()
                ->where('producto_id', $producto->id)
                ->first();

            if ($detalle) {
                $nuevaCantidad = $detalle->cantidad + $cantidad;

                if ($producto->stock < $nuevaCantidad) {
                    throw new \RuntimeException(
                        "Stock insuficiente para '{$producto->nombre}'. Disponible: {$producto->stock}."
                    );
                }

                $detalle->update([
                    'cantidad' => $nuevaCantidad,
                    'subtotal' => $nuevaCantidad * $detalle->precio_unitario,
                ]);
            } else {
                if ($producto->stock < $cantidad) {
                    throw new \RuntimeException(
                        "Stock insuficiente para '{$producto->nombre}'. Disponible: {$producto->stock}."
                    );
                }

                $detalle = $carrito->detalles()->create([
                    'producto_id'     => $producto->id,
                    'cantidad'        => $cantidad,
                    'precio_unitario' => $producto->precio,
                    'subtotal'        => $cantidad * $producto->precio,
                ]);
            }

            $this->recalcularTotal($carrito);

            return $detalle->fresh();
        });
    }

    public function eliminarProducto(int $detalleId): void
    {
        DB::transaction(function () use ($detalleId) {
            $carrito = $this->obtenerCarrito();

            // findOrFail scoped to this cart enforces ownership automatically
            $detalle = $carrito->detalles()->findOrFail($detalleId);

            $detalle->delete();

            $this->recalcularTotal($carrito);
        });
    }

    public function confirmarCompra(): VentaCabecera
    {
        return DB::transaction(function () {
            $carrito = $this->obtenerCarrito();

            $detalles = $carrito->detalles()->with('producto')->get();

            if ($detalles->isEmpty()) {
                throw new \RuntimeException('No se puede confirmar un carrito vacío.');
            }

            foreach ($detalles as $detalle) {
                $producto = Producto::where('id', $detalle->producto_id)
                    ->lockForUpdate()
                    ->firstOrFail();

                if ($producto->stock < $detalle->cantidad) {
                    throw new \RuntimeException(
                        "Stock insuficiente para '{$producto->nombre}'. Disponible: {$producto->stock}, solicitado: {$detalle->cantidad}."
                    );
                }

                $producto->decrement('stock', $detalle->cantidad);
            }

            $carrito->update([
                'estado'      => 'confirmado',
                'fecha_venta' => now(),
            ]);

            $venta = $carrito->fresh();

            GenerarYEnviarFacturaJob::dispatch($venta->id);

            return $venta;
        });
    }

    public function vaciarCarrito(): void
    {
        DB::transaction(function () {
            $carrito = $this->obtenerCarrito();
            $carrito->detalles()->delete();
            $carrito->update(['total' => 0]);
        });
    }

    private function recalcularTotal(VentaCabecera $carrito): void
    {
        $total = $carrito->detalles()->sum('subtotal');

        $carrito->update(['total' => $total]);
    }
}
