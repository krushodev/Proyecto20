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
                $ {{ number_format($detalle->precio_unitario, 0, ',', '.') }} ARS
                <span class="cart-item-sep">×</span>
                {{ $detalle->cantidad }}
              </p>
            </div>

            <p class="cart-item-subtotal">
              $ {{ number_format($detalle->subtotal, 0, ',', '.') }} ARS
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
          <span>$ {{ number_format($carrito->total, 0, ',', '.') }} ARS</span>
        </div>
        <div class="cart-summary-divider"></div>
        <div class="cart-summary-row cart-summary-total">
          <span>Total</span>
          <span>$ {{ number_format($carrito->total, 0, ',', '.') }} ARS</span>
        </div>

        {{-- Método de pago --}}
        <div class="cart-payment-section">
          <h3 class="cart-payment-title">Método de pago</h3>

          <label class="cart-payment-option">
            <input type="radio" name="payment_method" value="transferencia" checked />
            <span class="cart-payment-option-body">
              <i data-lucide="landmark"></i>
              <span>
                <strong>Transferencia bancaria</strong>
                <small>CBU / CVU · Acreditación inmediata</small>
              </span>
            </span>
          </label>

          <label class="cart-payment-option">
            <input type="radio" name="payment_method" value="mercadopago" />
            <span class="cart-payment-option-body">
              <img src="https://cdn.simpleicons.org/mercadopago/ffffff" alt="Mercado Pago" class="cart-payment-logo" />
              <span>
                <strong>Mercado Pago</strong>
                <small>Débito, crédito o dinero en cuenta</small>
              </span>
            </span>
          </label>
        </div>

        <form action="{{ route('carrito.confirmar') }}" method="POST" class="cart-confirm-form">
          @csrf
          <button type="submit" class="btn-primary-vittorio">Confirmar Compra</button>
        </form>

        <form action="{{ route('carrito.vaciar') }}" method="POST" class="cart-clear-form"
              onsubmit="return confirm('¿Vaciar el carrito? Esta acción no se puede deshacer.')">
          @csrf
          @method('DELETE')
          <button type="submit" class="btn-clear-vittorio">
            <i data-lucide="trash"></i> Vaciar Carrito
          </button>
        </form>

        <a href="{{ route('catalogo') }}" class="cart-continue-link">← Seguir comprando</a>
      </aside>

    </div>
  @endif

</section>
@endsection

@push('styles')
<style>
.cart-payment-section {
  margin: 1.25rem 0;
  display: flex;
  flex-direction: column;
  gap: .75rem;
}
.cart-payment-title {
  font-size: .7rem;
  letter-spacing: .12em;
  text-transform: uppercase;
  color: rgba(255,255,255,.4);
  margin-bottom: .25rem;
}
.cart-payment-option {
  display: block;
  cursor: pointer;
}
.cart-payment-option input[type="radio"] { display: none; }
.cart-payment-option-body {
  display: flex;
  align-items: center;
  gap: .85rem;
  padding: .85rem 1rem;
  border: 1px solid rgba(255,255,255,.1);
  border-radius: 6px;
  transition: border-color .2s, background .2s;
}
.cart-payment-option input:checked + .cart-payment-option-body {
  border-color: rgba(255,255,255,.5);
  background: rgba(255,255,255,.05);
}
.cart-payment-option-body i,
.cart-payment-logo {
  width: 22px;
  height: 22px;
  flex-shrink: 0;
  opacity: .85;
}
.cart-payment-option-body span {
  display: flex;
  flex-direction: column;
  gap: .15rem;
}
.cart-payment-option-body strong {
  font-size: .85rem;
  font-weight: 600;
}
.cart-payment-option-body small {
  font-size: .72rem;
  color: rgba(255,255,255,.45);
}
.cart-clear-form { margin-top: .5rem; }
.btn-clear-vittorio {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: .4rem;
  width: 100%;
  padding: .65rem 1rem;
  background: transparent;
  border: 1px solid rgba(255,107,107,.35);
  border-radius: 6px;
  color: rgba(255,107,107,.85);
  font-size: .8rem;
  letter-spacing: .06em;
  cursor: pointer;
  transition: border-color .2s, background .2s, color .2s;
}
.btn-clear-vittorio i { width: 14px; height: 14px; }
.btn-clear-vittorio:hover {
  border-color: #ff6b6b;
  background: rgba(255,107,107,.08);
  color: #ff6b6b;
}
</style>
@endpush
