<?php

namespace App\Services;

use App\Models\Producto;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProductoService
{
    public function obtenerTodos(): Collection
    {
        return Producto::with(['categoria', 'imagenes'])->orderBy('nombre')->get();
    }

    public function obtenerPorSlug(string $slug): Producto
    {
        return Producto::with(['categoria', 'imagenes'])
            ->where('slug', $slug)
            ->where('activo', true)
            ->firstOrFail();
    }

    public function obtenerActivos(): Collection
    {
        return Producto::with('imagenes')
            ->where('activo', true)
            ->orderBy('nombre')
            ->get();
    }

    public function crear(array $datos): Producto
    {
        return DB::transaction(function () use ($datos) {
            $datos['slug'] = $datos['slug'] ?? Str::slug($datos['nombre']);

            $imagenLifestyle = Arr::pull($datos, 'imagen_lifestyle');
            $imagenStudio    = Arr::pull($datos, 'imagen_studio');

            $producto = Producto::create($datos);

            if ($imagenLifestyle) {
                $producto->imagenes()->create(['url' => $imagenLifestyle, 'tipo' => 'lifestyle', 'orden' => 0]);
            }
            if ($imagenStudio) {
                $producto->imagenes()->create(['url' => $imagenStudio, 'tipo' => 'studio', 'orden' => 1]);
            }

            return $producto;
        });
    }

    public function actualizar(Producto $producto, array $datos): void
    {
        DB::transaction(function () use ($producto, $datos) {
            $imagenLifestyle = Arr::pull($datos, 'imagen_lifestyle');
            $imagenStudio    = Arr::pull($datos, 'imagen_studio');

            $producto->update($datos);

            if ($imagenLifestyle) {
                $producto->imagenes()->updateOrCreate(['tipo' => 'lifestyle'], ['url' => $imagenLifestyle, 'orden' => 0]);
            } else {
                $producto->imagenes()->where('tipo', 'lifestyle')->delete();
            }

            if ($imagenStudio) {
                $producto->imagenes()->updateOrCreate(['tipo' => 'studio'], ['url' => $imagenStudio, 'orden' => 1]);
            } else {
                $producto->imagenes()->where('tipo', 'studio')->delete();
            }
        });
    }

    public function eliminar(Producto $producto): void
    {
        DB::transaction(function () use ($producto) {
            $producto->delete();
        });
    }
}
