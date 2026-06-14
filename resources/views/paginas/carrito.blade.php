{{--
  ============================================================
  VISTA: carrito.blade.php
  PROPÓSITO: Carrito de compras (autenticado o invitado)
  ============================================================
--}}
@extends('layout.layout')

@section('title', 'Mi Carrito - Vittorio')

@section('content')
<section class="cart-main">

  <header class="cart-header">
    @auth
      <p class="cart-eyebrow">{{ auth()->user()->nombre }}</p>
    @endauth
    <h1 class="cart-title">Mi Carrito</h1>
    <div class="catalog-header-divider"></div>
  </header>

  @auth
    {{-- ── Carrito autenticado (DB) ── --}}
    @if($carrito->detalles->isEmpty())
      <div class="cart-empty">
        <i data-lucide="shopping-cart" class="cart-empty-icon"></i>
        <p class="cart-empty-text">Tu carrito está vacío.</p>
        <a href="{{ route('catalogo') }}" class="btn-primary-vittorio">Explorar Catálogo</a>
      </div>
    @else
      <div class="cart-layout">

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
              <p class="cart-item-subtotal">$ {{ number_format($detalle->subtotal, 0, ',', '.') }} ARS</p>
              <form action="{{ route('carrito.eliminar', $detalle->id) }}" method="POST" class="cart-item-remove">
                @csrf @method('DELETE')
                <button type="submit" class="btn-icon-vittorio" aria-label="Eliminar {{ $detalle->producto->nombre }}">
                  <i data-lucide="trash-2"></i>
                </button>
              </form>
            </div>
          @endforeach
        </div>

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

          <a href="{{ route('checkout.envio') }}" class="btn-primary-vittorio" style="display:block;text-align:center;margin-top:1.25rem;">
            Proceder al pago
          </a>

          <form action="{{ route('carrito.vaciar') }}" method="POST" class="cart-clear-form"
                onsubmit="return confirm('¿Vaciar el carrito? Esta acción no se puede deshacer.')">
            @csrf @method('DELETE')
            <button type="submit" class="btn-clear-vittorio">
              <i data-lucide="trash"></i> Vaciar Carrito
            </button>
          </form>

          <a href="{{ route('catalogo') }}" class="cart-continue-link">← Seguir comprando</a>
        </aside>
      </div>
    @endif

  @else
    {{-- ── Carrito guest (session) ── --}}
    @if(empty($guestCart['items']))
      <div class="cart-empty">
        <i data-lucide="shopping-cart" class="cart-empty-icon"></i>
        <p class="cart-empty-text">Tu carrito está vacío.</p>
        <a href="{{ route('catalogo') }}" class="btn-primary-vittorio">Explorar Catálogo</a>
      </div>
    @else
      <div class="cart-layout">

        <div class="cart-items">
          @foreach($guestCart['items'] as $item)
            <div class="cart-item">
              <div class="cart-item-image">
                @if($item['imagen_studio'])
                  <img src="{{ $item['imagen_studio'] }}" alt="{{ $item['nombre'] }}" loading="lazy" />
                @endif
              </div>
              <div class="cart-item-info">
                <h3 class="cart-item-name">{{ $item['nombre'] }}</h3>
                <p class="cart-item-meta">
                  $ {{ number_format($item['precio_unitario'], 0, ',', '.') }} ARS
                  <span class="cart-item-sep">×</span>
                  {{ $item['cantidad'] }}
                </p>
              </div>
              <p class="cart-item-subtotal">$ {{ number_format($item['subtotal'], 0, ',', '.') }} ARS</p>
              <form action="{{ route('carrito.eliminar', $item['producto_id']) }}" method="POST" class="cart-item-remove">
                @csrf @method('DELETE')
                <button type="submit" class="btn-icon-vittorio" aria-label="Eliminar {{ $item['nombre'] }}">
                  <i data-lucide="trash-2"></i>
                </button>
              </form>
            </div>
          @endforeach
        </div>

        <aside class="cart-summary">
          <h2 class="cart-summary-title">Resumen</h2>
          <div class="cart-summary-row">
            <span>{{ count($guestCart['items']) }} {{ count($guestCart['items']) === 1 ? 'artículo' : 'artículos' }}</span>
            <span>$ {{ number_format($guestCart['total'], 0, ',', '.') }} ARS</span>
          </div>
          <div class="cart-summary-divider"></div>
          <div class="cart-summary-row cart-summary-total">
            <span>Total</span>
            <span>$ {{ number_format($guestCart['total'], 0, ',', '.') }} ARS</span>
          </div>

          {{-- Al hacer clic, Laravel guarda la URL con intended() y redirige
               al login; tras autenticarse el usuario vuelve al checkout. --}}
          <a href="{{ route('checkout.envio') }}"
             class="btn-primary-vittorio"
             style="display:block;text-align:center;margin-top:1.25rem;">
            Proceder al pago
          </a>

          <div class="cart-guest-cta">
            <p class="cart-guest-text">
              <i data-lucide="info"></i>
              Tu carrito se guardará al iniciar sesión o crear una cuenta.
            </p>
            <a href="{{ route('registro') }}" class="cart-register-link">¿No tenés cuenta? Registrate gratis →</a>
          </div>

          <form action="{{ route('carrito.vaciar') }}" method="POST" class="cart-clear-form"
                onsubmit="return confirm('¿Vaciar el carrito? Esta acción no se puede deshacer.')">
            @csrf @method('DELETE')
            <button type="submit" class="btn-clear-vittorio">
              <i data-lucide="trash"></i> Vaciar Carrito
            </button>
          </form>

          <a href="{{ route('catalogo') }}" class="cart-continue-link">← Seguir comprando</a>
        </aside>
      </div>
    @endif
  @endauth

</section>
@endsection

@push('styles')
<style>
.cart-guest-cta {
  display: flex;
  flex-direction: column;
  gap: .75rem;
  padding: 1rem;
  border: 1px solid rgba(255,255,255,.1);
  border-radius: 8px;
  margin-top: 1.25rem;
}
.cart-guest-text {
  display: flex;
  align-items: flex-start;
  gap: .5rem;
  font-size: .8rem;
  color: rgba(255,255,255,.5);
  line-height: 1.5;
}
.cart-guest-text i { width: 14px; height: 14px; flex-shrink: 0; margin-top: .1rem; }
.cart-register-link {
  font-size: .78rem;
  color: rgba(255,255,255,.4);
  text-align: center;
  text-decoration: none;
  transition: color .2s;
}
.cart-register-link:hover { color: #fff; }
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
