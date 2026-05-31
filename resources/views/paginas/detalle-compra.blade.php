{{--
  ============================================================
  VISTA: detalle-compra.blade.php
  PROPÓSITO: Confirmación de compra exitosa
  ============================================================
--}}
@extends ('layout.layout')

@section ('title', 'Compra Confirmada - Vittorio')

@section ('content')
<section class="dc-main">

  @if($venta)

    <header class="dc-header">
      <div class="dc-check-icon">
        <i data-lucide="check-circle"></i>
      </div>
      <h1 class="dc-title">Compra Confirmada</h1>
      <p class="dc-meta">
        Pedido #{{ $venta->id }}
        &nbsp;·&nbsp;
        {{ $venta->fecha_venta->format('d/m/Y \a \l\a\s H:i') }}
      </p>
    </header>

    <div class="dc-card">
      <h2 class="dc-card-title">Detalle del Pedido</h2>

      <div class="dc-items">
        @foreach($venta->detalles as $detalle)
          <div class="dc-item">
            <div class="dc-item-image">
              <img src="{{ $detalle->producto->imagen_studio }}" alt="{{ $detalle->producto->nombre }}" loading="lazy" />
            </div>
            <div class="dc-item-info">
              <p class="dc-item-name">{{ $detalle->producto->nombre }}</p>
              <p class="dc-item-qty">Cantidad: {{ $detalle->cantidad }}</p>
            </div>
            <p class="dc-item-subtotal">
              $ {{ number_format($detalle->subtotal, 0, ',', '.') }} ARS
            </p>
          </div>
        @endforeach
      </div>

      <div class="dc-total-row">
        <span class="dc-total-label">Total Pagado</span>
        <span class="dc-total-amount">$ {{ number_format($venta->total, 0, ',', '.') }} ARS</span>
      </div>
    </div>

    {{-- Instrucciones de pago locales --}}
    <div class="dc-payment-info">
      <h2 class="dc-payment-title">
        <i data-lucide="credit-card"></i>
        Completá tu pago
      </h2>
      <p class="dc-payment-subtitle">Elegí uno de los siguientes medios para finalizar tu compra.</p>

      <div class="dc-payment-methods">

        <div class="dc-payment-method">
          <div class="dc-payment-method-header">
            <i data-lucide="landmark"></i>
            <h3>Transferencia bancaria</h3>
          </div>
          <ul class="dc-payment-details">
            <li><span>Banco</span><strong>Banco Provincia de Buenos Aires</strong></li>
            <li><span>Titular</span><strong>Vittorio Relojería S.R.L.</strong></li>
            <li><span>CBU</span><strong>0140318201386183660100</strong></li>
            <li><span>Alias</span><strong>VITTORIO.RELOJES.ARS</strong></li>
            <li><span>Importe</span><strong>$ {{ number_format($venta->total, 0, ',', '.') }} ARS</strong></li>
          </ul>
          <p class="dc-payment-note">
            <i data-lucide="info"></i>
            Una vez realizada la transferencia, enviá el comprobante a <strong>pagos@vittorio.com.ar</strong> con tu número de pedido (#{{ $venta->id }}).
          </p>
        </div>

        <div class="dc-payment-method">
          <div class="dc-payment-method-header">
            <img src="https://cdn.simpleicons.org/mercadopago/ffffff" alt="Mercado Pago" class="dc-mp-logo" />
            <h3>Mercado Pago</h3>
          </div>
          <p class="dc-payment-method-desc">Pagá con débito, crédito o dinero en tu cuenta de Mercado Pago. Hasta 12 cuotas sin interés con tarjetas seleccionadas.</p>
          <a href="#" class="dc-payment-cta">
            <i data-lucide="external-link"></i>
            Ir a pagar con Mercado Pago
          </a>
          <p class="dc-payment-note">
            <i data-lucide="info"></i>
            Al hacer clic serás redirigido al portal de pago seguro de Mercado Pago. Ingresá el código de pedido <strong>#{{ $venta->id }}</strong> como referencia.
          </p>
        </div>

      </div>
    </div>

    <div class="dc-actions">
      <a href="{{ route('catalogo') }}" class="btn-primary-vittorio">Seguir Comprando</a>
    </div>

  @else

    <div class="dc-empty">
      <i data-lucide="package-open" class="dc-empty-icon"></i>
      <p class="dc-empty-text">No hay ningún pedido reciente.</p>
      <a href="{{ route('carrito') }}" class="btn-link-vittorio">Ver mi carrito</a>
    </div>

  @endif

</section>
@endsection

@push('styles')
<style>
.dc-payment-info {
  max-width: 760px;
  margin: 2.5rem auto 0;
  padding: 0 1rem;
}
.dc-payment-title {
  display: flex;
  align-items: center;
  gap: .6rem;
  font-size: 1.1rem;
  font-weight: 600;
  margin-bottom: .4rem;
}
.dc-payment-title i { width: 20px; height: 20px; opacity: .7; }
.dc-payment-subtitle {
  font-size: .85rem;
  color: rgba(255,255,255,.45);
  margin-bottom: 1.5rem;
}
.dc-payment-methods {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1.25rem;
}
@media (max-width: 600px) {
  .dc-payment-methods { grid-template-columns: 1fr; }
}
.dc-payment-method {
  border: 1px solid rgba(255,255,255,.1);
  border-radius: 8px;
  padding: 1.5rem;
  display: flex;
  flex-direction: column;
  gap: .85rem;
}
.dc-payment-method-header {
  display: flex;
  align-items: center;
  gap: .65rem;
}
.dc-payment-method-header i { width: 22px; height: 22px; opacity: .75; }
.dc-mp-logo { width: 24px; height: 24px; }
.dc-payment-method-header h3 {
  font-size: .95rem;
  font-weight: 600;
  margin: 0;
}
.dc-payment-details {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: .5rem;
}
.dc-payment-details li {
  display: flex;
  justify-content: space-between;
  font-size: .82rem;
  gap: .5rem;
}
.dc-payment-details li span { color: rgba(255,255,255,.45); }
.dc-payment-details li strong { font-weight: 600; text-align: right; }
.dc-payment-method-desc {
  font-size: .82rem;
  color: rgba(255,255,255,.55);
  line-height: 1.55;
}
.dc-payment-cta {
  display: inline-flex;
  align-items: center;
  gap: .45rem;
  font-size: .82rem;
  font-weight: 600;
  color: #fff;
  border: 1px solid rgba(255,255,255,.3);
  border-radius: 5px;
  padding: .55rem .9rem;
  text-decoration: none;
  transition: background .2s, border-color .2s;
  align-self: flex-start;
}
.dc-payment-cta:hover {
  background: rgba(255,255,255,.08);
  border-color: rgba(255,255,255,.5);
  color: #fff;
}
.dc-payment-cta i { width: 14px; height: 14px; }
.dc-payment-note {
  display: flex;
  align-items: flex-start;
  gap: .45rem;
  font-size: .75rem;
  color: rgba(255,255,255,.35);
  line-height: 1.5;
  margin-top: auto;
}
.dc-payment-note i { width: 13px; height: 13px; flex-shrink: 0; margin-top: .15rem; }
</style>
@endpush
