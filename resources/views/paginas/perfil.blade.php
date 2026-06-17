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
    <div class="perfil-summary">
      <div class="perfil-summary-card">
        <div class="perfil-avatar-container">
          <div class="perfil-avatar-large">
            {{ strtoupper(substr($usuario->nombre, 0, 1)) }}
          </div>
          <p class="perfil-avatar-name">{{ $usuario->nombre }}</p>
        </div>
      </div>

      <div class="perfil-summary-card perfil-summary-details">
        <div class="perfil-grid">
          <div class="perfil-item">
            <span class="perfil-item-label">Nombre</span>
            <span class="perfil-item-value">{{ $usuario->nombre }}</span>
          </div>

          <div class="perfil-item">
            <span class="perfil-item-label">Email</span>
            <span class="perfil-item-value">{{ $usuario->email }}</span>
          </div>
          
        </div>
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
  <div class="perfil-actions perfil-actions-centered perfil-actions-spaced">
    <form action="{{ route('logout') }}" method="POST" class="perfil-logout-form">
      @csrf
      <button type="submit" class="btn btn-secondary">
        <i data-lucide="log-out"></i>
        <span>Cerrar Sesión</span>
      </button>
    </form>
  </div>
</div>
@endsection
