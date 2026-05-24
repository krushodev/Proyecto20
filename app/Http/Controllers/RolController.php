<?php

namespace App\Http\Controllers;

use App\Models\Rol;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class RolController extends Controller
{
    public function index(): View
    {
        $roles = Rol::all();

        return view('backend.admin.roles.index', compact('roles'));
    }

    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'nombre' => ['required', 'string', 'unique:roles,nombre'],
        ]);

        Rol::create($request->only('nombre'));

        return redirect()->route('roles.index');
    }

    public function destroy(Rol $rol): RedirectResponse
    {
        $rol->delete();

        return redirect()->route('roles.index');
    }
}
