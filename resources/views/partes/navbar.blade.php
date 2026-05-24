{{--
  ============================================================
  COMPONENTE: navbar.blade.php
  PROPÓSITO: Barra de navegación principal
  DESCRIPCIÓN: Navegación fija con logo, menú, divisa, búsqueda
  y cuenta. El icono de cuenta es condicional según el rol:
  - @guest     → enlace a Login
  - rol cliente → enlace a Área Cliente + Cerrar Sesión
  - rol admin   → enlace a Panel Admin + Cerrar Sesión
  ============================================================
--}}
<nav class="navbar navbar-expand-lg navbar-vittorio fixed-top" aria-label="Navegación principal">
  <div class="container-fluid navbar-container">
    <a href="{{ url('/') }}" class="navbar-brand">
      <img src="{{ asset('assets/logo.png') }}" alt="Vittorio" class="navbar-logo" />
    </a>

    <div class="navbar-actions order-lg-3">

      {{-- Selector de divisa --}}
      <div class="dropdown navbar-currency">
        <button
          class="navbar-icon-btn dropdown-toggle"
          type="button"
          data-bs-toggle="dropdown"
          aria-expanded="false"
          aria-label="Seleccionar divisa"
        >
          <span data-currency-label>USD</span>
        </button>
        <ul class="dropdown-menu dropdown-menu-end navbar-currency-menu">
          <li><button type="button" class="dropdown-item" data-currency="USD">USD · Dólar</button></li>
          <li><button type="button" class="dropdown-item" data-currency="ARS">ARS · Peso Argentino</button></li>
          <li><button type="button" class="dropdown-item" data-currency="EUR">EUR · Euro</button></li>
          <li><button type="button" class="dropdown-item" data-currency="BRL">BRL · Real</button></li>
        </ul>
      </div>

      {{-- Búsqueda --}}
      <button class="navbar-icon-btn" aria-label="Buscar" type="button">
        <i data-lucide="search"></i>
      </button>

      {{-- Carrito: solo visible para clientes --}}
      @auth
        @if(auth()->user()->rol?->nombre === 'cliente')
          <a href="{{ route('cliente') }}" class="navbar-icon-btn" aria-label="Área cliente">
            <i data-lucide="shopping-cart"></i>
          </a>
        @endif
      @endauth

      {{-- Cuenta: condicional por estado y rol --}}
      @guest
        {{-- Visitante: enlace directo a login --}}
        <a href="{{ route('login') }}" class="navbar-icon-btn" aria-label="Iniciar sesión">
          <i data-lucide="user"></i>
        </a>
      @else
        {{-- Autenticado: dropdown con opciones según rol --}}
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

            @if(auth()->user()->rol?->nombre === 'admin')
              <li>
                <a class="dropdown-item" href="{{ route('admin.panel') }}">
                  <i data-lucide="layout-dashboard"></i> Panel Admin
                </a>
              </li>
            @elseif(auth()->user()->rol?->nombre === 'cliente')
              <li>
                <a class="dropdown-item" href="{{ route('cliente') }}">
                  <i data-lucide="user-circle"></i> Área Cliente
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

    <div class="navbar-menu collapse navbar-collapse order-lg-2" id="vittorioMenu">
      <a href="{{ url('/') }}"                 class="navbar-link {{ Request::is('/')               ? 'active' : '' }}">Inicio</a>
      <a href="{{ url('/catalogo') }}"          class="navbar-link {{ Request::is('catalogo')        ? 'active' : '' }}">Catálogo</a>
      <a href="{{ url('/nosotros') }}"          class="navbar-link {{ Request::is('nosotros')        ? 'active' : '' }}">Quiénes Somos</a>
      <a href="{{ url('/comercializacion') }}"  class="navbar-link {{ Request::is('comercializacion') ? 'active' : '' }}">Comercialización</a>
      <a href="{{ url('/contacto') }}"          class="navbar-link {{ Request::is('contacto')        ? 'active' : '' }}">Contacto</a>

      @auth
        @if(auth()->user()->rol?->nombre === 'admin')
          <a href="{{ route('admin.panel') }}" class="navbar-link {{ Request::is('admin*') ? 'active' : '' }}">Admin</a>
        @endif
      @endauth
    </div>
  </div>
</nav>

{{-- OffCanvas móvil --}}
<div class="offcanvas offcanvas-end navbar-offcanvas" tabindex="-1" id="vittorioOffcanvas" aria-labelledby="vittorioOffcanvasLabel">
  <div class="offcanvas-header">
    <h2 class="offcanvas-title" id="vittorioOffcanvasLabel">
      <img src="{{ asset('assets/logo.png') }}" alt="Vittorio" class="offcanvas-logo" />
    </h2>
    <button type="button" class="btn-close-offcanvas" data-bs-dismiss="offcanvas" aria-label="Cerrar">
      <i data-lucide="x"></i>
    </button>
  </div>
  <div class="offcanvas-body">
    <nav class="offcanvas-nav" aria-label="Menú móvil">
      <a href="{{ url('/') }}"                 class="offcanvas-link {{ Request::is('/')               ? 'active' : '' }}">Inicio</a>
      <a href="{{ url('/catalogo') }}"          class="offcanvas-link {{ Request::is('catalogo')        ? 'active' : '' }}">Catálogo</a>
      <a href="{{ url('/nosotros') }}"          class="offcanvas-link {{ Request::is('nosotros')        ? 'active' : '' }}">Quiénes Somos</a>
      <a href="{{ url('/comercializacion') }}"  class="offcanvas-link {{ Request::is('comercializacion') ? 'active' : '' }}">Comercialización</a>
      <a href="{{ url('/contacto') }}"          class="offcanvas-link {{ Request::is('contacto')        ? 'active' : '' }}">Contacto</a>
    </nav>

    <div class="offcanvas-footer">
      @guest
        <a href="{{ route('login') }}" class="offcanvas-cta">
          <i data-lucide="user"></i>
          <span>Iniciar sesión</span>
        </a>
      @else
        @if(auth()->user()->rol?->nombre === 'admin')
          <a href="{{ route('admin.panel') }}" class="offcanvas-cta">
            <i data-lucide="layout-dashboard"></i>
            <span>Panel Admin</span>
          </a>
        @elseif(auth()->user()->rol?->nombre === 'cliente')
          <a href="{{ route('cliente') }}" class="offcanvas-cta">
            <i data-lucide="user-circle"></i>
            <span>Área Cliente</span>
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
