{{--
  ============================================================
  CHECKOUT — Paso 3: Confirmación de compra
  ============================================================
--}}
@extends('layout.layout')

@section('title', 'Compra confirmada | Vittorio')

@section('content')
<section class="checkout-main">

  {{-- Indicador de pasos — todos completados --}}
  <div class="checkout-steps">
    <div class="checkout-step done">
      <span class="checkout-step-num"><i data-lucide="check" style="width:14px;height:14px;"></i></span>
      <span class="checkout-step-label">Envío</span>
    </div>
    <div class="checkout-step-divider done-divider"></div>
    <div class="checkout-step done">
      <span class="checkout-step-num"><i data-lucide="check" style="width:14px;height:14px;"></i></span>
      <span class="checkout-step-label">Pago</span>
    </div>
    <div class="checkout-step-divider done-divider"></div>
    <div class="checkout-step active">
      <span class="checkout-step-num"><i data-lucide="check" style="width:14px;height:14px;"></i></span>
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
                  <i data-lucide="watch" style="width:18px;height:18px;color:rgba(255,255,255,.2);"></i>
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
      <div class="checkout-card" style="margin-bottom:1.25rem;">
        <h2 class="confirmacion-section-title">
          <i data-lucide="map-pin" style="width:13px;height:13px;"></i>
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
          <i data-lucide="receipt" style="width:13px;height:13px;"></i>
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
                <i data-lucide="check-circle" style="width:11px;height:11px;"></i>
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

  {{-- Nota de factura --}}
  <div class="confirmacion-factura-nota">
    <i data-lucide="mail" style="width:14px;height:14px;"></i>
    <span>La factura de tu compra está siendo generada y se enviará a tu correo en unos minutos.</span>
  </div>

  {{-- Acciones --}}
  <div class="confirmacion-actions">
    <a href="{{ route('mis-compras') }}" class="btn-primary-vittorio">
      <i data-lucide="package"></i>
      Ver mis compras
    </a>
    <a href="{{ route('catalogo') }}" class="btn-outline-vittorio">
      Seguir comprando <i data-lucide="arrow-right"></i>
    </a>
  </div>

</section>
@endsection

@push('styles')
<style>
/* ── Layout ──────────────────────────────────────────────────────────── */
.checkout-main { max-width: 860px; margin: 0 auto; padding: 2rem 1.5rem 4rem; }

/* ── Steps ───────────────────────────────────────────────────────────── */
.checkout-steps { display: flex; align-items: center; justify-content: center; gap: .5rem; margin-bottom: 2.5rem; }
.checkout-step { display: flex; flex-direction: column; align-items: center; gap: .25rem; opacity: .35; }
.checkout-step.active { opacity: 1; }
.checkout-step.done   { opacity: .75; }
.checkout-step-num {
  width: 32px; height: 32px; border-radius: 50%;
  border: 2px solid rgba(255,255,255,.3);
  display: flex; align-items: center; justify-content: center;
  color: rgba(255,255,255,.6);
}
.checkout-step.active .checkout-step-num { border-color: #4ade80; color: #4ade80; background: rgba(74,222,128,.08); }
.checkout-step.done   .checkout-step-num { border-color: rgba(74,222,128,.6); color: rgba(74,222,128,.8); }
.checkout-step-label { font-size: .68rem; letter-spacing: .1em; text-transform: uppercase; color: rgba(255,255,255,.5); }
.checkout-step.active .checkout-step-label { color: #4ade80; }
.checkout-step-divider { width: 40px; height: 1px; background: rgba(255,255,255,.1); margin-bottom: 1.2rem; }
.checkout-step-divider.done-divider { background: rgba(74,222,128,.3); }

/* ── Hero ────────────────────────────────────────────────────────────── */
.confirmacion-hero { text-align: center; margin-bottom: 2.5rem; }
.confirmacion-icon-wrap {
  width: 72px; height: 72px; border-radius: 50%; margin: 0 auto 1.25rem;
  background: rgba(74,222,128,.1); border: 2px solid rgba(74,222,128,.3);
  display: flex; align-items: center; justify-content: center;
  animation: pulse-green 2s ease-in-out infinite;
}
@keyframes pulse-green {
  0%, 100% { box-shadow: 0 0 0 0 rgba(74,222,128,.2); }
  50%       { box-shadow: 0 0 0 12px rgba(74,222,128,0); }
}
.confirmacion-icon { width: 36px; height: 36px; color: #4ade80; }
.confirmacion-title { font-size: 2rem; font-weight: 700; letter-spacing: .04em; color: #fff; margin-bottom: .6rem; }
.confirmacion-subtitle { font-size: .88rem; color: rgba(255,255,255,.5); line-height: 1.7; }
.confirmacion-id    { color: #fff; }
.confirmacion-email { color: rgba(255,255,255,.7); font-style: italic; }

/* ── Grid ────────────────────────────────────────────────────────────── */
.confirmacion-grid { display: grid; grid-template-columns: 1fr 340px; gap: 1.25rem; margin-bottom: 1.5rem; }
@media (max-width: 680px) { .confirmacion-grid { grid-template-columns: 1fr; } }

/* ── Card ────────────────────────────────────────────────────────────── */
.checkout-card {
  background: rgba(255,255,255,.03); border: 1px solid rgba(255,255,255,.08);
  border-radius: 12px; padding: 1.75rem;
}
.confirmacion-section-title {
  display: flex; align-items: center; gap: .4rem;
  font-size: .72rem; font-weight: 700; letter-spacing: .12em; text-transform: uppercase;
  color: rgba(255,255,255,.4); margin-bottom: 1.1rem;
}

/* ── Productos ───────────────────────────────────────────────────────── */
.confirmacion-items { display: flex; flex-direction: column; }
.confirmacion-item {
  display: flex; align-items: center; gap: .85rem;
  padding: .75rem 0; border-bottom: 1px solid rgba(255,255,255,.05);
}
.confirmacion-item:last-child { border-bottom: none; }
.confirmacion-item-img {
  width: 52px; height: 52px; border-radius: 6px; overflow: hidden; flex-shrink: 0;
  background: rgba(255,255,255,.05);
}
.confirmacion-item-img img { width: 100%; height: 100%; object-fit: cover; display: block; }
.confirmacion-item-img-placeholder {
  width: 100%; height: 100%; display: flex; align-items: center; justify-content: center;
}
.confirmacion-item-info { flex: 1; display: flex; flex-direction: column; gap: .2rem; }
.confirmacion-item-nombre { font-size: .85rem; font-weight: 600; color: rgba(255,255,255,.85); }
.confirmacion-item-meta   { font-size: .72rem; color: rgba(255,255,255,.35); }
.confirmacion-item-subtotal { font-size: .85rem; font-weight: 600; color: rgba(255,255,255,.75); white-space: nowrap; }

/* ── Totales ─────────────────────────────────────────────────────────── */
.confirmacion-totales { display: flex; flex-direction: column; gap: .4rem; margin-top: 1rem; padding-top: 1rem; border-top: 1px solid rgba(255,255,255,.08); }
.confirmacion-totales-row { display: flex; justify-content: space-between; font-size: .82rem; color: rgba(255,255,255,.5); }
.confirmacion-total-final { font-size: .95rem; font-weight: 700; color: #fff; padding-top: .4rem; border-top: 1px solid rgba(255,255,255,.1); margin-top: .3rem; }

/* ── DL envío / pago ─────────────────────────────────────────────────── */
.confirmacion-dl { display: flex; flex-direction: column; gap: .55rem; }
.confirmacion-dl > div { display: flex; justify-content: space-between; align-items: baseline; gap: .75rem; }
.confirmacion-dl dt { font-size: .72rem; color: rgba(255,255,255,.35); text-transform: uppercase; letter-spacing: .06em; white-space: nowrap; }
.confirmacion-dl dd { font-size: .82rem; color: rgba(255,255,255,.8); font-weight: 500; text-align: right; margin: 0; }

/* ── Badge estado ────────────────────────────────────────────────────── */
.badge-estado {
  display: inline-flex; align-items: center; gap: .3rem;
  padding: .2rem .6rem; border-radius: 20px; font-size: .7rem; font-weight: 600; letter-spacing: .05em;
}
.badge-aprobado { background: rgba(74,222,128,.12); border: 1px solid rgba(74,222,128,.3); color: #4ade80; }

/* ── Nota factura ────────────────────────────────────────────────────── */
.confirmacion-factura-nota {
  display: flex; align-items: center; justify-content: center; gap: .5rem;
  font-size: .78rem; color: rgba(255,255,255,.35); margin-bottom: 2rem;
  padding: .85rem 1.25rem; border: 1px solid rgba(255,255,255,.06); border-radius: 8px;
  background: rgba(255,255,255,.02);
}

/* ── Acciones ────────────────────────────────────────────────────────── */
.confirmacion-actions { display: flex; align-items: center; justify-content: center; gap: 1rem; flex-wrap: wrap; }
.btn-primary-vittorio {
  display: inline-flex; align-items: center; gap: .4rem;
  padding: .75rem 1.5rem; background: #fff; color: #111; border: none;
  border-radius: 8px; font-size: .84rem; font-weight: 700; letter-spacing: .08em;
  cursor: pointer; text-decoration: none; transition: background .2s, transform .1s;
}
.btn-primary-vittorio:hover { background: rgba(255,255,255,.9); transform: translateY(-1px); }
.btn-primary-vittorio i { width: 14px; height: 14px; }
.btn-outline-vittorio {
  display: inline-flex; align-items: center; gap: .4rem;
  padding: .65rem 1.2rem; border: 1px solid rgba(255,255,255,.2); border-radius: 8px;
  color: rgba(255,255,255,.6); font-size: .82rem; letter-spacing: .06em;
  text-decoration: none; transition: border-color .2s, color .2s;
}
.btn-outline-vittorio:hover { border-color: rgba(255,255,255,.5); color: #fff; }
.btn-outline-vittorio i { width: 14px; height: 14px; }
</style>
@endpush

@push('scripts')
<script>
if (window.lucide) lucide.createIcons();
</script>
@endpush
