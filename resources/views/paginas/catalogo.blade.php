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
        <form action="{{ route('catalogo') }}" method="GET" class="catalog-filter-form" aria-label="Filtro del catálogo">
          <div class="catalog-filter-row">
            <div class="catalog-filter-group">
              <label for="linea" class="catalog-filter-label">Línea</label>
              <select id="linea" name="linea" class="form-input catalog-filter-select" onchange="this.form.submit()">
                <option value="" {{ empty($lineaSlug) ? 'selected' : '' }}>Todas las líneas</option>
                @foreach($lineas as $linea)
                  <option value="{{ $linea->slug }}" {{ $lineaSlug === $linea->slug ? 'selected' : '' }}>{{ $linea->nombre }}</option>
                @endforeach
              </select>
            </div>

            <div class="catalog-filter-group">
              <label for="precio" class="catalog-filter-label">Precio</label>
              <select id="precio" name="precio" class="form-input catalog-filter-select" onchange="this.form.submit()">
                <option value="" {{ empty($precio) ? 'selected' : '' }}>Todos los precios</option>
                <option value="low" {{ ($precio ?? '') === 'low' ? 'selected' : '' }}>Hasta $150.000</option>
                <option value="mid" {{ ($precio ?? '') === 'mid' ? 'selected' : '' }}>$150.001 - $300.000</option>
                <option value="high" {{ ($precio ?? '') === 'high' ? 'selected' : '' }}>Más de $300.000</option>
              </select>
            </div>

            <div class="catalog-filter-group">
              <label for="stock" class="catalog-filter-label">Disponibilidad</label>
              <select id="stock" name="stock" class="form-input catalog-filter-select" onchange="this.form.submit()">
                <option value="" {{ empty($stock) ? 'selected' : '' }}>Todas</option>
                <option value="en_stock" {{ ($stock ?? '') === 'en_stock' ? 'selected' : '' }}>En stock</option>
                <option value="agotado" {{ ($stock ?? '') === 'agotado' ? 'selected' : '' }}>Agotados</option>
              </select>
            </div>
          </div>
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
