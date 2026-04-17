<nav class="navbar-vittorio">
  <div class="navbar-container">
    <a href="{{ url('/') }}" class="navbar-brand">Vittorio</a>

    <div class="navbar-menu">
      <a href="{{ url('/') }}" class="navbar-link {{ Request::is('/') ? 'active' : '' }}">Inicio</a>
      <a href="{{ url('/catalogo') }}" class="navbar-link {{ Request::is('catalogo') ? 'active' : '' }}">Catálogo</a>
      <a href="{{ url('/nosotros') }}" class="navbar-link {{ Request::is('nosotros') ? 'active' : '' }}"
        >Quiénes Somos</a
      >
      <a href="{{ url('/comercializacion') }}" class="navbar-link {{ Request::is('comercializacion') ? 'active' : '' }}"
        >Comercialización</a
      >
      <a href="{{ url('/contacto') }}" class="navbar-link {{ Request::is('contacto') ? 'active' : '' }}">Contacto</a>
    </div>

    <div class="navbar-actions">
      <button class="navbar-icon-btn" aria-label="Buscar">
        <i data-lucide="search"></i>
      </button>
      <button class="navbar-icon-btn" aria-label="Carrito">
        <i data-lucide="shopping-cart"></i>
      </button>
      <button class="navbar-icon-btn" aria-label="Cuenta">
        <i data-lucide="user"></i>
      </button>
    </div>
  </div>
</nav>
