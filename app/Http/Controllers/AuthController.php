<?php

namespace App\Http\Controllers;

use App\Models\Rol;
use App\Models\Usuario;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class AuthController extends Controller
{
    public function mostrarLogin(): View
    {
        return view('server.usuarios.login');
    }

    public function mostrarRegistro(): View
    {
        return view('server.usuarios.registro');
    }

    public function autenticar(Request $request): RedirectResponse
    {
        $credenciales = $request->validate([
            'email'    => ['required', 'email'],
            'password' => ['required', 'min:8'],
        ]);

        if (Auth::attempt($credenciales, $request->boolean('remember'))) {
            $request->session()->regenerate();

            $rol = Auth::user()->rol?->nombre;

            if ($rol === 'admin') {
                return redirect()->intended('/admin');
            }

            return redirect()->intended('/cliente');
        }

        return back()
            ->withInput($request->only('email', 'remember'))
            ->withErrors(['email' => 'Las credenciales no coinciden con nuestros registros.']);
    }

    public function registrar(Request $request): RedirectResponse
    {
        $datos = $request->validate([
            'nombre'   => ['required', 'string', 'min:2', 'max:100'],
            'email'    => ['required', 'email', 'unique:usuarios,email'],
            'password' => ['required', 'min:8', 'confirmed'],
        ]);

        $rolCliente = Rol::where('nombre', 'cliente')->first();

        $usuario = Usuario::create([
            'nombre'   => $datos['nombre'],
            'email'    => $datos['email'],
            'password' => $datos['password'],
            'rol_id'   => $rolCliente?->id,
        ]);

        Auth::login($usuario);

        return redirect('/cliente');
    }

    public function logout(Request $request): RedirectResponse
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/');
    }
}
