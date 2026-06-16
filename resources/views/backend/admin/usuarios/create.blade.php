@extends('layout.layout-admin')

@section('title', 'Nuevo Usuario - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container admin-container--sm">

    <div class="admin-header admin-header--with-action">
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

      <button type="submit" class="btn-vt btn-vt-primary">Crear Usuario</button>
    </form>

  </div>
</div>
@endsection
