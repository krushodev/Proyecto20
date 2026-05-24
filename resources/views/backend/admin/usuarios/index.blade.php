@extends('layout.layout')

@section('title', 'Usuarios - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container">

    <div class="admin-header">
      <div>
        <h1 class="admin-title">Usuarios</h1>
        <p class="admin-subtitle">{{ $usuarios->count() }} usuarios registrados</p>
      </div>
      <a href="{{ route('admin.panel') }}" class="admin-back">
        <i data-lucide="arrow-left"></i> Volver al panel
      </a>
    </div>

    <div class="admin-table-wrapper">
      <table class="admin-table">
        <thead>
          <tr>
            <th>#</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>Rol</th>
            <th>Acciones</th>
          </tr>
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
          <tr>
            <td colspan="5" class="admin-empty">No hay usuarios registrados.</td>
          </tr>
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
.admin-container { max-width: 960px; margin: 0 auto; }
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
  transition: color 0.2s;
}
.admin-back:hover { color: #fff; }
.admin-back i { width: 14px; height: 14px; }
.admin-table-wrapper { overflow-x: auto; }
.admin-table { width: 100%; border-collapse: collapse; font-size: 0.875rem; }
.admin-table th {
  text-align: left; padding: 0.75rem 1rem;
  font-size: 0.7rem; font-weight: 600; letter-spacing: 0.08em; text-transform: uppercase;
  color: rgba(255,255,255,0.4); border-bottom: 1px solid rgba(255,255,255,0.08);
}
.admin-table td {
  padding: 0.875rem 1rem; color: rgba(255,255,255,0.8);
  border-bottom: 1px solid rgba(255,255,255,0.05);
}
.admin-table tr:hover td { background-color: rgba(255,255,255,0.02); }
.admin-actions { display: flex; gap: 0.5rem; align-items: center; }
.admin-btn-edit, .admin-btn-delete {
  padding: 0.35rem 0.75rem; font-size: 0.75rem; font-weight: 600;
  letter-spacing: 0.05em; cursor: pointer; border: 1px solid; border-radius: 4px;
  text-decoration: none; background: none; transition: all 0.2s;
}
.admin-btn-edit { color: rgba(255,255,255,0.7); border-color: rgba(255,255,255,0.2); }
.admin-btn-edit:hover { color: #fff; border-color: #fff; }
.admin-btn-delete { color: #ff6b6b; border-color: rgba(255,107,107,0.3); }
.admin-btn-delete:hover { background-color: rgba(255,107,107,0.1); }
.admin-empty { text-align: center; color: rgba(255,255,255,0.3); padding: 2rem; }
</style>
@endpush
