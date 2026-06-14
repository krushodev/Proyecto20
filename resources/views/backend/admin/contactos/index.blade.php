@extends('layout.layout')

@section('title', 'Consultas - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container">

    <div class="admin-header">
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
        <p>No hay consultas registradas.</p>
      </div>
    @endforelse

  </div>
</div>
@endsection

@push('styles')
<style>
.admin-page { min-height: 100vh; padding: 2rem; background-color: #0a0a0a; }
.admin-container { max-width: 860px; margin: 0 auto; }
.admin-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 2rem; padding-bottom: 1.5rem; border-bottom: 1px solid rgba(255,255,255,0.08); }
.admin-title { font-size: 1.75rem; font-weight: 700; color: #fff; letter-spacing: -0.02em; }
.admin-subtitle { font-size: 0.875rem; color: rgba(255,255,255,0.5); margin-top: 0.25rem; }
.admin-back { display: flex; align-items: center; gap: 0.4rem; font-size: 0.8rem; color: rgba(255,255,255,0.5); text-decoration: none; transition: color 0.2s; white-space: nowrap; }
.admin-back:hover { color: #fff; }
.admin-back i { width: 14px; height: 14px; }
.ac-unread-count { color: #facc15; font-weight: 600; }
.admin-alert-success { padding: .75rem 1rem; background: rgba(74,222,128,.1); border: 1px solid rgba(74,222,128,.3); border-radius: 6px; color: #4ade80; font-size: .85rem; margin-bottom: 1.5rem; }
.ac-card {
  border: 1px solid rgba(255,255,255,.08);
  border-radius: 10px;
  padding: 1.25rem 1.5rem;
  margin-bottom: 1rem;
  display: flex;
  flex-direction: column;
  gap: .75rem;
  transition: border-color .2s;
}
.ac-card--nuevo {
  border-color: rgba(250,204,21,.2);
  background: rgba(250,204,21,.02);
}
.ac-card--leido { background: rgba(255,255,255,.015); }
.ac-card-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  gap: 1rem;
  flex-wrap: wrap;
}
.ac-meta { display: flex; flex-direction: column; gap: .2rem; }
.ac-nombre { font-size: .9rem; font-weight: 600; color: #fff; }
.ac-email { font-size: .75rem; color: rgba(255,255,255,.4); font-family: monospace; }
.ac-card-right { display: flex; align-items: center; gap: .65rem; flex-wrap: wrap; }
.ac-fecha { display: flex; align-items: center; gap: .3rem; font-size: .72rem; color: rgba(255,255,255,.35); }
.ac-fecha i { width: 12px; height: 12px; }
.admin-badge { display: inline-block; padding: .2rem .6rem; border-radius: 20px; font-size: .68rem; font-weight: 600; letter-spacing: .05em; white-space: nowrap; }
.admin-badge-new { background: rgba(250,204,21,.12); color: #facc15; border: 1px solid rgba(250,204,21,.3); }
.admin-badge-read { background: rgba(255,255,255,.06); color: rgba(255,255,255,.4); border: 1px solid rgba(255,255,255,.1); }
.ac-btn-toggle {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 30px;
  height: 30px;
  background: none;
  border: 1px solid rgba(255,255,255,.12);
  border-radius: 5px;
  color: rgba(255,255,255,.5);
  cursor: pointer;
  transition: all .2s;
}
.ac-btn-toggle:hover { border-color: rgba(255,255,255,.4); color: #fff; }
.ac-btn-toggle i { width: 14px; height: 14px; }
.ac-asunto {
  display: flex;
  align-items: center;
  gap: .4rem;
  font-size: .78rem;
  font-weight: 600;
  letter-spacing: .04em;
  color: rgba(255,255,255,.6);
  text-transform: uppercase;
}
.ac-asunto i { width: 13px; height: 13px; opacity: .5; }
.ac-mensaje {
  font-size: .875rem;
  color: rgba(255,255,255,.75);
  line-height: 1.65;
  margin: 0;
  white-space: pre-wrap;
}
.admin-empty-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: .75rem;
  padding: 4rem 1rem;
  color: rgba(255,255,255,.25);
  font-size: .9rem;
}
.admin-empty-state i { width: 40px; height: 40px; }
</style>
@endpush
