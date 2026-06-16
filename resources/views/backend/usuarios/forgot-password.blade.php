@extends('layout.layout')

@section('title', '¿Olvidaste tu contraseña? - Vittorio')

@section('content')
<div class="login-page">
  <div class="login-container">

    <div class="login-header">
      <h1 class="login-title">Recuperar contraseña</h1>
      <p class="login-subtitle">Te enviaremos un enlace para restablecerla</p>
    </div>

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

      <button type="submit" class="btn-vt btn-vt-primary">Enviar enlace</button>
    </form>

    <div class="login-footer">
      <p class="register-text">
        <a href="{{ route('login') }}" class="register-link">← Volver al inicio de sesión</a>
      </p>
    </div>

  </div>
</div>
@endsection

