<?php

namespace App\Services;

use App\Models\Categoria;

class CategoriaService
{
    public function obtenerActivasConProductos(): \Illuminate\Database\Eloquent\Collection
    {
        return Categoria::with([
            'productos' => fn ($q) => $q->where('activo', true)->orderBy('nombre'),
        ])
            ->where('activo', true)
            ->orderBy('nombre')
            ->get();
    }
}
