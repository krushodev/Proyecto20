@extends('layout.layout-admin')

@section('title', 'Usuarios - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container admin-container--md2">

    <div class="admin-header admin-header--with-action">
      <div>
        <h1 class="admin-title">Usuarios</h1>
        <p class="admin-subtitle">{{ $usuarios->count() }} usuarios registrados</p>
      </div>
      <div class="admin-header-actions">
        <a href="{{ route('usuarios.create') }}" class="admin-btn-new">
          <i data-lucide="plus"></i> Nuevo Usuario
        </a>
        <a href="{{ route('admin.panel') }}" class="admin-back">
          <i data-lucide="arrow-left"></i> Volver al panel
        </a>
      </div>
    </div>

    <form action="{{ route('usuarios.index') }}" method="GET" class="admin-filters" aria-label="Filtro de usuarios">
      <label for="buscar">
        Buscar
        <input id="buscar" name="buscar" type="search" class="form-input" placeholder="Nombre o email" value="{{ $busqueda ?? '' }}" />
      </label>
      <button type="submit" class="admin-filter-submit">Buscar</button>
    </form>

    <div class="admin-table-wrapper">
      <table class="admin-table">
        <thead>
          <tr><th>#</th><th>Nombre</th><th>Email</th><th>Rol</th><th>Acciones</th></tr>
        </thead>
        <tbody>
          @forelse($usuarios as $usuario)
          <tr>
            <td>{{ $usuario->id }}</td>
            <td>{{ $usuario->nombre }}</td>
            <td>{{ $usuario->email }}</td>
            <td>{{ $usuario->rol?->nombre ?? '—' }}</td>
            <td class="admin-actions">
              <a href="{{ route('usuarios.edit', $usuario) }}" class="admin-btn-edit">Editar</a>
              <form action="{{ route('usuarios.destroy', $usuario) }}" method="POST"
                    onsubmit="return confirm('¿Eliminar a {{ $usuario->nombre }}?')">
                @csrf @method('DELETE')
                <button type="submit" class="admin-btn-delete">Eliminar</button>
              </form>
            </td>
          </tr>
          @empty
          <tr><td colspan="5" class="admin-empty">No hay usuarios registrados.</td></tr>
          @endforelse
        </tbody>
      </table>
    </div>

  </div>
</div>
@endsection
