{{--
  PARTIAL: toasts.blade.php
  Notificaciones emergentes Vittorio — SweetAlert2 restyled.
  Incluido automáticamente desde layout.blade.php.
--}}
@php
  $successMsg = session('success') ?? session('status');
  $errorMsg   = session('error');
  $warningMsg = session('warning');
  $infoMsg    = session('info');
  $hasErrors  = $errors->any();
@endphp

@if ($successMsg || $errorMsg || $warningMsg || $infoMsg || $hasErrors)

<style>
/* ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   Vittorio Toasts — override completo de SweetAlert2
   Selectores de alta especificidad para ganar el cascade.
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ */

/* 1. Contenedor: posicionado debajo de la navbar fija */
.swal2-container.vt-wrap {
  padding: .5rem !important;
  z-index: 9999 !important;
}
.swal2-container.vt-wrap.swal2-top-end {
  top: 68px !important;
}

/* 2. Popup base */
.swal2-container.vt-wrap .swal2-popup.vt-popup {
  /* layout */
  display:          flex !important;
  flex-direction:   column !important;
  align-items:      flex-start !important;
  gap:              0 !important;
  /* dimensiones — controladas sólo por CSS, nunca por el parámetro width de JS */
  width:            auto !important;
  min-width:        220px !important;
  max-width:        min(360px, calc(100vw - 1.5rem)) !important;
  box-sizing:       border-box !important;
  /* apariencia */
  background:       #131313 !important;
  border:           1px solid rgba(220, 220, 220, .08) !important;
  border-left:      3px solid !important; /* color se pone por variante */
  border-radius:    2px !important;
  box-shadow:       0 8px 28px rgba(0, 0, 0, .5) !important;
  font-family:      'Space Grotesk', ui-sans-serif, sans-serif !important;
  padding:          .875rem 1.125rem !important;
  overflow:         hidden !important;
}

/* 3. Color del borde izquierdo según variante */
.swal2-container.vt-wrap .swal2-popup.vt-popup--success { border-left-color: #4ade80 !important; }
.swal2-container.vt-wrap .swal2-popup.vt-popup--error   { border-left-color: #ff6b6b !important; }
.swal2-container.vt-wrap .swal2-popup.vt-popup--warning { border-left-color: #f59e0b !important; }
.swal2-container.vt-wrap .swal2-popup.vt-popup--info    { border-left-color: #60a5fa !important; }

/* 4. Ocultar el ícono SVG de SweetAlert2 (fuente del problema de sizing) */
.swal2-container.vt-wrap .swal2-icon {
  display: none !important;
}

/* 5. Título */
.swal2-container.vt-wrap .swal2-title.vt-title {
  display:        block !important;
  width:          100% !important;
  margin:         0 !important;
  padding:        0 !important;
  font-size:      .78rem !important;
  font-weight:    600 !important;
  color:          #e5e2e1 !important;
  letter-spacing: .025em !important;
  line-height:    1.4 !important;
  text-align:     left !important;
}

/* 6. Contenido HTML (lista de errores de validación) */
.swal2-container.vt-wrap .swal2-html-container.vt-html {
  display:      block !important;
  width:        100% !important;
  margin:       .35rem 0 0 !important;
  padding:      0 !important;
  font-size:    .72rem !important;
  color:        rgba(220, 220, 220, .5) !important;
  line-height:  1.55 !important;
  text-align:   left !important;
}
.swal2-container.vt-wrap .swal2-html-container.vt-html ul {
  margin:       0 !important;
  padding-left: .9rem !important;
  list-style:   disc !important;
}
.swal2-container.vt-wrap .swal2-html-container.vt-html li {
  margin-bottom: .15rem !important;
}

/* 7. Barra de progreso */
.swal2-container.vt-wrap .swal2-timer-progress-bar-container {
  border-radius: 0 !important;
}
.swal2-container.vt-wrap .swal2-timer-progress-bar {
  height:        2px !important;
  background:    rgba(220, 220, 220, .12) !important;
  border-radius: 0 !important;
}
/* Barra coloreada según el tipo */
.swal2-container.vt-wrap.vt-wrap--success .swal2-timer-progress-bar { background: rgba(74,  222, 128, .35) !important; }
.swal2-container.vt-wrap.vt-wrap--error   .swal2-timer-progress-bar { background: rgba(255, 107, 107, .35) !important; }
.swal2-container.vt-wrap.vt-wrap--warning .swal2-timer-progress-bar { background: rgba(245, 158,  11, .35) !important; }
.swal2-container.vt-wrap.vt-wrap--info    .swal2-timer-progress-bar { background: rgba(96,  165, 250, .35) !important; }

/* 8. Responsive: en móvil el toast ocupa el ancho disponible */
@media (max-width: 480px) {
  .swal2-container.vt-wrap.swal2-top-end {
    right:  0 !important;
    left:   0 !important;
    top:    60px !important;
  }
  .swal2-container.vt-wrap .swal2-popup.vt-popup {
    min-width: 0 !important;
    width:     calc(100vw - 1rem) !important;
    max-width: calc(100vw - 1rem) !important;
  }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function () {

  function vToast(type, opts) {
    return Swal.fire(Object.assign({
      toast:             true,
      position:          'top-end',
      showConfirmButton: false,
      timerProgressBar:  true,
    }, opts, {
      customClass: Object.assign({
        container:     'vt-wrap vt-wrap--' + type,
        popup:         'vt-popup vt-popup--' + type,
        title:         'vt-title',
        htmlContainer: 'vt-html',
      }, opts.customClass || {}),
    }));
  }

  @if ($successMsg)
  vToast('success', { title: @json($successMsg), timer: 4000 });
  @endif

  @if ($errorMsg)
  vToast('error', { title: @json($errorMsg), timer: 5500 });
  @endif

  @if ($warningMsg)
  vToast('warning', { title: @json($warningMsg), timer: 5000 });
  @endif

  @if ($infoMsg)
  vToast('info', { title: @json($infoMsg), timer: 4000 });
  @endif

  @if ($hasErrors)
  vToast('error', {
    title: 'Corregí los errores del formulario',
    html: '<ul>'
      @foreach ($errors->all() as $error)
        + '<li>{{ e($error) }}</li>'
      @endforeach
      + '</ul>',
    timer: 7000,
  });
  @endif

});
</script>
@endif
