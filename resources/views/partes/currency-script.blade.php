{{-- 
  ============================================================
  COMPONENTE: currency-script.blade.php
  PROPÓSITO: Script de conversión de divisas
  DESCRIPCIÓN: JavaScript que maneja el cambio de moneda
  en el sitio. Permite convertir precios entre USD, ARS,
  EUR y BRL usando tasas de cambio predefinidas.
  Almacena la selección en localStorage.
  Se incluye en la plantilla principal layout.blade.php
  ============================================================
--}}
<script>
  (function () {
    // Cotizaciones referenciales (base USD).
    const RATES = {
      USD: { rate: 1, symbol: 'US$', code: 'USD', locale: 'en-US' },
      ARS: { rate: 1100, symbol: '$', code: 'ARS', locale: 'es-AR' },
      EUR: { rate: 0.92, symbol: '€', code: 'EUR', locale: 'es-ES' },
      BRL: { rate: 5.1, symbol: 'R$', code: 'BRL', locale: 'pt-BR' }
    };
    const STORAGE_KEY = 'vittorio_currency';
    const getCurrency = () => {
      const saved = localStorage.getItem(STORAGE_KEY);
      return RATES[saved] ? saved : 'USD';
    };
    const formatPrice = (usd, currency) => {
      const conf = RATES[currency] || RATES.USD;
      const value = usd * conf.rate;
      const decimals = currency === 'ARS' ? 0 : (value >= 1000 ? 0 : 2);
      const formatted = new Intl.NumberFormat(conf.locale, {
        minimumFractionDigits: decimals,
        maximumFractionDigits: decimals
      }).format(value);
      return `${conf.symbol} ${formatted} ${conf.code}`;
    };
    const applyCurrency = (currency) => {
      // Etiqueta en navbar
      document.querySelectorAll('[data-currency-label]').forEach(el => {
        el.textContent = currency;
      });
      // Marca activo
      document.querySelectorAll('[data-currency]').forEach(el => {
        el.classList.toggle('active', el.dataset.currency === currency);
      });
      // Reformatea cualquier precio con data-price-usd
      document.querySelectorAll('[data-price-usd]').forEach(el => {
        const usd = parseFloat(el.dataset.priceUsd);
        if (!Number.isNaN(usd)) {
          el.textContent = formatPrice(usd, currency);
        }
      });
    };

    document.addEventListener('DOMContentLoaded', function () {
      const current = getCurrency();
      applyCurrency(current);

      document.querySelectorAll('[data-currency]').forEach(btn => {
        btn.addEventListener('click', function (e) {
          e.preventDefault();
          const c = this.dataset.currency;
          if (!RATES[c]) return;
          localStorage.setItem(STORAGE_KEY, c);
          applyCurrency(c);
        });
      });
    });

    window.VittorioCurrency = { applyCurrency, getCurrency, formatPrice };
  })();
</script>
