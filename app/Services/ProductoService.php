<?php

namespace App\Services;

use App\Models\Producto;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
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
            ->activo()
            ->firstOrFail();
    }

    public function obtenerActivos(): Collection
    {
        return Producto::with('imagenes')
            ->activo()
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

            if ($imagenLifestyle !== null && $imagenLifestyle !== '') {
                $url = $this->almacenarImagen($imagenLifestyle);
                $producto->imagenes()->create(['url' => $url, 'tipo' => 'lifestyle', 'orden' => 0]);
            }
            if ($imagenStudio !== null && $imagenStudio !== '') {
                $url = $this->almacenarImagen($imagenStudio);
                $producto->imagenes()->create(['url' => $url, 'tipo' => 'studio', 'orden' => 1]);
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

            if ($imagenLifestyle !== null && $imagenLifestyle !== '') {
                $this->reemplazarImagen($producto, 'lifestyle', $imagenLifestyle, 0);
            }

            if ($imagenStudio !== null && $imagenStudio !== '') {
                $this->reemplazarImagen($producto, 'studio', $imagenStudio, 1);
            }
        });
    }

    private function almacenarImagen(UploadedFile|string $imagen): string
    {
        if ($imagen instanceof UploadedFile) {
            return Storage::disk('public')->put('productos', $imagen);
        }

        return $imagen;
    }

    private function reemplazarImagen(Producto $producto, string $tipo, UploadedFile|string $nueva, int $orden): void
    {
        if ($nueva instanceof UploadedFile) {
            $anterior = $producto->imagenes()->where('tipo', $tipo)->first();
            if ($anterior && !str_starts_with($anterior->url, 'http')) {
                Storage::disk('public')->delete($anterior->url);
            }
        }

        $url = $this->almacenarImagen($nueva);
        $producto->imagenes()->updateOrCreate(['tipo' => $tipo], ['url' => $url, 'orden' => $orden]);
    }

    public function eliminar(Producto $producto): void
    {
        DB::transaction(function () use ($producto) {
            $producto->delete();
        });
    }
}
