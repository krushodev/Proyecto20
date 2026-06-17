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
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://unpkg.com/lucide@latest"></script>
  <script>
    lucide.createIcons();
  </script>
  @include ('partes.toasts')
  @stack ('scripts')
  <script>
  /* ── Password visibility toggle (global, auto-init) ──────────── */
  (function () {
    document.querySelectorAll('input[type="password"]').forEach(function (input) {
      // Excluir campos CVV de tarjeta
      if (input.getAttribute('autocomplete') === 'cc-csc') return;
      if (input.parentElement && input.parentElement.classList.contains('pw-wrap')) return;

      var wrap = document.createElement('div');
      wrap.className = 'pw-wrap';
      input.parentNode.insertBefore(wrap, input);
      wrap.appendChild(input);

      var btn = document.createElement('button');
      btn.type = 'button';
      btn.className = 'pw-eye-btn';
      btn.setAttribute('aria-label', 'Mostrar contraseña');
      btn.innerHTML = '<i data-lucide="eye"></i>';
      wrap.appendChild(btn);

      btn.addEventListener('click', function () {
        var visible = input.type === 'text';
        input.type = visible ? 'password' : 'text';
        btn.setAttribute('aria-label', visible ? 'Mostrar contraseña' : 'Ocultar contraseña');
        btn.innerHTML = visible ? '<i data-lucide="eye"></i>' : '<i data-lucide="eye-off"></i>';
        lucide.createIcons();
      });
    });
    lucide.createIcons();
  })();
  </script>
</body>
</html>
