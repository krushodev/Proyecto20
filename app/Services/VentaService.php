<?php

namespace App\Services;

use App\Models\VentaCabecera;

class VentaService
{
    public function obtenerPorId(int $id): ?VentaCabecera
    {
        return VentaCabecera::with('detalles.producto')->find($id);
    }
}
