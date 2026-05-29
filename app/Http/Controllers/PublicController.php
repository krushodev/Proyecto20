<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use App\Models\Producto;
use Illuminate\View\View;

class PublicController extends Controller
{
    public function inicio(): View
    {
        return view('paginas.inicio');
    }

    public function catalogo(): View
    {
        $categorias = Categoria::with([
            'productos' => fn ($q) => $q->where('activo', true)->orderBy('nombre'),
        ])
            ->where('activo', true)
            ->orderBy('nombre')
            ->get();

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
        $producto = Producto::with('categoria')
            ->where('slug', $slug)
            ->where('activo', true)
            ->firstOrFail();

        return view('paginas.detalle-producto', compact('producto'));
    }
}
