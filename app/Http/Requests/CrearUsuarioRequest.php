<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CrearUsuarioRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'nombre'            => ['required', 'string', 'min:2', 'max:100'],
            'email'             => ['required', 'email', 'unique:usuarios,email'],
            'password'          => ['required', 'string', 'min:8', 'confirmed'],
            'rol_id'            => ['required', 'exists:roles,id'],
        ];
    }
}
