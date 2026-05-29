{{--
  ============================================================
  VISTA: detalle-compra.blade.php
  PROPÓSITO: Confirmación de compra exitosa
  ============================================================
--}}
@extends ('layout.layout')

@section ('title', 'Compra Confirmada - Vittorio')

@section ('content')
<section class="dc-main">

  @if($venta)

    <header class="dc-header">
      <div class="dc-check-icon">
        <i data-lucide="check-circle"></i>
      </div>
      <h1 class="dc-title">Compra Confirmada</h1>
      <p class="dc-meta">
        Pedido #{{ $venta->id }}
        &nbsp;·&nbsp;
        {{ $venta->fecha_venta->format('d/m/Y \a \l\a\s H:i') }}
      </p>
    </header>

    <div class="dc-card">
      <h2 class="dc-card-title">Detalle del Pedido</h2>

      <div class="dc-items">
        @foreach($venta->detalles as $detalle)
          <div class="dc-item">
            <div class="dc-item-image">
              <img src="{{ $detalle->producto->imagen_studio }}" alt="{{ $detalle->producto->nombre }}" loading="lazy" />
            </div>
            <div class="dc-item-info">
              <p class="dc-item-name">{{ $detalle->producto->nombre }}</p>
              <p class="dc-item-qty">Cantidad: {{ $detalle->cantidad }}</p>
            </div>
            <p class="dc-item-subtotal" data-price-usd="{{ $detalle->subtotal }}">
              US$ {{ number_format($detalle->subtotal, 0, ',', '.') }}
            </p>
          </div>
        @endforeach
      </div>

      <div class="dc-total-row">
        <span class="dc-total-label">Total Pagado</span>
        <span class="dc-total-amount" data-price-usd="{{ $venta->total }}">
          US$ {{ number_format($venta->total, 0, ',', '.') }}
        </span>
      </div>
    </div>

    <div class="dc-actions">
      <a href="{{ route('catalogo') }}" class="btn-primary-vittorio">Seguir Comprando</a>
    </div>

  @else

    <div class="dc-empty">
      <i data-lucide="package-open" class="dc-empty-icon"></i>
      <p class="dc-empty-text">No hay ningún pedido reciente.</p>
      <a href="{{ route('carrito') }}" class="btn-link-vittorio">Ver mi carrito</a>
    </div>

  @endif

</section>
@endsection
