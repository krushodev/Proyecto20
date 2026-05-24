<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegistroRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'nombre'   => ['required', 'string', 'min:2', 'max:100'],
            'email'    => ['required', 'email', 'unique:usuarios,email'],
            'password' => ['required', 'min:8', 'confirmed'],
        ];
    }
}
