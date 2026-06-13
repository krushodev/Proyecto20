{{--
  ============================================================
  COMPONENTE: navbar.blade.php
  PROPÓSITO: Barra de navegación principal
  DESCRIPCIÓN: Navegación adaptativa según rol:
  - @guest       → menú público + carrito (guest) + enlace a login
  - rol cliente  → menú público + carrito + cuenta
  - rol admin    → solo logo + enlace a Panel Admin + logout
  ============================================================
--}}
@php($esAdminUser = auth()->check() && auth()->user()->rol?->nombre === 'admin')
@php($esAdminArea = $esAdminUser && Request::is('admin*'))

<nav class="navbar navbar-expand-lg navbar-vittorio fixed-top" aria-label="Navegación principal">
  <div class="container-fluid navbar-container">
    <a href="{{ $esAdminArea ? route('admin.panel') : url('/') }}" class="navbar-brand">
      <img src="https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/logo.png" alt="Vittorio" class="navbar-logo" />
    </a>

    <div class="navbar-actions order-lg-3">

      @if(!$esAdminUser)
        {{-- Carrito: visible para guests y clientes autenticados --}}
        <a href="{{ route('carrito') }}" class="navbar-icon-btn" aria-label="Mi carrito">
          <i data-lucide="shopping-cart"></i>
        </a>
      @endif

      {{-- Cuenta: condicional por estado y rol --}}
      @guest
        <a href="{{ route('login') }}" class="navbar-icon-btn" aria-label="Iniciar sesión">
          <i data-lucide="user"></i>
        </a>
      @else
        <div class="navbar-user-dropdown">
          <button
            class="navbar-user-avatar-btn"
            type="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
            aria-label="Mi cuenta"
            title="{{ auth()->user()->nombre }}"
          >
            <div class="navbar-user-avatar">
              {{ strtoupper(substr(auth()->user()->nombre, 0, 1)) }}
            </div>
          </button>
          <ul class="dropdown-menu dropdown-menu-end navbar-user-menu">

            {{-- Encabezado con nombre y email --}}
            <li class="navbar-user-header">
              <div class="navbar-user-avatar-large">
                {{ strtoupper(substr(auth()->user()->nombre, 0, 1)) }}
              </div>
              <div class="navbar-user-info">
                <span class="navbar-user-name-text">{{ auth()->user()->nombre }}</span>
                <span class="navbar-user-email-text">{{ auth()->user()->email }}</span>
              </div>
            </li>

            <li><hr class="navbar-divider"></li>

            @if($esAdminUser)
              <li>
                <a class="navbar-user-menu-item" href="{{ route('admin.panel') }}">
                  <i data-lucide="layout-dashboard"></i>
                  <span>Panel Admin</span>
                </a>
              </li>
              <li>
                <a class="navbar-user-menu-item" href="{{ route('admin.perfil') }}">
                  <i data-lucide="settings"></i>
                  <span>Mi Perfil</span>
                </a>
              </li>
            @else
              <li>
                <a class="navbar-user-menu-item" href="{{ route('mis-compras') }}">
                  <i data-lucide="package"></i>
                  <span>Mis Compras</span>
                </a>
              </li>
              <li>
                <a class="navbar-user-menu-item" href="{{ route('perfil.ver') }}">
                  <i data-lucide="settings"></i>
                  <span>Mi Perfil</span>
                </a>
              </li>
            @endif

            <li><hr class="navbar-divider"></li>

            <li>
              <form action="{{ route('logout') }}" method="POST" class="w-100">
                @csrf
                <button type="submit" class="navbar-user-menu-item navbar-user-menu-logout">
                  <i data-lucide="log-out"></i>
                  <span>Cerrar Sesión</span>
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
      @if($esAdminArea)
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
      @if($esAdminArea)
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
        <a href="{{ route('carrito') }}" class="offcanvas-cta">
          <i data-lucide="shopping-cart"></i>
          <span>Mi Carrito</span>
        </a>
        <a href="{{ route('login') }}" class="offcanvas-cta">
          <i data-lucide="user"></i>
          <span>Iniciar sesión</span>
        </a>
      @else
        @if($esAdminUser)
          <a href="{{ route('admin.panel') }}" class="offcanvas-cta">
            <i data-lucide="layout-dashboard"></i>
            <span>Panel Admin</span>
          </a>
          <a href="{{ route('admin.perfil') }}" class="offcanvas-cta">
            <i data-lucide="settings"></i>
            <span>Mi Perfil</span>
          </a>
        @else
          <a href="{{ route('carrito') }}" class="offcanvas-cta">
            <i data-lucide="shopping-cart"></i>
            <span>Mi Carrito</span>
          </a>
          <a href="{{ route('mis-compras') }}" class="offcanvas-cta">
            <i data-lucide="package"></i>
            <span>Mis Compras</span>
          </a>
          <a href="{{ route('perfil.ver') }}" class="offcanvas-cta">
            <i data-lucide="settings"></i>
            <span>Mi Perfil</span>
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
/* ── Dropdown: tema oscuro consistente ───────────────────────────────── */
.navbar-user-menu {
  min-width: 220px;
  padding: .5rem 0;
  background: #111;
  border: 1px solid rgba(255,255,255,.1);
  border-radius: 10px;
  box-shadow: 0 8px 32px rgba(0,0,0,.6);
}

/* Encabezado del dropdown */
.navbar-user-header {
  display: flex;
  align-items: center;
  gap: .75rem;
  padding: .85rem 1rem;
}
.navbar-user-avatar-large {
  width: 38px;
  height: 38px;
  border-radius: 50%;
  background: rgba(255,255,255,.1);
  border: 1px solid rgba(255,255,255,.15);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: .85rem;
  font-weight: 700;
  color: #fff;
  flex-shrink: 0;
}
.navbar-user-info {
  display: flex;
  flex-direction: column;
  gap: .1rem;
  overflow: hidden;
}
.navbar-user-name-text {
  font-size: .82rem;
  font-weight: 600;
  color: #fff;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.navbar-user-email-text {
  font-size: .7rem;
  color: rgba(255,255,255,.4);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* Divisor */
.navbar-divider {
  margin: .3rem 0;
  border-color: rgba(255,255,255,.08);
}

/* Ítems del dropdown */
.navbar-user-menu-item {
  display: flex;
  align-items: center;
  gap: .6rem;
  width: 100%;
  padding: .6rem 1rem;
  font-size: .83rem;
  color: rgba(255,255,255,.75);
  background: none;
  border: none;
  cursor: pointer;
  text-decoration: none;
  transition: background .15s, color .15s;
  letter-spacing: .01em;
}
.navbar-user-menu-item:hover {
  background: rgba(255,255,255,.06);
  color: #fff;
}
.navbar-user-menu-item i {
  width: 15px;
  height: 15px;
  flex-shrink: 0;
  color: rgba(255,255,255,.4);
}
.navbar-user-menu-item:hover i { color: rgba(255,255,255,.7); }

/* Logout */
.navbar-user-menu-logout { color: rgba(255,107,107,.8); }
.navbar-user-menu-logout:hover { background: rgba(255,107,107,.08); color: #ff6b6b; }
.navbar-user-menu-logout i { color: rgba(255,107,107,.5); }
.navbar-user-menu-logout:hover i { color: #ff6b6b; }

/* Offcanvas logout */
.offcanvas-logout-btn {
  width: 100%;
  background: none;
  border: none;
  cursor: pointer;
  color: rgba(255,255,255,0.5);
}
</style>
@endpush
