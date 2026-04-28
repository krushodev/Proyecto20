@extends ('layout.layout')

@section ('title', 'Contacto - Vittorio')

@section ('content')
  <div class="contacto-page">
    <section class="contacto-hero" aria-label="Contacto">
      <div class="hero-inner">
        <div class="hero-copy">
          <p class="section-label">Atención personalizada</p>
          <h1>Contacto</h1>
          <p>Consultas sobre nuestros modelos, reservas en showroom o servicio técnico. El equipo Vittorio responde dentro de las 24 hs hábiles desde nuestro taller en La Plata.</p>
        </div>
        <div class="hero-media">
          <div class="hero-image">
            <img
              alt="Detalle del taller Vittorio en La Plata"
              src="https://lh3.googleusercontent.com/aida-public/AB6AXuCzced9A1HJLeB4A1Y3ZiLfEAJLh8h5NN4G6x4bgrZ3yKAX2L6nrKzqcPEQag2p6gbS5DiVAjXQj_KKjH8tsLiUTYSnFuzx0aKpogg4T14zEUWzGkg5Kz7aaryMTXTM18cDsw9X7jcGAXgmXBVAOCjzqQV1YtQT3_4mrnvzzBU_Z2GxmZKSA15-HHKpDZA9K31kSYeslMLRFG22GIoCRKO7_H3TnVOShpYieHGpXKLKCCMqKN7NMO1eQsTyIYUxcndS4PI4YppJwW-p"
              loading="lazy"
            />
          </div>
        </div>
      </div>
    </section>

    <section class="contacto-main" aria-label="Formulario y datos">
      <article class="contacto-form-card">
        <h2>Formulario de consulta</h2>
        <form>
          <div class="form-row">
            <div class="form-field">
              <label for="nombre">Nombre completo</label>
              <input id="nombre" name="nombre" placeholder="Tu nombre" type="text" required />
            </div>
            <div class="form-field">
              <label for="email">Correo electrónico</label>
              <input id="email" name="email" placeholder="tu@email.com" type="email" required />
            </div>
          </div>
          <div class="form-field">
            <label for="asunto">Asunto</label>
            <select id="asunto" name="asunto">
              <option>Consulta general</option>
              <option>Reserva de showroom privado</option>
              <option>Servicio y mantenimiento</option>
              <option>Prensa y medios</option>
            </select>
          </div>
          <div class="form-field">
            <label for="mensaje">Mensaje</label>
            <textarea id="mensaje" name="mensaje" placeholder="¿En qué podemos ayudarte?" rows="4"></textarea>
          </div>
          <div class="form-action">
            <button type="submit">Enviar mensaje</button>
          </div>
        </form>
      </article>

      <aside class="contacto-details-card">
        <h2>Datos de la casa</h2>

        <div class="contact-quickrow">
          <a class="contact-chip" href="tel:+542211234567" aria-label="Llamar al teléfono">
            <i data-lucide="phone"></i>
            <span>+54 221 123-4567</span>
          </a>
          <a class="contact-chip" href="mailto:contacto@vittorio.com.ar" aria-label="Enviar correo">
            <i data-lucide="mail"></i>
            <span>contacto@vittorio.com.ar</span>
          </a>
          <a class="contact-chip" href="https://wa.me/5492211234567" target="_blank" rel="noopener" aria-label="WhatsApp">
            <i data-lucide="message-circle"></i>
            <span>WhatsApp</span>
          </a>
        </div>

        <div class="detail-row">
          <p>Razón social</p>
          <p>Vittorio Relojería S.R.L.</p>
        </div>
        <div class="detail-row">
          <p>Dirección</p>
          <address>Calle 50 N° 1234,<br />B1900 La Plata,<br />Provincia de Buenos Aires, Argentina</address>
        </div>
        <div class="detail-row">
          <p>Horario del taller</p>
          <p>Lun a Vie · 09:00 — 18:00<br />Sáb · solo con cita previa</p>
        </div>

        <a class="map-link-cta" href="https://www.google.com/maps/place/La+Plata,+Provincia+de+Buenos+Aires" target="_blank" rel="noopener">
          <i data-lucide="map-pin"></i>
          <span>Ver en Google Maps</span>
        </a>
      </aside>
    </section>

    <section class="contacto-map" aria-label="Ubicación en La Plata">
      <iframe
        title="Mapa Vittorio La Plata"
        src="https://www.google.com/maps?q=Calle+50+entre+7+y+8,+La+Plata,+Buenos+Aires,+Argentina&output=embed"
        loading="lazy"
        referrerpolicy="no-referrer-when-downgrade"
        allowfullscreen></iframe>
    </section>

    <section class="contacto-footnotes" aria-label="Información adicional">
      <article class="footnote-card">
        <i data-lucide="clock-3" class="footnote-icon"></i>
        <h3>Atención al cliente</h3>
        <p>Lun a Vie 09:00 — 18:00 (UTC-3). Respondemos dentro de las 24 hs hábiles.</p>
      </article>
      <article class="footnote-card">
        <i data-lucide="shield-check" class="footnote-icon"></i>
        <h3>Autenticación</h3>
        <p>Para verificar el número de serie de tu pieza, adjuntá fotos de alta resolución del movimiento y la trasera.</p>
      </article>
      <article class="footnote-card">
        <i data-lucide="newspaper" class="footnote-icon"></i>
        <h3>Prensa & medios</h3>
        <p>Solicitudes editoriales y entrevistas: <a href="mailto:prensa@vittorio.com.ar">prensa@vittorio.com.ar</a></p>
      </article>
    </section>
  </div>
@endsection
