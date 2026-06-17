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

    public function obtenerActivasConProductos(?string $slug = null, ?string $precio = null, ?string $stock = null): \Illuminate\Database\Eloquent\Collection
    {
        $query = Categoria::with([
            'productos'          => fn ($q) => $this->aplicarFiltroProductos($q, $precio, $stock)->orderBy('nombre'),
            'productos.imagenes' => fn ($q) => $q->orderBy('orden'),
        ])
            ->activo()
            ->whereHas('productos', fn ($q) => $this->aplicarFiltroProductos($q, $precio, $stock));

        if ($slug) {
            $query = $query->where('slug', $slug);
        }

        return $query->orderBy('nombre')->get();
    }

    private function aplicarFiltroProductos($query, ?string $precio = null, ?string $stock = null)
    {
        $query = $query->activo();

        if ($precio === 'low') {
            $query->where('precio', '<=', 150000);
        } elseif ($precio === 'mid') {
            $query->whereBetween('precio', [150001, 300000]);
        } elseif ($precio === 'high') {
            $query->where('precio', '>', 300000);
        }

        if ($stock === 'en_stock') {
            $query->where('stock', '>', 0);
        } elseif ($stock === 'agotado') {
            $query->where('stock', '<=', 0);
        }

        return $query;
    }
}
