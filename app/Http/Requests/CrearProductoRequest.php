<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CrearProductoRequest extends FormRequest
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
        return [
            'categoria_id'     => ['required', 'exists:categorias,id'],
            'nombre'           => ['required', 'string', 'max:150'],
            'slug'             => ['required', 'string', 'max:150', 'unique:productos,slug'],
            'descripcion'      => ['nullable', 'string'],
            'precio'           => ['required', 'numeric', 'min:0'],
            'imagen_lifestyle' => ['nullable', 'image', 'mimes:jpeg,png,jpg,webp', 'max:2048'],
            'imagen_studio'    => ['nullable', 'image', 'mimes:jpeg,png,jpg,webp', 'max:2048'],
            'caja'             => ['nullable', 'string', 'max:200'],
            'movimiento'       => ['nullable', 'string', 'max:200'],
            'cristal'          => ['nullable', 'string', 'max:200'],
            'resistencia'      => ['nullable', 'string', 'max:200'],
            'correa'           => ['nullable', 'string', 'max:200'],
            'stock'            => ['required', 'integer', 'min:0'],
            'activo'           => ['required', 'boolean'],
        ];
    }
}
