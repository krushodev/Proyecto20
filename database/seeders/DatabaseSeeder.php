<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call([
            RolesSeeder::class,
            SuperAdminSeeder::class,
            UsuariosSeeder::class,
            CatalogoSeeder::class,
            CarritoDemoSeeder::class,
            VentasDemoSeeder::class,
            ContactosDemoSeeder::class,
        ]);
    }
}
