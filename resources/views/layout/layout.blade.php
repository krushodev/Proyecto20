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
