<?php

namespace App\Services;

use App\Models\Rol;
use App\Models\Usuario;
use Illuminate\Support\Facades\Auth;

class AuthService
{
    public function registrarUsuario(array $datos): Usuario
    {
        $rolCliente = Rol::where('nombre', 'cliente')->first();

        $usuario = Usuario::create([
            'nombre'   => $datos['nombre'],
            'email'    => $datos['email'],
            'password' => $datos['password'],
            'rol_id'   => $rolCliente?->id,
        ]);

        Auth::login($usuario);

        return $usuario;
    }

    public function autenticarUsuario(array $credenciales, bool $remember): bool
    {
        return Auth::attempt($credenciales, $remember);
    }
}
