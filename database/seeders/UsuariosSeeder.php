<?php

namespace Database\Seeders;

use App\Models\Rol;
use App\Models\Usuario;
use App\Models\UserTarjeta;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

/**
 * Usuarios de demo con credenciales predecibles para pruebas manuales.
 *
 * Admin:    admin@admin.com    / 123456789  (creado por SuperAdminSeeder)
 * Clientes: cliente1@demo.com  / 123456789  → Visa + Mastercard guardadas
 *           cliente2@demo.com  / 123456789  → Amex guardada
 *           cliente3@demo.com  / 123456789  → Naranja guardada
 *           ... + ~100 clientes aleatorios con 0-2 tarjetas cada uno
 */
class UsuariosSeeder extends Seeder
{
    public const CLIENTES_DEMO = [
        ['nombre' => 'Valentina Rodríguez', 'email' => 'cliente1@demo.com'],
        ['nombre' => 'Martín Fernández',    'email' => 'cliente2@demo.com'],
        ['nombre' => 'Lucía Acosta',        'email' => 'cliente3@demo.com'],
    ];

    /** Tarjetas predefinidas para cada cliente demo, indexadas por email. */
    private const TARJETAS_DEMO = [
        'cliente1@demo.com' => [
            ['ultimos_cuatro' => '4242', 'titular' => 'VALENTINA RODRIGUEZ', 'mes_exp' => '12', 'anio_exp' => '27', 'tipo' => 'visa'],
            ['ultimos_cuatro' => '5521', 'titular' => 'VALENTINA RODRIGUEZ', 'mes_exp' => '08', 'anio_exp' => '28', 'tipo' => 'mastercard'],
        ],
        'cliente2@demo.com' => [
            ['ultimos_cuatro' => '0005', 'titular' => 'MARTIN FERNANDEZ',    'mes_exp' => '03', 'anio_exp' => '26', 'tipo' => 'amex'],
        ],
        'cliente3@demo.com' => [
            ['ultimos_cuatro' => '6234', 'titular' => 'LUCIA ACOSTA',        'mes_exp' => '06', 'anio_exp' => '29', 'tipo' => 'naranja'],
        ],
    ];

    public function run(): void
    {
        $rolCliente = Rol::firstOrCreate(['nombre' => 'cliente']);

        foreach (self::CLIENTES_DEMO as $datos) {
            $usuario = Usuario::firstOrCreate(
                ['email' => $datos['email']],
                [
                    'nombre'            => $datos['nombre'],
                    'password'          => Hash::make('123456789'),
                    'rol_id'            => $rolCliente->id,
                    'email_verified_at' => now(),
                ]
            );

            // Sincroniza la contraseña si el usuario ya existía con otra clave.
            if (! \Illuminate\Support\Facades\Hash::check('123456789', $usuario->password)) {
                $usuario->update(['password' => Hash::make('123456789')]);
            }

            // Sembramos tarjetas solo si el usuario no tiene ninguna todavía.
            if ($usuario->tarjetas()->count() === 0) {
                foreach (self::TARJETAS_DEMO[$datos['email']] as $tarjeta) {
                    $usuario->tarjetas()->create($tarjeta);
                }
            }
        }

        // Volumen adicional de clientes aleatorios: ~30 % con 1 tarjeta, ~20 % con 2.
        $existentes = Usuario::where('rol_id', $rolCliente->id)->count();
        $faltantes  = max(0, 100 - $existentes);

        if ($faltantes > 0) {
            $porcion1 = (int) round($faltantes * 0.30);
            $porcion2 = (int) round($faltantes * 0.20);
            $sinTarj  = $faltantes - $porcion1 - $porcion2;

            Usuario::factory()->count($sinTarj)->cliente()->create();
            Usuario::factory()->count($porcion1)->cliente()->conTarjeta(1)->create();
            Usuario::factory()->count($porcion2)->cliente()->conTarjeta(2)->create();
        }
    }
}
