<?php

namespace App\Services;

use App\Models\Categoria;

class CategoriaService
{
    public function obtenerTodas(): \Illuminate\Database\Eloquent\Collection
    {
        return Categoria::orderBy('nombre')->get();
    }

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
