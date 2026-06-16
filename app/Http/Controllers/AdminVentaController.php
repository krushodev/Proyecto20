<?php

namespace App\Http\Controllers;

use App\Http\Requests\FiltrarVentasRequest;
use App\Services\VentaService;
use Illuminate\View\View;

class AdminVentaController extends Controller
{
    public function __construct(
        private readonly VentaService $ventaService,
    ) {}

    public function index(FiltrarVentasRequest $request): View
    {
        $filtros = $request->validated();
        $ventas  = $this->ventaService->obtenerParaAdmin($filtros);

        return view('backend.admin.ventas.index', compact('ventas', 'filtros'));
    }

    public function show(int $id): View
    {
        $venta = $this->ventaService->obtenerPorId($id);

        abort_if($venta === null, 404);

        return view('backend.admin.ventas.show', compact('venta'));
    }
}
