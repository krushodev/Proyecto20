{{--
  ============================================================
  VISTA: detalle-producto.blade.php
  PROPÓSITO: Página de detalle de producto individual
  ============================================================
--}}
@extends ('layout.layout')

@section ('title', $producto->nombre . ' - Vittorio')

@section ('content')
<section class="pd-main">

  <div class="pd-back-row">
    <a href="{{ route('catalogo') }}" class="btn-link-vittorio">
      <i data-lucide="arrow-left"></i> Volver al catálogo
    </a>
  </div>

  <div class="pd-layout">

    {{-- ── COLUMNA IZQUIERDA: Carrusel de imágenes ── --}}
    <div class="pd-gallery">

      {{-- Carrusel principal --}}
      <div id="productCarousel" class="carousel slide pd-carousel" data-bs-ride="false">

        <div class="carousel-inner">
          @foreach($producto->imagenes as $loop->iteration => $imagen)
            <div class="carousel-item {{ $loop->first ? 'active' : '' }}">
              <img src="{{ $imagen->url }}"
                   class="pd-carousel-img"
                   alt="{{ $producto->nombre }} — {{ $imagen->tipo }}" />
            </div>
          @endforeach
        </div>

        @if($producto->imagenes->count() > 1)
          <button class="carousel-control-prev pd-carousel-ctrl" type="button"
                  data-bs-target="#productCarousel" data-bs-slide="prev">
            <i data-lucide="chevron-left"></i>
          </button>
          <button class="carousel-control-next pd-carousel-ctrl" type="button"
                  data-bs-target="#productCarousel" data-bs-slide="next">
            <i data-lucide="chevron-right"></i>
          </button>
        @endif
      </div>

      {{-- Thumbnails de navegación --}}
      @if($producto->imagenes->count() > 1)
        <div class="pd-thumbs">
          @foreach($producto->imagenes as $i => $imagen)
            <button type="button"
                    class="pd-thumb {{ $loop->first ? 'active' : '' }}"
                    data-bs-target="#productCarousel"
                    data-bs-slide-to="{{ $i }}"
                    aria-label="Ver {{ $imagen->tipo }}">
              <img src="{{ $imagen->url }}" alt="{{ ucfirst($imagen->tipo) }}" />
            </button>
          @endforeach
        </div>
      @endif

    </div>

    {{-- ── COLUMNA DERECHA: Información del producto ── --}}
    <div class="pd-copy">

      <p class="pd-eyebrow">
        <span>{{ $producto->categoria->nombre }}</span>
        <span class="pd-eyebrow-sep">·</span>
        <span>Vittorio</span>
      </p>

      <h1 class="pd-title">{{ $producto->nombre }}</h1>

      <p class="pd-price">$ {{ number_format($producto->precio, 0, ',', '.') }} <span class="pd-currency">ARS</span></p>

      @if($producto->descripcion)
        <p class="pd-description">{{ $producto->descripcion }}</p>
      @endif

      {{-- Especificaciones --}}
      @php
        $specs = array_filter([
          'Caja'        => $producto->caja,
          'Movimiento'  => $producto->movimiento,
          'Cristal'     => $producto->cristal,
          'Resistencia' => $producto->resistencia,
          'Correa'      => $producto->correa,
        ]);
      @endphp

      @if(!empty($specs))
        <div class="pd-specs">
          <h2 class="pd-specs-title">Especificaciones</h2>
          <dl class="pd-specs-list">
            @foreach($specs as $label => $value)
              <div class="pd-spec-row">
                <dt>{{ $label }}</dt>
                <dd>{{ $value }}</dd>
              </div>
            @endforeach
          </dl>
        </div>
      @endif

      {{-- Acciones --}}
      <div class="pd-actions">
        @auth
          @if($producto->stock > 0)

            <p class="pd-stock-label">
              <i data-lucide="package"></i>
              {{ $producto->stock }} {{ $producto->stock === 1 ? 'unidad disponible' : 'unidades disponibles' }}
            </p>

            <form action="{{ route('carrito.agregar') }}" method="POST" class="pd-add-form">
              @csrf
              <input type="hidden" name="producto_id" value="{{ $producto->id }}" />

              {{-- Stepper +/− --}}
              <div class="pd-stepper">
                <button type="button" class="pd-stepper-btn" id="qty-minus" aria-label="Disminuir cantidad">
                  <i data-lucide="minus"></i>
                </button>
                <span class="pd-stepper-display" id="qty-display" aria-live="polite">1</span>
                <button type="button" class="pd-stepper-btn" id="qty-plus" aria-label="Aumentar cantidad">
                  <i data-lucide="plus"></i>
                </button>
                <input type="hidden" name="cantidad" id="qty-input" value="1" />
              </div>

              @if($errors->has('stock'))
                <p class="form-error">{{ $errors->first('stock') }}</p>
              @endif

              <button type="submit" class="btn-primary-vittorio pd-add-btn">
                <i data-lucide="shopping-cart"></i>
                Agregar al carrito
              </button>
            </form>

          @else
            <p class="pd-out-of-stock">
              <i data-lucide="x-circle"></i>
              Sin stock disponible
            </p>
          @endif
        @else
          <a href="{{ route('login') }}" class="btn-primary-vittorio pd-add-btn">
            <i data-lucide="user"></i>
            Iniciar sesión para comprar
          </a>
        @endauth
      </div>

    </div>
  </div>

</section>
@endsection

@push('styles')
<style>
/* ── Layout principal ── */
.pd-main {
  max-width: 1100px;
  margin: 0 auto;
  padding: 2rem 1.5rem 4rem;
}
.pd-back-row {
  margin-bottom: 2rem;
}
.pd-back-row .btn-link-vittorio {
  display: inline-flex;
  align-items: center;
  gap: .4rem;
}
.pd-back-row i { width: 14px; height: 14px; }

.pd-layout {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  align-items: start;
}
@media (max-width: 768px) {
  .pd-layout { grid-template-columns: 1fr; gap: 2.5rem; }
}

/* ── Galería / Carrusel ── */
.pd-gallery { position: sticky; top: 90px; }

.pd-carousel {
  border-radius: 10px;
  overflow: hidden;
  background: #0e0e0e;
  border: 1px solid rgba(255,255,255,.07);
}
.pd-carousel-img {
  width: 100%;
  aspect-ratio: 1 / 1;
  object-fit: cover;
  display: block;
}
.pd-carousel-ctrl {
  width: 40px;
  height: 40px;
  background: rgba(0,0,0,.55);
  border-radius: 50%;
  top: 50%;
  transform: translateY(-50%);
  border: 1px solid rgba(255,255,255,.15);
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 1;
}
.pd-carousel-ctrl:hover { background: rgba(0,0,0,.8); }
.pd-carousel-ctrl i { width: 18px; height: 18px; color: #fff; }
.carousel-control-prev.pd-carousel-ctrl { left: .75rem; }
.carousel-control-next.pd-carousel-ctrl { right: .75rem; }
.pd-carousel-ctrl .carousel-control-prev-icon,
.pd-carousel-ctrl .carousel-control-next-icon { display: none; }

/* Thumbnails */
.pd-thumbs {
  display: flex;
  gap: .6rem;
  margin-top: .75rem;
}
.pd-thumb {
  flex: 1;
  border: 2px solid rgba(255,255,255,.1);
  border-radius: 6px;
  overflow: hidden;
  cursor: pointer;
  padding: 0;
  background: none;
  transition: border-color .2s;
  aspect-ratio: 1 / 1;
}
.pd-thumb img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}
.pd-thumb.active,
.pd-thumb:hover { border-color: rgba(255,255,255,.6); }

/* ── Columna de información ── */
.pd-eyebrow {
  display: flex;
  align-items: center;
  gap: .4rem;
  font-size: .7rem;
  font-weight: 600;
  letter-spacing: .15em;
  text-transform: uppercase;
  color: rgba(255,255,255,.4);
  margin-bottom: .75rem;
}
.pd-eyebrow-sep { opacity: .3; }

.pd-title {
  font-size: clamp(1.6rem, 3vw, 2.25rem);
  font-weight: 700;
  letter-spacing: -.03em;
  color: #fff;
  margin-bottom: .75rem;
  line-height: 1.15;
}

.pd-price {
  font-size: 1.6rem;
  font-weight: 700;
  color: #fff;
  margin-bottom: 1.25rem;
}
.pd-currency {
  font-size: .9rem;
  font-weight: 400;
  color: rgba(255,255,255,.4);
}

.pd-description {
  font-size: .9rem;
  color: rgba(255,255,255,.55);
  line-height: 1.65;
  margin-bottom: 1.75rem;
}

/* Especificaciones */
.pd-specs { margin-bottom: 2rem; }
.pd-specs-title {
  font-size: .68rem;
  font-weight: 600;
  letter-spacing: .12em;
  text-transform: uppercase;
  color: rgba(255,255,255,.3);
  margin-bottom: .85rem;
}
.pd-specs-list { margin: 0; padding: 0; }
.pd-spec-row {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  gap: 1rem;
  padding: .55rem 0;
  border-bottom: 1px solid rgba(255,255,255,.05);
}
.pd-spec-row:last-child { border-bottom: none; }
.pd-spec-row dt {
  font-size: .8rem;
  color: rgba(255,255,255,.4);
  font-weight: 400;
  white-space: nowrap;
}
.pd-spec-row dd {
  font-size: .82rem;
  color: rgba(255,255,255,.8);
  font-weight: 500;
  text-align: right;
  margin: 0;
}

/* Acciones */
.pd-actions { display: flex; flex-direction: column; gap: 1rem; }

.pd-stock-label {
  display: flex;
  align-items: center;
  gap: .45rem;
  font-size: .78rem;
  color: rgba(255,255,255,.4);
}
.pd-stock-label i { width: 14px; height: 14px; }

/* Stepper +/− */
.pd-add-form { display: flex; flex-direction: column; gap: .75rem; }

.pd-stepper {
  display: inline-flex;
  align-items: center;
  border: 1px solid rgba(255,255,255,.15);
  border-radius: 6px;
  overflow: hidden;
  width: fit-content;
}
.pd-stepper-btn {
  width: 42px;
  height: 42px;
  background: none;
  border: none;
  color: rgba(255,255,255,.7);
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background .2s, color .2s;
}
.pd-stepper-btn:hover:not(:disabled) {
  background: rgba(255,255,255,.08);
  color: #fff;
}
.pd-stepper-btn:disabled { opacity: .3; cursor: not-allowed; }
.pd-stepper-btn i { width: 15px; height: 15px; }

.pd-stepper-display {
  min-width: 44px;
  text-align: center;
  font-size: .95rem;
  font-weight: 600;
  color: #fff;
  border-left: 1px solid rgba(255,255,255,.1);
  border-right: 1px solid rgba(255,255,255,.1);
  padding: 0 .5rem;
  line-height: 42px;
}

/* Botón agregar */
.pd-add-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: .6rem;
  width: 100%;
}
.pd-add-btn i { width: 16px; height: 16px; }

.pd-out-of-stock {
  display: flex;
  align-items: center;
  gap: .5rem;
  font-size: .8rem;
  letter-spacing: .12em;
  text-transform: uppercase;
  color: rgba(255,107,107,.8);
}
.pd-out-of-stock i { width: 16px; height: 16px; }
</style>
@endpush

@push('scripts')
<script>
(function () {
  const stock   = {{ $producto->stock ?? 0 }};
  const input   = document.getElementById('qty-input');
  const display = document.getElementById('qty-display');
  const btnMinus = document.getElementById('qty-minus');
  const btnPlus  = document.getElementById('qty-plus');

  if (!input) return;

  function update(val) {
    val = Math.max(1, Math.min(stock, val));
    input.value    = val;
    display.textContent = val;
    btnMinus.disabled = val <= 1;
    btnPlus.disabled  = val >= stock;
  }

  update(1);

  btnMinus.addEventListener('click', () => update(parseInt(input.value) - 1));
  btnPlus.addEventListener('click',  () => update(parseInt(input.value) + 1));

  // Sync thumbnails with carousel
  const carousel = document.getElementById('productCarousel');
  const thumbs   = document.querySelectorAll('.pd-thumb');

  if (carousel && thumbs.length) {
    carousel.addEventListener('slide.bs.carousel', function (e) {
      thumbs.forEach((t, i) => t.classList.toggle('active', i === e.to));
    });
  }
})();
</script>
@endpush
