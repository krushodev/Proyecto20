<?php

namespace App\Services;

use App\Models\VentaCabecera;
use Illuminate\Database\Eloquent\Collection;

class VentaService
{
    public function obtenerPorId(int $id): ?VentaCabecera
    {
        return VentaCabecera::with('detalles.producto')->find($id);
    }

    public function obtenerComprasDeUsuario(int $userId): Collection
    {
        return VentaCabecera::with('detalles.producto')
            ->where('user_id', $userId)
            ->where('estado', 'confirmado')
            ->orderByDesc('fecha_venta')
            ->get();
    }
}
