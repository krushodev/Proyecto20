@extends('layout.layout-admin')

@section('title', 'Ventas - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container admin-container--lg">

    <div class="admin-header admin-header--with-action">
      <div>
        <h1 class="admin-title">Ventas</h1>
        <p class="admin-subtitle">{{ $ventas->total() }} {{ $ventas->total() === 1 ? 'venta confirmada' : 'ventas confirmadas' }}</p>
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
      <button type="submit" class="admin-btn-new">Filtrar</button>
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

    <div class="admin-pagination">
      {{ $ventas->appends(request()->query())->links('vendor.pagination.admin') }}
    </div>

  </div>
</div>
@endsection
