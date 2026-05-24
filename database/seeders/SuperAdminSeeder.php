<?php

namespace Database\Seeders;

use App\Models\Rol;
use App\Models\Usuario;
use Illuminate\Database\Seeder;

class SuperAdminSeeder extends Seeder
{
    public function run(): void
    {
        $rolAdmin = Rol::firstOrCreate(['nombre' => 'admin']);

        Usuario::firstOrCreate(
            ['email' => 'admin@admin.com'],
            [
                'nombre'   => 'Admin',
                'password' => bcrypt('123456789'),
                'rol_id'   => $rolAdmin->id,
            ]
        );
    }
}
