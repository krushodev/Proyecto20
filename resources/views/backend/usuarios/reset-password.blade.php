@extends('layout.layout')

@section('title', 'Nueva contraseña - Vittorio')

@section('content')
<div class="login-page">
  <div class="login-container">

    <div class="login-header">
      <h1 class="login-title">Nueva contraseña</h1>
      <p class="login-subtitle">Elegí una contraseña segura para tu cuenta</p>
    </div>

    <form class="login-form" action="{{ route('password.update') }}" method="POST">
      @csrf

      <input type="hidden" name="token" value="{{ $token }}" />

      <div class="form-group">
        <label for="email" class="form-label">Email</label>
        <input
          type="email"
          id="email"
          name="email"
          class="form-input {{ $errors->has('email') ? 'is-invalid' : '' }}"
          placeholder="tu@email.com"
          value="{{ old('email', request()->query('email')) }}"
          required
          autocomplete="email"
        />
        @error('email')
          <span class="form-error">{{ $message }}</span>
        @enderror
      </div>

      <div class="form-group">
        <label for="password" class="form-label">Nueva contraseña</label>
        <input
          type="password"
          id="password"
          name="password"
          class="form-input {{ $errors->has('password') ? 'is-invalid' : '' }}"
          placeholder="Mínimo 8 caracteres"
          required
          minlength="8"
          autocomplete="new-password"
        />
        @error('password')
          <span class="form-error">{{ $message }}</span>
        @enderror
      </div>

      <div class="form-group">
        <label for="password_confirmation" class="form-label">Confirmar contraseña</label>
        <input
          type="password"
          id="password_confirmation"
          name="password_confirmation"
          class="form-input"
          placeholder="Repetí la contraseña"
          required
          minlength="8"
          autocomplete="new-password"
        />
      </div>

      <button type="submit" class="btn-login">Restablecer contraseña</button>
    </form>

  </div>
</div>
@endsection
