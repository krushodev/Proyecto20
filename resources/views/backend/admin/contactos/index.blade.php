@extends('layout.layout-admin')

@section('title', 'Consultas - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container admin-container--md">

    <div class="admin-header admin-header--with-action">
      <div>
        <h1 class="admin-title">Consultas</h1>
        <p class="admin-subtitle">
          {{ $contactos->count() }} {{ $contactos->count() === 1 ? 'mensaje' : 'mensajes' }}
          @php($sinLeer = $contactos->where('leido', false)->count())
          @if($sinLeer > 0)
            &nbsp;·&nbsp; <span class="ac-unread-count">{{ $sinLeer }} sin leer</span>
          @endif
        </p>
      </div>
      <a href="{{ route('admin.panel') }}" class="admin-back">
        <i data-lucide="arrow-left"></i> Volver al panel
      </a>
    </div>

    @forelse($contactos as $contacto)
      <div class="ac-card {{ $contacto->leido ? 'ac-card--leido' : 'ac-card--nuevo' }}">

        <div class="ac-card-header">
          <div class="ac-meta">
            <span class="ac-nombre">{{ $contacto->nombre }}</span>
            <span class="ac-email">{{ $contacto->email }}</span>
          </div>
          <div class="ac-card-right">
            <span class="ac-fecha">
              <i data-lucide="clock"></i>
              {{ $contacto->created_at->format('d/m/Y H:i') }}
            </span>
            @if(!$contacto->leido)
              <span class="admin-badge admin-badge-new">Nuevo</span>
            @else
              <span class="admin-badge admin-badge-read">Leído</span>
            @endif
            <form action="{{ route('contactos.leido', $contacto->id) }}" method="POST">
              @csrf
              @method('PATCH')
              <button type="submit" class="ac-btn-toggle" title="{{ $contacto->leido ? 'Marcar como no leído' : 'Marcar como leído' }}">
                <i data-lucide="{{ $contacto->leido ? 'mail' : 'mail-check' }}"></i>
              </button>
            </form>
          </div>
        </div>

        <div class="ac-asunto">
          <i data-lucide="tag"></i>
          {{ $contacto->asunto }}
        </div>

        <p class="ac-mensaje">{{ $contacto->mensaje }}</p>

      </div>
    @empty
      <div class="admin-empty-state">
        <i data-lucide="inbox"></i>
        <p>No hay resultados.</p>
      </div>
    @endforelse

  </div>
</div>
@endsection
