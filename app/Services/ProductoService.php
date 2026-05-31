<?php

namespace App\Services;

use App\Models\Producto;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProductoService
{
    public function obtenerTodos(): Collection
    {
        return Producto::with('categoria')->orderBy('nombre')->get();
    }

    public function obtenerPorSlug(string $slug): Producto
    {
        return Producto::with('categoria')
            ->where('slug', $slug)
            ->where('activo', true)
            ->firstOrFail();
    }

    public function obtenerActivos(): Collection
    {
        return Producto::where('activo', true)
            ->orderBy('nombre')
            ->get();
    }

    public function crear(array $datos): Producto
    {
        return DB::transaction(function () use ($datos) {
            $datos['slug'] = $datos['slug'] ?? Str::slug($datos['nombre']);
            return Producto::create($datos);
        });
    }

    public function actualizar(Producto $producto, array $datos): void
    {
        DB::transaction(function () use ($producto, $datos) {
            $producto->update($datos);
        });
    }

    public function eliminar(Producto $producto): void
    {
        DB::transaction(function () use ($producto) {
            $producto->delete();
        });
    }
}
