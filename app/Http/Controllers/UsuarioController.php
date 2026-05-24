<?php

namespace App\Http\Controllers;

use App\Http\Requests\ActualizarUsuarioRequest;
use App\Models\Rol;
use App\Models\Usuario;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class UsuarioController extends Controller
{
    public function index(): View
    {
        $usuarios = Usuario::with('rol')->get();

        return view('server.admin.usuarios.index', compact('usuarios'));
    }

    public function edit(Usuario $usuario): View
    {
        $roles = Rol::all();

        return view('server.admin.usuarios.edit', compact('usuario', 'roles'));
    }

    public function update(ActualizarUsuarioRequest $request, Usuario $usuario): RedirectResponse
    {
        $usuario->update($request->validated());

        return redirect()->route('usuarios.index');
    }

    public function destroy(Usuario $usuario): RedirectResponse
    {
        $usuario->delete();

        return redirect()->route('usuarios.index');
    }
}
