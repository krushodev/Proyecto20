{{--
  ============================================================
  VISTA: mis-compras.blade.php
  PROPÓSITO: Historial de compras del cliente autenticado
  ============================================================
--}}
@extends('layout.layout')

@section('title', 'Mis Compras - Vittorio')

@section('content')
<section class="mc-main">

  <header class="cart-header">
    <p class="cart-eyebrow">{{ auth()->user()->nombre }}</p>
    <h1 class="cart-title">Mis Compras</h1>
    <div class="catalog-header-divider"></div>
  </header>

  @if($compras->isEmpty())

    <div class="cart-empty">
      <i data-lucide="package-open" class="cart-empty-icon"></i>
      <p class="cart-empty-text">Todavía no realizaste ninguna compra.</p>
      <a href="{{ route('catalogo') }}" class="btn-primary-vittorio">Explorar Catálogo</a>
    </div>

  @else

    <div class="mc-list">
      @foreach($compras as $compra)
        <div class="mc-card">

          <div class="mc-card-header">
            <div class="mc-card-meta">
              <span class="mc-order-id">Pedido #{{ $compra->id }}</span>
              <span class="mc-date">
                <i data-lucide="calendar"></i>
                {{ $compra->fecha_venta->format('d/m/Y \a \l\a\s H:i') }}
              </span>
            </div>
            <div class="mc-card-total">
              <span class="mc-total-label">Total</span>
              <span class="mc-total-amount">$ {{ number_format($compra->total, 0, ',', '.') }} ARS</span>
            </div>
          </div>

          <div class="mc-items">
            @foreach($compra->detalles as $detalle)
              <div class="mc-item">
                <div class="mc-item-image">
                  <img src="{{ $detalle->producto->imagen_studio }}"
                       alt="{{ $detalle->producto->nombre }}"
                       loading="lazy" />
                </div>
                <div class="mc-item-info">
                  <p class="mc-item-name">{{ $detalle->producto->nombre }}</p>
                  <p class="mc-item-meta">
                    {{ $detalle->cantidad }} {{ $detalle->cantidad === 1 ? 'unidad' : 'unidades' }}
                    &nbsp;·&nbsp;
                    $ {{ number_format($detalle->precio_unitario, 0, ',', '.') }} ARS c/u
                  </p>
                </div>
                <p class="mc-item-subtotal">
                  $ {{ number_format($detalle->subtotal, 0, ',', '.') }} ARS
                </p>
              </div>
            @endforeach
          </div>

        </div>
      @endforeach
    </div>

    <div class="mc-actions">
      <a href="{{ route('catalogo') }}" class="btn-primary-vittorio">Seguir Comprando</a>
    </div>

  @endif

</section>
@endsection

@push('styles')
<style>
.mc-main {
  min-height: 80vh;
  padding: 7rem 1.5rem 4rem;
}
.mc-list {
  max-width: 820px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}
.mc-card {
  border: 1px solid rgba(255,255,255,.1);
  border-radius: 10px;
  overflow: hidden;
}
.mc-card-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1rem;
  padding: 1rem 1.25rem;
  background: rgba(255,255,255,.04);
  border-bottom: 1px solid rgba(255,255,255,.08);
  flex-wrap: wrap;
}
.mc-card-meta {
  display: flex;
  flex-direction: column;
  gap: .25rem;
}
.mc-order-id {
  font-size: .75rem;
  font-weight: 700;
  letter-spacing: .1em;
  text-transform: uppercase;
  color: rgba(255,255,255,.85);
}
.mc-date {
  display: flex;
  align-items: center;
  gap: .35rem;
  font-size: .75rem;
  color: rgba(255,255,255,.4);
}
.mc-date i { width: 13px; height: 13px; }
.mc-card-total {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  gap: .1rem;
}
.mc-total-label {
  font-size: .65rem;
  letter-spacing: .1em;
  text-transform: uppercase;
  color: rgba(255,255,255,.35);
}
.mc-total-amount {
  font-size: 1rem;
  font-weight: 700;
  color: #fff;
}
.mc-items {
  display: flex;
  flex-direction: column;
  gap: 0;
}
.mc-item {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: .9rem 1.25rem;
  border-bottom: 1px solid rgba(255,255,255,.06);
}
.mc-item:last-child { border-bottom: none; }
.mc-item-image {
  width: 52px;
  height: 52px;
  border-radius: 6px;
  overflow: hidden;
  flex-shrink: 0;
  background: rgba(255,255,255,.05);
}
.mc-item-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.mc-item-info { flex: 1; min-width: 0; }
.mc-item-name {
  font-size: .875rem;
  font-weight: 600;
  margin: 0 0 .2rem;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.mc-item-meta {
  font-size: .75rem;
  color: rgba(255,255,255,.4);
  margin: 0;
}
.mc-item-subtotal {
  font-size: .875rem;
  font-weight: 600;
  white-space: nowrap;
  margin: 0;
}
.mc-actions {
  max-width: 820px;
  margin: 2rem auto 0;
  display: flex;
  justify-content: center;
}
@media (max-width: 500px) {
  .mc-card-header { flex-direction: column; align-items: flex-start; }
  .mc-card-total { align-items: flex-start; }
}
</style>
@endpush
