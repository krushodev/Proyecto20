<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Nueva consulta - Vittorio</title>
</head>
<body style="margin:0;padding:0;background-color:#0a0a0a;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;">

  <table width="100%" cellpadding="0" cellspacing="0" style="background-color:#0a0a0a;padding:40px 16px;">
    <tr>
      <td align="center">
        <table width="100%" cellpadding="0" cellspacing="0" style="max-width:560px;">

          <!-- Logo -->
          <tr>
            <td align="center" style="padding-bottom:32px;">
              <p style="margin:0;font-size:22px;font-weight:700;letter-spacing:0.15em;text-transform:uppercase;color:#ffffff;">
                VITTORIO
              </p>
              <p style="margin:6px 0 0;font-size:11px;letter-spacing:0.1em;text-transform:uppercase;color:rgba(255,255,255,0.35);">
                Notificación interna
              </p>
            </td>
          </tr>

          <!-- Card -->
          <tr>
            <td style="background-color:#111111;border:1px solid rgba(255,255,255,0.08);border-radius:12px;padding:40px 36px;">

              <p style="margin:0 0 8px;font-size:11px;font-weight:600;letter-spacing:0.1em;text-transform:uppercase;color:rgba(255,255,255,0.35);">
                Formulario de contacto
              </p>
              <h1 style="margin:0 0 24px;font-size:22px;font-weight:700;color:#ffffff;letter-spacing:-0.02em;">
                Nueva consulta recibida
              </h1>

              <!-- Datos del remitente -->
              <table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom:24px;">
                <tr>
                  <td style="padding:10px 12px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.07);border-radius:6px 6px 0 0;border-bottom:none;">
                    <p style="margin:0;font-size:10px;font-weight:700;letter-spacing:0.1em;text-transform:uppercase;color:rgba(255,255,255,0.35);">Nombre</p>
                    <p style="margin:4px 0 0;font-size:14px;color:#ffffff;">{{ $contacto->nombre }}</p>
                  </td>
                </tr>
                <tr>
                  <td style="padding:10px 12px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.07);border-top:none;border-bottom:none;">
                    <p style="margin:0;font-size:10px;font-weight:700;letter-spacing:0.1em;text-transform:uppercase;color:rgba(255,255,255,0.35);">Email</p>
                    <p style="margin:4px 0 0;font-size:14px;color:#ffffff;">
                      <a href="mailto:{{ $contacto->email }}" style="color:#ffffff;text-decoration:underline;">{{ $contacto->email }}</a>
                    </p>
                  </td>
                </tr>
                <tr>
                  <td style="padding:10px 12px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.07);border-top:none;border-radius:0 0 6px 6px;">
                    <p style="margin:0;font-size:10px;font-weight:700;letter-spacing:0.1em;text-transform:uppercase;color:rgba(255,255,255,0.35);">Asunto</p>
                    <p style="margin:4px 0 0;font-size:14px;font-weight:600;color:#ffffff;">{{ $contacto->asunto }}</p>
                  </td>
                </tr>
              </table>

              <!-- Mensaje -->
              <p style="margin:0 0 8px;font-size:10px;font-weight:700;letter-spacing:0.1em;text-transform:uppercase;color:rgba(255,255,255,0.35);">Mensaje</p>
              <div style="padding:16px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.07);border-radius:6px;font-size:14px;line-height:1.7;color:rgba(255,255,255,0.75);white-space:pre-wrap;">{{ $contacto->mensaje }}</div>

              <hr style="border:none;border-top:1px solid rgba(255,255,255,0.07);margin:28px 0 20px;" />

              <p style="margin:0;font-size:12px;color:rgba(255,255,255,0.3);line-height:1.6;">
                Recibido el {{ $contacto->created_at->format('d/m/Y \a \l\a\s H:i') }}.
                Podés responder directamente a este correo para contactar al remitente.
              </p>

            </td>
          </tr>

          <!-- Footer -->
          <tr>
            <td align="center" style="padding-top:28px;">
              <p style="margin:0;font-size:11px;color:rgba(255,255,255,0.2);">
                © {{ date('Y') }} Vittorio Relojería. Uso interno.
              </p>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

</body>
</html>
