@extends ('layout.layout')

@section ('title', 'Iniciar Sesión - Vittorio')

@section ('content')
<div class="login-page">
  <div class="login-container">
    <div class="login-header">
      <h1 class="login-title">Bienvenido</h1>
      <p class="login-subtitle">Ingresá a tu cuenta Vittorio</p>
    </div>

    @if (session('error'))
      <div class="alert-error">{{ session('error') }}</div>
    @endif

    <form class="login-form" action="{{ url('/login') }}" method="POST">
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

      <div class="form-group">
        <label for="password" class="form-label">Contraseña</label>
        <input
          type="password"
          id="password"
          name="password"
          class="form-input {{ $errors->has('password') ? 'is-invalid' : '' }}"
          placeholder="••••••••"
          required
          minlength="8"
          autocomplete="current-password"
        />
        @error('password')
          <span class="form-error">{{ $message }}</span>
        @enderror
      </div>

      <div class="form-options">
        <label class="checkbox-container">
          <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }} />
          <span class="checkmark"></span>
          <span class="checkbox-label">Recordarme</span>
        </label>
      </div>

      <button type="submit" class="btn-login">Iniciar Sesión</button>
    </form>

    <div class="login-footer">
      <p class="register-text">
        ¿No tenés cuenta?
        <a href="{{ route('registro') }}" class="register-link">Crear cuenta</a>
      </p>
    </div>
  </div>
</div>
@endsection
