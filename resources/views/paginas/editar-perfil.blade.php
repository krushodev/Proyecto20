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

      <div class="perfil-item">
        <label class="perfil-item-label" for="ubicacion">Ubicación (Dirección)</label>
        <input type="text" id="ubicacion" name="ubicacion" value="{{ old('ubicacion', $usuario->ubicacion) }}" placeholder="Calle, Número, Ciudad">
      </div>
    </div>

    <h3>Método de Pago</h3>
    <div class="perfil-grid">
      <div class="perfil-item">
        <label class="perfil-item-label" for="numero_tarjeta">Número de Tarjeta</label>
        <input type="text" id="numero_tarjeta" name="numero_tarjeta" value="{{ old('numero_tarjeta', $usuario->numero_tarjeta) }}" maxlength="19" placeholder="0000 0000 0000 0000">
      </div>

      <div class="perfil-item">
        <label class="perfil-item-label" for="titular_tarjeta">Titular</label>
        <input type="text" id="titular_tarjeta" name="titular_tarjeta" value="{{ old('titular_tarjeta', $usuario->titular_tarjeta) }}">
      </div>

      <div class="perfil-item">
        <label class="perfil-item-label" for="vencimiento_tarjeta">Vencimiento (MM/AA)</label>
        <input type="text" id="vencimiento_tarjeta" name="vencimiento_tarjeta" value="{{ old('vencimiento_tarjeta', $usuario->vencimiento_tarjeta) }}" maxlength="5" placeholder="MM/AA">
      </div>

      <div class="perfil-item">
        <label class="perfil-item-label" for="cvv_tarjeta">CVV</label>
        <input type="password" id="cvv_tarjeta" name="cvv_tarjeta" value="{{ old('cvv_tarjeta', $usuario->cvv_tarjeta) }}" maxlength="4" placeholder="000">
      </div>


    </div>

    <div class="perfil-actions">
      <button type="submit" class="btn-vt btn-vt-primary btn-vt-sm">Guardar cambios</button>
    </div>
  </form>

  <div class="perfil-bottom-actions">
    @if (Route::has('password.request'))
      <a href="{{ route('password.request') }}" class="btn-vt-link">Recuperar contraseña</a>
    @else
      <a href="#" class="btn-vt-link" onclick="Swal.fire({ icon: 'info', title: 'No disponible', text: 'La recuperación de contraseña no está configurada.' }); return false;">Recuperar contraseña</a>
    @endif

    <form action="{{ route('logout') }}" method="POST" class="logout-form">
      @csrf
      <button type="submit" class="btn-vt btn-vt-primary btn-vt-sm">Cerrar sesión</button>
    </form>
  </div>
</div>
@endsection
