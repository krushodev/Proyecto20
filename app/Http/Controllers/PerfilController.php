<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;

use App\Models\Usuario;

class PerfilController extends Controller
{
    public function ver(): View
    {
        $usuario = Auth::user();
        return view('paginas.perfil', compact('usuario'));
    }

    public function editar(): View
    {
        $usuario = Auth::user();
        return view('paginas.editar-perfil', compact('usuario'));
    }

    public function actualizar(): RedirectResponse
    {
        $usuario = Auth::user();

        $datos = request()->validate([
            'nombre' => 'required|string|max:255',
            'email' => 'required|email|unique:usuarios,email,' . $usuario->id,
            'numero_tarjeta' => 'nullable|string|regex:/^[0-9\s\-]{13,19}$/',
            'titular_tarjeta' => 'nullable|string|max:255',
            'vencimiento_tarjeta' => 'nullable|string|regex:/^\d{2}\/\d{2}$/',
            'cvv_tarjeta' => 'nullable|string|regex:/^[0-9]{3,4}$/',
            'cripto_habilitada' => 'boolean',
            'wallet_cripto' => 'nullable|string|max:255',
            'tipo_cripto' => 'nullable|in:BTC,ETH,USDT',
            'ubicacion' => 'nullable|string|max:255',
        ]);

        // Normalizar checkbox
        $datos['cripto_habilitada'] = request()->has('cripto_habilitada') ? 1 : 0;

        $usuario->update($datos);

        return redirect()->route('perfil.ver')->with('success', 'Perfil actualizado correctamente.');
    }
}
<?php

namespace App\Http\Controllers;

use App\Http\Requests\ActualizarPerfilRequest;
use App\Services\UsuarioService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class PerfilController extends Controller
{
    public function __construct(
        private readonly UsuarioService $usuarioService,
    ) {}

    public function mostrar(): View
    {
        $usuario = Auth::user();

        return view('paginas.mi-perfil', compact('usuario'));
    }

    public function actualizar(ActualizarPerfilRequest $request): RedirectResponse
    {
        $this->usuarioService->actualizarPerfil(Auth::user(), $request->validated());

        return redirect()->route('mi-perfil')
            ->with('success', 'Perfil actualizado correctamente.');
    }

    public function mostrarAdmin(): View
    {
        $usuario = Auth::user();

        return view('server.admin.perfil.index', compact('usuario'));
    }

    public function actualizarAdmin(ActualizarPerfilRequest $request): RedirectResponse
    {
        $this->usuarioService->actualizarPerfil(Auth::user(), $request->validated());

        return redirect()->route('admin.perfil')
            ->with('success', 'Perfil actualizado correctamente.');
    }
}
