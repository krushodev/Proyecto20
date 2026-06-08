<?php

namespace App\Http\Controllers;

use App\Http\Requests\CrearRolRequest;
use App\Models\Rol;
use App\Services\RolService;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class RolController extends Controller
{
    public function __construct(private RolService $rolService) {}

    public function index(): View
    {
        $roles = $this->rolService->obtenerTodos();

        return view('backend.admin.roles.index', compact('roles'));
    }

    public function store(CrearRolRequest $request): RedirectResponse
    {
        $this->rolService->crear($request->validated());

        return redirect()->route('roles.index')->with('success', 'Rol creado correctamente.');
    }

    public function destroy(Rol $rol): RedirectResponse
    {
        $this->rolService->eliminar($rol);

        return redirect()->route('roles.index')->with('success', 'Rol eliminado correctamente.');
    }
}
