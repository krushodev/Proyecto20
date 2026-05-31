<?php

namespace App\Jobs;

use App\Mail\FacturaCompraMail;
use App\Models\VentaCabecera;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class GenerarYEnviarFacturaJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public int $tries = 3;

    public int $backoff = 60;

    public function __construct(public readonly int $ventaId) {}

    public function handle(): void
    {
        $venta = VentaCabecera::with('usuario', 'detalles.producto')
            ->findOrFail($this->ventaId);

        $pdf = Pdf::loadView('facturas.factura', compact('venta'))
            ->setPaper('a4', 'portrait');

        Mail::to($venta->usuario->email)
            ->send(new FacturaCompraMail($venta, $pdf->output()));
    }
}
