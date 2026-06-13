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
        return Categoria::where('activo', true)
            ->orderBy('nombre')
            ->get();
    }

    public function obtenerActivasConProductos(string $slug = null): \Illuminate\Database\Eloquent\Collection
    {
        $query = Categoria::with([
            'productos'          => fn ($q) => $q->where('activo', true)->orderBy('nombre'),
            'productos.imagenes' => fn ($q) => $q->orderBy('orden'),
        ])
            ->where('activo', true)
            ->whereHas('productos', fn ($q) => $q->where('activo', true));

        if ($slug) {
            $query = $query->where('slug', $slug);
        }

        return $query->orderBy('nombre')->get();
    }
}
