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
    <a href="{{ route('catalogo') }}" class="btn-vt-link">
      <i data-lucide="arrow-left"></i> Volver al catálogo
    </a>
  </div>

  <div class="pd-layout">

    {{-- ── COLUMNA IZQUIERDA: Carrusel de imágenes ── --}}
    <div class="pd-gallery">

      {{-- Carrusel principal --}}
      <div id="productCarousel" class="carousel slide pd-carousel" data-bs-ride="false">

        <div class="carousel-inner">
          @foreach($producto->imagenes as $imagen)
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

            <button type="submit" class="btn-vt btn-vt-primary pd-add-btn">
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
      </div>

    </div>
  </div>

</section>
@endsection

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
