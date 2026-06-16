@extends('layout.layout-admin')

@section('title', 'Mi Perfil - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container admin-container--sm">

    <div class="admin-header admin-header--with-action">
      <div>
        <h1 class="admin-title">Mi Perfil</h1>
        <p class="admin-subtitle">{{ $usuario->email }}</p>
      </div>
      <a href="{{ route('admin.panel') }}" class="admin-back">
        <i data-lucide="arrow-left"></i> Volver al panel
      </a>
    </div>

    <form action="{{ route('admin.perfil.actualizar') }}" method="POST" class="login-form">
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

      <div class="perfil-section-title perfil-section-title--spaced">Cambiar contraseña</div>
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

      <button type="submit" class="btn-vt btn-vt-primary btn-login--spaced">Guardar Cambios</button>
    </form>

  </div>
</div>
@endsection
