{{--
  ============================================================
  PLANTILLA: layout-admin.blade.php
  PROPÓSITO: Layout exclusivo del panel de administración
  DESCRIPCIÓN: Layout sin footer comercial ni navbar público.
  Incluye un topbar admin minimalista con logo, contexto de
  navegación y acciones de sesión. Usado por todas las vistas
  bajo resources/views/backend/admin/*.
  ============================================================
--}}
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
  @include('partes.head')
</head>
<body class="layout-admin">

  {{-- Topbar exclusivo del área de administración --}}
  <header class="admin-topbar" role="banner">
    <div class="admin-topbar-inner">

      {{-- Lado izquierdo: logo + contexto --}}
      <div class="admin-topbar-left">
        <a href="{{ route('admin.panel') }}" class="admin-topbar-brand" aria-label="Ir al panel de administración">
          <img
            src="https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/logo.png"
            alt="Vittorio"
            class="admin-topbar-logo"
          />
        </a>
        <span class="admin-topbar-sep" aria-hidden="true">/</span>
        <span class="admin-topbar-context vt-eyebrow">Administración</span>
      </div>

      {{-- Lado derecho: usuario + logout --}}
      <div class="admin-topbar-right">
        @auth
          <div class="admin-topbar-divider" aria-hidden="true"></div>

          <div class="admin-topbar-user">
            <div class="admin-topbar-avatar" aria-hidden="true">
              {{ strtoupper(substr(auth()->user()->nombre, 0, 1)) }}
            </div>
            <span class="admin-topbar-username">{{ auth()->user()->nombre }}</span>
          </div>

          <form action="{{ route('logout') }}" method="POST" class="admin-topbar-logout-form">
            @csrf
            <button type="submit" class="admin-topbar-action admin-topbar-action--logout" aria-label="Cerrar sesión">
              <i data-lucide="log-out"></i>
              <span>Salir</span>
            </button>
          </form>
        @endauth
      </div>

    </div>
  </header>

  <main class="admin-main">
    @yield('content')
  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://unpkg.com/lucide@latest"></script>
  <script>
    lucide.createIcons();
  </script>
  @include('partes.toasts')
  @stack('scripts')
</body>
</html>
