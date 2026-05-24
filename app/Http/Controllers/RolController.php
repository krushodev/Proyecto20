<?php

namespace App\Http\Controllers;

use App\Http\Requests\CrearRolRequest;
use App\Models\Rol;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class RolController extends Controller
{
    public function index(): View
    {
        $roles = Rol::all();

        return view('server.admin.roles.index', compact('roles'));
    }

    public function store(CrearRolRequest $request): RedirectResponse
    {
        Rol::create($request->validated());

        return redirect()->route('roles.index');
    }

    public function destroy(Rol $rol): RedirectResponse
    {
        $rol->delete();

        return redirect()->route('roles.index');
    }
}
