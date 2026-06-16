<?php

namespace Database\Seeders;

use App\Models\Contacto;
use Illuminate\Database\Seeder;

/**
 * Volumen representativo de consultas de contacto, simulando un buzón real:
 * mayoría sin leer y un grupo ya leído por el equipo de soporte.
 */
class ContactosDemoSeeder extends Seeder
{
    private const CANTIDAD_CONTACTOS = 50;

    private const PROPORCION_LEIDOS = 0.3;

    public function run(): void
    {
        $leidos    = (int) round(self::CANTIDAD_CONTACTOS * self::PROPORCION_LEIDOS);
        $noLeidos  = self::CANTIDAD_CONTACTOS - $leidos;

        Contacto::factory()->count($noLeidos)->create();
        Contacto::factory()->count($leidos)->leido()->create();
    }
}
