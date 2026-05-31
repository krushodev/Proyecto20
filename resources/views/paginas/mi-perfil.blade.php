{{--
  ============================================================
  VISTA: mi-perfil.blade.php
  PROPÓSITO: Edición de datos personales del cliente
  ============================================================
--}}
@extends('layout.layout')

@section('title', 'Mi Perfil - Vittorio')

@section('content')
<section class="perfil-main">

  <header class="cart-header">
    <p class="cart-eyebrow">Cuenta</p>
    <h1 class="cart-title">Mi Perfil</h1>
    <div class="catalog-header-divider"></div>
  </header>

  <div class="perfil-card">

    @if(session('success'))
      <div class="perfil-alert perfil-alert-success">{{ session('success') }}</div>
    @endif

    <form action="{{ route('mi-perfil.actualizar') }}" method="POST" class="perfil-form">
      @csrf
      @method('PUT')

      <div class="perfil-section-title">Datos personales</div>

      <div class="form-group">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" id="nombre" name="nombre"
               class="form-input {{ $errors->has('nombre') ? 'is-invalid' : '' }}"
               value="{{ old('nombre', $usuario->nombre) }}"
               required minlength="2" maxlength="100" />
        @error('nombre')<span class="form-error">{{ $message }}</span>@enderror
      </div>

      <div class="form-group">
        <label for="email" class="form-label">Email</label>
        <input type="email" id="email" name="email"
               class="form-input {{ $errors->has('email') ? 'is-invalid' : '' }}"
               value="{{ old('email', $usuario->email) }}"
               required />
        @error('email')<span class="form-error">{{ $message }}</span>@enderror
      </div>

      <div class="perfil-section-title" style="margin-top:1.75rem">Cambiar contraseña</div>
      <p class="perfil-section-hint">Dejá los campos vacíos si no querés cambiar la contraseña.</p>

      <div class="form-group">
        <label for="password" class="form-label">Nueva contraseña</label>
        <input type="password" id="password" name="password"
               class="form-input {{ $errors->has('password') ? 'is-invalid' : '' }}"
               autocomplete="new-password" minlength="8" />
        @error('password')<span class="form-error">{{ $message }}</span>@enderror
      </div>

      <div class="form-group">
        <label for="password_confirmation" class="form-label">Confirmar contraseña</label>
        <input type="password" id="password_confirmation" name="password_confirmation"
               class="form-input"
               autocomplete="new-password" />
      </div>

      <button type="submit" class="btn-primary-vittorio" style="width:100%;margin-top:.5rem">
        Guardar Cambios
      </button>
    </form>

  </div>

</section>
@endsection

@push('styles')
<style>
.perfil-main {
  min-height: 80vh;
  padding: 7rem 1.5rem 4rem;
}
.perfil-card {
  max-width: 480px;
  margin: 0 auto;
}
.perfil-alert {
  padding: .75rem 1rem;
  border-radius: 6px;
  font-size: .85rem;
  margin-bottom: 1.5rem;
}
.perfil-alert-success {
  background: rgba(74,222,128,.1);
  border: 1px solid rgba(74,222,128,.3);
  color: #4ade80;
}
.perfil-form { display: flex; flex-direction: column; gap: 1rem; }
.perfil-section-title {
  font-size: .68rem;
  font-weight: 700;
  letter-spacing: .12em;
  text-transform: uppercase;
  color: rgba(255,255,255,.35);
  padding-bottom: .5rem;
  border-bottom: 1px solid rgba(255,255,255,.06);
}
.perfil-section-hint {
  font-size: .75rem;
  color: rgba(255,255,255,.3);
  margin: -.25rem 0 .25rem;
}
</style>
@endpush
