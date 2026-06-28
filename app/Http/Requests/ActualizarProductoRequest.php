<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\UploadedFile;

class ActualizarProductoRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    protected function prepareForValidation(): void
    {
        $this->merge(['activo' => $this->boolean('activo')]);
    }

    public function rules(): array
    {
        $producto = $this->route('producto');

        return [
            'categoria_id'     => ['required', 'exists:categorias,id'],
            'nombre'           => ['required', 'string', 'max:150'],
            'slug'             => ['required', 'string', 'max:150', 'unique:productos,slug,' . $producto->id],
            'descripcion'      => ['nullable', 'string'],
            'precio'           => ['required', 'numeric', 'min:0'],
            'imagen_lifestyle' => ['nullable', $this->reglasImagen()],
            'imagen_studio'    => ['nullable', $this->reglasImagen()],
            'caja'             => ['nullable', 'string', 'max:200'],
            'movimiento'       => ['nullable', 'string', 'max:200'],
            'cristal'          => ['nullable', 'string', 'max:200'],
            'resistencia'      => ['nullable', 'string', 'max:200'],
            'correa'           => ['nullable', 'string', 'max:200'],
            'stock'            => ['required', 'integer', 'min:0'],
            'activo'           => ['required', 'boolean'],
        ];
    }

    protected function reglasImagen(): \Closure
    {
        return function (string $attribute, mixed $value, \Closure $fail): void {
            if ($value instanceof UploadedFile) {
                if (!in_array($value->getMimeType(), ['image/jpeg', 'image/png', 'image/jpg', 'image/webp'], true)) {
                    $fail('La imagen debe ser un archivo jpeg, png, jpg o webp.');
                }
                if ($value->getSize() > 2048 * 1024) {
                    $fail('La imagen no puede superar los 2 MB.');
                }
                return;
            }

            if (!filter_var($value, FILTER_VALIDATE_URL)) {
                $fail('El campo debe ser una URL válida o un archivo de imagen.');
            }
        };
    }
}
