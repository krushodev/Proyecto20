<?php

namespace Database\Factories;

use App\Models\Rol;
use Illuminate\Database\Eloquent\Factories\Factory;

class RolFactory extends Factory
{
    protected $model = Rol::class;

    public function definition(): array
    {
        return [
            'nombre' => fake()->unique()->word(),
        ];
    }

    public function cliente(): static
    {
        return $this->state(['nombre' => 'cliente']);
    }

    public function admin(): static
    {
        return $this->state(['nombre' => 'admin']);
    }
}
