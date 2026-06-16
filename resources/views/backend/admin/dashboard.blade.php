@extends('layout.layout-admin')

@section('title', 'Panel de Administración - Vittorio')

@section('content')
<div class="admin-page">
  <div class="admin-container">

    <div class="admin-header">
      <div>
        <h1 class="admin-title">Panel de Administración</h1>
        <p class="admin-subtitle">Bienvenido, {{ auth()->user()->nombre }}</p>
      </div>
    </div>

    <div class="admin-grid">
      <a href="{{ route('productos.index') }}" class="admin-card">
        <i data-lucide="watch"></i>
        <span>Gestión de Productos</span>
      </a>
      <a href="{{ route('usuarios.index') }}" class="admin-card">
        <i data-lucide="users"></i>
        <span>Gestión de Usuarios</span>
      </a>
      <a href="{{ route('roles.index') }}" class="admin-card">
        <i data-lucide="shield"></i>
        <span>Gestión de Roles</span>
      </a>
      <a href="{{ route('ventas.index') }}" class="admin-card">
        <i data-lucide="receipt"></i>
        <span>Ventas</span>
      </a>
      <a href="{{ route('contactos.index') }}" class="admin-card">
        <i data-lucide="mail"></i>
        <span>Consultas</span>
      </a>
    </div>

  </div>
</div>
@endsection
