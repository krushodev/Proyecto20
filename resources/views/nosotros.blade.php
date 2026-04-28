@extends ('layout.layout')

@section ('title', 'Quiénes Somos - Vittorio')

@section ('content')
  <div class="nosotros-page">
    <header class="nosotros-hero">
      <p class="section-label">Nuestra esencia</p>
      <h1>Manufactura argentina, <span class="title-accent">precisión atemporal</span></h1>
      <p class="description">Desde 1999 diseñamos y ensamblamos relojes en La Plata. Más de 25 años combinando oficio artesanal y técnica relojera para crear modelos propios con identidad inconfundible.</p>
    </header>

    <section class="nosotros-grid" aria-label="Nuestra historia">
      <div class="nosotros-copy">
        <h3>De un taller en La Plata al mundo</h3>
        <p>Vittorio nació como un taller familiar en el centro de La Plata. Hoy es una manufactura independiente con catálogo propio, distribuidores en Sudamérica y clientes en más de 30 países.</p>
        <p>Cada reloj se ensambla a mano siguiendo controles de calidad propios. Diseño, mecánica y ajuste final ocurren bajo el mismo techo, sin tercerizaciones.</p>
        <p class="quote">"No diseñamos objetos para medir el tiempo, creamos legados que lo desafían."</p>
        <p class="citation">— Enzo Vittorio, Fundador</p>
      </div>

      <div class="nosotros-image-card">
        <div class="nosotros-image">
          <img
            alt="Taller relojero Vittorio en La Plata"
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuDhPgmeyb_Wc8PmS-kT1oNSvOOLWlrE6lfgl8KjCsHnIuLv5Gp7zpn0PC5PDwqxr7I3MdUaB9WI1lxtFSNcrNeBBFRBuDu6upSiNAgunDN4hwqhDvXLT7hb0Ot-AZZ-5OlusKhrj2OQc-xaJYqEAkHALxp-4EXJqJ1doGejkMWolhjM_u_stk_0XZqacrutyF6igxwbZWAYMn8yD2G5bOvhrZFiUTdtMEpoeVTghvErfrzt_UYcU-AoJWhM2qTxYBr4mNrG7OgxeJQD"
            loading="lazy"
          />
        </div>
        <div class="nosotros-metrics">
          <div class="nosotros-metric">
            <p>25+</p>
            <p>Años de oficio</p>
          </div>
          <div class="nosotros-metric">
            <p>30+</p>
            <p>Países de envío</p>
          </div>
          <div class="nosotros-metric">
            <p>9</p>
            <p>Modelos propios</p>
          </div>
          <div class="nosotros-metric">
            <p>100%</p>
            <p>Ensamblado a mano</p>
          </div>
        </div>
      </div>
    </section>

    <section class="nosotros-cta">
      <h2>Descubrí la colección Vittorio</h2>
      <div class="cta-actions">
        <a href="{{ url('/catalogo') }}" class="nosotros-button">Ver catálogo</a>
        <a href="{{ url('/contacto') }}" class="nosotros-button">Agendar cita</a>
      </div>
    </section>
  </div>
@endsection
