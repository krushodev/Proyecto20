<?php

namespace App\Http\Controllers;

use App\Http\Requests\ActualizarUsuarioRequest;
use App\Http\Requests\CrearUsuarioRequest;
use App\Models\Usuario;
use App\Services\UsuarioService;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class UsuarioController extends Controller
{
    public function __construct(private UsuarioService $usuarioService) {}

    public function index(): View
    {
        $usuarios = $this->usuarioService->obtenerTodos();

        return view('backend.admin.usuarios.index', compact('usuarios'));
    }

    public function create(): View
    {
        $roles = $this->usuarioService->obtenerRoles();

        return view('backend.admin.usuarios.create', compact('roles'));
    }

    public function store(CrearUsuarioRequest $request): RedirectResponse
    {
        $this->usuarioService->crear($request->validated());

        return redirect()->route('usuarios.index')->with('success', 'Usuario creado correctamente.');
    }

    public function edit(Usuario $usuario): View
    {
        $roles = $this->usuarioService->obtenerRoles();

        return view('backend.admin.usuarios.edit', compact('usuario', 'roles'));
    }

    public function update(ActualizarUsuarioRequest $request, Usuario $usuario): RedirectResponse
    {
        $this->usuarioService->actualizar($usuario, $request->validated());

        return redirect()->route('usuarios.index')->with('success', 'Usuario actualizado correctamente.');
    }

    public function destroy(Usuario $usuario): RedirectResponse
    {
        $this->usuarioService->eliminar($usuario);

        return redirect()->route('usuarios.index')->with('success', 'Usuario eliminado correctamente.');
    }
}
