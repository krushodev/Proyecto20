@extends ('layout.layout')

@section ('title', 'Inicio - Vittorio')

@section ('content')
  <section class="hero-section" aria-label="Presentación de Vittorio">
    <div class="hero-inner">
      <div class="hero-content">
        <h1 class="hero-title">El tiempo,<br /><span class="hero-title-accent">redefinido.</span></h1>
        <p class="hero-description">
          Ingeniería de precisión fusionada con una estética monolítica.
          Manufactura argentina con más de 25 años creando piezas atemporales.
        </p>
        <div class="hero-cta">
          <a href="{{ url('/catalogo') }}" class="btn-primary-vittorio">Explorar Colección</a>
        </div>
      </div>
      <div class="hero-image-wrapper">
        <div class="hero-image-frame">
          <img
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuDTXUdWqCNSj-3YvMp2OoGnBE16MRH6opzgxK86GASD5ks8WFUVxEHJGigpVIa2zvMoBw4nYsMXumgBG4hKgwzTC2QYQzAxENsxQPl5iA3XU7Km81YYYl8K6PRptg9rnBtUBhYcR6pEbeR_wr5OtR0qIaDSLXGQXQFeWr43QmifRR55hungBObCIvboeGKVfj7SHCPlSo8-I0IcYZtLwcDL72BAk4YCHqIKflsWO1TAdMDCZOOfTXap7hXGanbMuqlhqHXN_Hfacejh"
            alt="Reloj Vittorio en acero cepillado"
            class="hero-image"
            loading="eager"
          />
        </div>
      </div>
    </div>
  </section>
  <section class="philosophy-section">
    <div class="section-inner">
      <div class="philosophy-content">
        <h2 class="section-label">Filosofía Vittorio</h2>
        <p class="section-title">No fabricamos relojes en serie. Diseñamos y ensamblamos a mano instrumentos de precisión para quienes entienden que el lujo es silencio, estructura y perdurabilidad.</p>
      </div>
    </div>
  </section>
  <section class="collections-bento">
    <div class="section-inner">
      <div class="bento-grid bento-row-1">
        <div class="collection-card collection-card-large">
          <img
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuDCzr34ZlCpZ5PxD7mPS6QaFuVjcPN_Nv20sERNrFqcaUkvc5u6dM1pdkQO-jARutCU_tXPEpYcEFhZ4ycbr2eUs-1pdk65gqBSPrbgz8Pj0xixs_31r48GArPlOg1HhL81wjeXhYFX2X3a1SJ4RTMr3AYtlVatNMeTtESh4UB2pB_Ki0uFTj70bgMP2m5mfaYpfxBFnP-UNBsyhiFmcgvnomUfwT8xSE4R0yjSe856k8ErUAHin5sbGPeB0KBX2FQvV3U69s2-EXpv"
            alt="Chronograph"
            class="collection-card-image"
          />
          <div class="collection-card-overlay">
            <span class="collection-card-label">Edición Limitada</span>
            <h3 class="collection-card-title">L'Arquitecto</h3>
            <p class="collection-card-description">Inspirado en el brutalismo moderno. Acero cepillado y cristal de zafiro ahumado.</p>
            <a href="#" class="collection-card-link">Ver Detalles</a>
          </div>
        </div>

        <div class="collection-card collection-card-secondary">
          <img
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuDMaGpY5hbRTGphig02PF8KGZOce1H94cFJDxmb-VkONVaqZmAvsEQc2IHGMjClsgiSqB09ov6CBUOyW24FZQMzFodYcqrrGa59UkpqjkK-ENDLONcTNyNhn4hmbcttPZOxrFK22Q6sVpkERNUqmNs3lONd2jrz9JjKMiZ-052n7t_ZtJrHiVRlQcNH_FTW5j9yZqSZBuxKZEU7GLiFLnrnCNmiko1z0V3iq92Dl4IyZ_ksPGNafL-I3nxXj8iCF8laUaq09x3xO9rG"
            alt="Minimalist Watch"
            class="collection-card-image"
          />
          <div class="collection-card-overlay">
            <h3 class="collection-card-title collection-card-title-small">Zenith Steel</h3>
            <p class="collection-card-link">Colección Essential</p>
          </div>
        </div>
      </div>

    </div>
  </section>
  <section class="tech-specs-section">
    <div class="tech-specs-grid">
      <div class="tech-spec-item">
        <h5 class="tech-spec-title">Material</h5>
        <p class="tech-spec-description">Acero quirúrgico 316L y titanio Grado 5, seleccionados por su resistencia y ligereza.</p>
      </div>
      <div class="tech-spec-item">
        <h5 class="tech-spec-title">Movimiento</h5>
        <p class="tech-spec-description">Calibre Vittorio V-9 automático con reserva de marcha de 72 horas y rotor bidireccional.</p>
      </div>
      <div class="tech-spec-item">
        <h5 class="tech-spec-title">Cristal</h5>
        <p class="tech-spec-description">Cristal de zafiro con tratamiento antirreflectante interior y exterior.</p>
      </div>
      <div class="tech-spec-item">
        <h5 class="tech-spec-title">Resistencia</h5>
        <p class="tech-spec-description">Estanqueidad certificada hasta 100 metros para uso diario sin compromiso.</p>
      </div>
    </div>
  </section>
  <section class="cta-banner">
    <div class="cta-banner-background">
      <img
        src="https://lh3.googleusercontent.com/aida-public/AB6AXuAZ6f8C8Lvctp2BeCPFyP5dzJaWAlQwFGgAramD7LnVEePm-OxCiuHpNttQr3byZWQM1rAc_hfYnK49m5T9cOx9I_M5WgWZaPYl3ja0QlQtuXGvUuM5lKzK2hf0hgo8kOb86PQBEuPfnoUFxjtCnvu-zTwcXTddxPZv7V0jC1zJTTXv3H1g-bSV5INyvJLMKVgNNk2R5dE-bjQ0wjl5niu9Y_5ndn7_VyD0C7XwWaFwiTyyxdTIUfy-Z38anpWUwyVYFxFuCrFZbbOL"
        alt="Watch Background"
        class="cta-banner-image"
      />
    </div>
    <div class="cta-banner-content">
      <h2 class="cta-banner-title">Sé dueño de tu legado.</h2>
      <a href="{{ route('contacto') }}" class="btn-outline-vittorio">Reservar Cita Privada</a>
    </div>
  </section>

@endsection
