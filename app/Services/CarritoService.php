<?php

namespace App\Services;

use App\Mail\FacturaCompraMail;
use App\Models\Producto;
use App\Models\VentaCabecera;
use App\Models\VentaDetalle;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class CarritoService
{
    private const SESSION_KEY = 'carrito';

    // ─── Carrito autenticado (DB) ──────────────────────────────────────────

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
            $detalle = $carrito->detalles()->findOrFail($detalleId);
            $detalle->delete();
            $this->recalcularTotal($carrito);
        });
    }

    public function confirmarCompra(array $datosExtra = []): VentaCabecera
    {
        $venta = DB::transaction(function () use ($datosExtra) {
            $carrito  = $this->obtenerCarrito();
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

            $carrito->update(array_merge([
                'estado'      => 'confirmado',
                'fecha_venta' => now(),
                'estado_pago' => 'aprobado',
            ], $datosExtra));

            return $carrito->fresh(['usuario', 'detalles.producto']);
        });

        try {
            $pdf = Pdf::loadView('facturas.factura', compact('venta'))
                ->setPaper('a4', 'portrait');

            Mail::to($venta->usuario->email)
                ->send(new FacturaCompraMail($venta, $pdf->output()));
        } catch (\Throwable $e) {
            Log::error('Error al enviar factura por correo', [
                'venta_id' => $venta->id,
                'email'    => $venta->usuario->email,
                'error'    => $e->getMessage(),
            ]);
        }

        return $venta;
    }

    public function vaciarCarrito(): void
    {
        DB::transaction(function () {
            $carrito = $this->obtenerCarrito();
            $carrito->detalles()->delete();
            $carrito->update(['total' => 0]);
        });
    }

    // ─── Carrito guest (session) ───────────────────────────────────────────

    public function obtenerCarritoGuest(): array
    {
        return session(self::SESSION_KEY, ['items' => [], 'total' => 0]);
    }

    public function agregarProductoGuest(array $datos): void
    {
        $producto = Producto::findOrFail($datos['producto_id']);
        $cantidad = (int) $datos['cantidad'];

        $carrito = $this->obtenerCarritoGuest();
        $items   = $carrito['items'];

        $idx = collect($items)->search(fn($i) => $i['producto_id'] === $producto->id);

        if ($idx !== false) {
            $nuevaCantidad = $items[$idx]['cantidad'] + $cantidad;
            if ($producto->stock < $nuevaCantidad) {
                throw new \RuntimeException(
                    "Stock insuficiente para '{$producto->nombre}'. Disponible: {$producto->stock}."
                );
            }
            $items[$idx]['cantidad'] = $nuevaCantidad;
            $items[$idx]['subtotal'] = $nuevaCantidad * $items[$idx]['precio_unitario'];
        } else {
            if ($producto->stock < $cantidad) {
                throw new \RuntimeException(
                    "Stock insuficiente para '{$producto->nombre}'. Disponible: {$producto->stock}."
                );
            }
            $items[] = [
                'producto_id'     => $producto->id,
                'nombre'          => $producto->nombre,
                'precio_unitario' => (float) $producto->precio,
                'cantidad'        => $cantidad,
                'subtotal'        => $cantidad * (float) $producto->precio,
                'imagen_studio'   => $producto->imagen_studio,
            ];
        }

        $total = array_sum(array_column($items, 'subtotal'));
        session()->put(self::SESSION_KEY, ['items' => $items, 'total' => $total]);
    }

    public function eliminarProductoGuest(int $productoId): void
    {
        $carrito = $this->obtenerCarritoGuest();
        $items   = array_values(array_filter($carrito['items'], fn($i) => $i['producto_id'] !== $productoId));
        $total   = array_sum(array_column($items, 'subtotal'));
        session()->put(self::SESSION_KEY, ['items' => $items, 'total' => $total]);
    }

    public function vaciarCarritoGuest(): void
    {
        session()->forget(self::SESSION_KEY);
    }

    public function transferirCarritoSesionADB(int $userId): void
    {
        $guestCart = session(self::SESSION_KEY);

        if (!$guestCart || empty($guestCart['items'])) {
            return;
        }

        DB::transaction(function () use ($userId, $guestCart) {
            $carrito = VentaCabecera::firstOrCreate([
                'user_id' => $userId,
                'estado'  => 'carrito',
            ]);

            foreach ($guestCart['items'] as $item) {
                $producto = Producto::find($item['producto_id']);
                if (!$producto) {
                    continue;
                }

                $existente = $carrito->detalles()
                    ->where('producto_id', $item['producto_id'])
                    ->first();

                if ($existente) {
                    $nuevaCantidad = $existente->cantidad + $item['cantidad'];
                    $existente->update([
                        'cantidad' => $nuevaCantidad,
                        'subtotal' => $nuevaCantidad * $existente->precio_unitario,
                    ]);
                } else {
                    $carrito->detalles()->create([
                        'producto_id'     => $item['producto_id'],
                        'cantidad'        => $item['cantidad'],
                        'precio_unitario' => $item['precio_unitario'],
                        'subtotal'        => $item['subtotal'],
                    ]);
                }
            }

            $this->recalcularTotal($carrito);
        });

        session()->forget(self::SESSION_KEY);
    }

    // ─── Privado ───────────────────────────────────────────────────────────

    private function recalcularTotal(VentaCabecera $carrito): void
    {
        $total = $carrito->detalles()->sum('subtotal');
        $carrito->update(['total' => $total]);
    }
}
