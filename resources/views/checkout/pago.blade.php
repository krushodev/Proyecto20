{{--
  ============================================================
  CHECKOUT — Paso 2: Método de pago
  ============================================================
--}}
@extends('layout.layout')

@section('title', 'Checkout — Método de pago | Vittorio')

@section('content')
<section class="checkout-main">

  {{-- Indicador de pasos --}}
  <div class="checkout-steps">
    <div class="checkout-step done">
      <span class="checkout-step-num"><i data-lucide="check" style="width:14px;height:14px;"></i></span>
      <span class="checkout-step-label">Envío</span>
    </div>
    <div class="checkout-step-divider"></div>
    <div class="checkout-step active">
      <span class="checkout-step-num">2</span>
      <span class="checkout-step-label">Pago</span>
    </div>
    <div class="checkout-step-divider"></div>
    <div class="checkout-step">
      <span class="checkout-step-num">3</span>
      <span class="checkout-step-label">Confirmación</span>
    </div>
  </div>

  <header class="checkout-header">
    <h1 class="checkout-title">Método de pago</h1>
    <div class="catalog-header-divider"></div>
  </header>

  @if($errors->has('pago'))
    <div class="cart-alert cart-alert-error">{{ $errors->first('pago') }}</div>
  @endif

  <div class="pago-layout">

    {{-- ── Columna izquierda: métodos ──────────────────────────────── --}}
    <div class="pago-left">

      <form action="{{ route('checkout.pago.procesar') }}" method="POST" id="form-pago">
        @csrf

        {{-- Opciones de método --}}
        <div class="checkout-card metodos-card">
          <h2 class="checkout-card-title">Elegí cómo pagar</h2>

          <div class="metodos-lista">

            {{-- Transferencia --}}
            <label class="metodo-option" data-target="panel-transferencia">
              <input type="radio" name="metodo_pago" value="transferencia"
                     class="metodo-radio" checked />
              <span class="metodo-body">
                <span class="metodo-icon-wrap">
                  <i data-lucide="landmark"></i>
                </span>
                <span class="metodo-text">
                  <strong>Transferencia bancaria</strong>
                  <small>CBU / CVU — Sin cargos adicionales</small>
                </span>
                <i data-lucide="chevron-right" class="metodo-arrow"></i>
              </span>
            </label>

            {{-- Tarjeta (simulación) --}}
            <label class="metodo-option" data-target="panel-tarjeta">
              <input type="radio" name="metodo_pago" value="tarjeta"
                     class="metodo-radio" />
              <span class="metodo-body">
                <span class="metodo-icon-wrap">
                  <i data-lucide="credit-card"></i>
                </span>
                <span class="metodo-text">
                  <strong>Tarjeta de crédito / débito</strong>
                  <small>Visa, Mastercard, Naranja X</small>
                </span>
                <i data-lucide="chevron-right" class="metodo-arrow"></i>
              </span>
            </label>

            {{-- MercadoPago --}}
            <label class="metodo-option" data-target="panel-mp">
              <input type="radio" name="metodo_pago" value="mercadopago"
                     class="metodo-radio" />
              <span class="metodo-body">
                <span class="metodo-icon-wrap mp-icon">
                  <svg viewBox="0 0 24 24" fill="currentColor" style="width:18px;height:18px;">
                    <path d="M12 0C5.373 0 0 5.373 0 12s5.373 12 12 12 12-5.373 12-12S18.627 0 12 0zm5.562 8.248l-6.81 6.81a.75.75 0 01-1.06 0L6.438 11.81a.75.75 0 011.06-1.06l2.723 2.722 6.28-6.28a.75.75 0 011.061 1.056z"/>
                  </svg>
                </span>
                <span class="metodo-text">
                  <strong>Mercado Pago</strong>
                  <small>Dinero en cuenta, cuotas, QR</small>
                </span>
                <i data-lucide="chevron-right" class="metodo-arrow"></i>
              </span>
            </label>

          </div>
        </div>

        {{-- Panel transferencia --}}
        <div class="checkout-card panel-pago" id="panel-transferencia">
          <h2 class="checkout-card-title">Datos bancarios</h2>
          <div class="transferencia-datos">
            <div class="transferencia-row">
              <span class="transferencia-label">Banco</span>
              <span class="transferencia-val">Banco Galicia</span>
            </div>
            <div class="transferencia-row">
              <span class="transferencia-label">Titular</span>
              <span class="transferencia-val">Vittorio Relojes S.A.</span>
            </div>
            <div class="transferencia-row">
              <span class="transferencia-label">CBU</span>
              <span class="transferencia-val mono">0070012130004012345678</span>
            </div>
            <div class="transferencia-row">
              <span class="transferencia-label">Alias</span>
              <span class="transferencia-val mono">VITTORIO.RELOJES</span>
            </div>
          </div>
          <p class="transferencia-nota">
            <i data-lucide="info" style="width:13px;height:13px;"></i>
            Confirmá tu transferencia y nosotros procesamos tu pedido en el mismo día hábil.
          </p>
        </div>

        {{-- Panel tarjeta (simulación visual) --}}
        <div class="checkout-card panel-pago" id="panel-tarjeta" style="display:none;">
          <h2 class="checkout-card-title">Datos de la tarjeta</h2>

          {{-- Tarjeta animada --}}
          <div class="card-preview-wrap">
            <div class="card-preview" id="card-preview">
              <div class="card-front">
                <div class="card-chip"></div>
                <div class="card-number-display" id="card-number-display">•••• •••• •••• ••••</div>
                <div class="card-bottom">
                  <div>
                    <div class="card-label">Titular</div>
                    <div class="card-holder-display" id="card-holder-display">NOMBRE APELLIDO</div>
                  </div>
                  <div>
                    <div class="card-label">Vence</div>
                    <div class="card-exp-display" id="card-exp-display">MM/AA</div>
                  </div>
                  <div class="card-brand">
                    <svg viewBox="0 0 48 48" fill="none" style="width:40px;height:26px;">
                      <circle cx="18" cy="24" r="14" fill="rgba(255,255,255,.25)"/>
                      <circle cx="30" cy="24" r="14" fill="rgba(255,255,255,.15)"/>
                    </svg>
                  </div>
                </div>
              </div>
              <div class="card-back">
                <div class="card-strip"></div>
                <div class="card-cvv-row">
                  <div class="card-cvv-bar"></div>
                  <div class="card-cvv-box">
                    <div class="card-label">CVV</div>
                    <div class="card-cvv-display" id="card-cvv-display">•••</div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {{-- Campos (solo visual, no se envían al servidor) --}}
          <div class="form-group">
            <label class="form-label" for="card_number">Número de tarjeta</label>
            <input type="text" id="card_number" class="form-input"
                   placeholder="0000 0000 0000 0000" maxlength="19" inputmode="numeric" autocomplete="cc-number" />
          </div>
          <div class="form-group">
            <label class="form-label" for="card_holder">Nombre del titular</label>
            <input type="text" id="card_holder" class="form-input"
                   placeholder="Como figura en la tarjeta" autocomplete="cc-name" />
          </div>
          <div class="form-grid-2">
            <div class="form-group">
              <label class="form-label" for="card_exp">Vencimiento</label>
              <input type="text" id="card_exp" class="form-input"
                     placeholder="MM/AA" maxlength="5" inputmode="numeric" autocomplete="cc-exp" />
            </div>
            <div class="form-group">
              <label class="form-label" for="card_cvv">CVV</label>
              <input type="text" id="card_cvv" class="form-input"
                     placeholder="•••" maxlength="4" inputmode="numeric" autocomplete="cc-csc" />
            </div>
          </div>
          <p class="transferencia-nota">
            <i data-lucide="shield-check" style="width:13px;height:13px;"></i>
            Simulación frontend — los datos de tarjeta no se envían ni almacenan.
          </p>
        </div>

        {{-- Panel MercadoPago --}}
        <div class="checkout-card panel-pago" id="panel-mp" style="display:none;">
          <h2 class="checkout-card-title">Pagar con Mercado Pago</h2>
          <div class="mp-info">
            <div class="mp-logo-big">
              <svg viewBox="0 0 48 48" fill="none" style="width:48px;height:48px;">
                <circle cx="24" cy="24" r="24" fill="rgba(255,255,255,.06)"/>
                <path d="M24 8C15.163 8 8 15.163 8 24s7.163 16 16 16 16-7.163 16-16S32.837 8 24 8zm8.75 13.248l-9.81 9.81a1.25 1.25 0 01-1.768 0l-4.922-4.922a1.25 1.25 0 011.768-1.768l4.038 4.038 8.926-8.926a1.25 1.25 0 011.768 1.768z" fill="rgba(255,255,255,.7)"/>
              </svg>
            </div>
            <p class="mp-desc">Serás redirigido al sitio de Mercado Pago para completar el pago de forma segura. Podés pagar con dinero en cuenta, tarjeta o QR.</p>
            <div class="mp-badges">
              <span class="mp-badge"><i data-lucide="shield" style="width:12px;height:12px;"></i> Pago seguro</span>
              <span class="mp-badge"><i data-lucide="zap" style="width:12px;height:12px;"></i> Acreditación inmediata</span>
              <span class="mp-badge"><i data-lucide="repeat" style="width:12px;height:12px;"></i> Cuotas disponibles</span>
            </div>
          </div>
        </div>

        {{-- Acciones --}}
        <div class="checkout-actions">
          <a href="{{ route('checkout.envio') }}" class="btn-outline-vittorio">
            <i data-lucide="arrow-left"></i> Volver
          </a>
          <button type="submit" class="btn-primary-vittorio" id="btn-submit">
            Confirmar compra <i data-lucide="arrow-right"></i>
          </button>
        </div>

      </form>
    </div>

    {{-- ── Columna derecha: resumen ──────────────────────────────── --}}
    <aside class="pago-aside">
      <div class="checkout-card">
        <h2 class="checkout-card-title">Tu pedido</h2>

        <div class="resumen-items">
          @foreach($carrito->detalles as $detalle)
            <div class="resumen-item">
              <span class="resumen-nombre">{{ $detalle->producto->nombre }} <span class="resumen-qty">×{{ $detalle->cantidad }}</span></span>
              <span class="resumen-precio">$ {{ number_format($detalle->subtotal, 0, ',', '.') }}</span>
            </div>
          @endforeach
        </div>

        <div class="resumen-divider"></div>

        <div class="resumen-row">
          <span>Subtotal</span>
          <span>$ {{ number_format($carrito->total, 0, ',', '.') }} ARS</span>
        </div>
        <div class="resumen-row">
          <span>Envío <small style="font-size:.7rem;color:rgba(255,255,255,.3);">— {{ $envio['ciudad'] }}</small></span>
          <span>$ {{ number_format($envio['costo_envio'], 0, ',', '.') }} ARS</span>
        </div>

        <div class="resumen-divider"></div>

        <div class="resumen-row resumen-total">
          <span>Total</span>
          <span>$ {{ number_format($carrito->total + $envio['costo_envio'], 0, ',', '.') }} ARS</span>
        </div>

        <div class="resumen-envio-detalle">
          <i data-lucide="map-pin" style="width:13px;height:13px;"></i>
          {{ $envio['calle'] }} {{ $envio['numero'] }}, {{ $envio['ciudad'] }}, {{ $envio['provincia'] }}
        </div>
      </div>
    </aside>

  </div>

</section>
@endsection

@push('styles')
<style>
/* ── Layout ──────────────────────────────────────────────────────────── */
.checkout-main { max-width: 980px; margin: 0 auto; padding: 2rem 1.5rem 4rem; }
.pago-layout { display: grid; grid-template-columns: 1fr 320px; gap: 1.5rem; align-items: start; }
@media (max-width: 700px) { .pago-layout { grid-template-columns: 1fr; } }

/* ── Steps (reutiliza los de envio.blade) ────────────────────────────── */
.checkout-steps { display: flex; align-items: center; justify-content: center; gap: .5rem; margin-bottom: 2rem; }
.checkout-step { display: flex; flex-direction: column; align-items: center; gap: .25rem; opacity: .35; }
.checkout-step.active { opacity: 1; }
.checkout-step.done { opacity: .7; }
.checkout-step-num {
  width: 32px; height: 32px; border-radius: 50%;
  border: 2px solid rgba(255,255,255,.3);
  display: flex; align-items: center; justify-content: center;
  font-size: .78rem; font-weight: 700; color: rgba(255,255,255,.6);
}
.checkout-step.active .checkout-step-num { border-color: #fff; color: #fff; background: rgba(255,255,255,.08); }
.checkout-step.done .checkout-step-num { border-color: rgba(255,255,255,.5); color: rgba(255,255,255,.7); }
.checkout-step-label { font-size: .68rem; letter-spacing: .1em; text-transform: uppercase; color: rgba(255,255,255,.5); }
.checkout-step.active .checkout-step-label { color: #fff; }
.checkout-step-divider { width: 40px; height: 1px; background: rgba(255,255,255,.15); margin-bottom: 1.2rem; }

.checkout-header { text-align: center; margin-bottom: 2rem; }
.checkout-title { font-size: 1.6rem; font-weight: 700; letter-spacing: .08em; color: #fff; }
.checkout-card {
  background: rgba(255,255,255,.03); border: 1px solid rgba(255,255,255,.08);
  border-radius: 12px; padding: 1.75rem; margin-bottom: 1.25rem;
}
.checkout-card-title {
  font-size: .8rem; font-weight: 700; letter-spacing: .12em; text-transform: uppercase;
  color: rgba(255,255,255,.5); margin-bottom: 1.25rem;
}

/* ── Métodos lista ───────────────────────────────────────────────────── */
.metodos-lista { display: flex; flex-direction: column; gap: .6rem; }
.metodo-option { display: block; cursor: pointer; }
.metodo-radio { display: none; }
.metodo-body {
  display: flex; align-items: center; gap: .85rem;
  padding: .9rem 1rem; border: 1px solid rgba(255,255,255,.1);
  border-radius: 8px; transition: border-color .2s, background .2s;
}
.metodo-radio:checked + .metodo-body { border-color: rgba(255,255,255,.55); background: rgba(255,255,255,.05); }
.metodo-icon-wrap {
  width: 36px; height: 36px; flex-shrink: 0; border-radius: 8px;
  background: rgba(255,255,255,.06); display: flex; align-items: center; justify-content: center;
}
.metodo-icon-wrap i { width: 18px; height: 18px; color: rgba(255,255,255,.7); }
.mp-icon { background: rgba(255,178,0,.12); }
.metodo-text { flex: 1; display: flex; flex-direction: column; gap: .1rem; }
.metodo-text strong { font-size: .85rem; font-weight: 600; color: #fff; }
.metodo-text small { font-size: .72rem; color: rgba(255,255,255,.4); }
.metodo-arrow { width: 16px; height: 16px; color: rgba(255,255,255,.2); flex-shrink: 0; }

/* ── Panel transferencia ─────────────────────────────────────────────── */
.transferencia-datos { display: flex; flex-direction: column; gap: .6rem; margin-bottom: 1rem; }
.transferencia-row { display: flex; justify-content: space-between; align-items: center; font-size: .84rem; }
.transferencia-label { color: rgba(255,255,255,.35); font-size: .72rem; letter-spacing: .06em; text-transform: uppercase; }
.transferencia-val { color: #fff; }
.transferencia-val.mono { font-family: 'Courier New', monospace; font-size: .8rem; letter-spacing: .05em; }
.transferencia-nota {
  display: flex; align-items: center; gap: .4rem;
  font-size: .72rem; color: rgba(255,255,255,.35);
  padding-top: .75rem; border-top: 1px solid rgba(255,255,255,.06);
}

/* ── Card preview ────────────────────────────────────────────────────── */
.card-preview-wrap { perspective: 1200px; margin-bottom: 1.5rem; }
.card-preview {
  position: relative; width: 100%; max-width: 340px; height: 200px;
  margin: 0 auto; transform-style: preserve-3d; transition: transform .6s cubic-bezier(.4,0,.2,1);
  border-radius: 16px;
}
.card-preview.flipped { transform: rotateY(180deg); }
.card-front, .card-back {
  position: absolute; inset: 0; border-radius: 16px; backface-visibility: hidden;
  overflow: hidden;
}
.card-front {
  background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
  border: 1px solid rgba(255,255,255,.12);
  padding: 1.5rem; display: flex; flex-direction: column; justify-content: space-between;
}
.card-back {
  background: linear-gradient(135deg, #0f3460 0%, #16213e 100%);
  border: 1px solid rgba(255,255,255,.12);
  transform: rotateY(180deg);
  display: flex; flex-direction: column; justify-content: center;
}
.card-chip {
  width: 36px; height: 28px; border-radius: 5px;
  background: linear-gradient(135deg, #d4a843, #f0c040, #b8952e);
  box-shadow: 0 0 0 1px rgba(0,0,0,.3);
}
.card-number-display {
  font-family: 'Courier New', monospace; font-size: 1.1rem; letter-spacing: .2em;
  color: rgba(255,255,255,.9); text-shadow: 0 1px 3px rgba(0,0,0,.4);
}
.card-bottom { display: flex; align-items: flex-end; justify-content: space-between; }
.card-label { font-size: .55rem; letter-spacing: .12em; text-transform: uppercase; color: rgba(255,255,255,.4); margin-bottom: .15rem; }
.card-holder-display, .card-exp-display { font-size: .78rem; font-weight: 600; letter-spacing: .08em; color: #fff; text-transform: uppercase; }
.card-strip { height: 40px; background: rgba(0,0,0,.6); margin-bottom: 1.5rem; }
.card-cvv-row { display: flex; align-items: center; justify-content: flex-end; gap: 1rem; padding: 0 1.5rem; }
.card-cvv-bar { flex: 1; height: 32px; background: rgba(255,255,255,.85); border-radius: 2px; }
.card-cvv-box { text-align: center; }
.card-cvv-display { font-family: 'Courier New', monospace; font-size: .9rem; letter-spacing: .15em; color: rgba(255,255,255,.8); }

/* ── Form inputs (reutilizados de envio) ─────────────────────────────── */
.form-grid-2 { display: grid; grid-template-columns: 1fr 1fr; gap: .75rem; }
@media (max-width: 500px) { .form-grid-2 { grid-template-columns: 1fr; } }
.form-group { display: flex; flex-direction: column; gap: .35rem; margin-bottom: .75rem; }
.form-label { font-size: .72rem; letter-spacing: .08em; text-transform: uppercase; color: rgba(255,255,255,.45); }
.form-input {
  background: rgba(255,255,255,.05); border: 1px solid rgba(255,255,255,.1);
  border-radius: 8px; padding: .65rem .9rem; color: #fff; font-size: .88rem;
  outline: none; transition: border-color .2s;
}
.form-input:focus { border-color: rgba(255,255,255,.35); }
.form-input::placeholder { color: rgba(255,255,255,.2); }

/* ── MercadoPago panel ───────────────────────────────────────────────── */
.mp-info { display: flex; flex-direction: column; align-items: center; gap: 1rem; text-align: center; }
.mp-desc { font-size: .84rem; color: rgba(255,255,255,.55); line-height: 1.6; max-width: 360px; }
.mp-badges { display: flex; gap: .5rem; flex-wrap: wrap; justify-content: center; }
.mp-badge {
  display: inline-flex; align-items: center; gap: .3rem;
  padding: .3rem .7rem; border: 1px solid rgba(255,255,255,.1);
  border-radius: 20px; font-size: .7rem; color: rgba(255,255,255,.5); letter-spacing: .05em;
}

/* ── Resumen aside ───────────────────────────────────────────────────── */
.resumen-items { display: flex; flex-direction: column; gap: .5rem; margin-bottom: .75rem; }
.resumen-item { display: flex; justify-content: space-between; align-items: baseline; gap: .5rem; }
.resumen-nombre { font-size: .82rem; color: rgba(255,255,255,.6); }
.resumen-qty { font-size: .72rem; color: rgba(255,255,255,.35); margin-left: .25rem; }
.resumen-precio { font-size: .82rem; color: rgba(255,255,255,.75); white-space: nowrap; }
.resumen-divider { height: 1px; background: rgba(255,255,255,.07); margin: .6rem 0; }
.resumen-row { display: flex; justify-content: space-between; font-size: .82rem; color: rgba(255,255,255,.55); margin-bottom: .35rem; }
.resumen-total { font-size: .95rem; font-weight: 700; color: #fff; margin-top: .25rem; }
.resumen-envio-detalle {
  display: flex; align-items: center; gap: .35rem; margin-top: .75rem;
  padding-top: .75rem; border-top: 1px solid rgba(255,255,255,.06);
  font-size: .72rem; color: rgba(255,255,255,.3);
}

/* ── Actions ─────────────────────────────────────────────────────────── */
.checkout-actions { display: flex; align-items: center; justify-content: space-between; gap: 1rem; flex-wrap: wrap; }
.btn-outline-vittorio {
  display: inline-flex; align-items: center; gap: .4rem;
  padding: .65rem 1.2rem; border: 1px solid rgba(255,255,255,.2);
  border-radius: 8px; color: rgba(255,255,255,.6); font-size: .82rem;
  letter-spacing: .06em; text-decoration: none; transition: border-color .2s, color .2s;
}
.btn-outline-vittorio:hover { border-color: rgba(255,255,255,.5); color: #fff; }
.btn-outline-vittorio i { width: 14px; height: 14px; }
.btn-primary-vittorio {
  display: inline-flex; align-items: center; gap: .4rem;
  padding: .75rem 1.5rem; background: #fff; color: #111;
  border: none; border-radius: 8px; font-size: .84rem; font-weight: 700;
  letter-spacing: .08em; cursor: pointer; text-decoration: none;
  transition: background .2s, transform .1s;
}
.btn-primary-vittorio:hover { background: rgba(255,255,255,.9); transform: translateY(-1px); }
.btn-primary-vittorio i { width: 14px; height: 14px; }
</style>
@endpush

@push('scripts')
<script>
(function () {
  /* ── Cambio de panel según método seleccionado ─────────────────── */
  var panels   = { transferencia: 'panel-transferencia', tarjeta: 'panel-tarjeta', mercadopago: 'panel-mp' };
  var radios   = document.querySelectorAll('.metodo-radio');
  var btnLabel = { transferencia: 'Confirmar compra', tarjeta: 'Pagar con tarjeta', mercadopago: 'Ir a Mercado Pago' };
  var btnSubmit = document.getElementById('btn-submit');

  function showPanel(value) {
    Object.values(panels).forEach(function(id) {
      var el = document.getElementById(id);
      if (el) el.style.display = id === panels[value] ? '' : 'none';
    });
    if (btnSubmit) {
      var span = btnSubmit.childNodes[0];
      if (span && span.nodeType === Node.TEXT_NODE) span.textContent = btnLabel[value] + ' ';
    }
  }

  radios.forEach(function(radio) {
    radio.addEventListener('change', function() { showPanel(this.value); });
  });

  /* Inicializar con el valor checked */
  var checked = document.querySelector('.metodo-radio:checked');
  if (checked) showPanel(checked.value);

  /* ── Simulación de tarjeta ─────────────────────────────────────── */
  var cardPreview = document.getElementById('card-preview');
  var numDisplay  = document.getElementById('card-number-display');
  var holderDisp  = document.getElementById('card-holder-display');
  var expDisp     = document.getElementById('card-exp-display');
  var cvvDisp     = document.getElementById('card-cvv-display');

  var numInput    = document.getElementById('card_number');
  var holderInput = document.getElementById('card_holder');
  var expInput    = document.getElementById('card_exp');
  var cvvInput    = document.getElementById('card_cvv');

  if (numInput) {
    numInput.addEventListener('input', function() {
      var v = this.value.replace(/\D/g, '').slice(0, 16);
      var fmt = v.replace(/(.{4})/g, '$1 ').trim();
      this.value = fmt;
      var padded = v.padEnd(16, '•');
      numDisplay.textContent = padded.replace(/(.{4})/g, '$1 ').trim();
    });
  }

  if (holderInput) {
    holderInput.addEventListener('input', function() {
      holderDisp.textContent = this.value.toUpperCase() || 'NOMBRE APELLIDO';
    });
  }

  if (expInput) {
    expInput.addEventListener('input', function() {
      var v = this.value.replace(/\D/g, '').slice(0, 4);
      if (v.length >= 3) v = v.slice(0,2) + '/' + v.slice(2);
      this.value = v;
      expDisp.textContent = v || 'MM/AA';
    });
  }

  if (cvvInput) {
    cvvInput.addEventListener('focus', function() { if (cardPreview) cardPreview.classList.add('flipped'); });
    cvvInput.addEventListener('blur',  function() { if (cardPreview) cardPreview.classList.remove('flipped'); });
    cvvInput.addEventListener('input', function() {
      cvvDisp.textContent = this.value.replace(/\D/g,'').slice(0,4) || '•••';
    });
  }

  if (window.lucide) lucide.createIcons();
})();
</script>
@endpush
