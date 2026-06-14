@extends('layout.layout')

@section('title', 'Productos - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container">

    <div class="admin-header">
      <div>
        <h1 class="admin-title">Productos</h1>
        <p class="admin-subtitle">{{ $productos->count() }} productos en el catálogo</p>
      </div>
      <div style="display:flex;gap:.75rem;align-items:center">
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

@push('styles')
<style>
.admin-page { min-height: 100vh; padding: 2rem; background-color: #0a0a0a; }
.admin-container { max-width: 1100px; margin: 0 auto; }
.admin-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 2rem; padding-bottom: 1.5rem; border-bottom: 1px solid rgba(255,255,255,0.08); }
.admin-title { font-size: 1.75rem; font-weight: 700; color: #fff; letter-spacing: -0.02em; }
.admin-subtitle { font-size: 0.875rem; color: rgba(255,255,255,0.5); margin-top: 0.25rem; }
.admin-back { display: flex; align-items: center; gap: 0.4rem; font-size: 0.8rem; color: rgba(255,255,255,0.5); text-decoration: none; transition: color 0.2s; white-space: nowrap; }
.admin-back:hover { color: #fff; }
.admin-back i { width: 14px; height: 14px; }
.admin-btn-new { display: flex; align-items: center; gap: .4rem; padding: .45rem .9rem; font-size: .8rem; font-weight: 600; color: #fff; border: 1px solid rgba(255,255,255,.3); border-radius: 5px; text-decoration: none; transition: all .2s; white-space: nowrap; }
.admin-btn-new:hover { background: rgba(255,255,255,.08); border-color: #fff; color: #fff; }
.admin-btn-new i { width: 14px; height: 14px; }
.admin-alert-success { padding: .75rem 1rem; background: rgba(74,222,128,.1); border: 1px solid rgba(74,222,128,.3); border-radius: 6px; color: #4ade80; font-size: .85rem; margin-bottom: 1.5rem; }
.admin-table-wrapper { overflow-x: auto; }
.admin-table { width: 100%; border-collapse: collapse; font-size: 0.875rem; }
.admin-table th { text-align: left; padding: 0.75rem 1rem; font-size: 0.7rem; font-weight: 600; letter-spacing: 0.08em; text-transform: uppercase; color: rgba(255,255,255,0.4); border-bottom: 1px solid rgba(255,255,255,0.08); }
.admin-table td { padding: 0.875rem 1rem; color: rgba(255,255,255,0.8); border-bottom: 1px solid rgba(255,255,255,0.05); vertical-align: middle; }
.admin-table tr:hover td { background-color: rgba(255,255,255,0.02); }
.admin-product-thumb { width: 44px; height: 44px; object-fit: cover; border-radius: 4px; display: block; }
.admin-no-image { color: rgba(255,255,255,.3); }
.admin-slug { font-size: .72rem; color: rgba(255,255,255,.35); font-family: monospace; }
.admin-badge { display: inline-block; padding: .2rem .6rem; border-radius: 20px; font-size: .7rem; font-weight: 600; letter-spacing: .05em; }
.admin-badge-active { background: rgba(74,222,128,.12); color: #4ade80; border: 1px solid rgba(74,222,128,.25); }
.admin-badge-inactive { background: rgba(255,107,107,.1); color: #ff6b6b; border: 1px solid rgba(255,107,107,.25); }
.admin-actions { display: flex; gap: 0.5rem; align-items: center; }
.admin-btn-edit, .admin-btn-delete { padding: 0.35rem 0.75rem; font-size: 0.75rem; font-weight: 600; cursor: pointer; border: 1px solid; border-radius: 4px; text-decoration: none; background: none; transition: all 0.2s; }
.admin-btn-edit { color: rgba(255,255,255,0.7); border-color: rgba(255,255,255,0.2); }
.admin-btn-edit:hover { color: #fff; border-color: #fff; }
.admin-btn-delete { color: #ff6b6b; border-color: rgba(255,107,107,0.3); }
.admin-btn-delete:hover { background-color: rgba(255,107,107,0.1); }
.admin-empty { text-align: center; color: rgba(255,255,255,0.3); padding: 2rem; }
</style>
@endpush
