{{-- 
  ============================================================
  VISTA: login.blade.php
  PROPÓSITO: Página de inicio de sesión de usuarios
  DESCRIPCIÓN: Formulario de autenticación para usuarios
  registrados. Incluye campos de email y contraseña, opción
  de recordarme y enlace a registro de nuevos usuarios.
  ============================================================
--}}
@extends ('layout.layout')

@section ('title', 'Iniciar Sesión - Vittorio')

@section ('content')
<div class="login-page">
  <div class="login-container">
    <div class="login-header">
      <h1 class="login-title">Bienvenido</h1>
      <p class="login-subtitle">Ingresá a tu cuenta Vittorio</p>
    </div>

    <form class="login-form" action="{{ url('/') }}" method="GET">
      <div class="form-group">
        <label for="email" class="form-label">Email</label>
        <input 
          type="email" 
          id="email" 
          name="email" 
          class="form-input" 
          placeholder="tu@email.com" 
          required
        />
      </div>

      <div class="form-group">
        <label for="password" class="form-label">Contraseña</label>
        <input 
          type="password" 
          id="password" 
          name="password" 
          class="form-input" 
          placeholder="••••••••" 
          required
        />
      </div>

      <div class="form-options">
        <label class="checkbox-container">
          <input type="checkbox" name="remember" />
          <span class="checkmark"></span>
          <span class="checkbox-label">Recordarme</span>
        </label>
        <a href="#" class="forgot-link">¿Olvidaste tu contraseña?</a>
      </div>

      <button type="submit" class="btn-login">Iniciar Sesión</button>
    </form>

    <div class="login-footer">
      <p class="register-text">
        ¿No tenés cuenta? 
        <a href="{{ url('/registro') }}" class="register-link">Crear cuenta</a>
      </p>
    </div>
  </div>
</div>
@endsection