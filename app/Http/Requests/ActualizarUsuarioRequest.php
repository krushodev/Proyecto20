<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ActualizarUsuarioRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        $usuario = $this->route('usuario');

        return [
            'nombre' => ['required', 'string', 'min:2', 'max:100'],
            'email'  => ['required', 'email', 'unique:usuarios,email,' . $usuario->id],
            'rol_id' => ['required', 'exists:roles,id'],
        ];
    }
}
