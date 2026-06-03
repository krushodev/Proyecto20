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
      <a href="{{ route('perfil.editar') }}" class="btn btn-primary">
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

    <div class="card-dark">
      <span class="perfil-item-label">Criptomonedas</span>
      <div class="card-body">
        @if($usuario->cripto_habilitada)
          <span class="perfil-item-value">Tipo: {{ $usuario->tipo_cripto ?? '—' }}</span>
          @if($usuario->wallet_cripto)
            <div class="perfil-item-value-muted">Wallet: {{ $usuario->wallet_cripto }}</div>
          @endif
        @else
          <span class="perfil-item-value">No habilitada</span>
        @endif
      </div>
    </div>

    
  </div>

  {{-- Historial de Compras --}}
  <div class="perfil-section">
    <h2>Historial de Compras</h2>
    
    @if($usuario->ventas->count() > 0)
      <div class="ventas-table-wrap">
        <table class="ventas-table">
          <thead>
            <tr>
              <th>Número</th>
              <th>Fecha</th>
              <th style="text-align: right;">Total</th>
              <th style="text-align: center;">Estado</th>
            </tr>
          </thead>
          <tbody>
            @foreach($usuario->ventas as $venta)
              <tr>
                <td>#{{ $venta->id }}</td>
                <td>{{ $venta->created_at->format('d/m/Y') }}</td>
                <td style="text-align: right;">${{ number_format($venta->total, 2, ',', '.') }}</td>
                <td style="text-align: center;"><span class="badge badge-success">Completada</span></td>
              </tr>
            @endforeach
          </tbody>
        </table>
      </div>
    @else
      <div class="empty-state">
        <svg class="empty-state-icon" xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <circle cx="9" cy="21" r="1"></circle>
          <circle cx="20" cy="21" r="1"></circle>
          <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
        </svg>
        <p>No tienes compras registradas aún</p>
        <a href="{{ route('catalogo') }}" class="btn btn-primary">
          <i data-lucide="shopping-bag"></i>
          <span>Explorar Catálogo</span>
        </a>
      </div>
    @endif
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
@endsection
