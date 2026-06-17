<?php

namespace Database\Factories;

use App\Models\Rol;
use App\Models\Usuario;
use App\Models\UserTarjeta;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UsuarioFactory extends Factory
{
    protected $model = Usuario::class;

    protected static ?string $password;

    private static array $nombres = [
        'Valentina', 'Martín', 'Lucía', 'Gonzalo', 'Camila', 'Federico',
        'Agustina', 'Nicolás', 'Florencia', 'Tomás', 'Sofía', 'Matías',
        'Micaela', 'Sebastián', 'Julieta', 'Facundo', 'Natalia', 'Diego',
        'Paula', 'Leandro', 'Celeste', 'Rodrigo', 'Antonella', 'Ezequiel',
        'Romina', 'Ignacio', 'Melina', 'Maximiliano', 'Noelia', 'Andrés',
        'Carla', 'Joaquín', 'Soledad', 'Marcos', 'Vanesa', 'Cristian',
        'Verónica', 'Javier', 'Daniela', 'Pablo',
    ];

    private static array $apellidos = [
        'Rodríguez', 'Fernández', 'Acosta', 'Sánchez', 'López', 'García',
        'Martínez', 'Pérez', 'Díaz', 'Álvarez', 'Romero', 'Torres',
        'Gutiérrez', 'Herrera', 'Castro', 'Ruiz', 'Moreno', 'Jiménez',
        'Vargas', 'Ortiz', 'Molina', 'Navarro', 'Ramos', 'Domínguez',
        'Suárez', 'Mendoza', 'Ríos', 'Silva', 'Blanco', 'Medina',
        'Fuentes', 'Delgado', 'Ibáñez', 'Vega', 'Paredes', 'Heredia',
        'Núñez', 'Pereyra', 'Cabrera', 'Benítez',
    ];

    private static array $dominios = [
        'gmail.com', 'hotmail.com', 'yahoo.com.ar', 'outlook.com', 'live.com.ar',
    ];

    public function definition(): array
    {
        $nombre   = self::$nombres[array_rand(self::$nombres)];
        $apellido = self::$apellidos[array_rand(self::$apellidos)];
        $slug     = strtolower(iconv('UTF-8', 'ASCII//TRANSLIT', $nombre . '.' . $apellido));
        $dominio  = self::$dominios[array_rand(self::$dominios)];

        return [
            'nombre'            => "$nombre $apellido",
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

    /**
     * Crea el usuario con 1 o 2 tarjetas guardadas aleatorias.
     * Útil para tests y seeders de volumen.
     */
    public function conTarjeta(int $cantidad = 1): static
    {
        return $this->afterCreating(function (Usuario $usuario) use ($cantidad) {
            UserTarjeta::factory()
                ->count($cantidad)
                ->create(['user_id' => $usuario->id]);
        });
    }
}
