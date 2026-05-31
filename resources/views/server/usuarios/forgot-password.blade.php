@extends('layout.layout')

@section('title', '¿Olvidaste tu contraseña? - Vittorio')

@section('content')
<div class="login-page">
  <div class="login-container">

    <div class="login-header">
      <h1 class="login-title">Recuperar contraseña</h1>
      <p class="login-subtitle">Te enviaremos un enlace para restablecerla</p>
    </div>

    @if(session('status'))
      <div class="alert-success-vittorio">{{ session('status') }}</div>
    @endif

    <form class="login-form" action="{{ route('password.email') }}" method="POST">
      @csrf

      <div class="form-group">
        <label for="email" class="form-label">Email</label>
        <input
          type="email"
          id="email"
          name="email"
          class="form-input {{ $errors->has('email') ? 'is-invalid' : '' }}"
          placeholder="tu@email.com"
          value="{{ old('email') }}"
          required
          autocomplete="email"
        />
        @error('email')
          <span class="form-error">{{ $message }}</span>
        @enderror
      </div>

      <button type="submit" class="btn-login">Enviar enlace</button>
    </form>

    <div class="login-footer">
      <p class="register-text">
        <a href="{{ route('login') }}" class="register-link">← Volver al inicio de sesión</a>
      </p>
    </div>

  </div>
</div>
@endsection

@push('styles')
<style>
.alert-success-vittorio {
  padding: .75rem 1rem;
  background: rgba(74,222,128,.1);
  border: 1px solid rgba(74,222,128,.3);
  border-radius: 6px;
  color: #4ade80;
  font-size: .85rem;
  margin-bottom: 1.25rem;
}
</style>
@endpush
