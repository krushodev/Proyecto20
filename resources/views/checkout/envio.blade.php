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
            <span class="address-card-inner address-card-inner--centered">
              <i data-lucide="plus-circle" class="address-new-icon"></i>
              <span class="address-alias address-alias--muted">Nueva dirección</span>
            </span>
          </label>
        </div>
      </div>
    @endif

    {{-- ── Formulario nueva dirección ────────────────────────── --}}
    <div class="checkout-card {{ $direcciones->isNotEmpty() ? 'is-hidden' : '' }}" id="nueva-direccion-section">
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
    <div class="checkout-card shipping-preview is-hidden" id="shipping-preview">
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
