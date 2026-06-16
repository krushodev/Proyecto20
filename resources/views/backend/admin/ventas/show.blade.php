@extends('layout.layout')

@section('title', 'Detalle Venta #{{ $venta->id }} - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container admin-container--ventas-show">

    <div class="admin-header admin-header--with-action">
      <div>
        <h1 class="admin-title">Pedido <span class="admin-order-id-title">#{{ $venta->id }}</span></h1>
        <p class="admin-subtitle">
          {{ $venta->fecha_venta?->format('d/m/Y \a \l\a\s H:i') ?? '—' }}
        </p>
      </div>
      <a href="{{ route('ventas.index') }}" class="admin-back">
        <i data-lucide="arrow-left"></i> Volver a Ventas
      </a>
    </div>

    {{-- Datos del cliente --}}
    <div class="av-section">
      <h2 class="av-section-title">
        <i data-lucide="user"></i> Cliente
      </h2>
      <div class="av-meta-grid">
        <div class="av-meta-item">
          <span class="av-meta-label">Nombre</span>
          <span class="av-meta-value">{{ $venta->usuario?->nombre ?? '—' }}</span>
        </div>
        <div class="av-meta-item">
          <span class="av-meta-label">Email</span>
          <span class="av-meta-value">{{ $venta->usuario?->email ?? '—' }}</span>
        </div>
        <div class="av-meta-item">
          <span class="av-meta-label">Estado</span>
          <span class="admin-badge admin-badge-active">{{ ucfirst($venta->estado) }}</span>
        </div>
      </div>
    </div>

    {{-- Ítems del pedido --}}
    <div class="av-section">
      <h2 class="av-section-title">
        <i data-lucide="package"></i> Productos
      </h2>

      <div class="admin-table-wrapper">
        <table class="admin-table">
          <thead>
            <tr>
              <th>Imagen</th>
              <th>Producto</th>
              <th>Precio unitario</th>
              <th>Cantidad</th>
              <th>Subtotal</th>
            </tr>
          </thead>
          <tbody>
            @foreach($venta->detalles as $detalle)
            <tr>
              <td>
                @if($detalle->producto?->imagen_studio)
                  <img src="{{ $detalle->producto->imagen_studio }}"
                       alt="{{ $detalle->producto->nombre }}"
                       class="admin-product-thumb" />
                @else
                  <span class="admin-no-image">—</span>
                @endif
              </td>
              <td><strong>{{ $detalle->producto?->nombre ?? '(producto eliminado)' }}</strong></td>
              <td>$ {{ number_format($detalle->precio_unitario, 0, ',', '.') }} ARS</td>
              <td>{{ $detalle->cantidad }}</td>
              <td><strong>$ {{ number_format($detalle->subtotal, 0, ',', '.') }} ARS</strong></td>
            </tr>
            @endforeach
          </tbody>
        </table>
      </div>
    </div>

    {{-- Total --}}
    <div class="av-total-row">
      <span class="av-total-label">Total del Pedido</span>
      <span class="av-total-amount">$ {{ number_format($venta->total, 0, ',', '.') }} ARS</span>
    </div>

  </div>
</div>
@endsection
