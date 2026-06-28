<?php

namespace App\Services;

use App\Mail\ContactoRecibidoMail;
use App\Models\Contacto;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Mail;

class ContactoService
{
    public function guardar(array $datos): Contacto
    {
        $contacto = Contacto::create($datos);

        Mail::to(config('mail.admin_address'))
            ->queue(new ContactoRecibidoMail($contacto));

        return $contacto;
    }

    public function obtenerTodas(): LengthAwarePaginator
    {
        return Contacto::orderByRaw('leido ASC, created_at DESC')->paginate(15);
    }

    public function marcarLeido(int $id): void
    {
        $contacto = Contacto::findOrFail($id);
        $contacto->update(['leido' => !$contacto->leido]);
    }
}
