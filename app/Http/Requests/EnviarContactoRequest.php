<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EnviarContactoRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'nombre'  => ['required', 'string', 'max:100'],
            'email'   => ['required', 'email', 'max:150'],
            'asunto'  => ['required', 'string', 'max:150'],
            'mensaje' => ['nullable', 'string', 'max:2000'],
        ];
    }
}
