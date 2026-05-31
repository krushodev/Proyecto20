{{--
  ============================================================
  VISTA: comercializacion.blade.php
  PROPÓSITO: Página de información comercial y logística
  ============================================================
--}}
@extends ('layout.layout')

@section ('title', 'Comercialización - Vittorio')

@section ('content')
  <div class="comercializacion-page">

    {{-- Hero --}}
    <section class="comercializacion-hero" aria-label="Comercialización Vittorio">
      <div class="hero-copy">
        <p class="section-label">Logística & Pagos</p>
        <h1>Comprá con <br /><span class="title-accent">Confianza.</span></h1>
        <p>Cada reloj Vittorio se despacha bajo estrictos protocolos de seguridad. Te ofrecemos medios de pago locales confiables y un proceso de compra claro, pensado para que tu experiencia sea tan cuidada como el reloj que recibirás.</p>
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

    {{-- Proceso de compra --}}
    <section class="comercializacion-proceso" aria-label="Cómo comprar">
      <header class="section-heading">
        <p class="section-label">Paso a paso</p>
        <h2>¿Cómo funciona?</h2>
      </header>
      <ol class="proceso-steps">
        <li class="proceso-step">
          <span class="step-number">01</span>
          <div class="step-body">
            <h3>Elegí tu reloj</h3>
            <p>Explorá el catálogo, revisá las especificaciones y agregá la pieza al carrito.</p>
          </div>
        </li>
        <li class="proceso-step">
          <span class="step-number">02</span>
          <div class="step-body">
            <h3>Confirmá el pedido</h3>
            <p>Revisá tu carrito y hacé clic en <em>Confirmar Compra</em>. Recibirás tu número de pedido.</p>
          </div>
        </li>
        <li class="proceso-step">
          <span class="step-number">03</span>
          <div class="step-body">
            <h3>Realizá el pago</h3>
            <p>Transferí a nuestro CBU o pagá desde Mercado Pago con el importe exacto de tu pedido.</p>
          </div>
        </li>
        <li class="proceso-step">
          <span class="step-number">04</span>
          <div class="step-body">
            <h3>Enviá el comprobante</h3>
            <p>Mandá el comprobante a <strong>pagos@vittorio.com.ar</strong> indicando tu número de pedido. Confirmamos en menos de 24 h.</p>
          </div>
        </li>
      </ol>
    </section>

    {{-- Medios de pago --}}
    <section class="comercializacion-finance" aria-label="Medios de pago">
      <header class="finance-intro">
        <p class="section-label">Medios de pago</p>
        <h2>Pagá como prefieras.</h2>
        <p>Operamos con dos medios de pago seguros y de acreditación inmediata para clientes en Argentina.</p>
      </header>

      <div class="payment-block">
        <ul class="payment-logos payment-logos--duo">
          <li class="payment-logo">
            <i data-lucide="landmark"></i>
            <span>Transferencia / CBU</span>
            <small>Acreditación inmediata</small>
          </li>
          <li class="payment-logo">
            <img src="https://cdn.simpleicons.org/mercadopago/ffffff" alt="Mercado Pago" />
            <span>Mercado Pago</span>
            <small>Débito · Crédito · Cuenta</small>
          </li>
        </ul>
      </div>

      <div class="payment-bank-details">
        <h3 class="payment-bank-title">
          <i data-lucide="landmark"></i>
          Datos para transferencia bancaria
        </h3>
        <ul class="payment-bank-list">
          <li><span>Banco</span><strong>Banco Provincia de Buenos Aires</strong></li>
          <li><span>Titular</span><strong>Vittorio Relojería S.R.L.</strong></li>
          <li><span>CBU</span><strong>0140318201386183660100</strong></li>
          <li><span>Alias</span><strong>VITTORIO.RELOJES.ARS</strong></li>
        </ul>
        <p class="payment-bank-note">
          <i data-lucide="info"></i>
          Una vez realizada la transferencia, enviá el comprobante a <strong>pagos@vittorio.com.ar</strong> con tu número de pedido.
        </p>
      </div>

      <p class="payment-disclaimer">Todas las transacciones se procesan bajo cifrado AES-256 y certificación PCI-DSS. Los precios están expresados en Pesos Argentinos (ARS).</p>
    </section>

    {{-- Entrega --}}
    <section class="comercializacion-features" aria-label="Logística de envío">
      <header class="section-heading">
        <p class="section-label">Envío</p>
        <h2>Entrega en todo el país.</h2>
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
          <span>Interior del país</span>
          <h3>Provincias · 48–72 h</h3>
          <p>Cobertura a todas las provincias con operadores de confianza, embalaje especial y número de seguimiento desde el momento del despacho.</p>
          <ul>
            <li>Seguro a valor declarado</li>
            <li>Tracking en tiempo real</li>
          </ul>
        </article>
      </div>
    </section>

    {{-- CTA --}}
    <section class="comercializacion-cta">
      <div class="cta-copy">
        <h2>¿Tenés alguna duda?</h2>
        <p>Si necesitás asistencia con tu compra, el proceso de pago o el seguimiento de tu pedido, contactanos directamente.</p>
      </div>
      <a href="{{ url('/contacto') }}" class="cta-button">Contactar</a>
    </section>

  </div>
@endsection
