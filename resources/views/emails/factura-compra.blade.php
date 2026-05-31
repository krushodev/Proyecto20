<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Tu factura - Vittorio</title>
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
                Manufactura desde La Plata · Argentina
              </p>
            </td>
          </tr>

          <!-- Card -->
          <tr>
            <td style="background-color:#111111;border:1px solid rgba(255,255,255,0.08);border-radius:12px;padding:40px 36px;">

              <p style="margin:0 0 8px;font-size:11px;font-weight:600;letter-spacing:0.1em;text-transform:uppercase;color:rgba(255,255,255,0.35);">
                Compra confirmada
              </p>
              <h1 style="margin:0 0 16px;font-size:24px;font-weight:700;color:#ffffff;letter-spacing:-0.02em;">
                ¡Gracias por tu compra!
              </h1>
              <p style="margin:0 0 24px;font-size:14px;line-height:1.65;color:rgba(255,255,255,0.6);">
                Hola <strong style="color:rgba(255,255,255,0.85);">{{ $venta->usuario->nombre }}</strong>,
                tu pedido <strong style="color:rgba(255,255,255,0.85);">#{{ $venta->id }}</strong> fue confirmado el
                {{ $venta->fecha_venta->format('d/m/Y \a \l\a\s H:i') }}.
              </p>

              <!-- Resumen de ítems -->
              <table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom:24px;">
                @foreach($venta->detalles as $detalle)
                <tr>
                  <td style="padding:8px 0;border-bottom:1px solid rgba(255,255,255,0.06);font-size:13px;color:rgba(255,255,255,0.75);">
                    {{ $detalle->producto->nombre }}
                    <span style="color:rgba(255,255,255,0.35);">&times; {{ $detalle->cantidad }}</span>
                  </td>
                  <td style="padding:8px 0;border-bottom:1px solid rgba(255,255,255,0.06);font-size:13px;color:rgba(255,255,255,0.75);text-align:right;white-space:nowrap;">
                    $ {{ number_format($detalle->subtotal, 0, ',', '.') }} ARS
                  </td>
                </tr>
                @endforeach
                <tr>
                  <td style="padding:14px 0 0;font-size:15px;font-weight:700;color:#ffffff;">Total</td>
                  <td style="padding:14px 0 0;font-size:15px;font-weight:700;color:#ffffff;text-align:right;">
                    $ {{ number_format($venta->total, 0, ',', '.') }} ARS
                  </td>
                </tr>
              </table>

              <hr style="border:none;border-top:1px solid rgba(255,255,255,0.07);margin:0 0 24px;" />

              <p style="margin:0;font-size:13px;line-height:1.65;color:rgba(255,255,255,0.5);">
                Adjuntamos la factura en formato PDF a este correo. Podés usarla como comprobante de pago.
              </p>

            </td>
          </tr>

          <!-- Footer -->
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
