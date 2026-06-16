{{--
  ============================================================
  CHECKOUT — Paso 2: Método de pago
  ============================================================
--}}
@extends('layout.layout')

@section('title', 'Checkout — Método de pago | Vittorio')

@section('content')
<section class="checkout-main checkout-main--wide">

  {{-- Indicador de pasos --}}
  <div class="checkout-steps">
    <div class="checkout-step done">
      <span class="checkout-step-num"><i data-lucide="check" class="checkout-step-check-icon"></i></span>
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
                  <svg viewBox="0 0 24 24" fill="currentColor" class="mp-icon-svg">
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
            <i data-lucide="info" class="icon-13"></i>
            Confirmá tu transferencia y nosotros procesamos tu pedido en el mismo día hábil.
          </p>
        </div>

        {{-- Panel tarjeta (simulación visual) --}}
        <div class="checkout-card panel-pago is-hidden" id="panel-tarjeta">
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
                    <svg viewBox="0 0 48 48" fill="none" class="card-brand-svg">
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
            <i data-lucide="shield-check" class="icon-13"></i>
            Simulación frontend — los datos de tarjeta no se envían ni almacenan.
          </p>
        </div>

        {{-- Panel MercadoPago --}}
        <div class="checkout-card panel-pago is-hidden" id="panel-mp">
          <h2 class="checkout-card-title">Pagar con Mercado Pago</h2>
          <div class="mp-info">
            <div class="mp-logo-big">
              <svg viewBox="0 0 48 48" fill="none" class="mp-logo-big-svg">
                <circle cx="24" cy="24" r="24" fill="rgba(255,255,255,.06)"/>
                <path d="M24 8C15.163 8 8 15.163 8 24s7.163 16 16 16 16-7.163 16-16S32.837 8 24 8zm8.75 13.248l-9.81 9.81a1.25 1.25 0 01-1.768 0l-4.922-4.922a1.25 1.25 0 011.768-1.768l4.038 4.038 8.926-8.926a1.25 1.25 0 011.768 1.768z" fill="rgba(255,255,255,.7)"/>
              </svg>
            </div>
            <p class="mp-desc">Serás redirigido al sitio de Mercado Pago para completar el pago de forma segura. Podés pagar con dinero en cuenta, tarjeta o QR.</p>
            <div class="mp-badges">
              <span class="mp-badge"><i data-lucide="shield" class="icon-12"></i> Pago seguro</span>
              <span class="mp-badge"><i data-lucide="zap" class="icon-12"></i> Acreditación inmediata</span>
              <span class="mp-badge"><i data-lucide="repeat" class="icon-12"></i> Cuotas disponibles</span>
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
          <span>Envío <small class="resumen-envio-zona">— {{ $envio['ciudad'] }}</small></span>
          <span>$ {{ number_format($envio['costo_envio'], 0, ',', '.') }} ARS</span>
        </div>

        <div class="resumen-divider"></div>

        <div class="resumen-row resumen-total">
          <span>Total</span>
          <span>$ {{ number_format($carrito->total + $envio['costo_envio'], 0, ',', '.') }} ARS</span>
        </div>

        <div class="resumen-envio-detalle">
          <i data-lucide="map-pin" class="icon-13"></i>
          {{ $envio['calle'] }} {{ $envio['numero'] }}, {{ $envio['ciudad'] }}, {{ $envio['provincia'] }}
        </div>
      </div>
    </aside>

  </div>

</section>
@endsection

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

  /* ── Abrir Mercado Pago en nueva pestaña ───────────────────────── */
  var formPago = document.getElementById('form-pago');
  if (formPago) {
    formPago.addEventListener('submit', function (e) {
      var seleccionado = document.querySelector('.metodo-radio:checked');
      if (!seleccionado || seleccionado.value !== 'mercadopago') return; // deja funcionar normal para otros métodos

      e.preventDefault();

      // Abrir pestaña SINCRÓNICAMENTE dentro del evento (evita el bloqueador de popups)
      var mpTab = window.open('', '_blank');
      if (mpTab) {
        mpTab.document.write(
          '<html><head><title>Redirigiendo...</title></head>' +
          '<body style="margin:0;background:#009ee3;display:flex;align-items:center;justify-content:center;height:100vh;">' +
          '<p style="color:#fff;font-family:sans-serif;font-size:1.1rem;letter-spacing:.04em;">Conectando con Mercado Pago&hellip;</p>' +
          '</body></html>'
        );
      }

      var formData = new FormData(formPago);

      fetch(formPago.action, {
        method: 'POST',
        headers: { 'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json' },
        body: formData,
      })
        .then(function (res) { return res.json(); })
        .then(function (data) {
          if (data.url) {
            if (mpTab) { mpTab.location.href = data.url; }
          } else {
            if (mpTab) { mpTab.close(); }
            alert(data.error || 'No se pudo obtener la URL de MercadoPago.');
          }
        })
        .catch(function () {
          if (mpTab) { mpTab.close(); }
          alert('Error de conexión. Intentá de nuevo.');
        });
    });
  }
})();
</script>
@endpush
