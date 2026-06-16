<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FiltrarVentasRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'desde'  => ['nullable', 'date'],
            'hasta'  => ['nullable', 'date', 'after_or_equal:desde'],
            'estado' => ['nullable', 'string', 'in:carrito,confirmado'],
        ];
    }
}
