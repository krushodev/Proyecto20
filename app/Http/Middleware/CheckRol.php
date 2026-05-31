<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckRol
{
    public function handle(Request $request, Closure $next, string $rol): Response
    {
        $negar    = str_starts_with($rol, '!');
        $objetivo = $negar ? substr($rol, 1) : $rol;
        $tieneRol = $request->user()?->rol?->nombre === $objetivo;

        if ($negar && $tieneRol) {
            return redirect()->route('admin.panel');
        }

        if (!$negar && !$tieneRol) {
            abort(403, 'No tenés permiso para acceder a esta sección.');
        }

        return $next($request);
    }
}
