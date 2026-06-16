<?php

namespace App\Services;

use App\Models\Categoria;

class CategoriaService
{
    public function obtenerTodas(): \Illuminate\Database\Eloquent\Collection
    {
        return Categoria::orderBy('nombre')->get();
    }

    public function obtenerActivas(): \Illuminate\Database\Eloquent\Collection
    {
        return Categoria::activo()
            ->orderBy('nombre')
            ->get();
    }

    public function obtenerActivasConProductos(string $slug = null): \Illuminate\Database\Eloquent\Collection
    {
        $query = Categoria::with([
            'productos'          => fn ($q) => $q->activo()->orderBy('nombre'),
            'productos.imagenes' => fn ($q) => $q->orderBy('orden'),
        ])
            ->activo()
            ->whereHas('productos', fn ($q) => $q->activo());

        if ($slug) {
            $query = $query->where('slug', $slug);
        }

        return $query->orderBy('nombre')->get();
    }
}
