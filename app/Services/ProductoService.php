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

            /** @var UploadedFile|null $imagenLifestyle */
            $imagenLifestyle = Arr::pull($datos, 'imagen_lifestyle');
            /** @var UploadedFile|null $imagenStudio */
            $imagenStudio = Arr::pull($datos, 'imagen_studio');

            $producto = Producto::create($datos);

            if ($imagenLifestyle instanceof UploadedFile) {
                $url = Storage::disk('public')->put('productos', $imagenLifestyle);
                $producto->imagenes()->create(['url' => $url, 'tipo' => 'lifestyle', 'orden' => 0]);
            }
            if ($imagenStudio instanceof UploadedFile) {
                $url = Storage::disk('public')->put('productos', $imagenStudio);
                $producto->imagenes()->create(['url' => $url, 'tipo' => 'studio', 'orden' => 1]);
            }

            return $producto;
        });
    }

    public function actualizar(Producto $producto, array $datos): void
    {
        DB::transaction(function () use ($producto, $datos) {
            /** @var UploadedFile|null $imagenLifestyle */
            $imagenLifestyle = Arr::pull($datos, 'imagen_lifestyle');
            /** @var UploadedFile|null $imagenStudio */
            $imagenStudio = Arr::pull($datos, 'imagen_studio');

            $producto->update($datos);

            if ($imagenLifestyle instanceof UploadedFile) {
                $imagenAnterior = $producto->imagenes()->where('tipo', 'lifestyle')->first();
                if ($imagenAnterior) {
                    Storage::disk('public')->delete($imagenAnterior->url);
                }
                $url = Storage::disk('public')->put('productos', $imagenLifestyle);
                $producto->imagenes()->updateOrCreate(['tipo' => 'lifestyle'], ['url' => $url, 'orden' => 0]);
            }

            if ($imagenStudio instanceof UploadedFile) {
                $imagenAnterior = $producto->imagenes()->where('tipo', 'studio')->first();
                if ($imagenAnterior) {
                    Storage::disk('public')->delete($imagenAnterior->url);
                }
                $url = Storage::disk('public')->put('productos', $imagenStudio);
                $producto->imagenes()->updateOrCreate(['tipo' => 'studio'], ['url' => $url, 'orden' => 1]);
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
