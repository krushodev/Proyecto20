<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EsCliente
{
    public function handle(Request $request, Closure $next): Response
    {
        if ($request->user()?->rol?->nombre === 'admin') {
            return redirect()->route('admin.panel');
        }

        return $next($request);
    }
}
