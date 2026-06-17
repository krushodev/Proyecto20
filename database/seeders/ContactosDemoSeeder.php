<?php

namespace Database\Seeders;

use App\Models\Contacto;
use Illuminate\Database\Seeder;

/**
 * Consultas de contacto simulando un buzón real de una relojería en La Plata:
 * mayoría sin leer (recientes) y un grupo ya leído (consultas más antiguas).
 */
class ContactosDemoSeeder extends Seeder
{
    private const CANTIDAD_CONTACTOS = 50;

    private const PROPORCION_LEIDOS = 0.3;

    public function run(): void
    {
        $leidos   = (int) round(self::CANTIDAD_CONTACTOS * self::PROPORCION_LEIDOS);
        $noLeidos = self::CANTIDAD_CONTACTOS - $leidos;

        // Consultas sin leer: llegaron en los últimos 30 días
        for ($i = 0; $i < $noLeidos; $i++) {
            $fecha = now()->subDays(rand(0, 30))->subHours(rand(0, 23));
            Contacto::factory()->create([
                'created_at' => $fecha,
                'updated_at' => $fecha,
            ]);
        }

        // Consultas ya leídas: entre 1 y 6 meses atrás
        for ($i = 0; $i < $leidos; $i++) {
            $fecha = now()->subDays(rand(31, 180))->subHours(rand(0, 23));
            Contacto::factory()->leido()->create([
                'created_at' => $fecha,
                'updated_at' => $fecha,
            ]);
        }
    }
}
