<?php

namespace Database\Seeders;

use App\Models\Rol;
use App\Models\Usuario;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

/**
 * Usuarios de demo con credenciales predecibles para pruebas manuales.
 *
 * Admin:    admin@admin.com    / 123456789  (creado por SuperAdminSeeder)
 * Clientes: cliente1@demo.com  / password
 *           cliente2@demo.com  / password
 *           cliente3@demo.com  / password
 *           ... + ~100 clientes aleatorios para volumen
 */
class UsuariosSeeder extends Seeder
{
    public const CLIENTES_DEMO = [
        ['nombre' => 'Valentina Rodríguez', 'email' => 'cliente1@demo.com'],
        ['nombre' => 'Martín Fernández',    'email' => 'cliente2@demo.com'],
        ['nombre' => 'Lucía Acosta',        'email' => 'cliente3@demo.com'],
    ];

    public function run(): void
    {
        $rolCliente = Rol::firstOrCreate(['nombre' => 'cliente']);

        foreach (self::CLIENTES_DEMO as $datos) {
            Usuario::firstOrCreate(
                ['email' => $datos['email']],
                [
                    'nombre'            => $datos['nombre'],
                    'password'          => Hash::make('password'),
                    'rol_id'            => $rolCliente->id,
                    'email_verified_at' => now(),
                ]
            );
        }

        // Volumen adicional de clientes aleatorios para datos más representativos.
        $existentes = Usuario::where('rol_id', $rolCliente->id)->count();
        $faltantes  = max(0, 100 - $existentes);

        if ($faltantes > 0) {
            Usuario::factory()
                ->count($faltantes)
                ->cliente()
                ->create();
        }
    }
}
