<?php

namespace Database\Factories;

use App\Models\UserTarjeta;
use App\Models\Usuario;
use Illuminate\Database\Eloquent\Factories\Factory;

class UserTarjetaFactory extends Factory
{
    protected $model = UserTarjeta::class;

    private static array $tipos = [
        'visa'       => ['prefijos' => ['4111', '4532', '4916', '4024']],
        'mastercard' => ['prefijos' => ['5100', '5200', '5300', '5411', '5521']],
        'amex'       => ['prefijos' => ['3714', '3787']],
        'cabal'      => ['prefijos' => ['6034']],
        'naranja'    => ['prefijos' => ['5895']],
    ];

    public function definition(): array
    {
        $tipo    = array_rand(self::$tipos);
        $prefijo = self::$tipos[$tipo]['prefijos'][array_rand(self::$tipos[$tipo]['prefijos'])];
        $ultimos = str_pad((string) rand(0, 9999), 4, '0', STR_PAD_LEFT);

        $nombre   = fake('es_AR')->firstName();
        $apellido = fake('es_AR')->lastName();

        $mesExp  = str_pad((string) rand(1, 12), 2, '0', STR_PAD_LEFT);
        $anioExp = str_pad((string) rand(26, 29), 2, '0', STR_PAD_LEFT);

        return [
            'user_id'        => Usuario::factory(),
            'ultimos_cuatro' => $ultimos,
            'titular'        => strtoupper("$nombre $apellido"),
            'mes_exp'        => $mesExp,
            'anio_exp'       => $anioExp,
            'tipo'           => $tipo,
        ];
    }

    public function visa(): static
    {
        return $this->state(fn () => ['tipo' => 'visa']);
    }

    public function mastercard(): static
    {
        return $this->state(fn () => ['tipo' => 'mastercard']);
    }

    public function amex(): static
    {
        return $this->state(fn () => ['tipo' => 'amex']);
    }

    public function naranja(): static
    {
        return $this->state(fn () => ['tipo' => 'naranja']);
    }
}
