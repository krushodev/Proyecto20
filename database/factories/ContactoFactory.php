<?php

namespace Database\Factories;

use App\Models\Contacto;
use Illuminate\Database\Eloquent\Factories\Factory;

class ContactoFactory extends Factory
{
    protected $model = Contacto::class;

    public function definition(): array
    {
        return [
            'nombre'  => fake()->name(),
            'email'   => fake()->safeEmail(),
            'asunto'  => fake()->sentence(4),
            'mensaje' => fake()->paragraph(),
            'leido'   => false,
        ];
    }

    public function leido(): static
    {
        return $this->state(['leido' => true]);
    }
}
