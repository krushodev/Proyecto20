<?php

namespace App\Http\Controllers;

use App\Http\Requests\ActualizarPerfilRequest;
use App\Models\UserTarjeta;
use App\Services\UsuarioService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class PerfilController extends Controller
{
    public function __construct(
        private readonly UsuarioService $usuarioService,
    ) {}

    public function ver(): View
    {
        $usuario  = Auth::user();
        $tarjetas = $usuario->tarjetas;

        return view('paginas.perfil', compact('usuario', 'tarjetas'));
    }

    public function editar(): View
    {
        $usuario = Auth::user();

        return view('paginas.editar-perfil', compact('usuario'));
    }

    public function actualizar(ActualizarPerfilRequest $request): RedirectResponse
    {
        $this->usuarioService->actualizarPerfil(Auth::user(), $request->validated());

        return redirect()->route('perfil.ver')->with('success', 'Perfil actualizado correctamente.');
    }

    public function guardarTarjeta(Request $request): RedirectResponse
    {
        $datos = $request->validate([
            'numero_tarjeta'  => ['required', 'string', 'regex:/^[0-9\s]{13,19}$/'],
            'titular_tarjeta' => ['required', 'string', 'max:100'],
            'vencimiento'     => ['required', 'string', 'regex:/^\d{2}\/\d{2}$/'],
            'tipo'            => ['required', 'string', 'in:visa,mastercard,amex,discover,cabal,naranja,argencard,default'],
        ]);

        $numero = preg_replace('/\D/', '', $datos['numero_tarjeta']);
        [$mes, $anio] = explode('/', $datos['vencimiento']);

        Auth::user()->tarjetas()->create([
            'ultimos_cuatro' => substr($numero, -4),
            'titular'        => strtoupper(trim($datos['titular_tarjeta'])),
            'mes_exp'        => $mes,
            'anio_exp'       => $anio,
            'tipo'           => $datos['tipo'],
        ]);

        return redirect()->route('perfil.ver')->with('success', 'Tarjeta guardada correctamente.');
    }

    public function eliminarTarjeta(UserTarjeta $tarjeta): RedirectResponse
    {
        abort_if($tarjeta->user_id !== Auth::id(), 403);

        $tarjeta->delete();

        return redirect()->route('perfil.ver')->with('success', 'Tarjeta eliminada.');
    }

    public function mostrarAdmin(): View
    {
        $usuario = Auth::user();

        return view('backend.admin.perfil.index', compact('usuario'));
    }

    public function actualizarAdmin(ActualizarPerfilRequest $request): RedirectResponse
    {
        $this->usuarioService->actualizarPerfil(Auth::user(), $request->validated());

        return redirect()->route('admin.perfil')->with('success', 'Perfil actualizado correctamente.');
    }
}
