@extends ('layout.layout')

@section ('title', 'Catálogo - Vittorio')

@section ('content')
  <main class="catalog-main">
    <header class="catalog-header">
      <h1 class="catalog-header-title">Colección <span class="title-accent">2026</span></h1>
      <div class="catalog-header-divider"></div>
      <p class="catalog-header-description">La intersección entre la ingeniería de precisión suiza y la vanguardia estética. Cada pieza es un manifiesto de durabilidad y diseño monocromático.</p>
    </header>

    @foreach($catalogo as $categoria)
      <section class="catalog-category-section">
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
                />
                <img
                  src="{{ asset($modelo['imagen_studio']) }}"
                  alt="{{ $modelo['nombre'] }} - Studio"
                  class="product-card-image product-card-image-studio"
                />
              </div>
              <div class="product-card-info">
                <h3 class="product-card-name">{{ $modelo['nombre'] }}</h3>
              </div>
            </article>
          @endforeach
        </div>
      </section>
    @endforeach
  </main>

@endsection
