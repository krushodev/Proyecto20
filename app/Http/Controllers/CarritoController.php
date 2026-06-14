<?php

namespace App\Http\Controllers;

use App\Http\Requests\AgregarAlCarritoRequest;
use App\Services\CarritoService;
use App\Services\VentaService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Response;
use Illuminate\Routing\Controllers\HasMiddleware;
use Illuminate\Routing\Controllers\Middleware;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class CarritoController extends Controller implements HasMiddleware
{
    public static function middleware(): array
    {
        return [
            new Middleware(
                middleware: function ($request, $next) {
                    if (auth()->check() && auth()->user()->rol?->nombre === 'admin') {
                        return redirect()->route('admin.panel');
                    }
                    return $next($request);
                },
                only: ['index', 'agregar', 'eliminar', 'vaciar'],
            ),
        ];
    }

    public function __construct(
        private readonly CarritoService $carritoService,
        private readonly VentaService $ventaService,
    ) {}

    public function index(): View
    {
        if (Auth::check()) {
            $carrito = $this->carritoService->obtenerCarrito();
            $carrito->load('detalles.producto.imagenes');
            return view('paginas.carrito', ['carrito' => $carrito, 'guestCart' => null]);
        }

        $guestCart = $this->carritoService->obtenerCarritoGuest();
        return view('paginas.carrito', ['carrito' => null, 'guestCart' => $guestCart]);
    }

    public function agregar(AgregarAlCarritoRequest $request): RedirectResponse
    {
        try {
            if (Auth::check()) {
                $this->carritoService->agregarProducto($request->validated());
            } else {
                $this->carritoService->agregarProductoGuest($request->validated());
            }

            return redirect()->route('carrito')->with('success', 'Producto agregado al carrito.');
        } catch (\RuntimeException $e) {
            return back()->withErrors(['stock' => $e->getMessage()]);
        }
    }

    public function eliminar(int $detalle): RedirectResponse
    {
        try {
            if (Auth::check()) {
                $this->carritoService->eliminarProducto($detalle);
            } else {
                $this->carritoService->eliminarProductoGuest($detalle);
            }

            return redirect()->route('carrito')->with('success', 'Producto eliminado del carrito.');
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException) {
            abort(404);
        }
    }

    public function vaciar(): RedirectResponse
    {
        if (Auth::check()) {
            $this->carritoService->vaciarCarrito();
        } else {
            $this->carritoService->vaciarCarritoGuest();
        }

        return redirect()->route('carrito')->with('success', 'Carrito vaciado correctamente.');
    }

    public function confirmar(): RedirectResponse
    {
        try {
            $venta = $this->carritoService->confirmarCompra();

            return redirect()->route('detalle-compra')
                ->with('venta_confirmada_id', $venta->id);
        } catch (\RuntimeException $e) {
            return back()->withErrors(['carrito' => $e->getMessage()]);
        }
    }

    public function misCompras(): View
    {
        $compras = $this->ventaService->obtenerComprasDeUsuario(Auth::id());

        return view('paginas.mis-compras', compact('compras'));
    }

    public function detalleCompra(): View
    {
        $ventaId = session('venta_confirmada_id');

        $venta = $ventaId
            ? $this->ventaService->obtenerPorId($ventaId)
            : null;

        return view('paginas.detalle-compra', compact('venta'));
    }

    public function descargarFactura(int $id): Response
    {
        $venta = $this->ventaService->obtenerPorId($id);

        if (!$venta || $venta->user_id !== Auth::id()) {
            abort(403);
        }

        $pdf = Pdf::loadView('facturas.factura', compact('venta'))
            ->setPaper('a4', 'portrait');

        $filename = 'factura-' . str_pad($venta->id, 8, '0', STR_PAD_LEFT) . '.pdf';

        return $pdf->download($filename);
    }
}
