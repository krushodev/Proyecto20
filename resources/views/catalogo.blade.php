{{-- 
  ============================================================
  VISTA: catalogo.blade.php
  PROPÓSITO: Catálogo de productos/relojes Vittorio
  DESCRIPCIÓN: Muestra todos los modelos de relojes disponibles
  organizados por categorías. Cada producto incluye imagen,
  nombre y precio. Los datos se obtienen de la variable $catalogo
  pasada desde el controlador.
  ============================================================
--}}
@extends ('layout.layout')

@section ('title', 'Catálogo - Vittorio')

@section ('content')
  <section class="catalog-main">
    <header class="catalog-header">
      <p class="catalog-header-eyebrow">Manufactura Argentina · 1999</p>
      <h1 class="catalog-header-title">Colección <span class="title-accent">2026</span></h1>
      <div class="catalog-header-divider"></div>
      <p class="catalog-header-description">Modelos propios diseñados y ensamblados en nuestro taller argentino. Cada pieza es un manifiesto de precisión, durabilidad y diseño monocromático atemporal.</p>
    </header>

    @foreach($catalogo as $categoria)
      <section class="catalog-category-section" aria-label="{{ $categoria['nombre'] }}">
        <header class="catalog-category-header">
          <h2 class="catalog-category-title">{{ $categoria['nombre'] }}</h2>
          <div class="catalog-category-divider"></div>
        </header>

        <div class="catalog-product-grid">
          @foreach($categoria['modelos'] as $modelo)
            <article class="product-card">
              <div class="product-card-image-wrapper">
                <img
                  src="{{ asset($modelo['imagen_lifestyle']) }}"
                  alt="{{ $modelo['nombre'] }}"
                  class="product-card-image product-card-image-lifestyle"
                  loading="lazy"
                />
                <img
                  src="{{ asset($modelo['imagen_studio']) }}"
                  alt="{{ $modelo['nombre'] }} en estudio"
                  class="product-card-image product-card-image-studio"
                  loading="lazy"
                />
              </div>
              <div class="product-card-info">
                <h3 class="product-card-name">{{ $modelo['nombre'] }}</h3>
                <p class="product-card-price" data-price-usd="{{ $modelo['precio'] }}">US$ {{ number_format($modelo['precio'], 0, ',', '.') }} USD</p>
              </div>
            </article>
          @endforeach
        </div>
      </section>
    @endforeach
  </section>

@endsection
