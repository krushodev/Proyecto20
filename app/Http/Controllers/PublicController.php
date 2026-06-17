<?php

namespace App\Http\Controllers;

use App\Http\Requests\EnviarContactoRequest;
use App\Services\CategoriaService;
use App\Services\ContactoService;
use App\Services\ProductoService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class PublicController extends Controller
{
    public function __construct(
        private readonly CategoriaService $categoriaService,
        private readonly ProductoService $productoService,
        private readonly ContactoService $contactoService,
    ) {}

    public function inicio(): View
    {
        return view('paginas.inicio');
    }

    public function catalogo(Request $request): View
    {
        $lineaSlug = $request->query('linea');
        $precio    = $request->query('precio');
        $stock     = $request->query('stock');

        $lineas = $this->categoriaService->obtenerActivas();
        $categorias = $this->categoriaService->obtenerActivasConProductos($lineaSlug, $precio, $stock);

        return view('paginas.catalogo', compact('categorias', 'lineas', 'lineaSlug', 'precio', 'stock'));
    }

    public function nosotros(): View
    {
        return view('paginas.nosotros');
    }

    public function comercializacion(): View
    {
        return view('paginas.comercializacion');
    }

    public function contacto(): View
    {
        return view('paginas.contacto');
    }

    public function enviarContacto(EnviarContactoRequest $request): RedirectResponse
    {
        $this->contactoService->guardar($request->validated());

        return redirect()->route('contacto')
            ->with('success', '¡Mensaje enviado! Te responderemos dentro de las 24 hs hábiles.');
    }

    public function terminosYCondiciones(): View
    {
        return view('paginas.terminos-y-condiciones');
    }

    public function detalleProducto(string $slug): View
    {
        $producto = $this->productoService->obtenerPorSlug($slug);

        return view('paginas.detalle-producto', compact('producto'));
    }
}
