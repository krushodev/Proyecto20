@extends('layout.layout')

@section('title', 'Detalle Venta #{{ $venta->id }} - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container" style="max-width:820px">

    <div class="admin-header">
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

@push('styles')
<style>
.admin-page { min-height: 100vh; padding: 2rem; background-color: #0a0a0a; }
.admin-container { margin: 0 auto; }
.admin-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 2rem; padding-bottom: 1.5rem; border-bottom: 1px solid rgba(255,255,255,0.08); }
.admin-title { font-size: 1.75rem; font-weight: 700; color: #fff; letter-spacing: -0.02em; }
.admin-order-id-title { font-family: monospace; color: rgba(255,255,255,.5); font-weight: 400; }
.admin-subtitle { font-size: 0.875rem; color: rgba(255,255,255,0.5); margin-top: 0.25rem; }
.admin-back { display: flex; align-items: center; gap: 0.4rem; font-size: 0.8rem; color: rgba(255,255,255,0.5); text-decoration: none; transition: color 0.2s; white-space: nowrap; }
.admin-back:hover { color: #fff; }
.admin-back i { width: 14px; height: 14px; }
.av-section { margin-bottom: 2rem; }
.av-section-title { display: flex; align-items: center; gap: .5rem; font-size: .8rem; font-weight: 600; letter-spacing: .1em; text-transform: uppercase; color: rgba(255,255,255,.4); margin-bottom: 1rem; }
.av-section-title i { width: 15px; height: 15px; }
.av-meta-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 1rem; }
.av-meta-item { display: flex; flex-direction: column; gap: .3rem; padding: .85rem 1rem; background: rgba(255,255,255,.03); border: 1px solid rgba(255,255,255,.07); border-radius: 6px; }
.av-meta-label { font-size: .65rem; letter-spacing: .1em; text-transform: uppercase; color: rgba(255,255,255,.35); }
.av-meta-value { font-size: .9rem; color: #fff; font-weight: 500; }
.admin-table-wrapper { overflow-x: auto; }
.admin-table { width: 100%; border-collapse: collapse; font-size: 0.875rem; }
.admin-table th { text-align: left; padding: 0.75rem 1rem; font-size: 0.7rem; font-weight: 600; letter-spacing: 0.08em; text-transform: uppercase; color: rgba(255,255,255,0.4); border-bottom: 1px solid rgba(255,255,255,0.08); }
.admin-table td { padding: 0.875rem 1rem; color: rgba(255,255,255,0.8); border-bottom: 1px solid rgba(255,255,255,0.05); vertical-align: middle; }
.admin-table tr:hover td { background-color: rgba(255,255,255,0.02); }
.admin-product-thumb { width: 44px; height: 44px; object-fit: cover; border-radius: 4px; display: block; }
.admin-no-image { color: rgba(255,255,255,.3); }
.admin-badge { display: inline-block; padding: .2rem .6rem; border-radius: 20px; font-size: .7rem; font-weight: 600; letter-spacing: .05em; }
.admin-badge-active { background: rgba(74,222,128,.12); color: #4ade80; border: 1px solid rgba(74,222,128,.25); }
.av-total-row { display: flex; justify-content: flex-end; align-items: center; gap: 1.5rem; padding: 1.25rem 1rem; border-top: 1px solid rgba(255,255,255,.1); margin-top: .5rem; }
.av-total-label { font-size: .75rem; letter-spacing: .08em; text-transform: uppercase; color: rgba(255,255,255,.4); }
.av-total-amount { font-size: 1.3rem; font-weight: 700; color: #fff; }
</style>
@endpush
