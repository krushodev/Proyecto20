@extends('layout.layout')

@section('title', 'Editar Usuario - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container admin-container--sm">

    <div class="admin-header admin-header--with-action">
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
