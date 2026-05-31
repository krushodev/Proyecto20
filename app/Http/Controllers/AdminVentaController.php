<?php

namespace App\Http\Controllers;

use App\Services\VentaService;
use Illuminate\View\View;

class AdminVentaController extends Controller
{
    public function __construct(
        private readonly VentaService $ventaService,
    ) {}

    public function index(): View
    {
        $ventas = $this->ventaService->obtenerTodas();

        return view('server.admin.ventas.index', compact('ventas'));
    }

    public function show(int $id): View
    {
        $venta = $this->ventaService->obtenerPorId($id);

        abort_if($venta === null, 404);

        return view('server.admin.ventas.show', compact('venta'));
    }
}
