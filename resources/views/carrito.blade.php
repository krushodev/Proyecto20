@extends('layout.layout')

@section('title', 'Mi Carrito - Vittorio')

@section('content')
<div class="login-page">
  <div class="login-container" style="max-width:600px;text-align:center">
    <div class="login-header">
      <h1 class="login-title">Mi Carrito</h1>
      <p class="login-subtitle">Hola, {{ auth()->user()->nombre }}</p>
    </div>
    <p style="color:rgba(255,255,255,0.4);font-size:0.9rem;margin-top:1rem">
      Tu carrito está vacío. Explorá nuestro catálogo.
    </p>
    <a href="{{ url('/catalogo') }}" class="btn-login" style="display:inline-block;margin-top:2rem;text-decoration:none">
      Ver Catálogo
    </a>
  </div>
</div>
@endsection
