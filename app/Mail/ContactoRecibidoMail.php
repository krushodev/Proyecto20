<?php

namespace App\Mail;

use App\Models\Contacto;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ContactoRecibidoMail extends Mailable
{
    use SerializesModels;

    public function __construct(
        public readonly Contacto $contacto,
    ) {}

    public function envelope(): Envelope
    {
        return new Envelope(
            replyTo: [$this->contacto->email],
            subject: "Nueva consulta: {$this->contacto->asunto}",
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'emails.contacto-recibido',
        );
    }
}
