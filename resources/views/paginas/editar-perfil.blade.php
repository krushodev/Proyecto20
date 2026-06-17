@extends('layout.layout')

@section('title', 'Editar Perfil - Vittorio')

@section('content')
<div class="editar-perfil-container">
  <div class="perfil-header">
    <h1>Editar Perfil</h1>
    <div class="perfil-header-actions">
      <a href="{{ route('perfil.ver') }}" class="btn btn-secondary">Volver</a>
    </div>
  </div>

  <form action="{{ route('perfil.actualizar') }}" method="POST" class="perfil-section">
    @csrf
    @method('PUT')

    <div class="perfil-grid">
      <div class="perfil-item">
        <label class="perfil-item-label" for="nombre">Nombre</label>
        <input type="text" id="nombre" name="nombre" value="{{ old('nombre', $usuario->nombre) }}" required>
      </div>

      <div class="perfil-item">
        <label class="perfil-item-label" for="email">Email</label>
        <input type="email" id="email" name="email" value="{{ old('email', $usuario->email) }}" required>
      </div>
    </div>

    <div class="perfil-actions">
      <button type="submit" class="btn-vt btn-vt-primary btn-vt-sm">Guardar cambios</button>
    </div>
  </form>

</div>
@endsection
