@extends('layout.layout-admin')

@section('title', 'Roles - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container admin-container--roles">

    <div class="admin-header admin-header--with-action">
      <div>
        <h1 class="admin-title">Roles</h1>
        <p class="admin-subtitle">{{ $roles->count() }} roles en el sistema</p>
      </div>
      <a href="{{ route('admin.panel') }}" class="admin-back">
        <i data-lucide="arrow-left"></i> Volver al panel
      </a>
    </div>

    <form action="{{ route('roles.store') }}" method="POST" class="roles-form">
      @csrf
      <div class="roles-input-row">
        <input type="text" name="nombre"
               class="form-input {{ $errors->has('nombre') ? 'is-invalid' : '' }}"
               placeholder="Nombre del rol" value="{{ old('nombre') }}" required />
        <button type="submit" class="btn-vt btn-vt-primary roles-btn-add">Agregar</button>
      </div>
      @error('nombre')<span class="form-error">{{ $message }}</span>@enderror
    </form>

    <div class="admin-table-wrapper admin-table-wrapper--spaced">
      <table class="admin-table">
        <thead>
          <tr><th>#</th><th>Nombre</th><th>Usuarios</th><th></th></tr>
        </thead>
        <tbody>
          @forelse($roles as $rol)
          <tr>
            <td>{{ $rol->id }}</td>
            <td>{{ ucfirst($rol->nombre) }}</td>
            <td>{{ $rol->usuarios->count() }}</td>
            <td>
              <form action="{{ route('roles.destroy', $rol) }}" method="POST"
                    onsubmit="return confirm('¿Eliminar el rol {{ $rol->nombre }}?')">
                @csrf @method('DELETE')
                <button type="submit" class="admin-btn-delete">Eliminar</button>
              </form>
            </td>
          </tr>
          @empty
          <tr><td colspan="4" class="admin-empty">No hay roles creados.</td></tr>
          @endforelse
        </tbody>
      </table>
    </div>

  </div>
</div>
@endsection
