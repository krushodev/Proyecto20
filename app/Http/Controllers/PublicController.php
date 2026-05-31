<?php

namespace App\Http\Controllers;

use App\Services\CategoriaService;
use App\Services\ProductoService;
use Illuminate\View\View;

class PublicController extends Controller
{
    public function __construct(
        private readonly CategoriaService $categoriaService,
        private readonly ProductoService $productoService,
    ) {}

    public function inicio(): View
    {
        return view('paginas.inicio');
    }

    public function catalogo(): View
    {
        $categorias = $this->categoriaService->obtenerActivasConProductos();

        return view('paginas.catalogo', compact('categorias'));
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
