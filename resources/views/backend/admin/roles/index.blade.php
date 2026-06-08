@extends('layout.layout')

@section('title', 'Roles - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container" style="max-width:600px">

    <div class="admin-header">
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
        <button type="submit" class="btn-login" style="width:auto;padding:1rem 1.5rem">Agregar</button>
      </div>
      @error('nombre')<span class="form-error">{{ $message }}</span>@enderror
    </form>

    <div class="admin-table-wrapper" style="margin-top:2rem">
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
.roles-form { margin-bottom: 0.5rem; }
.roles-input-row { display: flex; gap: 0.75rem; align-items: flex-start; }
.roles-input-row .form-input { flex: 1; }
.admin-table-wrapper { overflow-x: auto; }
.admin-table { width: 100%; border-collapse: collapse; font-size: 0.875rem; }
.admin-table th { text-align: left; padding: 0.75rem 1rem; font-size: 0.7rem; font-weight: 600; letter-spacing: 0.08em; text-transform: uppercase; color: rgba(255,255,255,0.4); border-bottom: 1px solid rgba(255,255,255,0.08); }
.admin-table td { padding: 0.875rem 1rem; color: rgba(255,255,255,0.8); border-bottom: 1px solid rgba(255,255,255,0.05); }
.admin-btn-delete { padding: 0.35rem 0.75rem; font-size: 0.75rem; font-weight: 600; cursor: pointer; border: 1px solid rgba(255,107,107,0.3); border-radius: 4px; background: none; color: #ff6b6b; transition: all 0.2s; }
.admin-btn-delete:hover { background-color: rgba(255,107,107,0.1); }
.admin-empty { text-align: center; color: rgba(255,255,255,0.3); padding: 2rem; }
</style>
@endpush
