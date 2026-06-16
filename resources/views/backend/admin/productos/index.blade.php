@extends('layout.layout')

@section('title', 'Productos - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container admin-container--lg">

    <div class="admin-header admin-header--with-action">
      <div>
        <h1 class="admin-title">Productos</h1>
        <p class="admin-subtitle">{{ $productos->count() }} productos en el catálogo</p>
      </div>
      <div class="admin-header-actions">
        <a href="{{ route('productos.create') }}" class="admin-btn-new">
          <i data-lucide="plus"></i> Nuevo Producto
        </a>
        <a href="{{ route('admin.panel') }}" class="admin-back">
          <i data-lucide="arrow-left"></i> Volver al panel
        </a>
      </div>
    </div>

    <div class="admin-table-wrapper">
      <table class="admin-table">
        <thead>
          <tr>
            <th>#</th>
            <th>Imagen</th>
            <th>Nombre</th>
            <th>Categoría</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Estado</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          @forelse($productos as $producto)
          <tr>
            <td>{{ $producto->id }}</td>
            <td>
              @if($producto->imagen_studio)
                <img src="{{ $producto->imagen_studio }}" alt="{{ $producto->nombre }}" class="admin-product-thumb" />
              @else
                <span class="admin-no-image">—</span>
              @endif
            </td>
            <td>
              <strong>{{ $producto->nombre }}</strong>
              <br><small class="admin-slug">{{ $producto->slug }}</small>
            </td>
            <td>{{ $producto->categoria?->nombre ?? '—' }}</td>
            <td>$ {{ number_format($producto->precio, 0, ',', '.') }}</td>
            <td>{{ $producto->stock }}</td>
            <td>
              <span class="admin-badge {{ $producto->activo ? 'admin-badge-active' : 'admin-badge-inactive' }}">
                {{ $producto->activo ? 'Activo' : 'Inactivo' }}
              </span>
            </td>
            <td class="admin-actions">
              <a href="{{ route('productos.edit', $producto) }}" class="admin-btn-edit">Editar</a>
              <form action="{{ route('productos.destroy', $producto) }}" method="POST"
                    onsubmit="return confirm('¿Eliminar el producto {{ $producto->nombre }}?')">
                @csrf @method('DELETE')
                <button type="submit" class="admin-btn-delete">Eliminar</button>
              </form>
            </td>
          </tr>
          @empty
          <tr><td colspan="8" class="admin-empty">No hay productos registrados.</td></tr>
          @endforelse
        </tbody>
      </table>
    </div>

  </div>
</div>
@endsection
