@extends('layout.layout')

@section('title', 'Método de pago - Vittorio')

@section('content')
<section class="checkout-main">

  <div class="checkout-steps">
    <span class="checkout-step">1. Envío</span>
    <span class="checkout-step-sep">→</span>
    <span class="checkout-step checkout-step-active">2. Pago</span>
    <span class="checkout-step-sep">→</span>
    <span class="checkout-step">3. Confirmación</span>
  </div>

  <div class="checkout-card">
    <h1 class="checkout-title">Método de pago</h1>
    <p class="checkout-subtitle">Elegí cómo querés abonar tu pedido.</p>

    @if($errors->has('pago'))
      <div class="cart-alert cart-alert-error" style="margin-bottom:1rem">{{ $errors->first('pago') }}</div>
    @endif

    {{-- Resumen del pedido --}}
    <div class="pago-resumen">
      <h2 class="pago-resumen-title">Resumen del pedido</h2>
      @foreach($carrito->detalles as $detalle)
        <div class="pago-resumen-item">
          <span>{{ $detalle->producto->nombre }} × {{ $detalle->cantidad }}</span>
          <span>$ {{ number_format($detalle->subtotal, 0, ',', '.') }} ARS</span>
        </div>
      @endforeach
      <div class="pago-resumen-total">
        <span>Total</span>
        <span>$ {{ number_format($carrito->total, 0, ',', '.') }} ARS</span>
      </div>
    </div>

    <form action="{{ route('checkout.pago.procesar') }}" method="POST" class="checkout-form">
      @csrf

      <div class="cart-payment-section">
        <h3 class="cart-payment-title">Seleccioná un método</h3>

        <label class="cart-payment-option">
          <input type="radio" name="metodo_pago" value="transferencia" checked />
          <span class="cart-payment-option-body">
            <i data-lucide="landmark"></i>
            <span>
              <strong>Transferencia bancaria</strong>
              <small>CBU / CVU · Acreditación inmediata</small>
            </span>
          </span>
        </label>

        <label class="cart-payment-option">
          <input type="radio" name="metodo_pago" value="mercadopago" />
          <span class="cart-payment-option-body">
            <img src="https://cdn.simpleicons.org/mercadopago/ffffff" alt="Mercado Pago" class="cart-payment-logo" />
            <span>
              <strong>Mercado Pago</strong>
              <small>Débito, crédito o dinero en cuenta</small>
            </span>
          </span>
        </label>
      </div>

      @error('metodo_pago')<span class="form-error">{{ $message }}</span>@enderror

      <div class="checkout-actions">
        <a href="{{ route('checkout.envio') }}" class="checkout-back-link">← Volver al envío</a>
        <button type="submit" class="btn-primary-vittorio">Confirmar compra →</button>
      </div>
    </form>
  </div>

</section>
@endsection

@push('styles')
<style>
.checkout-main { max-width: 600px; margin: 0 auto; padding: 2rem 1.5rem 4rem; }
.checkout-steps { display: flex; align-items: center; gap: .6rem; margin-bottom: 2rem; font-size: .72rem; letter-spacing: .08em; text-transform: uppercase; }
.checkout-step { color: rgba(255,255,255,.3); }
.checkout-step-active { color: #fff; font-weight: 600; }
.checkout-step-sep { color: rgba(255,255,255,.2); }
.checkout-card { padding: 2rem; border: 1px solid rgba(255,255,255,.08); border-radius: 10px; background: rgba(255,255,255,.02); }
.checkout-title { font-size: 1.5rem; font-weight: 700; color: #fff; margin-bottom: .35rem; }
.checkout-subtitle { font-size: .85rem; color: rgba(255,255,255,.45); margin-bottom: 1.75rem; }
.checkout-form { display: flex; flex-direction: column; gap: 1.25rem; }
.checkout-actions { display: flex; justify-content: space-between; align-items: center; }
.checkout-back-link { font-size: .82rem; color: rgba(255,255,255,.4); text-decoration: none; transition: color .2s; }
.checkout-back-link:hover { color: #fff; }
.pago-resumen { padding: 1rem; border: 1px solid rgba(255,255,255,.07); border-radius: 6px; margin-bottom: 1.25rem; display: flex; flex-direction: column; gap: .5rem; }
.pago-resumen-title { font-size: .68rem; font-weight: 600; letter-spacing: .1em; text-transform: uppercase; color: rgba(255,255,255,.3); margin-bottom: .4rem; }
.pago-resumen-item { display: flex; justify-content: space-between; font-size: .82rem; color: rgba(255,255,255,.6); }
.pago-resumen-total { display: flex; justify-content: space-between; font-size: .9rem; font-weight: 700; color: #fff; padding-top: .5rem; border-top: 1px solid rgba(255,255,255,.08); margin-top: .25rem; }
.cart-payment-section { display: flex; flex-direction: column; gap: .75rem; }
.cart-payment-title { font-size: .7rem; letter-spacing: .12em; text-transform: uppercase; color: rgba(255,255,255,.4); margin-bottom: .25rem; }
.cart-payment-option { display: block; cursor: pointer; }
.cart-payment-option input[type="radio"] { display: none; }
.cart-payment-option-body { display: flex; align-items: center; gap: .85rem; padding: .85rem 1rem; border: 1px solid rgba(255,255,255,.1); border-radius: 6px; transition: border-color .2s, background .2s; }
.cart-payment-option input:checked + .cart-payment-option-body { border-color: rgba(255,255,255,.5); background: rgba(255,255,255,.05); }
.cart-payment-option-body i, .cart-payment-logo { width: 22px; height: 22px; flex-shrink: 0; opacity: .85; }
.cart-payment-option-body span { display: flex; flex-direction: column; gap: .15rem; }
.cart-payment-option-body strong { font-size: .85rem; font-weight: 600; }
.cart-payment-option-body small { font-size: .72rem; color: rgba(255,255,255,.45); }
</style>
@endpush
