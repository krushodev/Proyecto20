{{--
  ============================================================
  CHECKOUT — Paso 1: Dirección de envío
  ============================================================
--}}
@extends('layout.layout')

@section('title', 'Checkout — Dirección de envío | Vittorio')

@section('content')
<section class="checkout-main">

  {{-- Indicador de pasos --}}
  <div class="checkout-steps">
    <div class="checkout-step active">
      <span class="checkout-step-num">1</span>
      <span class="checkout-step-label">Envío</span>
    </div>
    <div class="checkout-step-divider"></div>
    <div class="checkout-step">
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
    <h1 class="checkout-title">Dirección de entrega</h1>
    <div class="catalog-header-divider"></div>
  </header>

  @if($errors->any())
    <div class="cart-alert cart-alert-error">
      <ul style="margin:0;padding-left:1.2rem;">
        @foreach($errors->all() as $error)
          <li>{{ $error }}</li>
        @endforeach
      </ul>
    </div>
  @endif

  <form action="{{ route('checkout.envio.guardar') }}" method="POST" class="checkout-form" id="form-envio">
    @csrf

    {{-- ── Direcciones guardadas ──────────────────────────────── --}}
    @if($direcciones->isNotEmpty())
      <div class="checkout-card">
        <h2 class="checkout-card-title">Mis direcciones guardadas</h2>

        <div class="address-grid" id="address-list">
          @foreach($direcciones as $dir)
            <label class="address-card {{ old('direccion_id') == $dir->id ? 'selected' : '' }}" data-cp="{{ $dir->cp }}">
              <input type="radio" name="direccion_id" value="{{ $dir->id }}"
                     class="address-radio"
                     {{ old('direccion_id') == $dir->id ? 'checked' : '' }} />
              <span class="address-card-inner">
                <span class="address-alias">{{ $dir->alias }}</span>
                <span class="address-line">{{ $dir->calle }} {{ $dir->numero }}</span>
                <span class="address-line">{{ $dir->ciudad }}, {{ $dir->provincia }}</span>
                <span class="address-cp">CP {{ $dir->cp }}</span>
              </span>
              <i data-lucide="check-circle" class="address-check-icon"></i>
            </label>
          @endforeach

          {{-- Tarjeta: usar nueva dirección --}}
          <label class="address-card" id="nueva-addr-card">
            <input type="radio" name="direccion_id" value=""
                   class="address-radio"
                   id="radio-nueva" />
            <span class="address-card-inner" style="align-items:center;justify-content:center;text-align:center;">
              <i data-lucide="plus-circle" style="width:20px;height:20px;margin-bottom:.4rem;color:rgba(255,255,255,.4);"></i>
              <span class="address-alias" style="color:rgba(255,255,255,.5);">Nueva dirección</span>
            </span>
          </label>
        </div>
      </div>
    @endif

    {{-- ── Formulario nueva dirección ────────────────────────── --}}
    <div class="checkout-card" id="nueva-direccion-section"
         style="{{ $direcciones->isNotEmpty() ? 'display:none;' : '' }}">
      <h2 class="checkout-card-title">
        {{ $direcciones->isEmpty() ? 'Dirección de entrega' : 'Nueva dirección' }}
      </h2>

      <div class="form-grid-2">
        <div class="form-group">
          <label class="form-label" for="calle">Calle *</label>
          <input type="text" id="calle" name="calle" value="{{ old('calle') }}"
                 class="form-input" placeholder="Av. Independencia" autocomplete="address-line1" />
        </div>
        <div class="form-group">
          <label class="form-label" for="numero">Número / Piso / Depto *</label>
          <input type="text" id="numero" name="numero" value="{{ old('numero') }}"
                 class="form-input" placeholder="1234 – 3B" />
        </div>
      </div>

      <div class="form-grid-2">
        <div class="form-group">
          <label class="form-label" for="ciudad">Ciudad *</label>
          <input type="text" id="ciudad" name="ciudad" value="{{ old('ciudad') }}"
                 class="form-input" placeholder="Corrientes" autocomplete="address-level2" />
        </div>
        <div class="form-group">
          <label class="form-label" for="provincia">Provincia *</label>
          <input type="text" id="provincia" name="provincia" value="{{ old('provincia') }}"
                 class="form-input" placeholder="Corrientes" autocomplete="address-level1" />
        </div>
      </div>

      <div class="form-grid-2">
        <div class="form-group">
          <label class="form-label" for="cp">Código postal *</label>
          <input type="text" id="cp" name="cp" value="{{ old('cp') }}"
                 class="form-input" placeholder="3400" inputmode="numeric"
                 autocomplete="postal-code" maxlength="8" />
        </div>
        <div class="form-group">
          <label class="form-label" for="alias">Alias (ej: Casa, Trabajo)</label>
          <input type="text" id="alias" name="alias" value="{{ old('alias') }}"
                 class="form-input" placeholder="Casa" />
        </div>
      </div>

      <div class="form-group">
        <label class="form-label" for="observaciones">Observaciones</label>
        <input type="text" id="observaciones" name="observaciones" value="{{ old('observaciones') }}"
               class="form-input" placeholder="Timbre 3B, portón negro..." />
      </div>

      <label class="form-check">
        <input type="checkbox" name="guardar_direccion" value="1"
               class="form-check-input"
               {{ old('guardar_direccion') ? 'checked' : '' }} />
        <span class="form-check-label">Guardar esta dirección para futuras compras</span>
      </label>
    </div>

    {{-- ── Preview costo de envío ─────────────────────────────── --}}
    <div class="checkout-card shipping-preview" id="shipping-preview" style="display:none;">
      <h2 class="checkout-card-title">Costo de envío estimado</h2>
      <div class="shipping-info">
        <div>
          <span class="shipping-zone" id="shipping-zone"></span>
        </div>
        <span class="shipping-cost" id="shipping-cost"></span>
      </div>
    </div>

    <div class="checkout-actions">
      <a href="{{ route('carrito') }}" class="btn-outline-vittorio">
        <i data-lucide="arrow-left"></i> Volver al carrito
      </a>
      <button type="submit" class="btn-primary-vittorio">
        Continuar al pago <i data-lucide="arrow-right"></i>
      </button>
    </div>
  </form>

</section>
@endsection

@push('styles')
<style>
/* ── Layout general ──────────────────────────────────────────────────── */
.checkout-main {
  max-width: 760px;
  margin: 0 auto;
  padding: 2rem 1.5rem 4rem;
}

/* ── Step indicator ──────────────────────────────────────────────────── */
.checkout-steps {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: .5rem;
  margin-bottom: 2rem;
}
.checkout-step {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: .25rem;
  opacity: .35;
}
.checkout-step.active { opacity: 1; }
.checkout-step-num {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  border: 2px solid rgba(255,255,255,.3);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: .78rem;
  font-weight: 700;
  letter-spacing: .04em;
  color: rgba(255,255,255,.6);
}
.checkout-step.active .checkout-step-num {
  border-color: #fff;
  color: #fff;
  background: rgba(255,255,255,.08);
}
.checkout-step-label { font-size: .68rem; letter-spacing: .1em; text-transform: uppercase; color: rgba(255,255,255,.5); }
.checkout-step.active .checkout-step-label { color: #fff; }
.checkout-step-divider {
  width: 40px;
  height: 1px;
  background: rgba(255,255,255,.15);
  margin-bottom: 1.2rem;
}

/* ── Header ──────────────────────────────────────────────────────────── */
.checkout-header { text-align: center; margin-bottom: 2rem; }
.checkout-title { font-size: 1.6rem; font-weight: 700; letter-spacing: .08em; color: #fff; }

/* ── Card ────────────────────────────────────────────────────────────── */
.checkout-card {
  background: rgba(255,255,255,.03);
  border: 1px solid rgba(255,255,255,.08);
  border-radius: 12px;
  padding: 1.75rem;
  margin-bottom: 1.25rem;
}
.checkout-card-title {
  font-size: .8rem;
  font-weight: 700;
  letter-spacing: .12em;
  text-transform: uppercase;
  color: rgba(255,255,255,.5);
  margin-bottom: 1.25rem;
}

/* ── Address grid ────────────────────────────────────────────────────── */
.address-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
  gap: .75rem;
}
.address-card {
  position: relative;
  display: flex;
  cursor: pointer;
  border: 1px solid rgba(255,255,255,.1);
  border-radius: 10px;
  padding: 1rem;
  transition: border-color .2s, background .2s;
  overflow: hidden;
  min-height: 100px;
}
.address-card:hover { border-color: rgba(255,255,255,.25); background: rgba(255,255,255,.03); }
.address-card.selected { border-color: rgba(255,255,255,.6); background: rgba(255,255,255,.06); }
.address-radio { position: absolute; opacity: 0; pointer-events: none; }
.address-card-inner {
  display: flex;
  flex-direction: column;
  gap: .2rem;
  flex: 1;
}
.address-alias { font-size: .8rem; font-weight: 700; color: #fff; letter-spacing: .04em; }
.address-line  { font-size: .72rem; color: rgba(255,255,255,.5); line-height: 1.4; }
.address-cp    { font-size: .68rem; color: rgba(255,255,255,.3); margin-top: .2rem; }
.address-check-icon {
  position: absolute;
  top: .6rem; right: .6rem;
  width: 16px; height: 16px;
  color: rgba(255,255,255,.4);
  opacity: 0;
  transition: opacity .2s;
}
.address-card.selected .address-check-icon { opacity: 1; color: #fff; }

/* ── Form ────────────────────────────────────────────────────────────── */
.form-grid-2 { display: grid; grid-template-columns: 1fr 1fr; gap: .75rem; }
@media (max-width: 500px) { .form-grid-2 { grid-template-columns: 1fr; } }
.form-group { display: flex; flex-direction: column; gap: .35rem; margin-bottom: .75rem; }
.form-label { font-size: .72rem; letter-spacing: .08em; text-transform: uppercase; color: rgba(255,255,255,.45); }
.form-input {
  background: rgba(255,255,255,.05);
  border: 1px solid rgba(255,255,255,.1);
  border-radius: 8px;
  padding: .65rem .9rem;
  color: #fff;
  font-size: .88rem;
  outline: none;
  transition: border-color .2s;
}
.form-input:focus { border-color: rgba(255,255,255,.35); }
.form-input::placeholder { color: rgba(255,255,255,.2); }
.form-check {
  display: flex;
  align-items: center;
  gap: .5rem;
  margin-top: .5rem;
  cursor: pointer;
}
.form-check-input {
  width: 15px; height: 15px;
  accent-color: #fff;
  cursor: pointer;
}
.form-check-label { font-size: .78rem; color: rgba(255,255,255,.5); }

/* ── Shipping preview ────────────────────────────────────────────────── */
.shipping-preview .shipping-info {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1rem;
}
.shipping-zone { font-size: .8rem; color: rgba(255,255,255,.6); }
.shipping-cost { font-size: 1.2rem; font-weight: 700; color: #fff; white-space: nowrap; }

/* ── Actions ─────────────────────────────────────────────────────────── */
.checkout-actions {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1rem;
  margin-top: 1.5rem;
  flex-wrap: wrap;
}
.btn-outline-vittorio {
  display: inline-flex;
  align-items: center;
  gap: .4rem;
  padding: .65rem 1.2rem;
  border: 1px solid rgba(255,255,255,.2);
  border-radius: 8px;
  color: rgba(255,255,255,.6);
  font-size: .82rem;
  letter-spacing: .06em;
  text-decoration: none;
  transition: border-color .2s, color .2s;
}
.btn-outline-vittorio:hover { border-color: rgba(255,255,255,.5); color: #fff; }
.btn-outline-vittorio i { width: 14px; height: 14px; }
.btn-primary-vittorio {
  display: inline-flex;
  align-items: center;
  gap: .4rem;
  padding: .75rem 1.5rem;
  background: #fff;
  color: #111;
  border: none;
  border-radius: 8px;
  font-size: .84rem;
  font-weight: 700;
  letter-spacing: .08em;
  cursor: pointer;
  text-decoration: none;
  transition: background .2s, transform .1s;
}
.btn-primary-vittorio:hover { background: rgba(255,255,255,.9); transform: translateY(-1px); }
.btn-primary-vittorio i { width: 14px; height: 14px; }
</style>
@endpush

@push('scripts')
<script>
(function () {
  var COSTO_ENVIO_URL = @json(route('checkout.costo-envio'));

  var addressCards   = document.querySelectorAll('.address-card');
  var nuevaSection   = document.getElementById('nueva-direccion-section');
  var nuevaCard      = document.getElementById('nueva-addr-card');
  var cpInput        = document.getElementById('cp');
  var shippingBox    = document.getElementById('shipping-preview');
  var shippingZone   = document.getElementById('shipping-zone');
  var shippingCost   = document.getElementById('shipping-cost');
  var debounceTimer  = null;

  function selectCard(card) {
    addressCards.forEach(function(c) { c.classList.remove('selected'); });
    card.classList.add('selected');
    card.querySelector('.address-radio').checked = true;
  }

  function showShipping(costo_fmt, zona) {
    shippingZone.textContent = zona;
    shippingCost.textContent = costo_fmt;
    shippingBox.style.display = '';
  }

  function fetchCosto(cp) {
    if (!cp || cp.replace(/\D/g, '').length < 4) {
      shippingBox.style.display = 'none';
      return;
    }
    fetch(COSTO_ENVIO_URL + '?cp=' + encodeURIComponent(cp))
      .then(function(r) { return r.json(); })
      .then(function(data) { showShipping(data.costo_fmt, data.zona); })
      .catch(function() {});
  }

  addressCards.forEach(function(card) {
    card.addEventListener('click', function() {
      selectCard(card);
      if (card === nuevaCard) {
        nuevaSection.style.display = '';
        shippingBox.style.display = 'none';
      } else {
        nuevaSection.style.display = 'none';
        var cp = card.dataset.cp;
        if (cp) fetchCosto(cp);
      }
    });
  });

  if (cpInput) {
    cpInput.addEventListener('input', function() {
      clearTimeout(debounceTimer);
      debounceTimer = setTimeout(function() { fetchCosto(cpInput.value.trim()); }, 450);
    });
  }

  @if(old('cp') && !old('direccion_id'))
    if (nuevaSection) nuevaSection.style.display = '';
    fetchCosto('{{ old('cp') }}');
  @elseif($direcciones->isNotEmpty() && !old('direccion_id') && !old('cp'))
    (function() {
      var first = document.querySelector('.address-card:not(#nueva-addr-card)');
      if (first) { selectCard(first); fetchCosto(first.dataset.cp || ''); }
    })();
  @elseif(old('direccion_id'))
    (function() {
      var sel = document.querySelector('.address-card.selected');
      if (sel && sel !== nuevaCard) fetchCosto(sel.dataset.cp || '');
    })();
  @endif

  if (window.lucide) lucide.createIcons();
})();
</script>
@endpush
