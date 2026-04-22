@extends ('layout.layout')

@section ('title', 'Quiénes Somos - Vittorio')

@section ('content')
  <div class="nosotros-page">
    <header class="nosotros-hero">
      <p class="section-label">Nuestra Esencia</p>
      <h1>El arte de la precisión <span class="title-accent">infinita</span></h1>
      <p class="description">Vittorio no es simplemente una manufactura. Es un compromiso con el tiempo, una búsqueda implacable de la perfección técnica y la elegancia arquitectónica.</p>
    </header>

    <section class="nosotros-grid">
      <div class="nosotros-copy">
        <h3>La Fundación del Rigor</h3>
        <p>Nacidos bajo la premisa de que la relojería es la máxima expresión de la ingeniería humana. En Vittorio, cada milímetro narra una historia de superación y excelencia técnica heredada.</p>
        <p class="quote">"No diseñamos objetos para medir el tiempo, creamos legados que lo desafían."</p>
        <p class="citation">— Enzo Vittorio, Fundador</p>
      </div>

      <div class="nosotros-image-card">
        <div class="nosotros-image">
          <img
            alt="Watchmaker workshop"
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuDhPgmeyb_Wc8PmS-kT1oNSvOOLWlrE6lfgl8KjCsHnIuLv5Gp7zpn0PC5PDwqxr7I3MdUaB9WI1lxtFSNcrNeBBFRBuDu6upSiNAgunDN4hwqhDvXLT7hb0Ot-AZZ-5OlusKhrj2OQc-xaJYqEAkHALxp-4EXJqJ1doGejkMWolhjM_u_stk_0XZqacrutyF6igxwbZWAYMn8yD2G5bOvhrZFiUTdtMEpoeVTghvErfrzt_UYcU-AoJWhM2qTxYBr4mNrG7OgxeJQD"
          />
        </div>
        <div class="nosotros-metrics">
          <div class="nosotros-metric">
            <p>12+</p>
            <p>Patentes Propias</p>
          </div>
          <div class="nosotros-metric">
            <p>0.02</p>
            <p>Tolerancia de Precisión</p>
          </div>
        </div>
      </div>
    </section>

    <section class="nosotros-cta">
      <h2>Descubra el siguiente nivel de la relojería</h2>
      <div class="cta-actions">
        <button class="nosotros-button">Ver Catálogo</button>
        <button class="nosotros-button">Agendar Cita</button>
      </div>
    </section>
  </div>
@endsection
