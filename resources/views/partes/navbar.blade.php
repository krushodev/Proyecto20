{{--
  ============================================================
  COMPONENTE: navbar.blade.php
  PROPÓSITO: Barra de navegación principal
  DESCRIPCIÓN: Navegación adaptativa según rol:
  - @guest       → menú público + enlace a login
  - rol cliente  → menú público + carrito + cuenta
  - rol admin    → solo logo + enlace a Panel Admin + logout
  ============================================================
--}}
@php($esAdmin = auth()->check() && auth()->user()->rol?->nombre === 'admin')

<nav class="navbar navbar-expand-lg navbar-vittorio fixed-top" aria-label="Navegación principal">
  <div class="container-fluid navbar-container">
    <a href="{{ $esAdmin ? route('admin.panel') : url('/') }}" class="navbar-brand">
      <img src="https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/logo.png" alt="Vittorio" class="navbar-logo" />
    </a>

    <div class="navbar-actions order-lg-3">

      @if(!$esAdmin)
        {{-- Búsqueda (solo tienda) --}}
        <button class="navbar-icon-btn" aria-label="Buscar" type="button">
          <i data-lucide="search"></i>
        </button>

        {{-- Carrito (solo clientes autenticados) --}}
        @auth
          <a href="{{ route('carrito') }}" class="navbar-icon-btn" aria-label="Mi carrito">
            <i data-lucide="shopping-cart"></i>
          </a>
        @endauth
      @endif

      {{-- Cuenta: condicional por estado y rol --}}
      @guest
        <a href="{{ route('login') }}" class="navbar-icon-btn" aria-label="Iniciar sesión">
          <i data-lucide="user"></i>
        </a>
      @else
        <div class="dropdown">
          <button
            class="navbar-icon-btn dropdown-toggle"
            type="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
            aria-label="Mi cuenta"
          >
            <i data-lucide="user"></i>
          </button>
          <ul class="dropdown-menu dropdown-menu-end navbar-user-menu">
            <li class="navbar-user-name">{{ auth()->user()->nombre }}</li>

            @if($esAdmin)
              <li>
                <a class="dropdown-item" href="{{ route('admin.panel') }}">
                  <i data-lucide="layout-dashboard"></i> Panel Admin
                </a>
              </li>
            @endif

            <li><hr class="dropdown-divider"></li>
            <li>
              <form action="{{ route('logout') }}" method="POST">
                @csrf
                <button type="submit" class="dropdown-item navbar-logout-btn">
                  <i data-lucide="log-out"></i> Cerrar Sesión
                </button>
              </form>
            </li>
          </ul>
        </div>
      @endguest

      {{-- Hamburguesa móvil --}}
      <button
        class="navbar-toggler navbar-icon-btn d-lg-none"
        type="button"
        data-bs-toggle="offcanvas"
        data-bs-target="#vittorioOffcanvas"
        aria-controls="vittorioOffcanvas"
        aria-label="Abrir menú"
      >
        <i data-lucide="menu"></i>
      </button>
    </div>

    {{-- Menú de navegación desktop --}}
    <div class="navbar-menu collapse navbar-collapse order-lg-2" id="vittorioMenu">
      @if($esAdmin)
        <a href="{{ route('admin.panel') }}" class="navbar-link {{ Request::is('admin*') ? 'active' : '' }}">
          <i data-lucide="layout-dashboard" style="width:14px;height:14px;margin-right:.3rem;"></i>Panel Admin
        </a>
      @else
        <a href="{{ url('/') }}"                 class="navbar-link {{ Request::is('/')               ? 'active' : '' }}">Inicio</a>
        <a href="{{ url('/catalogo') }}"          class="navbar-link {{ Request::is('catalogo')        ? 'active' : '' }}">Catálogo</a>
        <a href="{{ url('/nosotros') }}"          class="navbar-link {{ Request::is('nosotros')        ? 'active' : '' }}">Quiénes Somos</a>
        <a href="{{ url('/comercializacion') }}"  class="navbar-link {{ Request::is('comercializacion') ? 'active' : '' }}">Comercialización</a>
        <a href="{{ url('/contacto') }}"          class="navbar-link {{ Request::is('contacto')        ? 'active' : '' }}">Contacto</a>
      @endif
    </div>
  </div>
</nav>

{{-- OffCanvas móvil --}}
<div class="offcanvas offcanvas-end navbar-offcanvas" tabindex="-1" id="vittorioOffcanvas" aria-labelledby="vittorioOffcanvasLabel">
  <div class="offcanvas-header">
    <h2 class="offcanvas-title" id="vittorioOffcanvasLabel">
      <img src="https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/logo.png" alt="Vittorio" class="offcanvas-logo" />
    </h2>
    <button type="button" class="btn-close-offcanvas" data-bs-dismiss="offcanvas" aria-label="Cerrar">
      <i data-lucide="x"></i>
    </button>
  </div>
  <div class="offcanvas-body">
    <nav class="offcanvas-nav" aria-label="Menú móvil">
      @if($esAdmin)
        <a href="{{ route('admin.panel') }}" class="offcanvas-link {{ Request::is('admin*') ? 'active' : '' }}">Panel Admin</a>
      @else
        <a href="{{ url('/') }}"                 class="offcanvas-link {{ Request::is('/')               ? 'active' : '' }}">Inicio</a>
        <a href="{{ url('/catalogo') }}"          class="offcanvas-link {{ Request::is('catalogo')        ? 'active' : '' }}">Catálogo</a>
        <a href="{{ url('/nosotros') }}"          class="offcanvas-link {{ Request::is('nosotros')        ? 'active' : '' }}">Quiénes Somos</a>
        <a href="{{ url('/comercializacion') }}"  class="offcanvas-link {{ Request::is('comercializacion') ? 'active' : '' }}">Comercialización</a>
        <a href="{{ url('/contacto') }}"          class="offcanvas-link {{ Request::is('contacto')        ? 'active' : '' }}">Contacto</a>
      @endif
    </nav>

    <div class="offcanvas-footer">
      @guest
        <a href="{{ route('login') }}" class="offcanvas-cta">
          <i data-lucide="user"></i>
          <span>Iniciar sesión</span>
        </a>
      @else
        @if($esAdmin)
          <a href="{{ route('admin.panel') }}" class="offcanvas-cta">
            <i data-lucide="layout-dashboard"></i>
            <span>Panel Admin</span>
          </a>
        @endif
        <form action="{{ route('logout') }}" method="POST" style="width:100%">
          @csrf
          <button type="submit" class="offcanvas-cta offcanvas-logout-btn">
            <i data-lucide="log-out"></i>
            <span>Cerrar Sesión</span>
          </button>
        </form>
      @endguest
      <p class="offcanvas-tagline">Manufactura desde La Plata · Argentina</p>
    </div>
  </div>
</div>

@push('styles')
<style>
.navbar-user-name {
  padding: 0.4rem 1rem 0.2rem;
  font-size: 0.7rem;
  font-weight: 600;
  color: rgba(255,255,255,0.35);
  letter-spacing: 0.1em;
  text-transform: uppercase;
}
.navbar-user-menu { min-width: 180px; }
.navbar-user-menu .dropdown-item {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.875rem;
}
.navbar-user-menu .dropdown-item i { width: 15px; height: 15px; }
.navbar-logout-btn {
  width: 100%;
  background: none;
  border: none;
  cursor: pointer;
  text-align: left;
  color: #ff6b6b;
}
.navbar-logout-btn:hover { color: #ff6b6b; background-color: rgba(255,107,107,0.08); }
.offcanvas-logout-btn {
  width: 100%;
  background: none;
  border: none;
  cursor: pointer;
  color: rgba(255,255,255,0.5);
}
</style>
@endpush
