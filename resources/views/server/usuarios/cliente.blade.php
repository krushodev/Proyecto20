@extends('layout.layout')

@section('title', 'Área Cliente - Vittorio')

@section('content')
<div class="admin-page">
  <div class="admin-container">

    <div class="admin-header">
      <div>
        <h1 class="admin-title">Área Cliente</h1>
        <p class="admin-subtitle">Hola, {{ auth()->user()->nombre }}</p>
      </div>
    </div>

    <div class="admin-grid">
      <a href="{{ url('/catalogo') }}" class="admin-card">
        <i data-lucide="watch"></i>
        <span>Ver Catálogo</span>
      </a>
      <a href="{{ url('/') }}" class="admin-card">
        <i data-lucide="home"></i>
        <span>Inicio</span>
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
</style>
@endpush
