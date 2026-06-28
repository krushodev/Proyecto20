@if ($paginator->hasPages())
  <nav class="admin-pager" aria-label="Paginación">

    {{-- Anterior --}}
    @if ($paginator->onFirstPage())
      <span class="admin-pager-btn admin-pager-btn--disabled" aria-disabled="true">
        <i data-lucide="chevron-left"></i>
      </span>
    @else
      <a href="{{ $paginator->previousPageUrl() }}" class="admin-pager-btn" rel="prev" aria-label="Anterior">
        <i data-lucide="chevron-left"></i>
      </a>
    @endif

    {{-- Números de página --}}
    @foreach ($elements as $element)
      @if (is_string($element))
        <span class="admin-pager-btn admin-pager-btn--dots" aria-hidden="true">…</span>
      @endif

      @if (is_array($element))
        @foreach ($element as $page => $url)
          @if ($page == $paginator->currentPage())
            <span class="admin-pager-btn admin-pager-btn--active" aria-current="page">{{ $page }}</span>
          @else
            <a href="{{ $url }}" class="admin-pager-btn">{{ $page }}</a>
          @endif
        @endforeach
      @endif
    @endforeach

    {{-- Siguiente --}}
    @if ($paginator->hasMorePages())
      <a href="{{ $paginator->nextPageUrl() }}" class="admin-pager-btn" rel="next" aria-label="Siguiente">
        <i data-lucide="chevron-right"></i>
      </a>
    @else
      <span class="admin-pager-btn admin-pager-btn--disabled" aria-disabled="true">
        <i data-lucide="chevron-right"></i>
      </span>
    @endif

  </nav>
@endif
