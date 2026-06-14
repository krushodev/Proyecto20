@extends('layout.layout')

@section('title', 'Nuevo Usuario - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container" style="max-width:520px">

    <div class="admin-header">
      <div>
        <h1 class="admin-title">Nuevo Usuario</h1>
        <p class="admin-subtitle">Completá los datos para crear la cuenta.</p>
      </div>
      <a href="{{ route('usuarios.index') }}" class="admin-back">
        <i data-lucide="arrow-left"></i> Volver
      </a>
    </div>

    <form action="{{ route('usuarios.store') }}" method="POST" class="login-form">
      @csrf

      <div class="form-group">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" id="nombre" name="nombre"
               class="form-input {{ $errors->has('nombre') ? 'is-invalid' : '' }}"
               value="{{ old('nombre') }}" required minlength="2" maxlength="100" />
        @error('nombre')<span class="form-error">{{ $message }}</span>@enderror
      </div>

      <div class="form-group">
        <label for="email" class="form-label">Email</label>
        <input type="email" id="email" name="email"
               class="form-input {{ $errors->has('email') ? 'is-invalid' : '' }}"
               value="{{ old('email') }}" required />
        @error('email')<span class="form-error">{{ $message }}</span>@enderror
      </div>

      <div class="form-group">
        <label for="password" class="form-label">Contraseña</label>
        <input type="password" id="password" name="password"
               class="form-input {{ $errors->has('password') ? 'is-invalid' : '' }}"
               required minlength="8" />
        @error('password')<span class="form-error">{{ $message }}</span>@enderror
      </div>

      <div class="form-group">
        <label for="password_confirmation" class="form-label">Confirmar Contraseña</label>
        <input type="password" id="password_confirmation" name="password_confirmation"
               class="form-input" required minlength="8" />
      </div>

      <div class="form-group">
        <label for="rol_id" class="form-label">Rol</label>
        <select id="rol_id" name="rol_id"
                class="form-input {{ $errors->has('rol_id') ? 'is-invalid' : '' }}" required>
          <option value="">Seleccioná un rol</option>
          @foreach($roles as $rol)
            <option value="{{ $rol->id }}" {{ old('rol_id') == $rol->id ? 'selected' : '' }}>
              {{ ucfirst($rol->nombre) }}
            </option>
          @endforeach
        </select>
        @error('rol_id')<span class="form-error">{{ $message }}</span>@enderror
      </div>

      <button type="submit" class="btn-login">Crear Usuario</button>
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
select.form-input option { background-color: #1a1a1a; color: #fff; }
</style>
@endpush
