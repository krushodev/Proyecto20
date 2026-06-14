<?php

namespace Database\Factories;

use App\Models\Categoria;
use App\Models\Producto;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class ProductoFactory extends Factory
{
    protected $model = Producto::class;

    public function definition(): array
    {
        $nombre = fake()->unique()->words(3, true);

        return [
            'categoria_id' => Categoria::factory(),
            'nombre'       => ucfirst($nombre),
            'slug'         => Str::slug($nombre),
            'descripcion'  => fake()->paragraph(),
            'precio'       => fake()->randomFloat(2, 5000, 500000),
            'stock'        => fake()->numberBetween(5, 100),
            'activo'       => true,
        ];
    }

    public function sinStock(): static
    {
        return $this->state(['stock' => 0]);
    }

    public function inactivo(): static
    {
        return $this->state(['activo' => false]);
    }
}
