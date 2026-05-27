{{--
  ============================================================
  VISTA: detalle-producto.blade.php
  PROPÓSITO: Página de detalle de producto individual
  ============================================================
--}}
@extends ('layout.layout')

@section ('title', $producto['nombre'] . ' - Vittorio')

@section ('content')
  <section class="detail-main">
    <div class="detail-card">
      <div class="detail-top">
        <a href="{{ route('catalogo') }}" class="btn-link-vittorio">← Volver al catálogo</a>
      </div>

      <div class="detail-card">
        <div class="detail-panel">
          <div class="detail-grid">
            <figure class="detail-image-container">
              <div class="detail-image-frame">
                <img src="{{ asset($producto['imagen_studio']) }}" alt="{{ $producto['nombre'] }}" loading="lazy" />
              </div>
            </figure>

            <div class="detail-copy">
              <p class="detail-eyebrow">Colección 2026 · Vittorio</p>
              <h1 class="detail-title">{{ $producto['nombre'] }}</h1>
              <p class="detail-price">US$ {{ number_format($producto['precio'], 0, ',', '.') }} USD</p>
              <p class="detail-description">{{ $producto['descripcion'] }}</p>

              <div class="detail-specs">
                <h2 class="detail-specs-title">Especificaciones</h2>
                <ul>
                  @foreach($producto['especificaciones'] as $clave => $valor)
                    <li><strong>{{ $clave }}:</strong> {{ $valor }}</li>
                  @endforeach
                </ul>
              </div>

              <div class="detail-actions">
                <a href="{{ route('carrito') }}" class="btn-primary-vittorio">Agregar al carrito</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
@endsection
