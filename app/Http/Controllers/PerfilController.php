<?php

namespace App\Http\Controllers;

use App\Http\Requests\ActualizarPerfilRequest;
use App\Services\UsuarioService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class PerfilController extends Controller
{
    public function __construct(
        private readonly UsuarioService $usuarioService,
    ) {}

    public function ver(): View
    {
        $usuario = Auth::user();

        return view('paginas.perfil', compact('usuario'));
    }

    public function editar(): View
    {
        $usuario = Auth::user();

        return view('paginas.editar-perfil', compact('usuario'));
    }

    public function actualizar(ActualizarPerfilRequest $request): RedirectResponse
    {
        $this->usuarioService->actualizarPerfil(Auth::user(), $request->validated());

        return redirect()->route('perfil.ver')->with('success', 'Perfil actualizado correctamente.');
    }

    public function mostrarAdmin(): View
    {
        $usuario = Auth::user();

        return view('backend.admin.perfil.index', compact('usuario'));
    }

    public function actualizarAdmin(ActualizarPerfilRequest $request): RedirectResponse
    {
        $this->usuarioService->actualizarPerfil(Auth::user(), $request->validated());

        return redirect()->route('admin.perfil')->with('success', 'Perfil actualizado correctamente.');
    }
}
