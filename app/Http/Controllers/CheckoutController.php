<?php

namespace App\Http\Controllers;

use App\Http\Requests\GuardarDireccionRequest;
use App\Models\UserDireccion;
use App\Models\VentaCabecera;
use App\Services\CarritoService;
use App\Services\CheckoutService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;
use MercadoPago\Exceptions\MPApiException;

class CheckoutController extends Controller
{
    public function __construct(
        private readonly CarritoService  $carritoService,
        private readonly CheckoutService $checkoutService,
    ) {}

    // ─── Paso 1: Dirección y envío ─────────────────────────────────────────

    public function envio(): View|RedirectResponse
    {
        $carrito = $this->carritoService->obtenerCarrito();

        if ($carrito->detalles()->count() === 0) {
            return redirect()->route('carrito');
        }

        $direcciones = Auth::user()->direcciones;

        return view('checkout.envio', compact('direcciones'));
    }

    public function guardarEnvio(GuardarDireccionRequest $request): RedirectResponse
    {
        $datos = $request->validated();

        if ($datos['direccion_id'] ?? null) {
            $direccion = Auth::user()->direcciones()->findOrFail($datos['direccion_id']);
        } else {
            if ($datos['guardar_direccion']) {
                $direccion = Auth::user()->direcciones()->create([
                    'alias'         => $datos['alias'],
                    'calle'         => $datos['calle'],
                    'numero'        => $datos['numero'],
                    'ciudad'        => $datos['ciudad'],
                    'provincia'     => $datos['provincia'],
                    'cp'            => $datos['cp'],
                    'observaciones' => $datos['observaciones'] ?? null,
                ]);
            } else {
                $direccion = new UserDireccion([
                    'alias'         => $datos['alias'] ?? 'Entrega',
                    'calle'         => $datos['calle'],
                    'numero'        => $datos['numero'],
                    'ciudad'        => $datos['ciudad'],
                    'provincia'     => $datos['provincia'],
                    'cp'            => $datos['cp'],
                    'observaciones' => $datos['observaciones'] ?? null,
                ]);
            }
        }

        $costoEnvio = $this->checkoutService->calcularCostoEnvio($direccion->cp);

        session()->put('checkout_envio', [
            'direccion_id'   => $direccion->id ?? null,
            'alias'          => $direccion->alias,
            'calle'          => $direccion->calle,
            'numero'         => $direccion->numero,
            'ciudad'         => $direccion->ciudad,
            'provincia'      => $direccion->provincia,
            'cp'             => $direccion->cp,
            'observaciones'  => $direccion->observaciones,
            'costo_envio'    => $costoEnvio,
        ]);

        return redirect()->route('checkout.pago');
    }

    /** Endpoint AJAX para previsualizar el costo de envío al tipear el CP. */
    public function costoEnvio(Request $request): JsonResponse
    {
        $cp     = $request->query('cp', '');
        $costo  = $this->checkoutService->calcularCostoEnvio($cp);
        $zona   = $this->checkoutService->zonaDescripcion($cp);

        return response()->json([
            'costo'      => $costo,
            'costo_fmt'  => '$ ' . number_format($costo, 0, ',', '.') . ' ARS',
            'zona'       => $zona,
        ]);
    }

    // ─── Paso 2: Pago ──────────────────────────────────────────────────────

    public function pago(): View|RedirectResponse
    {
        $envio = session('checkout_envio');

        if (!$envio) {
            return redirect()->route('checkout.envio');
        }

        $carrito  = $this->carritoService->obtenerCarrito();
        $carrito->load('detalles.producto.imagenes');

        $tarjetas = Auth::user()->tarjetas;

        return view('checkout.pago', compact('carrito', 'envio', 'tarjetas'));
    }

    public function procesarPago(Request $request): RedirectResponse|\Illuminate\Http\JsonResponse
    {
        $request->validate([
            'metodo_pago' => ['required', 'in:transferencia,tarjeta,mercadopago'],
        ]);

        $envio = session('checkout_envio');
        if (!$envio) {
            return redirect()->route('checkout.envio');
        }

        // MercadoPago: crear preferencia y redirigir al checkout de MP
        if ($request->metodo_pago === 'mercadopago') {
            return $this->redirigirMercadoPago($envio);
        }

        try {
            $venta = $this->carritoService->confirmarCompra([
                'user_direccion_id'   => $envio['direccion_id'],
                'nombre_destinatario' => Auth::user()->nombre,
                'calle'               => $envio['calle'],
                'numero'              => $envio['numero'],
                'ciudad'              => $envio['ciudad'],
                'provincia'           => $envio['provincia'],
                'codigo_postal'       => $envio['cp'],
                'costo_envio'         => $envio['costo_envio'],
                'metodo_pago'         => $request->metodo_pago,
            ]);

            session()->forget('checkout_envio');

            return redirect()->route('checkout.confirmacion')
                ->with('venta_confirmada_id', $venta->id);
        } catch (\RuntimeException $e) {
            return back()->withErrors(['pago' => $e->getMessage()]);
        }
    }

    private function redirigirMercadoPago(array $envio): RedirectResponse|\Illuminate\Http\JsonResponse
    {
        $carrito = $this->carritoService->obtenerCarrito();
        $carrito->load('detalles.producto');

        session()->put('checkout_envio', array_merge($envio, ['metodo_pago' => 'mercadopago']));

        try {
            $initPoint = $this->checkoutService->crearPreferenciaMercadoPago(
                $carrito,
                route('checkout.confirmacion')
            );

            if (empty($initPoint)) {
                \Log::error('MercadoPago: sandbox_init_point vino vacío', ['carrito_id' => $carrito->id]);
                $msg = 'MercadoPago no devolvió una URL de pago. Revisá las credenciales en .env.';
                return request()->ajax()
                    ? response()->json(['error' => $msg], 502)
                    : back()->withErrors(['pago' => $msg]);
            }

            return request()->ajax()
                ? response()->json(['url' => $initPoint])
                : redirect()->away($initPoint);

        } catch (MPApiException $e) {
            \Log::error('MercadoPago: API error', [
                'status'     => $e->getStatusCode(),
                'response'   => $e->getApiResponse()->getContent(),
                'carrito_id' => $carrito->id ?? null,
            ]);
            $detalle = app()->environment('local')
                ? ' [' . $e->getStatusCode() . '] ' . json_encode($e->getApiResponse()->getContent())
                : '';
            $msg = 'No se pudo conectar con MercadoPago.' . $detalle;
            return request()->ajax()
                ? response()->json(['error' => $msg], 502)
                : back()->withErrors(['pago' => $msg]);

        } catch (\Throwable $e) {
            \Log::error('MercadoPago: error inesperado', [
                'message'    => $e->getMessage(),
                'carrito_id' => $carrito->id ?? null,
            ]);
            $detalle = app()->environment('local') ? ' (' . $e->getMessage() . ')' : '';
            $msg = 'No se pudo conectar con MercadoPago.' . $detalle;
            return request()->ajax()
                ? response()->json(['error' => $msg], 502)
                : back()->withErrors(['pago' => $msg]);
        }
    }

    // ─── Paso 3: Confirmación ──────────────────────────────────────────────

    public function confirmacion(Request $request): View|RedirectResponse
    {
        // Retorno desde MercadoPago (back_url)
        if ($request->has('external_reference') && $request->has('status')) {
            return $this->procesarRetornoMercadoPago($request);
        }

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

    private function procesarRetornoMercadoPago(Request $request): View|RedirectResponse
    {
        $carritoId = (int) $request->query('external_reference');
        $status    = $request->query('status');

        $envio = session('checkout_envio');
        if (!$envio || !$carritoId) {
            return redirect()->route('mis-compras');
        }

        $carrito = \App\Models\VentaCabecera::find($carritoId);

        if (!$carrito || $carrito->user_id !== Auth::id() || $carrito->estado !== 'carrito') {
            return redirect()->route('mis-compras');
        }

        if ($status !== 'approved') {
            return redirect()->route('checkout.pago')
                ->withErrors(['pago' => 'El pago no fue aprobado. Estado: ' . $status]);
        }

        try {
            $venta = $this->carritoService->confirmarCompra([
                'user_direccion_id'   => $envio['direccion_id'],
                'nombre_destinatario' => Auth::user()->nombre,
                'calle'               => $envio['calle'],
                'numero'              => $envio['numero'],
                'ciudad'              => $envio['ciudad'],
                'provincia'           => $envio['provincia'],
                'codigo_postal'       => $envio['cp'],
                'costo_envio'         => $envio['costo_envio'],
                'metodo_pago'         => 'mercadopago',
            ]);

            session()->forget('checkout_envio');

            $venta->load('detalles.producto.imagenes');

            return view('checkout.confirmacion', compact('venta'));
        } catch (\RuntimeException $e) {
            return redirect()->route('checkout.pago')->withErrors(['pago' => $e->getMessage()]);
        }
    }
}
