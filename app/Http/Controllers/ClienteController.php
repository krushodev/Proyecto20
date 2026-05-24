<?php

namespace App\Http\Controllers;

use Illuminate\View\View;

class ClienteController extends Controller
{
    public function index(): View
    {
        return view('carrito');
    }
}
