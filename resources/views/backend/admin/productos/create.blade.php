@extends('layout.layout')

@section('title', 'Nuevo Producto - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container" style="max-width:680px">

    <div class="admin-header">
      <div>
        <h1 class="admin-title">Nuevo Producto</h1>
        <p class="admin-subtitle">Completá los datos del reloj.</p>
      </div>
      <a href="{{ route('productos.index') }}" class="admin-back">
        <i data-lucide="arrow-left"></i> Volver
      </a>
    </div>

    <form action="{{ route('productos.store') }}" method="POST" class="admin-form">
      @csrf

      <div class="admin-form-section">
        <h2 class="admin-form-section-title">Información general</h2>

        <div class="form-group">
          <label for="nombre" class="form-label">Nombre</label>
          <input type="text" id="nombre" name="nombre"
                 class="form-input {{ $errors->has('nombre') ? 'is-invalid' : '' }}"
                 value="{{ old('nombre') }}" required maxlength="150" />
          @error('nombre')<span class="form-error">{{ $message }}</span>@enderror
        </div>

        <div class="form-group">
          <label for="slug" class="form-label">Slug <small>(URL amigable)</small></label>
          <input type="text" id="slug" name="slug"
                 class="form-input {{ $errors->has('slug') ? 'is-invalid' : '' }}"
                 value="{{ old('slug') }}" required maxlength="150" />
          @error('slug')<span class="form-error">{{ $message }}</span>@enderror
        </div>

        <div class="form-group">
          <label for="categoria_id" class="form-label">Categoría</label>
          <select id="categoria_id" name="categoria_id"
                  class="form-input {{ $errors->has('categoria_id') ? 'is-invalid' : '' }}" required>
            <option value="">Seleccioná una categoría</option>
            @foreach($categorias as $categoria)
              <option value="{{ $categoria->id }}" {{ old('categoria_id') == $categoria->id ? 'selected' : '' }}>
                {{ $categoria->nombre }}
              </option>
            @endforeach
          </select>
          @error('categoria_id')<span class="form-error">{{ $message }}</span>@enderror
        </div>

        <div class="form-group">
          <label for="descripcion" class="form-label">Descripción</label>
          <textarea id="descripcion" name="descripcion" rows="3"
                    class="form-input {{ $errors->has('descripcion') ? 'is-invalid' : '' }}">{{ old('descripcion') }}</textarea>
          @error('descripcion')<span class="form-error">{{ $message }}</span>@enderror
        </div>
      </div>

      <div class="admin-form-section">
        <h2 class="admin-form-section-title">Precio e inventario</h2>

        <div class="admin-form-row">
          <div class="form-group">
            <label for="precio" class="form-label">Precio (ARS)</label>
            <input type="number" id="precio" name="precio" step="0.01" min="0"
                   class="form-input {{ $errors->has('precio') ? 'is-invalid' : '' }}"
                   value="{{ old('precio') }}" required />
            @error('precio')<span class="form-error">{{ $message }}</span>@enderror
          </div>

          <div class="form-group">
            <label for="stock" class="form-label">Stock</label>
            <input type="number" id="stock" name="stock" min="0"
                   class="form-input {{ $errors->has('stock') ? 'is-invalid' : '' }}"
                   value="{{ old('stock', 0) }}" required />
            @error('stock')<span class="form-error">{{ $message }}</span>@enderror
          </div>
        </div>

        <div class="form-group">
          <label class="admin-checkbox-label">
            <input type="hidden" name="activo" value="0" />
            <input type="checkbox" name="activo" value="1" {{ old('activo', true) ? 'checked' : '' }} />
            <span>Producto activo (visible en la tienda)</span>
          </label>
        </div>
      </div>

      <div class="admin-form-section">
        <h2 class="admin-form-section-title">Imágenes</h2>

        <div class="form-group">
          <label for="imagen_lifestyle" class="form-label">URL Imagen Lifestyle</label>
          <input type="url" id="imagen_lifestyle" name="imagen_lifestyle"
                 class="form-input {{ $errors->has('imagen_lifestyle') ? 'is-invalid' : '' }}"
                 value="{{ old('imagen_lifestyle') }}" placeholder="https://..." />
          @error('imagen_lifestyle')<span class="form-error">{{ $message }}</span>@enderror
        </div>

        <div class="form-group">
          <label for="imagen_studio" class="form-label">URL Imagen Studio</label>
          <input type="url" id="imagen_studio" name="imagen_studio"
                 class="form-input {{ $errors->has('imagen_studio') ? 'is-invalid' : '' }}"
                 value="{{ old('imagen_studio') }}" placeholder="https://..." />
          @error('imagen_studio')<span class="form-error">{{ $message }}</span>@enderror
        </div>
      </div>

      <div class="admin-form-section">
        <h2 class="admin-form-section-title">Especificaciones técnicas</h2>

        @foreach(['caja' => 'Caja', 'movimiento' => 'Movimiento', 'cristal' => 'Cristal', 'resistencia' => 'Resistencia al agua', 'correa' => 'Correa'] as $field => $label)
          <div class="form-group">
            <label for="{{ $field }}" class="form-label">{{ $label }}</label>
            <input type="text" id="{{ $field }}" name="{{ $field }}"
                   class="form-input {{ $errors->has($field) ? 'is-invalid' : '' }}"
                   value="{{ old($field) }}" maxlength="200" />
            @error($field)<span class="form-error">{{ $message }}</span>@enderror
          </div>
        @endforeach
      </div>

      <div class="admin-form-actions">
        <button type="submit" class="btn-login">Crear Producto</button>
        <a href="{{ route('productos.index') }}" class="admin-btn-cancel">Cancelar</a>
      </div>
    </form>

  </div>
</div>
@endsection

@push('styles')
<style>
.admin-page { min-height: 100vh; padding: 2rem; background-color: #0a0a0a; }
.admin-container { margin: 0 auto; }
.admin-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 2rem; padding-bottom: 1.5rem; border-bottom: 1px solid rgba(255,255,255,0.08); }
.admin-title { font-size: 1.75rem; font-weight: 700; color: #fff; letter-spacing: -0.02em; }
.admin-subtitle { font-size: 0.875rem; color: rgba(255,255,255,0.5); margin-top: 0.25rem; }
.admin-back { display: flex; align-items: center; gap: 0.4rem; font-size: 0.8rem; color: rgba(255,255,255,0.5); text-decoration: none; white-space: nowrap; transition: color 0.2s; }
.admin-back:hover { color: #fff; }
.admin-back i { width: 14px; height: 14px; }
.admin-form { display: flex; flex-direction: column; gap: 2rem; }
.admin-form-section { display: flex; flex-direction: column; gap: 1rem; padding: 1.5rem; border: 1px solid rgba(255,255,255,.07); border-radius: 8px; }
.admin-form-section-title { font-size: .7rem; font-weight: 600; letter-spacing: .1em; text-transform: uppercase; color: rgba(255,255,255,.35); margin-bottom: .25rem; }
.admin-form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; }
.admin-checkbox-label { display: flex; align-items: center; gap: .6rem; cursor: pointer; font-size: .875rem; color: rgba(255,255,255,.7); }
.admin-checkbox-label input[type="checkbox"] { width: 15px; height: 15px; accent-color: #fff; }
.admin-form-actions { display: flex; gap: 1rem; align-items: center; }
.admin-btn-cancel { font-size: .875rem; color: rgba(255,255,255,.4); text-decoration: none; transition: color .2s; }
.admin-btn-cancel:hover { color: #fff; }
select.form-input option { background-color: #1a1a1a; color: #fff; }
textarea.form-input { resize: vertical; min-height: 80px; }
</style>
@endpush

@push('scripts')
<script>
  document.getElementById('nombre').addEventListener('input', function () {
    const slug = this.value.toLowerCase()
      .normalize('NFD').replace(/[̀-ͯ]/g, '')
      .replace(/[^a-z0-9\s-]/g, '')
      .trim().replace(/\s+/g, '-');
    document.getElementById('slug').value = slug;
  });
</script>
@endpush
