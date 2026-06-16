{{--
  ============================================================
  VISTA: catalogo.blade.php
  PROPÓSITO: Catálogo de productos/relojes Vittorio
  ============================================================
--}}
@extends ('layout.layout')

@section ('title', 'Catálogo - Vittorio')

@section ('content')
  <section class="catalog-main">
    <header class="catalog-header">
      <div class="catalog-header-left">
        <p class="catalog-header-eyebrow">Manufactura Argentina · 1999</p>
        <h1 class="catalog-header-title">Colección <span class="title-accent">2026</span></h1>
        <div class="catalog-header-divider"></div>
        <p class="catalog-header-description">Modelos propios diseñados y ensamblados en nuestro taller argentino. Cada pieza es un manifiesto de precisión, durabilidad y diseño monocromático atemporal.</p>
      </div>

      <div class="catalog-header-right">
        <form action="{{ route('catalogo') }}" method="GET" class="catalog-filter-form" aria-label="Filtro por línea">
          <select id="linea" name="linea" class="catalog-filter-select" onchange="this.form.submit()">
            <option value="" {{ empty($lineaSlug) ? 'selected' : '' }}>Todas las líneas</option>
            @foreach($lineas as $linea)
              <option value="{{ $linea->slug }}" {{ $lineaSlug === $linea->slug ? 'selected' : '' }}>{{ $linea->nombre }}</option>
            @endforeach
          </select>
        </form>
      </div>
    </header>

    @forelse($categorias as $categoria)
      <section class="catalog-category-section" aria-label="{{ $categoria->nombre }}">
        <header class="catalog-category-header">
          <h2 class="catalog-category-title">{{ $categoria->nombre }}</h2>
          <div class="catalog-category-divider"></div>
        </header>

        <div class="catalog-product-grid">
          @foreach($categoria->productos as $producto)
            @php
              $imgLifestyle = $producto->imagenes->where('tipo', 'lifestyle')->first();
              $imgStudio    = $producto->imagenes->where('tipo', 'studio')->first();
            @endphp
            <article class="product-card">
              <a href="{{ route('detalle-producto', $producto->slug) }}" class="product-card-image-link" aria-label="Ver detalles de {{ $producto->nombre }}">
                <div class="product-card-image-wrapper">
                  @if($imgLifestyle)
                    <img
                      src="{{ $imgLifestyle->url }}"
                      alt="{{ $producto->nombre }}"
                      class="product-card-image product-card-image-lifestyle"
                      loading="lazy"
                    />
                  @endif
                  @if($imgStudio)
                    <img
                      src="{{ $imgStudio->url }}"
                      alt="{{ $producto->nombre }} en estudio"
                      class="product-card-image product-card-image-studio"
                      loading="lazy"
                    />
                  @endif
                </div>
              </a>
              <div class="product-card-info">
                <h3 class="product-card-name">{{ $producto->nombre }}</h3>
                <p class="product-card-price">$ {{ number_format($producto->precio, 0, ',', '.') }} ARS</p>
              </div>
            </article>
          @endforeach
        </div>
      </section>
    @empty
      <p class="catalog-empty-message">
        No hay productos disponibles en este momento.
      </p>
    @endforelse
  </section>
@endsection
