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
