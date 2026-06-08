<?php

namespace App\Services;

/**
 * Calcula el costo de envío en base a zonas de CP.
 * Origen: CP 3400 — Corrientes Capital.
 *
 * Zonas:
 *   A – Misma provincia (Corrientes):  CP 3400–3499  → $2.500
 *   B – NEA / NOA cercano:             CP 30xx–38xx  → $5.000
 *   C – Resto del país                              → $8.500
 */
class CheckoutService
{
    public const COSTO_ZONA_A = 2500.00;
    public const COSTO_ZONA_B = 5000.00;
    public const COSTO_ZONA_C = 8500.00;

    public const CP_ORIGEN = '3400';

    public function calcularCostoEnvio(string $cp): float
    {
        $num = (int) preg_replace('/\D/', '', $cp);

        // Zona A: Corrientes provincia (3400–3499)
        if ($num >= 3400 && $num <= 3499) {
            return self::COSTO_ZONA_A;
        }

        // Zona B: NEA / NEA ampliado (3000–3899)
        if ($num >= 3000 && $num <= 3899) {
            return self::COSTO_ZONA_B;
        }

        // Zona C: Resto del país
        return self::COSTO_ZONA_C;
    }

    public function zonaDescripcion(string $cp): string
    {
        return match ($this->calcularCostoEnvio($cp)) {
            self::COSTO_ZONA_A => 'Zona A — Corrientes Capital y provincia',
            self::COSTO_ZONA_B => 'Zona B — NEA (Chaco, Misiones, Formosa, Entre Ríos)',
            default            => 'Zona C — Resto del país',
        };
    }
}
