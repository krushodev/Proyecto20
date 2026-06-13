@extends('layout.layout')

@section('title', 'Panel de Administración - Vittorio')

@section('content')
<div class="admin-page">
  <div class="admin-container">

    <div class="admin-header">
      <div>
        <h1 class="admin-title">Panel de Administración</h1>
        <p class="admin-subtitle">Bienvenido, {{ auth()->user()->nombre }}</p>
      </div>
      <a href="{{ route('home') }}" class="admin-return">
        <i data-lucide="home"></i>
        <span>Ir al inicio</span>
      </a>
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

@push('styles')
<style>
.admin-page { min-height: 100vh; padding: 2rem; background-color: #0a0a0a; }
.admin-container { max-width: 900px; margin: 0 auto; }
.admin-header { margin-bottom: 2.5rem; padding-bottom: 1.5rem; border-bottom: 1px solid rgba(255,255,255,0.08); }
.admin-title { font-size: 1.75rem; font-weight: 700; color: #fff; letter-spacing: -0.02em; }
.admin-subtitle { font-size: 0.875rem; color: rgba(255,255,255,0.5); margin-top: 0.25rem; }
.admin-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 1rem; }
.admin-card {
  display: flex; flex-direction: column; align-items: center; gap: 0.75rem;
  padding: 2rem 1rem; background-color: #0e0e0e;
  border: 1px solid rgba(255,255,255,0.08); border-radius: 12px;
  color: rgba(255,255,255,0.7); text-decoration: none;
  font-size: 0.875rem; font-weight: 500; transition: all 0.3s ease;
}
.admin-card:hover { border-color: rgba(255,255,255,0.25); color: #fff; transform: translateY(-2px); }
.admin-card i { width: 32px; height: 32px; }
.admin-return {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem 1rem;
  color: rgba(255,255,255,0.9);
  background: rgba(255,255,255,0.08);
  border: 1px solid rgba(255,255,255,0.12);
  border-radius: 999px;
  text-decoration: none;
  transition: background 0.2s ease, border-color 0.2s ease, color 0.2s ease;
}
.admin-return:hover { background: rgba(255,255,255,0.15); border-color: rgba(255,255,255,0.2); color: #fff; }
.admin-return i { width: 16px; height: 16px; }
</style>
@endpush
