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
