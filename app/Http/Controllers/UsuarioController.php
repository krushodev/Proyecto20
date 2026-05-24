<?php

namespace App\Http\Controllers;

use App\Http\Requests\ActualizarUsuarioRequest;
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

        return view('server.admin.usuarios.index', compact('usuarios'));
    }

    public function edit(Usuario $usuario): View
    {
        $roles = $this->usuarioService->obtenerRoles();

        return view('server.admin.usuarios.edit', compact('usuario', 'roles'));
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
