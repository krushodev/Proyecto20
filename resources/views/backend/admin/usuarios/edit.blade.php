@extends('layout.layout')

@section('title', 'Editar Usuario - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container" style="max-width:520px">

    <div class="admin-header">
      <div>
        <h1 class="admin-title">Editar Usuario</h1>
        <p class="admin-subtitle">{{ $usuario->email }}</p>
      </div>
      <a href="{{ route('usuarios.index') }}" class="admin-back">
        <i data-lucide="arrow-left"></i> Volver
      </a>
    </div>

    <form action="{{ route('usuarios.update', $usuario) }}" method="POST" class="login-form">
      @csrf @method('PUT')

      <div class="form-group">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" id="nombre" name="nombre"
               class="form-input {{ $errors->has('nombre') ? 'is-invalid' : '' }}"
               value="{{ old('nombre', $usuario->nombre) }}" required minlength="2" maxlength="100" />
        @error('nombre')<span class="form-error">{{ $message }}</span>@enderror
      </div>

      <div class="form-group">
        <label for="email" class="form-label">Email</label>
        <input type="email" id="email" name="email"
               class="form-input {{ $errors->has('email') ? 'is-invalid' : '' }}"
               value="{{ old('email', $usuario->email) }}" required />
        @error('email')<span class="form-error">{{ $message }}</span>@enderror
      </div>

      <div class="form-group">
        <label for="rol_id" class="form-label">Rol</label>
        <select id="rol_id" name="rol_id"
                class="form-input {{ $errors->has('rol_id') ? 'is-invalid' : '' }}" required>
          <option value="">Seleccioná un rol</option>
          @foreach($roles as $rol)
            <option value="{{ $rol->id }}" {{ old('rol_id', $usuario->rol_id) == $rol->id ? 'selected' : '' }}>
              {{ ucfirst($rol->nombre) }}
            </option>
          @endforeach
        </select>
        @error('rol_id')<span class="form-error">{{ $message }}</span>@enderror
      </div>

      <button type="submit" class="btn-login">Guardar Cambios</button>
    </form>

  </div>
</div>
@endsection

@push('styles')
<style>
.admin-page { min-height: 100vh; padding: 2rem; background-color: #0a0a0a; }
.admin-container { margin: 0 auto; }
.admin-header {
  display: flex; justify-content: space-between; align-items: flex-start;
  margin-bottom: 2rem; padding-bottom: 1.5rem;
  border-bottom: 1px solid rgba(255,255,255,0.08);
}
.admin-title { font-size: 1.75rem; font-weight: 700; color: #fff; letter-spacing: -0.02em; }
.admin-subtitle { font-size: 0.875rem; color: rgba(255,255,255,0.5); margin-top: 0.25rem; }
.admin-back {
  display: flex; align-items: center; gap: 0.4rem;
  font-size: 0.8rem; color: rgba(255,255,255,0.5); text-decoration: none;
  white-space: nowrap; transition: color 0.2s;
}
.admin-back:hover { color: #fff; }
.admin-back i { width: 14px; height: 14px; }
select.form-input option { background-color: #1a1a1a; color: #fff; }
</style>
@endpush
