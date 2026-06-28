@extends('layout.layout-admin')

@section('title', 'Editar Producto - Vittorio Admin')

@section('content')
<div class="admin-page">
  <div class="admin-container admin-container--form">

    <div class="admin-header admin-header--with-action">
      <div>
        <h1 class="admin-title">Editar Producto</h1>
        <p class="admin-subtitle">{{ $producto->nombre }}</p>
      </div>
      <a href="{{ route('productos.index') }}" class="admin-back">
        <i data-lucide="arrow-left"></i> Volver
      </a>
    </div>

    <form action="{{ route('productos.update', $producto) }}" method="POST" enctype="multipart/form-data" class="admin-form">
      @csrf @method('PUT')

      <div class="admin-form-section">
        <h2 class="admin-form-section-title">Información general</h2>

        <div class="form-group">
          <label for="nombre" class="form-label">Nombre</label>
          <input type="text" id="nombre" name="nombre"
                 class="form-input {{ $errors->has('nombre') ? 'is-invalid' : '' }}"
                 value="{{ old('nombre', $producto->nombre) }}" required maxlength="150" />
          @error('nombre')<span class="form-error">{{ $message }}</span>@enderror
        </div>

        <div class="form-group">
          <label for="slug" class="form-label">Slug <small>(URL amigable)</small></label>
          <input type="text" id="slug" name="slug"
                 class="form-input {{ $errors->has('slug') ? 'is-invalid' : '' }}"
                 value="{{ old('slug', $producto->slug) }}" required maxlength="150" />
          @error('slug')<span class="form-error">{{ $message }}</span>@enderror
        </div>

        <div class="form-group">
          <label for="categoria_id" class="form-label">Categoría</label>
          <select id="categoria_id" name="categoria_id"
                  class="form-input {{ $errors->has('categoria_id') ? 'is-invalid' : '' }}" required>
            <option value="">Seleccioná una categoría</option>
            @foreach($categorias as $categoria)
              <option value="{{ $categoria->id }}" {{ old('categoria_id', $producto->categoria_id) == $categoria->id ? 'selected' : '' }}>
                {{ $categoria->nombre }}
              </option>
            @endforeach
          </select>
          @error('categoria_id')<span class="form-error">{{ $message }}</span>@enderror
        </div>

        <div class="form-group">
          <label for="descripcion" class="form-label">Descripción</label>
          <textarea id="descripcion" name="descripcion" rows="3"
                    class="form-input {{ $errors->has('descripcion') ? 'is-invalid' : '' }}">{{ old('descripcion', $producto->descripcion) }}</textarea>
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
                   value="{{ old('precio', $producto->precio) }}" required />
            @error('precio')<span class="form-error">{{ $message }}</span>@enderror
          </div>

          <div class="form-group">
            <label for="stock" class="form-label">Stock</label>
            <input type="number" id="stock" name="stock" min="0"
                   class="form-input {{ $errors->has('stock') ? 'is-invalid' : '' }}"
                   value="{{ old('stock', $producto->stock) }}" required />
            @error('stock')<span class="form-error">{{ $message }}</span>@enderror
          </div>
        </div>

        <div class="form-group">
          <label class="admin-checkbox-label">
            <input type="hidden" name="activo" value="0" />
            <input type="checkbox" name="activo" value="1" {{ old('activo', $producto->activo) ? 'checked' : '' }} />
            <span>Producto activo (visible en la tienda)</span>
          </label>
        </div>
      </div>

      <div class="admin-form-section">
        <h2 class="admin-form-section-title">Imágenes</h2>

        <div class="form-group">
          <label for="imagen_lifestyle" class="form-label">Imagen Lifestyle</label>
          @if($producto->imagen_lifestyle)
            <img src="{{ $producto->imagen_lifestyle }}"
                 alt="Lifestyle actual" class="admin-product-thumb" style="margin-bottom:8px;" />
            <p class="form-hint">Subí un nuevo archivo para reemplazar la imagen actual.</p>
          @endif
          <input type="file" id="imagen_lifestyle" name="imagen_lifestyle"
                 class="form-input {{ $errors->has('imagen_lifestyle') ? 'is-invalid' : '' }}"
                 accept="image/jpeg,image/png,image/jpg,image/webp" />
          @error('imagen_lifestyle')<span class="form-error">{{ $message }}</span>@enderror
        </div>

        <div class="form-group">
          <label for="imagen_studio" class="form-label">Imagen Studio</label>
          @if($producto->imagen_studio)
            <img src="{{ $producto->imagen_studio }}"
                 alt="Studio actual" class="admin-product-thumb" style="margin-bottom:8px;" />
            <p class="form-hint">Subí un nuevo archivo para reemplazar la imagen actual.</p>
          @endif
          <input type="file" id="imagen_studio" name="imagen_studio"
                 class="form-input {{ $errors->has('imagen_studio') ? 'is-invalid' : '' }}"
                 accept="image/jpeg,image/png,image/jpg,image/webp" />
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
                   value="{{ old($field, $producto->$field) }}" maxlength="200" />
            @error($field)<span class="form-error">{{ $message }}</span>@enderror
          </div>
        @endforeach
      </div>

      <div class="admin-form-actions">
        <button type="submit" class="btn-vt btn-vt-primary">Guardar Cambios</button>
        <a href="{{ route('productos.index') }}" class="admin-btn-cancel">Cancelar</a>
      </div>
    </form>

  </div>
</div>
@endsection
