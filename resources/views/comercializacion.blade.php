@extends ('layout.layout')

@section ('title', 'Comercialización - Vittorio')

@section ('content')
  <div class="comercializacion-page">
    <section class="comercializacion-hero" aria-label="Comercialización Vittorio">
      <div class="hero-copy">
        <p class="section-label">Logística & Pagos</p>
        <h1>Comercialización de <br /><span class="title-accent">Precisión.</span></h1>
        <p>Cada pieza Vittorio se despacha bajo estrictos protocolos de seguridad y se ofrece con múltiples medios de pago locales e internacionales para que la experiencia sea tan cuidada como el reloj que recibirás.</p>
      </div>
      <div class="hero-media">
        <img
          alt="Detalle de un reloj Vittorio"
          src="https://lh3.googleusercontent.com/aida-public/AB6AXuDnWgU7XddwfmI13mC0tptEppyQEUCk573jv5Nf0wh2wl8t68XYihJPATUxlN5k3YTfDleE86ojQbWcTccP3W0pb7ZLRb6sD9wSknp-XS3j5i8BS25robe3rLknjYdbaDKkHKN16aoXw22DQS7eJuX-RsBmiY46a1Rp4Lp4qzu06nnLM7xj4nVCpHEe5SBqeEpjYa7wgLAzFK7w4gzfMorWHKmGWTUqCHeIk39JyhLKCMQ4q_C9RlAB7Iu1XoRqUONXAvObjqTSeity"
          loading="lazy"
          class="hero-image"
        />
      </div>
    </section>

    <section class="comercializacion-features" aria-label="Logística de envío">
      <header class="section-heading">
        <h2>Entrega Global</h2>
      </header>
      <div class="feature-grid">
        <article class="feature-card">
          <span>Envío nacional</span>
          <h3>Argentina · 24–72 h</h3>
          <p>Despacho asegurado a todo el país mediante operadores premium. Cobertura total y seguimiento en tiempo real.</p>
          <ul>
            <li>Envío gratuito en CABA y GBA</li>
            <li>Embalaje sellado y certificado</li>
          </ul>
        </article>
        <article class="feature-card feature-card-highlight">
          <span>Concierge</span>
          <h3>Entrega Privada</h3>
          <p>Para piezas de alta complicación, un especialista Vittorio entrega personalmente el reloj, calibra el movimiento y explica su mantenimiento.</p>
          <a href="{{ url('/contacto') }}" class="cta-button feature-card-cta">Solicitar Concierge</a>
        </article>
        <article class="feature-card">
          <span>Envío internacional</span>
          <h3>Mundo · 5–10 días</h3>
          <p>Operamos con DHL Express y FedEx Priority. Cobertura a más de 80 países con seguro a valor declarado y trámite aduanero asistido.</p>
          <ul>
            <li>Tracking satelital 24/7</li>
            <li>Asesoría aduanera incluida</li>
          </ul>
        </article>
      </div>
    </section>

    <section class="comercializacion-finance" aria-label="Medios de pago">
      <header class="finance-intro">
        <p class="section-label">Medios de pago</p>
        <h2>Pagá como prefieras.</h2>
        <p>Como tienda argentina con clientes en todo el mundo, integramos pagos locales e internacionales bajo protocolos encriptados y verificación bancaria instantánea.</p>
      </header>

      <div class="payment-block">
        <h3 class="payment-block-title">Argentina</h3>
        <ul class="payment-logos">
          <li class="payment-logo" title="Mercado Pago">
            <img src="https://cdn.simpleicons.org/mercadopago/ffffff" alt="Mercado Pago" />
            <span>Mercado Pago</span>
          </li>
          <li class="payment-logo" title="MODO">
            <span class="payment-logo-text">MODO</span>
            <span>MODO</span>
          </li>
          <li class="payment-logo" title="Transferencia bancaria CBU/CVU">
            <i data-lucide="landmark"></i>
            <span>Transferencia / CBU</span>
          </li>
          <li class="payment-logo" title="Pago en efectivo en sucursal">
            <i data-lucide="banknote"></i>
            <span>Rapipago / Pago Fácil</span>
          </li>
          <li class="payment-logo" title="Cuotas sin interés">
            <i data-lucide="calendar-clock"></i>
            <span>Hasta 12 cuotas</span>
          </li>
        </ul>
      </div>

      <div class="payment-block">
        <h3 class="payment-block-title">Internacional</h3>
        <ul class="payment-logos">
          <li class="payment-logo" title="Visa">
            <img src="https://cdn.simpleicons.org/visa/ffffff" alt="Visa" />
            <span>Visa</span>
          </li>
          <li class="payment-logo" title="Mastercard">
            <img src="https://cdn.simpleicons.org/mastercard/ffffff" alt="Mastercard" />
            <span>Mastercard</span>
          </li>
          <li class="payment-logo" title="American Express">
            <img src="https://cdn.simpleicons.org/americanexpress/ffffff" alt="American Express" />
            <span>Amex</span>
          </li>
          <li class="payment-logo" title="PayPal">
            <img src="https://cdn.simpleicons.org/paypal/ffffff" alt="PayPal" />
            <span>PayPal</span>
          </li>
          <li class="payment-logo" title="Stripe">
            <img src="https://cdn.simpleicons.org/stripe/ffffff" alt="Stripe" />
            <span>Stripe</span>
          </li>
          <li class="payment-logo" title="Google Pay">
            <img src="https://cdn.simpleicons.org/googlepay/ffffff" alt="Google Pay" />
            <span>Google Pay</span>
          </li>
          <li class="payment-logo" title="Apple Pay">
            <img src="https://cdn.simpleicons.org/applepay/ffffff" alt="Apple Pay" />
            <span>Apple Pay</span>
          </li>
          <li class="payment-logo" title="Wire Transfer">
            <i data-lucide="globe"></i>
            <span>Wire Transfer</span>
          </li>
        </ul>
      </div>

      <div class="payment-block">
        <h3 class="payment-block-title">Criptomonedas</h3>
        <ul class="payment-logos">
          <li class="payment-logo" title="Bitcoin">
            <img src="https://cdn.simpleicons.org/bitcoin/ffffff" alt="Bitcoin" />
            <span>Bitcoin</span>
          </li>
          <li class="payment-logo" title="Ethereum">
            <img src="https://cdn.simpleicons.org/ethereum/ffffff" alt="Ethereum" />
            <span>Ethereum</span>
          </li>
          <li class="payment-logo" title="USDT">
            <img src="https://cdn.simpleicons.org/tether/ffffff" alt="USDT Tether" />
            <span>USDT</span>
          </li>
          <li class="payment-logo" title="USDC">
            <i data-lucide="circle-dollar-sign"></i>
            <span>USDC</span>
          </li>
        </ul>
      </div>

      <p class="payment-disclaimer">Todas las transacciones se procesan bajo cifrado AES-256 y certificación PCI-DSS. Las cotizaciones internacionales utilizan referencia diaria del mercado.</p>
    </section>

    <section class="comercializacion-cta">
      <div class="cta-copy">
        <h2>Transparencia garantizada.</h2>
        <p>Descargá nuestro Protocolo de Comercialización en PDF con detalle de costos, plazos, IVA, aduanas y cumplimiento fiscal local e internacional.</p>
      </div>
      <a href="#" class="cta-button">Descargar Protocolo</a>
    </section>
  </div>
@endsection
