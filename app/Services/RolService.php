<?php

namespace App\Services;

use App\Models\Rol;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\DB;

class RolService
{
    public function obtenerTodos(): Collection
    {
        return Rol::all();
    }

    public function crear(array $datos): Rol
    {
        return DB::transaction(function () use ($datos) {
            return Rol::create($datos);
        });
    }

    public function eliminar(Rol $rol): void
    {
        DB::transaction(function () use ($rol) {
            $rol->delete();
        });
    }
}
