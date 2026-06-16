<?php

namespace Database\Factories;

use App\Models\Rol;
use App\Models\Usuario;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UsuarioFactory extends Factory
{
    protected $model = Usuario::class;

    protected static ?string $password;

    public function definition(): array
    {
        return [
            'nombre'            => fake()->name(),
            'email'             => fake()->unique()->safeEmail(),
            'email_verified_at' => now(),
            'password'          => static::$password ??= Hash::make('password'),
            'remember_token'    => Str::random(10),
            'rol_id'            => null,
        ];
    }

    public function admin(): static
    {
        return $this->state(fn () => [
            'rol_id' => Rol::firstOrCreate(['nombre' => 'admin'])->id,
        ]);
    }

    public function cliente(): static
    {
        return $this->state(fn () => [
            'rol_id' => Rol::firstOrCreate(['nombre' => 'cliente'])->id,
        ]);
    }
}
