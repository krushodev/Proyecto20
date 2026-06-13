{{--
  ============================================================
  PÁGINA: perfil.blade.php
  PROPÓSITO: Mostrar perfil del usuario autenticado
  DESCRIPCIÓN: Visualización de información personal, datos
  de contacto y acciones disponibles para el usuario
  ============================================================
--}}
@extends('layout.layout')

@section('title', 'Mi Perfil - Vittorio')

@section('content')
<div class="perfil-container">
  {{-- Header --}}
  <div class="perfil-header">
    <h1>Mi Perfil</h1>
    <div class="perfil-header-actions">
      <a href="{{ route('perfil.editar') }}" class="btn btn-perfil-editar">
        <i data-lucide="edit"></i>
        <span>Editar Perfil</span>
      </a>
    </div>
  </div>

  {{-- Información Principal --}}
  <div class="perfil-section">
    <div class="perfil-avatar-container">
      <div class="perfil-avatar-large">
        {{ strtoupper(substr($usuario->nombre, 0, 1)) }}
      </div>
      <p class="perfil-avatar-name">{{ $usuario->nombre }}</p>
    </div>

    <div class="perfil-grid">
      <div class="perfil-item">
        <span class="perfil-item-label">Nombre</span>
        <span class="perfil-item-value">{{ $usuario->nombre }}</span>
      </div>
      
      <div class="perfil-item">
        <span class="perfil-item-label">Email</span>
        <span class="perfil-item-value">{{ $usuario->email }}</span>
      </div>
      
      {{-- Rol removido por solicitud del usuario --}}

      <div class="perfil-item">
        <span class="perfil-item-label">Ubicación</span>
        <span class="perfil-item-value">
          {{ $usuario->ubicacion ?? 'No configurada' }}
        </span>
      </div>
      
    </div>
  </div>

  {{-- Métodos de Pago --}}
  <div class="perfil-section">
    <h2>Métodos de Pago</h2>
    
    <div class="card-dark">
      <span class="perfil-item-label">Tarjeta de Crédito</span>
      <div class="card-body">
        @if($usuario->numero_tarjeta)
          <span class="perfil-item-value">•••• •••• •••• {{ substr(preg_replace('/\D/', '', $usuario->numero_tarjeta), -4) }}</span>
          @if($usuario->titular_tarjeta)
            <div class="perfil-item-value-muted">Titular: {{ $usuario->titular_tarjeta }}</div>
          @endif
          @if($usuario->vencimiento_tarjeta)
            <div class="perfil-item-value-muted">Venc.: {{ $usuario->vencimiento_tarjeta }}</div>
          @endif
        @else
          <span class="perfil-item-value">No configurada</span>
        @endif
      </div>
    </div>


  </div>

  {{-- Acciones Finales: solo botón de cerrar sesión --}}
  <div class="perfil-actions perfil-actions-centered" style="margin-top: 12px;">
    <form action="{{ route('logout') }}" method="POST" class="perfil-logout-form">
      @csrf
      <button type="submit" class="btn btn-secondary">
        <i data-lucide="log-out"></i>
        <span>Cerrar Sesión</span>
      </button>
    </form>
  </div>
</div>

@push('styles')
<style>
.perfil-container {
  margin-top: 7rem;
}
.perfil-avatar-large {
  width: 80px;
  height: 80px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto;
  font-size: 2rem;
  font-weight: 700;
  color: #fff;
  border-radius: 50%;
  background: radial-gradient(circle at top left, #2d2d2d 0%, #1f1f1f 45%, #111111 100%);
  box-shadow: 0 18px 36px rgba(0, 0, 0, 0.28);
}
.perfil-header-actions .btn-perfil-editar {
  background-color: #2d2d2d;
  color: #fff;
  border-color: #2d2d2d;
}
.perfil-header-actions .btn-perfil-editar:hover,
.perfil-header-actions .btn-perfil-editar:focus {
  background-color: #1f1f1f;
  border-color: #1f1f1f;
  color: #fff;
}
</style>
@endpush
