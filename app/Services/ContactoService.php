<?php

namespace App\Services;

use App\Models\Contacto;
use Illuminate\Database\Eloquent\Collection;

class ContactoService
{
    public function guardar(array $datos): Contacto
    {
        return Contacto::create($datos);
    }

    public function obtenerTodas(): Collection
    {
        return Contacto::orderByRaw('leido ASC, created_at DESC')->get();
    }

    public function marcarLeido(int $id): void
    {
        $contacto = Contacto::findOrFail($id);
        $contacto->update(['leido' => !$contacto->leido]);
    }
}
