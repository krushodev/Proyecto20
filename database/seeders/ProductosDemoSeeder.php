<?php

namespace Database\Seeders;

use App\Models\Categoria;
use App\Models\Producto;
use Illuminate\Database\Seeder;

/**
 * Volumen adicional de productos generados por factory, complementando el
 * catálogo curado de CatalogoSeeder. Aporta variedad de precios/stock y
 * casos de baja lógica (inactivo y soft-deleted) para probar filtros.
 */
class ProductosDemoSeeder extends Seeder
{
    public function run(): void
    {
        $categoriasActivas = Categoria::activo()->get();

        if ($categoriasActivas->isEmpty()) {
            return;
        }

        // Productos activos con variedad de precio/stock.
        Producto::factory()
            ->count(8)
            ->state(fn () => ['categoria_id' => $categoriasActivas->random()->id])
            ->create();

        // Producto sin stock (visible pero no comprable).
        Producto::factory()
            ->count(2)
            ->sinStock()
            ->state(fn () => ['categoria_id' => $categoriasActivas->random()->id])
            ->create();

        // Producto inactivo (baja lógica "soft" vía flag, no eliminado).
        $inactivos = Producto::factory()
            ->count(2)
            ->inactivo()
            ->state(fn () => ['categoria_id' => $categoriasActivas->random()->id])
            ->create();

        // Producto soft-deleted (baja lógica vía SoftDeletes) para probar
        // que no aparece ni en listados ni en catálogo.
        $eliminados = Producto::factory()
            ->count(2)
            ->state(fn () => ['categoria_id' => $categoriasActivas->random()->id])
            ->create();

        $eliminados->each(fn (Producto $producto) => $producto->delete());
    }
}
