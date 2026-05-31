<?php

namespace App\Services;

use App\Models\Contacto;

class ContactoService
{
    public function guardar(array $datos): Contacto
    {
        return Contacto::create($datos);
    }
}
