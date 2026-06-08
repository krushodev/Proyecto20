<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegistroRequest;
use App\Services\AuthService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class AuthController extends Controller
{
    public function __construct(private AuthService $authService) {}

    public function mostrarLogin(): View
    {
        return view('backend.usuarios.login');
    }

    public function mostrarRegistro(): View
    {
        return view('backend.usuarios.registro');
    }

    public function autenticar(LoginRequest $request): RedirectResponse
    {
        if ($this->authService->autenticarUsuario($request->only('email', 'password'), $request->boolean('remember'))) {
            $request->session()->regenerate();

            $rol = Auth::user()->rol?->nombre;

            if ($rol === 'admin') {
                return redirect()->intended('/admin');
            }

            return redirect()->intended('/');
        }

        return back()
            ->withInput($request->only('email', 'remember'))
            ->withErrors(['email' => 'Las credenciales no coinciden con nuestros registros.']);
    }

    public function registrar(RegistroRequest $request): RedirectResponse
    {
        $this->authService->registrarUsuario($request->validated());

        return redirect('/');
    }

    public function logout(Request $request): RedirectResponse
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/');
    }
}
