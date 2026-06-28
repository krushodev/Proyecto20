<?php

namespace App\Services;

use App\Models\Rol;
use App\Models\Usuario;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
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

    public function obtenerTodos(?string $busqueda = null, ?string $rolSeleccionado = null): LengthAwarePaginator
    {
        return Usuario::with('rol')
            ->when($busqueda !== null && $busqueda !== '', function ($query) use ($busqueda) {
                $query->where(function ($subquery) use ($busqueda) {
                    $subquery->where('nombre', 'like', "%{$busqueda}%")
                        ->orWhere('email', 'like', "%{$busqueda}%");
                });
            })
            ->when($rolSeleccionado !== null && $rolSeleccionado !== '', function ($query) use ($rolSeleccionado) {
                $query->whereHas('rol', function ($subquery) use ($rolSeleccionado) {
                    $subquery->where('id', $rolSeleccionado);
                });
            })
            ->paginate(15);
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
                'nombre'    => $datos['nombre'],
                'email'     => $datos['email'],
                'ubicacion' => $datos['ubicacion'] ?? null,
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
