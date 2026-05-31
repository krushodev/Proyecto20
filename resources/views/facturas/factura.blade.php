<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      font-family: 'DejaVu Sans', sans-serif;
      font-size: 12px;
      color: #1a1a1a;
      background: #ffffff;
      padding: 40px;
    }

    /* ── Header ── */
    .header {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      margin-bottom: 36px;
      padding-bottom: 20px;
      border-bottom: 2px solid #1a1a1a;
    }
    .brand-name {
      font-size: 26px;
      font-weight: 700;
      letter-spacing: 0.2em;
      text-transform: uppercase;
      color: #1a1a1a;
    }
    .brand-sub {
      font-size: 10px;
      letter-spacing: 0.1em;
      color: #888888;
      margin-top: 4px;
      text-transform: uppercase;
    }
    .factura-label {
      text-align: right;
    }
    .factura-label h2 {
      font-size: 18px;
      font-weight: 700;
      letter-spacing: 0.05em;
      text-transform: uppercase;
      color: #1a1a1a;
    }
    .factura-label p {
      font-size: 11px;
      color: #555555;
      margin-top: 4px;
    }

    /* ── Info grid ── */
    .info-grid {
      display: flex;
      justify-content: space-between;
      margin-bottom: 32px;
      gap: 24px;
    }
    .info-block {
      flex: 1;
    }
    .info-block h3 {
      font-size: 9px;
      font-weight: 700;
      letter-spacing: 0.12em;
      text-transform: uppercase;
      color: #888888;
      margin-bottom: 8px;
      padding-bottom: 4px;
      border-bottom: 1px solid #e5e5e5;
    }
    .info-block p {
      font-size: 11px;
      color: #333333;
      line-height: 1.7;
    }
    .info-block strong {
      color: #1a1a1a;
      font-weight: 600;
    }

    /* ── Items table ── */
    table.items {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 24px;
    }
    table.items thead tr {
      background-color: #1a1a1a;
      color: #ffffff;
    }
    table.items thead th {
      padding: 10px 12px;
      font-size: 9px;
      font-weight: 700;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      text-align: left;
    }
    table.items thead th:last-child,
    table.items tbody td:last-child {
      text-align: right;
    }
    table.items tbody tr:nth-child(even) {
      background-color: #f8f8f8;
    }
    table.items tbody td {
      padding: 10px 12px;
      font-size: 11px;
      color: #333333;
      border-bottom: 1px solid #eeeeee;
    }

    /* ── Totals ── */
    .totals {
      width: 260px;
      margin-left: auto;
      margin-bottom: 36px;
    }
    .totals-row {
      display: flex;
      justify-content: space-between;
      padding: 6px 0;
      font-size: 11px;
      color: #555555;
      border-bottom: 1px solid #eeeeee;
    }
    .totals-row.total-final {
      padding: 10px 0 0;
      font-size: 14px;
      font-weight: 700;
      color: #1a1a1a;
      border-bottom: none;
    }

    /* ── Footer ── */
    .footer {
      text-align: center;
      padding-top: 24px;
      border-top: 1px solid #e5e5e5;
      font-size: 10px;
      color: #aaaaaa;
      line-height: 1.7;
    }
  </style>
</head>
<body>

  <!-- Header -->
  <div class="header">
    <div>
      <div class="brand-name">Vittorio</div>
      <div class="brand-sub">Manufactura · La Plata, Argentina</div>
    </div>
    <div class="factura-label">
      <h2>Factura</h2>
      <p>N.º {{ str_pad($venta->id, 8, '0', STR_PAD_LEFT) }}</p>
      <p>Fecha: {{ $venta->fecha_venta->format('d/m/Y') }}</p>
    </div>
  </div>

  <!-- Info: vendedor + comprador -->
  <div class="info-grid">
    <div class="info-block">
      <h3>Emisor</h3>
      <p>
        <strong>Vittorio Relojería S.R.L.</strong><br>
        Calle 7 N.º 1234, La Plata<br>
        Buenos Aires, Argentina<br>
        pagos@vittorio.com.ar
      </p>
    </div>
    <div class="info-block">
      <h3>Facturado a</h3>
      <p>
        <strong>{{ $venta->usuario->nombre }}</strong><br>
        {{ $venta->usuario->email }}
      </p>
    </div>
    <div class="info-block">
      <h3>Detalle</h3>
      <p>
        <strong>Pedido:</strong> #{{ $venta->id }}<br>
        <strong>Fecha:</strong> {{ $venta->fecha_venta->format('d/m/Y H:i') }}<br>
        <strong>Estado:</strong> Confirmado
      </p>
    </div>
  </div>

  <!-- Items -->
  <table class="items">
    <thead>
      <tr>
        <th>Producto</th>
        <th>Precio unitario</th>
        <th>Cantidad</th>
        <th>Subtotal</th>
      </tr>
    </thead>
    <tbody>
      @foreach($venta->detalles as $detalle)
      <tr>
        <td>{{ $detalle->producto->nombre }}</td>
        <td>$ {{ number_format($detalle->precio_unitario, 2, ',', '.') }}</td>
        <td>{{ $detalle->cantidad }}</td>
        <td>$ {{ number_format($detalle->subtotal, 2, ',', '.') }}</td>
      </tr>
      @endforeach
    </tbody>
  </table>

  <!-- Totals -->
  <div class="totals">
    <div class="totals-row">
      <span>Subtotal</span>
      <span>$ {{ number_format($venta->total, 2, ',', '.') }} ARS</span>
    </div>
    <div class="totals-row">
      <span>Envío</span>
      <span>Sin cargo</span>
    </div>
    <div class="totals-row total-final">
      <span>Total</span>
      <span>$ {{ number_format($venta->total, 2, ',', '.') }} ARS</span>
    </div>
  </div>

  <!-- Footer -->
  <div class="footer">
    <p>Gracias por tu compra. Este documento es válido como comprobante de pago.</p>
    <p>Vittorio Relojería S.R.L. · La Plata, Buenos Aires · vittorio.com.ar</p>
  </div>

</body>
</html>
