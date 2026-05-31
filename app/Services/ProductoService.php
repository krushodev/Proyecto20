<?php

namespace App\Services;

use App\Models\Producto;
use Illuminate\Database\Eloquent\Model;

class ProductoService
{
    public function obtenerPorSlug(string $slug): Producto
    {
        return Producto::with('categoria')
            ->where('slug', $slug)
            ->where('activo', true)
            ->firstOrFail();
    }

    public function obtenerActivos(): \Illuminate\Database\Eloquent\Collection
    {
        return Producto::where('activo', true)
            ->orderBy('nombre')
            ->get();
    }
}
