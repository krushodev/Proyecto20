@extends('layout.layout-admin')

@section('title', 'Nuevo Producto - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container admin-container--form">

    <div class="admin-header admin-header--with-action">
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
        <button type="submit" class="btn-vt btn-vt-primary">Crear Producto</button>
        <a href="{{ route('productos.index') }}" class="admin-btn-cancel">Cancelar</a>
      </div>
    </form>

  </div>
</div>
@endsection

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
