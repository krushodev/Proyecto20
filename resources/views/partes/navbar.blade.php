{{-- 
  ============================================================
  COMPONENTE: navbar.blade.php
  PROPÓSITO: Barra de navegación principal
  DESCRIPCIÓN: Navegación fija en la parte superior con logo,
  menú de enlaces, selector de divisa, búsqueda, carrito,
  cuenta de usuario y menú responsive (offcanvas) para móvil.
  Se incluye en la plantilla principal layout.blade.php
  ============================================================
--}}
<nav class="navbar navbar-expand-lg navbar-vittorio fixed-top" aria-label="Navegación principal">
  <div class="container-fluid navbar-container">
    <a href="{{ url('/') }}" class="navbar-brand">
      <img src="{{ asset('assets/logo.png') }}" alt="Vittorio" class="navbar-logo" />
    </a>

    <div class="navbar-actions order-lg-3">
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
      <button class="navbar-icon-btn" aria-label="Buscar" type="button">
        <i data-lucide="search"></i>
      </button>
      <button class="navbar-icon-btn" aria-label="Carrito" type="button">
        <i data-lucide="shopping-cart"></i>
      </button>
      <a href="{{ url('/login') }}" class="navbar-icon-btn" aria-label="Cuenta">
        <i data-lucide="user"></i>
      </a>
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
      <a href="{{ url('/') }}" class="navbar-link {{ Request::is('/') ? 'active' : '' }}">Inicio</a>
      <a href="{{ url('/catalogo') }}" class="navbar-link {{ Request::is('catalogo') ? 'active' : '' }}">Catálogo</a>
      <a href="{{ url('/nosotros') }}" class="navbar-link {{ Request::is('nosotros') ? 'active' : '' }}">Quiénes Somos</a>
      <a href="{{ url('/comercializacion') }}" class="navbar-link {{ Request::is('comercializacion') ? 'active' : '' }}">Comercialización</a>
      <a href="{{ url('/contacto') }}" class="navbar-link {{ Request::is('contacto') ? 'active' : '' }}">Contacto</a>
    </div>
  </div>
</nav>

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
      <a href="{{ url('/') }}" class="offcanvas-link {{ Request::is('/') ? 'active' : '' }}">Inicio</a>
      <a href="{{ url('/catalogo') }}" class="offcanvas-link {{ Request::is('catalogo') ? 'active' : '' }}">Catálogo</a>
      <a href="{{ url('/nosotros') }}" class="offcanvas-link {{ Request::is('nosotros') ? 'active' : '' }}">Quiénes Somos</a>
      <a href="{{ url('/comercializacion') }}" class="offcanvas-link {{ Request::is('comercializacion') ? 'active' : '' }}">Comercialización</a>
      <a href="{{ url('/contacto') }}" class="offcanvas-link {{ Request::is('contacto') ? 'active' : '' }}">Contacto</a>
    </nav>
    <div class="offcanvas-footer">
      <a href="{{ url('/login') }}" class="offcanvas-cta">
        <i data-lucide="user"></i>
        <span>Mi cuenta</span>
      </a>
      <p class="offcanvas-tagline">Manufactura desde La Plata · Argentina</p>
    </div>
  </div>
</div>
