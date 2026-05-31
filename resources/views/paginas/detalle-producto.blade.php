{{--
  ============================================================
  VISTA: detalle-producto.blade.php
  PROPÓSITO: Página de detalle de producto individual
  ============================================================
--}}
@extends ('layout.layout')

@section ('title', $producto->nombre . ' - Vittorio')

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
                <img src="{{ $producto->imagen_studio }}" alt="{{ $producto->nombre }}" loading="lazy" />
              </div>
            </figure>

            <div class="detail-copy">
              <p class="detail-eyebrow">{{ $producto->categoria->nombre }} · Vittorio</p>
              <h1 class="detail-title">{{ $producto->nombre }}</h1>
              <p class="detail-price">$ {{ number_format($producto->precio, 0, ',', '.') }} ARS</p>
              <p class="detail-description">{{ $producto->descripcion }}</p>

              <div class="detail-specs">
                <h2 class="detail-specs-title">Especificaciones</h2>
                <ul>
                  @php
                    $specs = [
                      'Caja'        => $producto->caja,
                      'Movimiento'  => $producto->movimiento,
                      'Cristal'     => $producto->cristal,
                      'Resistencia' => $producto->resistencia,
                      'Correa'      => $producto->correa,
                    ];
                  @endphp
                  @foreach($specs as $label => $value)
                    @if($value)
                      <li><strong>{{ $label }}:</strong> {{ $value }}</li>
                    @endif
                  @endforeach
                </ul>
              </div>

              <div class="detail-actions">
                @auth
                  @if($producto->stock > 0)
                    <form action="{{ route('carrito.agregar') }}" method="POST" class="detail-add-form">
                      @csrf
                      <input type="hidden" name="producto_id" value="{{ $producto->id }}" />
                      <div class="detail-qty-row">
                        <input
                          type="number"
                          name="cantidad"
                          value="1"
                          min="1"
                          max="{{ $producto->stock }}"
                          class="form-input detail-qty-input"
                          aria-label="Cantidad"
                        />
                        <button type="submit" class="btn-primary-vittorio">Agregar al carrito</button>
                      </div>
                      @if($errors->has('stock'))
                        <p class="form-error" style="margin-top:.5rem">{{ $errors->first('stock') }}</p>
                      @endif
                    </form>
                  @else
                    <p class="detail-out-of-stock">Sin stock disponible</p>
                  @endif
                @else
                  <a href="{{ route('login') }}" class="btn-primary-vittorio">Iniciar sesión para comprar</a>
                @endauth
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
@endsection

@push('styles')
<style>
.detail-add-form { width: 100%; }
.detail-qty-row {
  display: flex;
  gap: .75rem;
  align-items: center;
  flex-wrap: wrap;
}
.detail-qty-input {
  width: 72px;
  padding: .6rem .75rem;
  text-align: center;
  -moz-appearance: textfield;
}
.detail-qty-input::-webkit-outer-spin-button,
.detail-qty-input::-webkit-inner-spin-button { -webkit-appearance: none; }
.detail-out-of-stock {
  font-size: .8rem;
  letter-spacing: .15em;
  text-transform: uppercase;
  color: rgba(255,107,107,.8);
}
</style>
@endpush
