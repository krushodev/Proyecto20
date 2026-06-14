@extends('layout.layout')

@section('title', 'Mi Perfil - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container" style="max-width:520px">

    <div class="admin-header">
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

      <div class="perfil-section-title" style="margin-top:1.5rem">Cambiar contraseña</div>
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

      <button type="submit" class="btn-login" style="margin-top:.5rem">Guardar Cambios</button>
    </form>

  </div>
</div>
@endsection

@push('styles')
<style>
.admin-page { min-height: 100vh; padding: 2rem; background-color: #0a0a0a; }
.admin-container { margin: 0 auto; }
.admin-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 2rem; padding-bottom: 1.5rem; border-bottom: 1px solid rgba(255,255,255,0.08); }
.admin-title { font-size: 1.75rem; font-weight: 700; color: #fff; letter-spacing: -0.02em; }
.admin-subtitle { font-size: 0.875rem; color: rgba(255,255,255,0.5); margin-top: 0.25rem; }
.admin-back { display: flex; align-items: center; gap: 0.4rem; font-size: 0.8rem; color: rgba(255,255,255,0.5); text-decoration: none; white-space: nowrap; transition: color 0.2s; }
.admin-back:hover { color: #fff; }
.admin-back i { width: 14px; height: 14px; }
.admin-alert-success { padding: .75rem 1rem; background: rgba(74,222,128,.1); border: 1px solid rgba(74,222,128,.3); border-radius: 6px; color: #4ade80; font-size: .85rem; margin-bottom: 1.5rem; }
.perfil-section-title {
  font-size: .68rem;
  font-weight: 700;
  letter-spacing: .12em;
  text-transform: uppercase;
  color: rgba(255,255,255,.35);
  padding-bottom: .5rem;
  border-bottom: 1px solid rgba(255,255,255,.06);
  margin-bottom: .25rem;
}
.perfil-section-hint {
  font-size: .75rem;
  color: rgba(255,255,255,.3);
  margin: 0 0 .5rem;
}
</style>
@endpush
