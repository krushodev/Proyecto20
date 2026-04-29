{{-- 
  ============================================================
  COMPONENTE: head.blade.php
  PROPÓSITO: Sección head del HTML
  DESCRIPCIÓN: Incluye metadatos, título, favicon, fuentes
  Google (Space Grotesk), Bootstrap CSS y Vite para assets.
  Se incluye en la plantilla principal layout.blade.php
  ============================================================
--}}
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>@yield ('title', 'Vittorio')</title>
<link rel="icon" type="image/png" href="{{ asset('assets/logo.png') }}" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&display=swap"
  rel="stylesheet"
/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
@if (file_exists(public_path('build/manifest.json')) || file_exists(public_path('hot')))
  @vite (['resources/css/app.css', 'resources/js/app.js'])
@endif
@stack ('styles')
