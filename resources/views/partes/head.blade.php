{{--
  ============================================================
  COMPONENTE: head.blade.php
  PROPÓSITO: Sección head del HTML
  DESCRIPCIÓN: Incluye metadatos, título, favicon, fuentes
  Google (Inter Variable como body, Space Grotesk como display),
  Bootstrap CSS y el CSS compilado del proyecto.
  ============================================================
--}}
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>@yield ('title', 'Vittorio')</title>
<link rel="icon" type="image/png" href="https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/logo.png" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&family=Space+Grotesk:wght@300;400;500;600;700&display=swap"
  rel="stylesheet"
/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="{{ asset('css/app.css') }}" />
@stack ('styles')
