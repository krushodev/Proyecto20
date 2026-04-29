{{-- 
  ============================================================
  PLANTILLA: layout.blade.php
  PROPÓSITO: Plantilla principal del sitio
  DESCRIPCIÓN: Estructura base HTML que heredan todas las vistas.
  Incluye el head, navbar, contenido principal (yield), footer
  y scripts globales (Bootstrap, Lucide icons).
  ============================================================
--}}
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
  @include ('partes.head')
</head>
<body>
  @include ('partes.navbar')

  <main>
    @yield ('content')
  </main>

  @include ('partes.footer')

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://unpkg.com/lucide@latest"></script>
  <script>
    lucide.createIcons();
  </script>
  @include ('partes.currency-script')
  @stack ('scripts')
</body>
</html>
