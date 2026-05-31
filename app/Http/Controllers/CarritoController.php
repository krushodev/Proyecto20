<?php

namespace App\Http\Controllers;

use App\Http\Requests\AgregarAlCarritoRequest;
use App\Services\CarritoService;
use App\Services\VentaService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class CarritoController extends Controller
{
    public function __construct(
        private readonly CarritoService $carritoService,
        private readonly VentaService $ventaService,
    ) {}

    public function index(): View
    {
        $carrito = $this->carritoService->obtenerCarrito();
        $carrito->load('detalles.producto');

        return view('paginas.carrito', compact('carrito'));
    }

    public function agregar(AgregarAlCarritoRequest $request): RedirectResponse
    {
        try {
            $this->carritoService->agregarProducto($request->validated());

            return redirect()->route('carrito')
                ->with('success', 'Producto agregado al carrito.');
        } catch (\RuntimeException $e) {
            return back()->withErrors(['stock' => $e->getMessage()]);
        }
    }

    public function eliminar(int $detalle): RedirectResponse
    {
        try {
            $this->carritoService->eliminarProducto($detalle);

            return redirect()->route('carrito')
                ->with('success', 'Producto eliminado del carrito.');
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException) {
            abort(404);
        }
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

    public function vaciar(): RedirectResponse
    {
        $this->carritoService->vaciarCarrito();

        return redirect()->route('carrito')
            ->with('success', 'Carrito vaciado correctamente.');
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
}
