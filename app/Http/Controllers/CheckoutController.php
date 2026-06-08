<?php

namespace App\Http\Controllers;

use App\Models\VentaCabecera;
use App\Services\CarritoService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class CheckoutController extends Controller
{
    public function __construct(private readonly CarritoService $carritoService) {}

    public function envio(): View|RedirectResponse
    {
        $carrito = $this->carritoService->obtenerCarrito();

        if ($carrito->detalles()->count() === 0) {
            return redirect()->route('carrito')->with('success', 'Tu carrito está vacío.');
        }

        return view('checkout.envio');
    }

    public function guardarEnvio(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'nombre_destinatario' => ['required', 'string', 'max:150'],
            'calle'               => ['required', 'string', 'max:200'],
            'numero'              => ['required', 'string', 'max:20'],
            'ciudad'              => ['required', 'string', 'max:100'],
            'provincia'           => ['required', 'string', 'max:100'],
            'codigo_postal'       => ['required', 'string', 'max:20'],
        ]);

        session()->put('checkout_envio', $validated);

        return redirect()->route('checkout.pago');
    }

    public function pago(): View|RedirectResponse
    {
        if (!session('checkout_envio')) {
            return redirect()->route('checkout.envio');
        }

        $carrito = $this->carritoService->obtenerCarrito();
        $carrito->load('detalles.producto.imagenes');

        return view('checkout.pago', compact('carrito'));
    }

    public function procesarPago(Request $request): RedirectResponse
    {
        $request->validate([
            'metodo_pago' => ['required', 'in:transferencia,mercadopago'],
        ]);

        $envio = session('checkout_envio');
        if (!$envio) {
            return redirect()->route('checkout.envio');
        }

        try {
            $venta = $this->carritoService->confirmarCompra(
                array_merge($envio, ['metodo_pago' => $request->metodo_pago])
            );

            session()->forget('checkout_envio');

            return redirect()->route('checkout.confirmacion')
                ->with('venta_confirmada_id', $venta->id);
        } catch (\RuntimeException $e) {
            return back()->withErrors(['pago' => $e->getMessage()]);
        }
    }

    public function confirmacion(): View|RedirectResponse
    {
        $ventaId = session('venta_confirmada_id');

        if (!$ventaId) {
            return redirect()->route('mis-compras');
        }

        $venta = VentaCabecera::with('detalles.producto.imagenes')->find($ventaId);

        if (!$venta || $venta->user_id !== Auth::id()) {
            return redirect()->route('mis-compras');
        }

        return view('checkout.confirmacion', compact('venta'));
    }
}
