@extends('layout.layout')

@section('title', 'Ventas - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container">

    <div class="admin-header">
      <div>
        <h1 class="admin-title">Ventas</h1>
        <p class="admin-subtitle">{{ $ventas->count() }} {{ $ventas->count() === 1 ? 'venta confirmada' : 'ventas confirmadas' }}</p>
      </div>
      <a href="{{ route('admin.panel') }}" class="admin-back">
        <i data-lucide="arrow-left"></i> Volver al panel
      </a>
    </div>

    <form method="GET" action="{{ route('ventas.index') }}" class="admin-filters">
      <label>
        Desde
        <input type="date" name="desde" value="{{ $filtros['desde'] ?? '' }}">
      </label>
      <label>
        Hasta
        <input type="date" name="hasta" value="{{ $filtros['hasta'] ?? '' }}">
      </label>
      <label>
        Estado
        <select name="estado">
          <option value="">Todos</option>
          <option value="confirmado" @selected(($filtros['estado'] ?? '') === 'confirmado')>Confirmado</option>
          <option value="carrito" @selected(($filtros['estado'] ?? '') === 'carrito')>Carrito</option>
        </select>
      </label>
      <button type="submit" class="admin-btn-edit">Filtrar</button>
      <a href="{{ route('ventas.index') }}" class="admin-back">Limpiar</a>
    </form>

    <div class="admin-table-wrapper">
      <table class="admin-table">
        <thead>
          <tr>
            <th>Pedido</th>
            <th>Cliente</th>
            <th>Fecha</th>
            <th>Ítems</th>
            <th>Total</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          @forelse($ventas as $venta)
          <tr>
            <td><span class="admin-order-id">#{{ $venta->id }}</span></td>
            <td>
              <strong>{{ $venta->usuario?->nombre ?? '—' }}</strong>
              <br><small class="admin-slug">{{ $venta->usuario?->email ?? '' }}</small>
            </td>
            <td>{{ $venta->fecha_venta?->format('d/m/Y H:i') ?? '—' }}</td>
            <td>{{ $venta->detalles_count ?? '—' }}</td>
            <td><strong>$ {{ number_format($venta->total, 0, ',', '.') }} ARS</strong></td>
            <td>
              <a href="{{ route('ventas.show', $venta) }}" class="admin-btn-edit">Ver detalle</a>
            </td>
          </tr>
          @empty
          <tr><td colspan="6" class="admin-empty">No hay ventas registradas.</td></tr>
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
.admin-table-wrapper { overflow-x: auto; }
.admin-table { width: 100%; border-collapse: collapse; font-size: 0.875rem; }
.admin-table th { text-align: left; padding: 0.75rem 1rem; font-size: 0.7rem; font-weight: 600; letter-spacing: 0.08em; text-transform: uppercase; color: rgba(255,255,255,0.4); border-bottom: 1px solid rgba(255,255,255,0.08); }
.admin-table td { padding: 0.875rem 1rem; color: rgba(255,255,255,0.8); border-bottom: 1px solid rgba(255,255,255,0.05); vertical-align: middle; }
.admin-table tr:hover td { background-color: rgba(255,255,255,0.02); }
.admin-order-id { font-family: monospace; font-size: .8rem; color: rgba(255,255,255,.5); }
.admin-slug { font-size: .72rem; color: rgba(255,255,255,.35); font-family: monospace; }
.admin-btn-edit { padding: 0.35rem 0.75rem; font-size: 0.75rem; font-weight: 600; cursor: pointer; border: 1px solid rgba(255,255,255,0.2); border-radius: 4px; text-decoration: none; background: none; color: rgba(255,255,255,0.7); transition: all 0.2s; white-space: nowrap; }
.admin-btn-edit:hover { color: #fff; border-color: #fff; }
.admin-empty { text-align: center; color: rgba(255,255,255,0.3); padding: 2rem; }
</style>
@endpush
