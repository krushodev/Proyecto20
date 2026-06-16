<?php

namespace App\Services;

use App\Models\Rol;
use App\Models\Usuario;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\DB;

class UsuarioService
{
    public function crear(array $datos): Usuario
    {
        return DB::transaction(function () use ($datos) {
            return Usuario::create($datos);
        });
    }

    public function obtenerTodos(): Collection
    {
        return Usuario::with('rol')->get();
    }

    public function obtenerRoles(): Collection
    {
        return Rol::all();
    }

    public function actualizar(Usuario $usuario, array $datos): void
    {
        DB::transaction(function () use ($usuario, $datos) {
            $usuario->update($datos);
        });
    }

    public function actualizarPerfil(Usuario $usuario, array $datos): void
    {
        DB::transaction(function () use ($usuario, $datos) {
            $campos = [
                'nombre'              => $datos['nombre'],
                'email'               => $datos['email'],
                'numero_tarjeta'      => $datos['numero_tarjeta'] ?? null,
                'titular_tarjeta'     => $datos['titular_tarjeta'] ?? null,
                'vencimiento_tarjeta' => $datos['vencimiento_tarjeta'] ?? null,
                'cvv_tarjeta'         => $datos['cvv_tarjeta'] ?? null,
                'ubicacion'           => $datos['ubicacion'] ?? null,
            ];

            if (!empty($datos['password'])) {
                $campos['password'] = $datos['password'];
            }

            $usuario->update($campos);
        });
    }

    public function eliminar(Usuario $usuario, Usuario $usuarioAutenticado): void
    {
        if ($usuario->id === $usuarioAutenticado->id) {
            throw new \RuntimeException('No podés eliminarte a vos mismo.');
        }

        DB::transaction(function () use ($usuario) {
            $usuario->delete();
        });
    }
}
