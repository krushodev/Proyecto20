<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class ActualizarPerfilRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'nombre'                => ['required', 'string', 'min:2', 'max:100'],
            'email'                 => ['required', 'email', 'max:150', 'unique:usuarios,email,' . Auth::id()],
            'password'              => ['nullable', 'string', 'min:8', 'confirmed'],
            'password_confirmation' => ['nullable', 'string'],
            'numero_tarjeta'        => ['nullable', 'string', 'regex:/^[0-9\s\-]{13,19}$/'],
            'titular_tarjeta'       => ['nullable', 'string', 'max:255'],
            'vencimiento_tarjeta'   => ['nullable', 'string', 'regex:/^\d{2}\/\d{2}$/'],
            'cvv_tarjeta'           => ['nullable', 'string', 'regex:/^[0-9]{3,4}$/'],
            'ubicacion'             => ['nullable', 'string', 'max:255'],
        ];
    }
}
