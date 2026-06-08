<?php

namespace App\Http\Controllers;

use App\Services\ContactoService;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class AdminContactoController extends Controller
{
    public function __construct(
        private readonly ContactoService $contactoService,
    ) {}

    public function index(): View
    {
        $contactos = $this->contactoService->obtenerTodas();

        return view('backend.admin.contactos.index', compact('contactos'));
    }

    public function marcarLeido(int $id): RedirectResponse
    {
        $this->contactoService->marcarLeido($id);

        return back()->with('success', 'Estado actualizado.');
    }
}
