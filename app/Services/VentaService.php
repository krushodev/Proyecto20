<?php

namespace App\Services;

use App\Models\VentaCabecera;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Collection;

class VentaService
{
    public function obtenerTodas(): Collection
    {
        return VentaCabecera::with('usuario')
            ->withCount('detalles')
            ->where('estado', 'confirmado')
            ->orderByDesc('fecha_venta')
            ->get();
    }

    public function obtenerParaAdmin(array $filtros = []): LengthAwarePaginator
    {
        $query = VentaCabecera::with('usuario')
            ->withCount('detalles')
            ->where('estado', $filtros['estado'] ?? 'confirmado');

        if (!empty($filtros['desde'])) {
            $query->whereDate('fecha_venta', '>=', $filtros['desde']);
        }

        if (!empty($filtros['hasta'])) {
            $query->whereDate('fecha_venta', '<=', $filtros['hasta']);
        }

        return $query->orderByDesc('fecha_venta')->paginate(15);
    }

    public function obtenerPorId(int $id): ?VentaCabecera
    {
        return VentaCabecera::with('detalles.producto.imagenes')->find($id);
    }

    public function obtenerComprasDeUsuario(int $userId): Collection
    {
        return VentaCabecera::with('detalles.producto.imagenes')
            ->where('user_id', $userId)
            ->where('estado', 'confirmado')
            ->orderByDesc('fecha_venta')
            ->get();
    }
}
