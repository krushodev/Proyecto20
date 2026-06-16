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
      <a href="{{ route('compras.factura', $venta->id) }}" class="btn-vt btn-vt-outline">
        <i data-lucide="download" class="dc-icon-sm"></i>
        Descargar Factura
      </a>
      <a href="{{ route('catalogo') }}" class="btn-vt btn-vt-primary">Seguir Comprando</a>
    </div>

  @else

    <div class="dc-empty">
      <i data-lucide="package-open" class="dc-empty-icon"></i>
      <p class="dc-empty-text">No hay ningún pedido reciente.</p>
      <a href="{{ route('carrito') }}" class="btn-vt-link">Ver mi carrito</a>
    </div>

  @endif

</section>
@endsection
