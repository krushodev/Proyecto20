<?php

namespace App\Mail;

use App\Models\VentaCabecera;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Attachment;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class FacturaCompraMail extends Mailable
{
    use SerializesModels;

    public function __construct(
        public readonly VentaCabecera $venta,
        public readonly string $pdfContent,
    ) {}

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: "Factura de tu compra #{$this->venta->id} - Vittorio",
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'emails.factura-compra',
        );
    }

    public function attachments(): array
    {
        $filename = 'factura-' . str_pad($this->venta->id, 8, '0', STR_PAD_LEFT) . '.pdf';

        return [
            Attachment::fromData(fn () => $this->pdfContent, $filename)
                ->withMime('application/pdf'),
        ];
    }
}
