{{--
  ============================================================
  PÁGINA: perfil.blade.php
  PROPÓSITO: Mostrar perfil del usuario autenticado
  ============================================================
--}}
@extends('layout.layout')

@section('title', 'Mi Perfil - Vittorio')

@section('content')
<div class="perfil-container">

  {{-- Header --}}
  <div class="perfil-header">
    <h1>Mi Perfil</h1>
    <div class="perfil-header-actions">
      <a href="{{ route('perfil.editar') }}" class="btn btn-perfil-editar">
        <i data-lucide="edit"></i>
        <span>Editar Perfil</span>
      </a>
    </div>
  </div>

  {{-- Información Principal --}}
  <div class="perfil-section">
    <div class="perfil-summary">
      <div class="perfil-summary-card">
        <div class="perfil-avatar-container">
          <div class="perfil-avatar-large">
            {{ strtoupper(substr($usuario->nombre, 0, 1)) }}
          </div>
          <p class="perfil-avatar-name">{{ $usuario->nombre }}</p>
        </div>
      </div>

      <div class="perfil-summary-card perfil-summary-details">
        <div class="perfil-grid">
          <div class="perfil-item">
            <span class="perfil-item-label">Nombre</span>
            <span class="perfil-item-value">{{ $usuario->nombre }}</span>
          </div>
          <div class="perfil-item">
            <span class="perfil-item-label">Email</span>
            <span class="perfil-item-value">{{ $usuario->email }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>

  {{-- ── Métodos de Pago ─────────────────────────────────────────── --}}
  <div class="perfil-section">
    <div class="perfil-metodos-header">
      <h2>Métodos de Pago</h2>
      <button type="button" class="btn-vt btn-vt-outline btn-vt-sm" id="btn-toggle-form-tarjeta">
        <i data-lucide="plus" style="width:14px;height:14px;"></i>
        Agregar tarjeta
      </button>
    </div>

    {{-- Tarjetas guardadas --}}
    @if($tarjetas->isEmpty())
      <p class="perfil-tarjetas-empty">No tenés tarjetas guardadas.</p>
    @else
      <div class="perfil-tarjetas-grid">
        @foreach($tarjetas as $tarjeta)
          <div class="perfil-tarjeta-tile" data-brand="{{ $tarjeta->tipo }}">
            <div class="ptt-face">
              <div class="ptt-chip"></div>
              <div class="ptt-number">•••• •••• •••• {{ $tarjeta->ultimos_cuatro }}</div>
              <div class="ptt-footer">
                <div class="ptt-col">
                  <div class="ptt-label">Titular</div>
                  <div class="ptt-value">{{ $tarjeta->titular }}</div>
                </div>
                <div class="ptt-col">
                  <div class="ptt-label">Vence</div>
                  <div class="ptt-value">{{ $tarjeta->mes_exp }}/{{ $tarjeta->anio_exp }}</div>
                </div>
                <div class="ptt-brand-icon" aria-hidden="true">
                  @include('partes.card-brand-svg', ['tipo' => $tarjeta->tipo])
                </div>
              </div>
            </div>
            <form action="{{ route('perfil.tarjetas.eliminar', $tarjeta) }}" method="POST" class="ptt-delete-form">
              @csrf
              @method('DELETE')
              <button type="submit" class="btn-vt btn-vt-danger btn-vt-sm ptt-delete-btn"
                      onclick="return confirm('¿Eliminar esta tarjeta?')">
                <i data-lucide="trash-2" style="width:13px;height:13px;"></i>
                Eliminar
              </button>
            </form>
          </div>
        @endforeach
      </div>
    @endif

    {{-- Formulario nueva tarjeta (oculto por defecto) --}}
    <div class="perfil-nueva-tarjeta-wrap is-hidden" id="perfil-form-tarjeta">
      <div class="pnt-divider">
        <span class="pnt-divider-label">Nueva tarjeta</span>
      </div>

      <form action="{{ route('perfil.tarjetas.guardar') }}" method="POST" id="form-nueva-tarjeta">
        @csrf

        {{-- Tarjeta animada --}}
        <div class="card-preview-wrap">
          <div class="card-preview" id="perfil-card-preview">
            <div class="card-front">
              <div class="card-chip"></div>
              <div class="card-number-display" id="perfil-card-number-display">•••• •••• •••• ••••</div>
              <div class="card-bottom">
                <div>
                  <div class="card-label">Titular</div>
                  <div class="card-holder-display" id="perfil-card-holder-display">NOMBRE APELLIDO</div>
                </div>
                <div>
                  <div class="card-label">Vence</div>
                  <div class="card-exp-display" id="perfil-card-exp-display">MM/AA</div>
                </div>
                <div class="card-brand" id="perfil-card-brand-wrap">
                  <svg viewBox="0 0 48 48" fill="none" class="card-brand-svg" id="perfil-card-brand-svg">
                    <circle cx="18" cy="24" r="14" fill="rgba(255,255,255,.25)"/>
                    <circle cx="30" cy="24" r="14" fill="rgba(255,255,255,.15)"/>
                  </svg>
                </div>
              </div>
            </div>
          </div>
        </div>

        {{-- Campos --}}
        <div class="form-group">
          <label class="form-label" for="perfil_card_number">Número de tarjeta</label>
          <input type="text" id="perfil_card_number" name="numero_tarjeta"
                 class="form-input @error('numero_tarjeta') is-invalid @enderror"
                 placeholder="0000 0000 0000 0000" maxlength="19"
                 inputmode="numeric" autocomplete="cc-number" />
          @error('numero_tarjeta')
            <span class="invalid-feedback">{{ $message }}</span>
          @enderror
        </div>

        <div class="form-group">
          <label class="form-label" for="perfil_card_holder">Nombre del titular</label>
          <input type="text" id="perfil_card_holder" name="titular_tarjeta"
                 class="form-input @error('titular_tarjeta') is-invalid @enderror"
                 placeholder="Como figura en la tarjeta" autocomplete="cc-name" />
          @error('titular_tarjeta')
            <span class="invalid-feedback">{{ $message }}</span>
          @enderror
        </div>

        <div class="form-grid-2">
          <div class="form-group">
            <label class="form-label" for="perfil_card_exp">Vencimiento</label>
            <input type="text" id="perfil_card_exp" name="vencimiento"
                   class="form-input @error('vencimiento') is-invalid @enderror"
                   placeholder="MM/AA" maxlength="5" inputmode="numeric" autocomplete="cc-exp" />
            @error('vencimiento')
              <span class="invalid-feedback">{{ $message }}</span>
            @enderror
          </div>
          <div class="form-group">
            <label class="form-label" for="perfil_card_cvv">CVV</label>
            <input type="password" id="perfil_card_cvv"
                   class="form-input"
                   placeholder="•••" maxlength="4" inputmode="numeric" autocomplete="cc-csc" />
          </div>
        </div>

        {{-- Campo oculto con el tipo detectado --}}
        <input type="hidden" name="tipo" id="perfil_card_tipo" value="default" />

        <div class="transferencia-nota" style="margin-bottom:1rem;">
          <i data-lucide="shield-check" class="icon-13"></i>
          Solo se guardan los últimos 4 dígitos. El CVV no se almacena.
        </div>

        <div class="pnt-actions">
          <button type="button" class="btn-vt btn-vt-outline btn-vt-sm" id="btn-cancel-tarjeta">
            Cancelar
          </button>
          <button type="submit" class="btn-vt btn-vt-primary btn-vt-sm">
            <i data-lucide="save" style="width:14px;height:14px;"></i>
            Guardar tarjeta
          </button>
        </div>
      </form>
    </div>

  </div>


</div>
@endsection

@push('scripts')
<script>
(function () {

  /* ── Toggle formulario nueva tarjeta ─────────────────────────── */
  var btnToggle  = document.getElementById('btn-toggle-form-tarjeta');
  var formWrap   = document.getElementById('perfil-form-tarjeta');
  var btnCancel  = document.getElementById('btn-cancel-tarjeta');

  function abrirForm() {
    formWrap.classList.remove('is-hidden');
    btnToggle.style.display = 'none';
    aplicarBrand('default');
    formWrap.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
  }
  function cerrarForm() {
    formWrap.classList.add('is-hidden');
    btnToggle.style.display = '';
  }

  if (btnToggle) btnToggle.addEventListener('click', abrirForm);
  if (btnCancel) btnCancel.addEventListener('click', cerrarForm);

  @if($errors->any())
    abrirForm();
  @endif

  /* ── Detección de franquicia ─────────────────────────────────── */
  var BRANDS = {
    visa:       { color1: '#1a1f71', color2: '#0e3d8c', label: 'VISA'       },
    mastercard: { color1: '#1c1c1c', color2: '#3a1a00', label: 'MC'         },
    amex:       { color1: '#007bc1', color2: '#004d7c', label: 'AMEX'       },
    discover:   { color1: '#231f20', color2: '#4d1f00', label: 'DISCOVER'   },
    cabal:      { color1: '#003082', color2: '#0044b3', label: 'CABAL'      },
    naranja:    { color1: '#d64d00', color2: '#f05a00', label: 'NARANJA'    },
    argencard:  { color1: '#002c77', color2: '#0041aa', label: 'ARGENCARD'  },
    default:    { color1: '#1a1a2e', color2: '#0f3460', label: ''           },
  };

  function detectarFranquicia(n) {
    n = n.replace(/\D/g, '');
    if (!n) return 'default';
    if (/^4/.test(n)) return 'visa';
    if (/^5[1-5]/.test(n)) return 'mastercard';
    if (/^2[2-7]/.test(n)) {
      var p = parseInt(n.slice(0, 4), 10);
      if (p >= 2221 && p <= 2720) return 'mastercard';
    }
    if (/^3[47]/.test(n)) return 'amex';
    if (/^6011|^65/.test(n)) return 'discover';
    if (/^589892/.test(n)) return 'argencard';
    if (/^603493|^627170/.test(n)) return 'cabal';
    if (/^589562/.test(n)) return 'naranja';
    return 'default';
  }

  function buildBrandSvg(tipo) {
    if (tipo === 'visa') {
      return '<text x="4" y="32" font-family="Arial Black,Arial,sans-serif" font-size="20" font-weight="900" fill="white" letter-spacing="1">VISA</text>';
    }
    if (tipo === 'mastercard') {
      return '<circle cx="16" cy="24" r="13" fill="#eb001b" opacity=".9"/><circle cx="32" cy="24" r="13" fill="#f79e1b" opacity=".9"/><path d="M24 13.3a13 13 0 0 1 0 21.4A13 13 0 0 1 24 13.3z" fill="#ff5f00" opacity=".9"/>';
    }
    if (tipo === 'amex') {
      return '<text x="2" y="30" font-family="Arial Black,Arial,sans-serif" font-size="16" font-weight="900" fill="white" letter-spacing="0.5">AMEX</text>';
    }
    if (tipo === 'naranja') {
      return '<circle cx="24" cy="24" r="18" fill="#f05a00" opacity=".7"/><text x="24" y="29" font-family="Arial,sans-serif" font-size="11" font-weight="700" fill="white" text-anchor="middle">NARANJA</text>';
    }
    if (tipo === 'cabal') {
      return '<text x="2" y="30" font-family="Arial Black,Arial,sans-serif" font-size="16" font-weight="900" fill="white" letter-spacing="0.5">CABAL</text>';
    }
    return '<circle cx="18" cy="24" r="14" fill="rgba(255,255,255,.25)"/><circle cx="30" cy="24" r="14" fill="rgba(255,255,255,.15)"/>';
  }

  function aplicarBrand(tipo) {
    var brand  = BRANDS[tipo] || BRANDS['default'];
    var preview = document.getElementById('perfil-card-preview');
    var front   = preview ? preview.querySelector('.card-front') : null;
    var svgEl   = document.getElementById('perfil-card-brand-svg');
    var tipoEl  = document.getElementById('perfil_card_tipo');

    if (front) {
      front.style.background = 'linear-gradient(135deg, ' + brand.color1 + ' 0%, ' + brand.color2 + ' 100%)';
    }
    if (svgEl) {
      svgEl.innerHTML = buildBrandSvg(tipo);
    }
    if (tipoEl) tipoEl.value = tipo;
  }

  /* ── Interacción con la tarjeta ─────────────────────────────── */
  var numInput    = document.getElementById('perfil_card_number');
  var holderInput = document.getElementById('perfil_card_holder');
  var expInput    = document.getElementById('perfil_card_exp');
  var numDisp     = document.getElementById('perfil-card-number-display');
  var holderDisp  = document.getElementById('perfil-card-holder-display');
  var expDisp     = document.getElementById('perfil-card-exp-display');

  if (numInput) {
    numInput.addEventListener('input', function () {
      var v   = this.value.replace(/\D/g, '').slice(0, 16);
      var fmt = v.replace(/(.{4})/g, '$1 ').trim();
      this.value = fmt;
      var padded = v.padEnd(16, '•');
      numDisp.textContent = padded.replace(/(.{4})/g, '$1 ').trim();
      aplicarBrand(detectarFranquicia(v));
    });
  }

  if (holderInput) {
    holderInput.addEventListener('input', function () {
      holderDisp.textContent = this.value.toUpperCase() || 'NOMBRE APELLIDO';
    });
  }

  if (expInput) {
    expInput.addEventListener('input', function () {
      var v = this.value.replace(/\D/g, '').slice(0, 4);
      if (v.length >= 3) v = v.slice(0, 2) + '/' + v.slice(2);
      this.value = v;
      expDisp.textContent = v || 'MM/AA';
    });
  }

  if (window.lucide) lucide.createIcons();

})();
</script>
@endpush
