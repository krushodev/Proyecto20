{{--
  ============================================================
  VISTA: carrito.blade.php
  PROPÓSITO: Carrito de compras del usuario autenticado
  ============================================================
--}}
@extends('layout.layout')

@section('title', 'Mi Carrito - Vittorio')

@section('content')
<section class="cart-main">

  <header class="cart-header">
    <p class="cart-eyebrow">{{ auth()->user()->nombre }}</p>
    <h1 class="cart-title">Mi Carrito</h1>
    <div class="catalog-header-divider"></div>
  </header>

  {{-- Mensajes de feedback --}}
  @if(session('success'))
    <div class="cart-alert cart-alert-success">{{ session('success') }}</div>
  @endif
  @if($errors->has('stock'))
    <div class="cart-alert cart-alert-error">{{ $errors->first('stock') }}</div>
  @endif
  @if($errors->has('carrito'))
    <div class="cart-alert cart-alert-error">{{ $errors->first('carrito') }}</div>
  @endif

  @if($carrito->detalles->isEmpty())

    {{-- Estado vacío --}}
    <div class="cart-empty">
      <i data-lucide="shopping-cart" class="cart-empty-icon"></i>
      <p class="cart-empty-text">Tu carrito está vacío.</p>
      <a href="{{ route('catalogo') }}" class="btn-primary-vittorio">Explorar Catálogo</a>
    </div>

  @else

    <div class="cart-layout">

      {{-- Lista de ítems --}}
      <div class="cart-items">
        @foreach($carrito->detalles as $detalle)
          <div class="cart-item">
            <div class="cart-item-image">
              <img src="{{ $detalle->producto->imagen_studio }}" alt="{{ $detalle->producto->nombre }}" loading="lazy" />
            </div>

            <div class="cart-item-info">
              <h3 class="cart-item-name">{{ $detalle->producto->nombre }}</h3>
              <p class="cart-item-meta">
                US$ {{ number_format($detalle->precio_unitario, 0, ',', '.') }}
                <span class="cart-item-sep">×</span>
                {{ $detalle->cantidad }}
              </p>
            </div>

            <p class="cart-item-subtotal" data-price-usd="{{ $detalle->subtotal }}">
              US$ {{ number_format($detalle->subtotal, 0, ',', '.') }}
            </p>

            <form action="{{ route('carrito.eliminar', $detalle->id) }}" method="POST" class="cart-item-remove">
              @csrf
              @method('DELETE')
              <button type="submit" class="btn-icon-vittorio" aria-label="Eliminar {{ $detalle->producto->nombre }}">
                <i data-lucide="trash-2"></i>
              </button>
            </form>
          </div>
        @endforeach
      </div>

      {{-- Resumen y confirmación --}}
      <aside class="cart-summary">
        <h2 class="cart-summary-title">Resumen</h2>

        <div class="cart-summary-row">
          <span>{{ $carrito->detalles->count() }} {{ $carrito->detalles->count() === 1 ? 'artículo' : 'artículos' }}</span>
          <span data-price-usd="{{ $carrito->total }}">US$ {{ number_format($carrito->total, 0, ',', '.') }}</span>
        </div>
        <div class="cart-summary-divider"></div>
        <div class="cart-summary-row cart-summary-total">
          <span>Total</span>
          <span data-price-usd="{{ $carrito->total }}">US$ {{ number_format($carrito->total, 0, ',', '.') }}</span>
        </div>

        <form action="{{ route('carrito.confirmar') }}" method="POST" class="cart-confirm-form">
          @csrf
          <button type="submit" class="btn-primary-vittorio">Confirmar Compra</button>
        </form>

        <a href="{{ route('catalogo') }}" class="cart-continue-link">← Seguir comprando</a>
      </aside>

    </div>
  @endif

</section>
@endsection
