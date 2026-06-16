{{--
  ============================================================
  CHECKOUT — Paso 3: Confirmación de compra
  ============================================================
--}}
@extends('layout.layout')

@section('title', 'Compra confirmada | Vittorio')

@section('content')
<section class="checkout-main checkout-main--confirm">

  {{-- Indicador de pasos — todos completados --}}
  <div class="checkout-steps checkout-steps--success">
    <div class="checkout-step done">
      <span class="checkout-step-num"><i data-lucide="check" class="icon-14"></i></span>
      <span class="checkout-step-label">Envío</span>
    </div>
    <div class="checkout-step-divider done-divider"></div>
    <div class="checkout-step done">
      <span class="checkout-step-num"><i data-lucide="check" class="icon-14"></i></span>
      <span class="checkout-step-label">Pago</span>
    </div>
    <div class="checkout-step-divider done-divider"></div>
    <div class="checkout-step active">
      <span class="checkout-step-num"><i data-lucide="check" class="icon-14"></i></span>
      <span class="checkout-step-label">Confirmación</span>
    </div>
  </div>

  {{-- Hero --}}
  <div class="confirmacion-hero">
    <div class="confirmacion-icon-wrap">
      <i data-lucide="circle-check" class="confirmacion-icon"></i>
    </div>
    <h1 class="confirmacion-title">¡Compra confirmada!</h1>
    <p class="confirmacion-subtitle">
      Tu pedido <strong class="confirmacion-id">#{{ str_pad($venta->id, 6, '0', STR_PAD_LEFT) }}</strong>
      fue registrado exitosamente.<br>
      Recibirás la factura en tu correo <span class="confirmacion-email">{{ auth()->user()->email }}</span>.
    </p>
  </div>

  <div class="confirmacion-grid">

    {{-- ── Columna izquierda: productos ───────────────────────── --}}
    <div class="checkout-card">
      <h2 class="confirmacion-section-title">Productos</h2>

      <div class="confirmacion-items">
        @foreach($venta->detalles as $detalle)
          <div class="confirmacion-item">
            <div class="confirmacion-item-img">
              @if($detalle->producto->imagen_studio)
                <img src="{{ $detalle->producto->imagen_studio }}"
                     alt="{{ $detalle->producto->nombre }}" loading="lazy" />
              @else
                <div class="confirmacion-item-img-placeholder">
                  <i data-lucide="watch" class="icon-18-muted"></i>
                </div>
              @endif
            </div>
            <div class="confirmacion-item-info">
              <span class="confirmacion-item-nombre">{{ $detalle->producto->nombre }}</span>
              <span class="confirmacion-item-meta">
                {{ $detalle->cantidad }} {{ $detalle->cantidad === 1 ? 'unidad' : 'unidades' }}
                &nbsp;·&nbsp;
                $ {{ number_format($detalle->precio_unitario, 0, ',', '.') }} c/u
              </span>
            </div>
            <span class="confirmacion-item-subtotal">
              $ {{ number_format($detalle->subtotal, 0, ',', '.') }}
            </span>
          </div>
        @endforeach
      </div>

      {{-- Totales --}}
      <div class="confirmacion-totales">
        @php $subtotal = $venta->detalles->sum('subtotal'); @endphp
        <div class="confirmacion-totales-row">
          <span>Subtotal</span>
          <span>$ {{ number_format($subtotal, 0, ',', '.') }} ARS</span>
        </div>
        <div class="confirmacion-totales-row">
          <span>Envío</span>
          <span>$ {{ number_format($venta->costo_envio ?? 0, 0, ',', '.') }} ARS</span>
        </div>
        <div class="confirmacion-totales-row confirmacion-total-final">
          <span>Total pagado</span>
          <span>$ {{ number_format(($subtotal + ($venta->costo_envio ?? 0)), 0, ',', '.') }} ARS</span>
        </div>
      </div>
    </div>

    {{-- ── Columna derecha: envío + pago ──────────────────────── --}}
    <div>
      <div class="checkout-card checkout-card--spaced">
        <h2 class="confirmacion-section-title">
          <i data-lucide="map-pin" class="icon-13"></i>
          Dirección de entrega
        </h2>
        <dl class="confirmacion-dl">
          <div>
            <dt>Destinatario</dt>
            <dd>{{ $venta->nombre_destinatario }}</dd>
          </div>
          <div>
            <dt>Dirección</dt>
            <dd>{{ $venta->calle }} {{ $venta->numero }}</dd>
          </div>
          <div>
            <dt>Ciudad</dt>
            <dd>{{ $venta->ciudad }}, {{ $venta->provincia }}</dd>
          </div>
          <div>
            <dt>Código postal</dt>
            <dd>{{ $venta->codigo_postal }}</dd>
          </div>
        </dl>
      </div>

      <div class="checkout-card">
        <h2 class="confirmacion-section-title">
          <i data-lucide="receipt" class="icon-13"></i>
          Información del pago
        </h2>
        <dl class="confirmacion-dl">
          <div>
            <dt>Método</dt>
            <dd>
              @php
                $metodoLabel = match($venta->metodo_pago) {
                    'transferencia' => 'Transferencia bancaria',
                    'tarjeta'       => 'Tarjeta de crédito / débito',
                    'mercadopago'   => 'Mercado Pago',
                    default         => ucfirst($venta->metodo_pago ?? '—'),
                };
              @endphp
              {{ $metodoLabel }}
            </dd>
          </div>
          <div>
            <dt>Estado</dt>
            <dd>
              <span class="badge-estado badge-aprobado">
                <i data-lucide="check-circle" class="icon-11"></i>
                Aprobado
              </span>
            </dd>
          </div>
          <div>
            <dt>Fecha</dt>
            <dd>{{ $venta->fecha_venta?->format('d/m/Y H:i') ?? now()->format('d/m/Y H:i') }}</dd>
          </div>
        </dl>
      </div>
    </div>

  </div>

  {{-- Nota de factura + descarga directa --}}
  <div class="confirmacion-factura-nota">
    <i data-lucide="mail" class="icon-14--shrink0"></i>
    <span>La factura fue enviada a tu correo. Si no la recibiste, podés descargarla directamente.</span>
    <a href="{{ route('compras.factura', $venta->id) }}" class="btn-factura-download">
      <i data-lucide="download" class="icon-13"></i>
      Descargar Factura
    </a>
  </div>

  {{-- Acciones --}}
  <div class="confirmacion-actions">
    <a href="{{ route('mis-compras') }}" class="btn-vt btn-vt-primary">
      <i data-lucide="package"></i>
      Ver mis compras
    </a>
    <a href="{{ route('catalogo') }}" class="btn-vt btn-vt-outline">
      Seguir comprando <i data-lucide="arrow-right"></i>
    </a>
  </div>

</section>
@endsection

@push('scripts')
<script>
if (window.lucide) lucide.createIcons();
</script>
@endpush
