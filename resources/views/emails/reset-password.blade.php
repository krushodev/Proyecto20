<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Recuperá tu contraseña - Vittorio</title>
</head>
<body style="margin:0;padding:0;background-color:#0a0a0a;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;">

  <table width="100%" cellpadding="0" cellspacing="0" style="background-color:#0a0a0a;padding:40px 16px;">
    <tr>
      <td align="center">
        <table width="100%" cellpadding="0" cellspacing="0" style="max-width:560px;">

          {{-- Logo / Header --}}
          <tr>
            <td align="center" style="padding-bottom:32px;">
              <p style="margin:0;font-size:22px;font-weight:700;letter-spacing:0.15em;text-transform:uppercase;color:#ffffff;">
                VITTORIO
              </p>
              <p style="margin:6px 0 0;font-size:11px;letter-spacing:0.1em;text-transform:uppercase;color:rgba(255,255,255,0.35);">
                Manufactura desde La Plata · Argentina
              </p>
            </td>
          </tr>

          {{-- Card --}}
          <tr>
            <td style="background-color:#111111;border:1px solid rgba(255,255,255,0.08);border-radius:12px;padding:40px 36px;">

              <p style="margin:0 0 8px;font-size:11px;font-weight:600;letter-spacing:0.1em;text-transform:uppercase;color:rgba(255,255,255,0.35);">
                Seguridad de cuenta
              </p>
              <h1 style="margin:0 0 16px;font-size:24px;font-weight:700;color:#ffffff;letter-spacing:-0.02em;">
                Recuperá tu contraseña
              </h1>
              <p style="margin:0 0 24px;font-size:14px;line-height:1.65;color:rgba(255,255,255,0.6);">
                Hola {{ $usuario->nombre }}, recibimos una solicitud para restablecer la contraseña de tu cuenta asociada a <strong style="color:rgba(255,255,255,0.85);">{{ $usuario->email }}</strong>.
              </p>
              <p style="margin:0 0 28px;font-size:14px;line-height:1.65;color:rgba(255,255,255,0.6);">
                Hacé clic en el botón de abajo para crear una nueva contraseña. El enlace es válido por <strong style="color:rgba(255,255,255,0.85);">{{ $expireIn }} minutos</strong>.
              </p>

              {{-- CTA Button --}}
              <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center" style="padding-bottom:28px;">
                    <a href="{{ $url }}"
                       style="display:inline-block;padding:14px 32px;background-color:#ffffff;color:#0a0a0a;font-size:13px;font-weight:700;letter-spacing:0.08em;text-transform:uppercase;text-decoration:none;border-radius:6px;">
                      Restablecer contraseña
                    </a>
                  </td>
                </tr>
              </table>

              <p style="margin:0 0 12px;font-size:12px;color:rgba(255,255,255,0.35);">
                Si el botón no funciona, copiá y pegá este enlace en tu navegador:
              </p>
              <p style="margin:0 0 28px;font-size:11px;word-break:break-all;color:rgba(255,255,255,0.4);">
                {{ $url }}
              </p>

              <hr style="border:none;border-top:1px solid rgba(255,255,255,0.07);margin:0 0 24px;" />

              <p style="margin:0;font-size:12px;line-height:1.6;color:rgba(255,255,255,0.3);">
                Si no solicitaste este cambio, podés ignorar este correo — tu contraseña no será modificada.
              </p>

            </td>
          </tr>

          {{-- Footer --}}
          <tr>
            <td align="center" style="padding-top:28px;">
              <p style="margin:0;font-size:11px;color:rgba(255,255,255,0.2);">
                © {{ date('Y') }} Vittorio Relojería. Todos los derechos reservados.
              </p>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

</body>
</html>
