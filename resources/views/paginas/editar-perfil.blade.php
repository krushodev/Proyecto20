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

  @if($errors->any())
    <div class="alert alert-danger">
      <ul>
        @foreach($errors->all() as $error)
          <li>{{ $error }}</li>
        @endforeach
      </ul>
    </div>
  @endif

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

      <div class="perfil-item">
        <label class="perfil-item-label" for="cripto_habilitada">Habilitar Cripto</label>
        <input type="checkbox" id="cripto_habilitada" name="cripto_habilitada" value="1" {{ old('cripto_habilitada', $usuario->cripto_habilitada) ? 'checked' : '' }}>
      </div>

      <div class="perfil-item">
        <label class="perfil-item-label" for="tipo_cripto">Tipo de Cripto</label>
        <select id="tipo_cripto" name="tipo_cripto">
          <option value="BTC" {{ old('tipo_cripto', $usuario->tipo_cripto) == 'BTC' ? 'selected' : '' }}>BTC</option>
          <option value="ETH" {{ old('tipo_cripto', $usuario->tipo_cripto) == 'ETH' ? 'selected' : '' }}>ETH</option>
          <option value="USDT" {{ old('tipo_cripto', $usuario->tipo_cripto) == 'USDT' ? 'selected' : '' }}>USDT</option>
        </select>
      </div>

      <div class="perfil-item">
        <label class="perfil-item-label" for="wallet_cripto">Dirección Wallet</label>
        <input type="text" id="wallet_cripto" name="wallet_cripto" value="{{ old('wallet_cripto', $usuario->wallet_cripto) }}">
      </div>
    </div>

    <div class="perfil-actions">
      <button type="submit" class="btn-primary-vittorio-sm">Guardar cambios</button>
    </div>
  </form>

  <div class="perfil-bottom-actions">
    @if (Route::has('password.request'))
      <a href="{{ route('password.request') }}" class="btn-link-vittorio">Recuperar contraseña</a>
    @else
      <a href="#" class="btn-link-vittorio" onclick="alert('Función de recuperación de contraseña no configurada'); return false;">Recuperar contraseña</a>
    @endif

    <form action="{{ route('logout') }}" method="POST" class="logout-form">
      @csrf
      <button type="submit" class="btn-primary-vittorio-sm">Cerrar sesión</button>
    </form>
  </div>
</div>
@endsection
