<?php

namespace App\Http\Controllers;

use App\Models\Rol;
use App\Models\Usuario;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class UsuarioController extends Controller
{
    public function index(): View
    {
        $usuarios = Usuario::with('rol')->get();

        return view('backend.admin.usuarios.index', compact('usuarios'));
    }

    public function edit(Usuario $usuario): View
    {
        $roles = Rol::all();

        return view('backend.admin.usuarios.edit', compact('usuario', 'roles'));
    }

    public function update(Request $request, Usuario $usuario): RedirectResponse
    {
        $request->validate([
            'nombre' => ['required', 'string', 'min:2', 'max:100'],
            'email'  => ['required', 'email', 'unique:usuarios,email,' . $usuario->id],
            'rol_id' => ['required', 'exists:roles,id'],
        ]);

        $usuario->update($request->only('nombre', 'email', 'rol_id'));

        return redirect()->route('usuarios.index');
    }

    public function destroy(Usuario $usuario): RedirectResponse
    {
        $usuario->delete();

        return redirect()->route('usuarios.index');
    }
}
