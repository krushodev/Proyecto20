@extends ('layout.layout')

@section ('title', 'Crear Cuenta - Vittorio')

@section ('content')
<div class="login-page">
  <div class="login-container">
    <div class="login-header">
      <h1 class="login-title">Crear Cuenta</h1>
      <p class="login-subtitle">Registrate en Vittorio</p>
    </div>

    <form class="login-form" action="{{ url('/registro') }}" method="POST">
      @csrf

      <div class="form-group">
        <label for="nombre" class="form-label">Nombre</label>
        <input
          type="text"
          id="nombre"
          name="nombre"
          class="form-input {{ $errors->has('nombre') ? 'is-invalid' : '' }}"
          placeholder="Tu nombre completo"
          value="{{ old('nombre') }}"
          required
          minlength="2"
          maxlength="100"
          autocomplete="name"
        />
        @error('nombre')
          <span class="form-error">{{ $message }}</span>
        @enderror
      </div>

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
          autocomplete="new-password"
        />
        @error('password')
          <span class="form-error">{{ $message }}</span>
        @enderror
      </div>

      <div class="form-group">
        <label for="password_confirmation" class="form-label">Confirmar Contraseña</label>
        <input
          type="password"
          id="password_confirmation"
          name="password_confirmation"
          class="form-input"
          placeholder="••••••••"
          required
          minlength="8"
          autocomplete="new-password"
        />
      </div>

      <button type="submit" class="btn-vt btn-vt-primary">Crear Cuenta</button>
    </form>

    <div class="login-footer">
      <p class="register-text">
        ¿Ya tenés cuenta?
        <a href="{{ route('login') }}" class="register-link">Iniciá sesión</a>
      </p>
    </div>
  </div>
</div>
@endsection
