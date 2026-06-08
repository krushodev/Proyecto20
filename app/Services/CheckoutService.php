<?php

namespace App\Services;

use App\Models\VentaCabecera;
use MercadoPago\Client\Preference\PreferenceClient;
use MercadoPago\MercadoPagoConfig;

/**
 * Calcula el costo de envío por zonas desde La Plata (CP 1900), Argentina.
 *
 * Zonas:
 *   A – CABA y Gran Buenos Aires (CP 1000–1999)           → $2.500
 *   B – Centro: Bs. As. interior, Córdoba, Santa Fe,
 *       Entre Ríos, La Pampa, Mendoza, San Luis (2000–5999) → $5.000
 *   C – Lejos: Patagonia, NOA, NEA, Cuyo norte (resto)   → $8.500
 */
class CheckoutService
{
    public const COSTO_ZONA_A = 2500.00;
    public const COSTO_ZONA_B = 5000.00;
    public const COSTO_ZONA_C = 8500.00;

    public const CP_ORIGEN = '1900'; // La Plata, Buenos Aires

    public function calcularCostoEnvio(string $cp): float
    {
        $num = (int) preg_replace('/\D/', '', $cp);

        // Zona A: CABA y Gran Buenos Aires (1000–1999)
        if ($num >= 1000 && $num <= 1999) {
            return self::COSTO_ZONA_A;
        }

        // Zona B: interior de Bs. As., Córdoba, Santa Fe, Entre Ríos,
        //         La Pampa, Mendoza, San Luis (2000–5999)
        if ($num >= 2000 && $num <= 5999) {
            return self::COSTO_ZONA_B;
        }

        // Zona C: Patagonia, NOA, NEA y resto del país
        return self::COSTO_ZONA_C;
    }

    public function zonaDescripcion(string $cp): string
    {
        return match ($this->calcularCostoEnvio($cp)) {
            self::COSTO_ZONA_A => 'Zona A — CABA y Gran Buenos Aires',
            self::COSTO_ZONA_B => 'Zona B — Centro del país (Córdoba, Santa Fe, interior Bs. As.)',
            default            => 'Zona C — Patagonia, NOA y NEA',
        };
    }

    /**
     * Crea una preferencia de pago en MercadoPago Sandbox y devuelve la init_point.
     * El back_url siempre apunta a checkout.confirmacion para que el flujo retorne.
     */
    public function crearPreferenciaMercadoPago(VentaCabecera $carrito, string $backUrl): string
    {
        MercadoPagoConfig::setAccessToken(config('services.mercadopago.access_token'));
        MercadoPagoConfig::setRuntimeEnviroment(MercadoPagoConfig::LOCAL);

        $items = $carrito->detalles->map(fn($d) => [
            'id'          => (string) $d->producto_id,
            'title'       => $d->producto->nombre,
            'quantity'    => $d->cantidad,
            'unit_price'  => (float) $d->precio_unitario,
            'currency_id' => 'ARS',
        ])->values()->toArray();

        $client = new PreferenceClient();

        $preference = $client->create([
            'items'       => $items,
            'back_urls'   => [
                'success' => $backUrl,
                'failure' => $backUrl,
                'pending' => $backUrl,
            ],
            'auto_return' => 'approved',
            'statement_descriptor' => 'Vittorio Relojes',
            'external_reference'   => (string) $carrito->id,
        ]);

        return $preference->init_point;
    }
}
