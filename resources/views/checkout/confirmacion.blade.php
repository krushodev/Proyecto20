@extends('layout.layout')

@section('title', 'Compra confirmada - Vittorio')

@section('content')
<section class="checkout-main">

  <div class="checkout-steps">
    <span class="checkout-step">1. Envío</span>
    <span class="checkout-step-sep">→</span>
    <span class="checkout-step">2. Pago</span>
    <span class="checkout-step-sep">→</span>
    <span class="checkout-step checkout-step-active">3. Confirmación</span>
  </div>

  <div class="confirmacion-hero">
    <i data-lucide="circle-check" class="confirmacion-icon"></i>
    <h1 class="confirmacion-title">¡Compra confirmada!</h1>
    <p class="confirmacion-subtitle">
      Tu pedido <strong>#{{ $venta->id }}</strong> fue registrado exitosamente.
      Recibirás un email con los detalles.
    </p>
  </div>

  <div class="confirmacion-grid">

    {{-- Detalle de productos --}}
    <div class="checkout-card">
      <h2 class="confirmacion-section-title">Productos</h2>
      @foreach($venta->detalles as $detalle)
        <div class="confirmacion-item">
          <div class="confirmacion-item-img">
            @if($detalle->producto->imagen_studio)
              <img src="{{ $detalle->producto->imagen_studio }}" alt="{{ $detalle->producto->nombre }}" />
            @endif
          </div>
          <div class="confirmacion-item-info">
            <span class="confirmacion-item-nombre">{{ $detalle->producto->nombre }}</span>
            <span class="confirmacion-item-meta">× {{ $detalle->cantidad }} · $ {{ number_format($detalle->subtotal, 0, ',', '.') }} ARS</span>
          </div>
        </div>
      @endforeach
      <div class="confirmacion-total">
        <span>Total pagado</span>
        <span>$ {{ number_format($venta->total, 0, ',', '.') }} ARS</span>
      </div>
    </div>

    {{-- Datos de envío y pago --}}
    <div class="checkout-card">
      <h2 class="confirmacion-section-title">Envío</h2>
      <dl class="confirmacion-dl">
        <div><dt>Destinatario</dt><dd>{{ $venta->nombre_destinatario }}</dd></div>
        <div><dt>Dirección</dt><dd>{{ $venta->calle }} {{ $venta->numero }}</dd></div>
        <div><dt>Ciudad</dt><dd>{{ $venta->ciudad }}, {{ $venta->provincia }}</dd></div>
        <div><dt>Código postal</dt><dd>{{ $venta->codigo_postal }}</dd></div>
      </dl>

      <h2 class="confirmacion-section-title" style="margin-top:1.5rem">Pago</h2>
      <dl class="confirmacion-dl">
        <div>
          <dt>Método</dt>
          <dd>{{ $venta->metodo_pago === 'transferencia' ? 'Transferencia bancaria' : 'Mercado Pago' }}</dd>
        </div>
      </dl>
    </div>

  </div>

  <div class="confirmacion-actions">
    <a href="{{ route('mis-compras') }}" class="btn-primary-vittorio">Ver mis compras</a>
    <a href="{{ route('catalogo') }}" class="checkout-back-link">Seguir comprando →</a>
  </div>

</section>
@endsection

@push('styles')
<style>
.checkout-main { max-width: 760px; margin: 0 auto; padding: 2rem 1.5rem 4rem; }
.checkout-steps { display: flex; align-items: center; gap: .6rem; margin-bottom: 2rem; font-size: .72rem; letter-spacing: .08em; text-transform: uppercase; }
.checkout-step { color: rgba(255,255,255,.3); }
.checkout-step-active { color: #fff; font-weight: 600; }
.checkout-step-sep { color: rgba(255,255,255,.2); }
.checkout-card { padding: 1.5rem; border: 1px solid rgba(255,255,255,.08); border-radius: 10px; background: rgba(255,255,255,.02); }

.confirmacion-hero { text-align: center; margin-bottom: 2.5rem; }
.confirmacion-icon { width: 52px; height: 52px; color: #4ade80; margin: 0 auto 1rem; display: block; }
.confirmacion-title { font-size: 2rem; font-weight: 700; color: #fff; margin-bottom: .5rem; }
.confirmacion-subtitle { font-size: .9rem; color: rgba(255,255,255,.5); line-height: 1.6; }

.confirmacion-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 1.25rem; margin-bottom: 2rem; }
@media (max-width: 640px) { .confirmacion-grid { grid-template-columns: 1fr; } }

.confirmacion-section-title { font-size: .68rem; font-weight: 600; letter-spacing: .1em; text-transform: uppercase; color: rgba(255,255,255,.35); margin-bottom: 1rem; }

.confirmacion-item { display: flex; align-items: center; gap: .85rem; padding: .6rem 0; border-bottom: 1px solid rgba(255,255,255,.05); }
.confirmacion-item:last-of-type { border-bottom: none; }
.confirmacion-item-img { width: 44px; height: 44px; border-radius: 4px; overflow: hidden; flex-shrink: 0; background: rgba(255,255,255,.05); }
.confirmacion-item-img img { width: 100%; height: 100%; object-fit: cover; display: block; }
.confirmacion-item-info { display: flex; flex-direction: column; gap: .2rem; }
.confirmacion-item-nombre { font-size: .85rem; font-weight: 600; color: rgba(255,255,255,.85); }
.confirmacion-item-meta { font-size: .75rem; color: rgba(255,255,255,.4); }
.confirmacion-total { display: flex; justify-content: space-between; font-size: .9rem; font-weight: 700; color: #fff; padding-top: .75rem; border-top: 1px solid rgba(255,255,255,.1); margin-top: .75rem; }

.confirmacion-dl { display: flex; flex-direction: column; gap: .55rem; }
.confirmacion-dl > div { display: flex; justify-content: space-between; gap: 1rem; }
.confirmacion-dl dt { font-size: .78rem; color: rgba(255,255,255,.4); }
.confirmacion-dl dd { font-size: .82rem; color: rgba(255,255,255,.8); font-weight: 500; text-align: right; margin: 0; }

.confirmacion-actions { display: flex; align-items: center; justify-content: center; gap: 2rem; flex-wrap: wrap; }
.checkout-back-link { font-size: .82rem; color: rgba(255,255,255,.4); text-decoration: none; transition: color .2s; }
.checkout-back-link:hover { color: #fff; }
</style>
@endpush
