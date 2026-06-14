<?php

use App\Services\CheckoutService;

// Test puramente unitario: sin base de datos ni framework necesario

beforeEach(function () {
    $this->service = new CheckoutService();
});

// ─── calcularCostoEnvio — fronteras de zonas ──────────────────────────────

it('CP 999 cae en Zona C (antes del limite inferior de A)', function () {
    expect($this->service->calcularCostoEnvio('999'))->toBe(8500.00);
});

it('CP 1000 es el limite inferior de Zona A', function () {
    expect($this->service->calcularCostoEnvio('1000'))->toBe(2500.00);
});

it('CP 1500 (Gran Buenos Aires) es Zona A', function () {
    expect($this->service->calcularCostoEnvio('1500'))->toBe(2500.00);
});

it('CP 1900 (La Plata, origen) es Zona A', function () {
    expect($this->service->calcularCostoEnvio('1900'))->toBe(2500.00);
});

it('CP 1999 es el limite superior de Zona A', function () {
    expect($this->service->calcularCostoEnvio('1999'))->toBe(2500.00);
});

it('CP 2000 es el limite inferior de Zona B', function () {
    expect($this->service->calcularCostoEnvio('2000'))->toBe(5000.00);
});

it('CP 3000 (Santa Fe) es Zona B', function () {
    expect($this->service->calcularCostoEnvio('3000'))->toBe(5000.00);
});

it('CP 5000 (Cordoba) es Zona B', function () {
    expect($this->service->calcularCostoEnvio('5000'))->toBe(5000.00);
});

it('CP 5999 es el limite superior de Zona B', function () {
    expect($this->service->calcularCostoEnvio('5999'))->toBe(5000.00);
});

it('CP 6000 inicia Zona C', function () {
    expect($this->service->calcularCostoEnvio('6000'))->toBe(8500.00);
});

it('CP 8300 (Neuquen) es Zona C', function () {
    expect($this->service->calcularCostoEnvio('8300'))->toBe(8500.00);
});

it('CP 9410 (Ushuaia) es Zona C', function () {
    expect($this->service->calcularCostoEnvio('9410'))->toBe(8500.00);
});

it('CP con letras extrae digitos y calcula correctamente', function () {
    // B1900XAX → extrae 1900 → Zona A
    expect($this->service->calcularCostoEnvio('B1900XAX'))->toBe(2500.00);
});

it('CP vacio (sin digitos) resulta en 0 que es Zona C', function () {
    expect($this->service->calcularCostoEnvio(''))->toBe(8500.00);
});

it('CP cero resulta en Zona C', function () {
    expect($this->service->calcularCostoEnvio('0'))->toBe(8500.00);
});

it('costos tienen los valores correctos segun las constantes', function () {
    expect(CheckoutService::COSTO_ZONA_A)->toBe(2500.00);
    expect(CheckoutService::COSTO_ZONA_B)->toBe(5000.00);
    expect(CheckoutService::COSTO_ZONA_C)->toBe(8500.00);
});

// ─── zonaDescripcion ──────────────────────────────────────────────────────

it('devuelve descripcion correcta para Zona A', function () {
    expect($this->service->zonaDescripcion('1000'))
        ->toBe('Zona A — CABA y Gran Buenos Aires');
});

it('devuelve descripcion correcta para Zona B', function () {
    expect($this->service->zonaDescripcion('5000'))
        ->toBe('Zona B — Centro del país (Córdoba, Santa Fe, interior Bs. As.)');
});

it('devuelve descripcion correcta para Zona C', function () {
    expect($this->service->zonaDescripcion('9000'))
        ->toBe('Zona C — Patagonia, NOA y NEA');
});
