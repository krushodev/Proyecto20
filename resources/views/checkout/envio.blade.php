@extends('layout.layout')

@section('title', 'Datos de envío - Vittorio')

@section('content')
<section class="checkout-main">

  <div class="checkout-steps">
    <span class="checkout-step checkout-step-active">1. Envío</span>
    <span class="checkout-step-sep">→</span>
    <span class="checkout-step">2. Pago</span>
    <span class="checkout-step-sep">→</span>
    <span class="checkout-step">3. Confirmación</span>
  </div>

  <div class="checkout-card">
    <h1 class="checkout-title">Datos de envío</h1>
    <p class="checkout-subtitle">¿A dónde enviamos tu pedido?</p>

    <form action="{{ route('checkout.envio.guardar') }}" method="POST" class="checkout-form">
      @csrf

      <div class="form-group">
        <label for="nombre_destinatario" class="form-label">Nombre del destinatario</label>
        <input type="text" id="nombre_destinatario" name="nombre_destinatario"
               class="form-input {{ $errors->has('nombre_destinatario') ? 'is-invalid' : '' }}"
               value="{{ old('nombre_destinatario', auth()->user()->nombre) }}"
               required maxlength="150" />
        @error('nombre_destinatario')<span class="form-error">{{ $message }}</span>@enderror
      </div>

      <div class="checkout-form-row">
        <div class="form-group">
          <label for="calle" class="form-label">Calle</label>
          <input type="text" id="calle" name="calle"
                 class="form-input {{ $errors->has('calle') ? 'is-invalid' : '' }}"
                 value="{{ old('calle') }}" required maxlength="200" />
          @error('calle')<span class="form-error">{{ $message }}</span>@enderror
        </div>
        <div class="form-group" style="max-width:120px">
          <label for="numero" class="form-label">Número</label>
          <input type="text" id="numero" name="numero"
                 class="form-input {{ $errors->has('numero') ? 'is-invalid' : '' }}"
                 value="{{ old('numero') }}" required maxlength="20" />
          @error('numero')<span class="form-error">{{ $message }}</span>@enderror
        </div>
      </div>

      <div class="checkout-form-row">
        <div class="form-group">
          <label for="ciudad" class="form-label">Ciudad</label>
          <input type="text" id="ciudad" name="ciudad"
                 class="form-input {{ $errors->has('ciudad') ? 'is-invalid' : '' }}"
                 value="{{ old('ciudad') }}" required maxlength="100" />
          @error('ciudad')<span class="form-error">{{ $message }}</span>@enderror
        </div>
        <div class="form-group">
          <label for="provincia" class="form-label">Provincia</label>
          <input type="text" id="provincia" name="provincia"
                 class="form-input {{ $errors->has('provincia') ? 'is-invalid' : '' }}"
                 value="{{ old('provincia') }}" required maxlength="100" />
          @error('provincia')<span class="form-error">{{ $message }}</span>@enderror
        </div>
        <div class="form-group" style="max-width:120px">
          <label for="codigo_postal" class="form-label">C. Postal</label>
          <input type="text" id="codigo_postal" name="codigo_postal"
                 class="form-input {{ $errors->has('codigo_postal') ? 'is-invalid' : '' }}"
                 value="{{ old('codigo_postal') }}" required maxlength="20" />
          @error('codigo_postal')<span class="form-error">{{ $message }}</span>@enderror
        </div>
      </div>

      <div class="checkout-actions">
        <a href="{{ route('carrito') }}" class="checkout-back-link">← Volver al carrito</a>
        <button type="submit" class="btn-primary-vittorio">Continuar al pago →</button>
      </div>
    </form>
  </div>

</section>
@endsection

@push('styles')
<style>
.checkout-main { max-width: 600px; margin: 0 auto; padding: 2rem 1.5rem 4rem; }
.checkout-steps {
  display: flex;
  align-items: center;
  gap: .6rem;
  margin-bottom: 2rem;
  font-size: .72rem;
  letter-spacing: .08em;
  text-transform: uppercase;
}
.checkout-step { color: rgba(255,255,255,.3); }
.checkout-step-active { color: #fff; font-weight: 600; }
.checkout-step-sep { color: rgba(255,255,255,.2); }
.checkout-card {
  padding: 2rem;
  border: 1px solid rgba(255,255,255,.08);
  border-radius: 10px;
  background: rgba(255,255,255,.02);
}
.checkout-title { font-size: 1.5rem; font-weight: 700; color: #fff; margin-bottom: .35rem; }
.checkout-subtitle { font-size: .85rem; color: rgba(255,255,255,.45); margin-bottom: 1.75rem; }
.checkout-form { display: flex; flex-direction: column; gap: 1rem; }
.checkout-form-row { display: flex; gap: 1rem; }
.checkout-form-row .form-group { flex: 1; }
.checkout-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: .5rem;
}
.checkout-back-link { font-size: .82rem; color: rgba(255,255,255,.4); text-decoration: none; transition: color .2s; }
.checkout-back-link:hover { color: #fff; }
</style>
@endpush
