<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class GuardarDireccionRequest extends FormRequest
{
    public function authorize(): bool
    {
        // Si se usa una dirección guardada, verificar que pertenezca al usuario
        if ($this->filled('direccion_id')) {
            return Auth::user()->direcciones()->where('id', $this->direccion_id)->exists();
        }

        return true;
    }

    protected function prepareForValidation(): void
    {
        $this->merge([
            'guardar_direccion' => $this->boolean('guardar_direccion'),
        ]);
    }

    public function rules(): array
    {
        $usandoGuardada = $this->filled('direccion_id');

        return [
            'direccion_id'      => ['nullable', 'integer', 'exists:user_direcciones,id'],
            'alias'             => $usandoGuardada ? ['nullable'] : ['required', 'string', 'max:60'],
            'calle'             => $usandoGuardada ? ['nullable'] : ['required', 'string', 'max:200'],
            'numero'            => $usandoGuardada ? ['nullable'] : ['required', 'string', 'max:20'],
            'ciudad'            => $usandoGuardada ? ['nullable'] : ['required', 'string', 'max:100'],
            'provincia'         => $usandoGuardada ? ['nullable'] : ['required', 'string', 'max:100'],
            'cp'                => $usandoGuardada ? ['nullable'] : ['required', 'string', 'max:20'],
            'observaciones'     => ['nullable', 'string', 'max:300'],
            'guardar_direccion' => ['boolean'],
        ];
    }

    public function messages(): array
    {
        return [
            'calle.required'    => 'La calle es obligatoria.',
            'numero.required'   => 'El número es obligatorio.',
            'ciudad.required'   => 'La ciudad es obligatoria.',
            'provincia.required'=> 'La provincia es obligatoria.',
            'cp.required'       => 'El código postal es obligatorio.',
        ];
    }
}
