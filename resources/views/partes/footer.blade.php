<footer class="footer-vittorio">
  <div class="footer-container">
    <div class="footer-brand-section">
      <div class="footer-brand-title">Vittorio</div>
      <p class="footer-brand-description">Manufactura La Plata · Argentina</p>
    </div>

    <nav class="footer-links" aria-label="Enlaces del pie">
      <a href="{{ url('/catalogo') }}" class="footer-link">Catálogo</a>
      <a href="{{ url('/comercializacion') }}" class="footer-link">Comercialización</a>
      <a href="{{ url('/terminos-y-condiciones') }}" class="footer-link">Términos y Usos</a>
      <a href="{{ url('/contacto') }}" class="footer-link">Contacto</a>
    </nav>

    <div class="footer-actions">
      <button class="footer-share-btn" aria-label="Compartir" type="button">
        <i data-lucide="share-2"></i>
        <span>Compartir</span>
      </button>
    </div>
  </div>

  <div class="footer-bottom">
    <p class="footer-copyright">© {{ date('Y') }} Vittorio. Precision Engineering.</p>
  </div>
</footer>
