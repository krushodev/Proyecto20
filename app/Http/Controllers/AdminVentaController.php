<?php

namespace App\Http\Controllers;

use App\Http\Requests\FiltrarVentasRequest;
use App\Services\VentaService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Response;
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

    public function factura(int $id): Response
    {
        $venta = $this->ventaService->obtenerPorId($id);

        abort_if($venta === null, 404);

        $pdf      = Pdf::loadView('facturas.factura', compact('venta'))->setPaper('a4', 'portrait');
        $filename = 'factura-' . str_pad($venta->id, 8, '0', STR_PAD_LEFT) . '.pdf';

        return $pdf->download($filename);
    }
}
