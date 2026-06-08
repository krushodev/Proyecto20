<?php

namespace App\Http\Controllers;

use App\Http\Requests\ActualizarProductoRequest;
use App\Http\Requests\CrearProductoRequest;
use App\Models\Producto;
use App\Services\CategoriaService;
use App\Services\ProductoService;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class ProductoController extends Controller
{
    public function __construct(
        private readonly ProductoService $productoService,
        private readonly CategoriaService $categoriaService,
    ) {}

    public function index(): View
    {
        $productos = $this->productoService->obtenerTodos();

        return view('backend.admin.productos.index', compact('productos'));
    }

    public function create(): View
    {
        $categorias = $this->categoriaService->obtenerTodas();

        return view('backend.admin.productos.create', compact('categorias'));
    }

    public function store(CrearProductoRequest $request): RedirectResponse
    {
        $this->productoService->crear($request->validated());

        return redirect()->route('productos.index')->with('success', 'Producto creado correctamente.');
    }

    public function edit(Producto $producto): View
    {
        $categorias = $this->categoriaService->obtenerTodas();

        return view('backend.admin.productos.edit', compact('producto', 'categorias'));
    }

    public function update(ActualizarProductoRequest $request, Producto $producto): RedirectResponse
    {
        $this->productoService->actualizar($producto, $request->validated());

        return redirect()->route('productos.index')->with('success', 'Producto actualizado correctamente.');
    }

    public function destroy(Producto $producto): RedirectResponse
    {
        $this->productoService->eliminar($producto);

        return redirect()->route('productos.index')->with('success', 'Producto eliminado correctamente.');
    }
}
