@extends ('layout.layout')

@section ('title', 'Catálogo - Vittorio')

@section ('content')
  <main class="catalog-main">
    <header class="catalog-header">
      <h1 class="catalog-header-title">Colección <span>2026</span></h1>
      <div class="catalog-header-divider"></div>
      <p class="catalog-header-description">La intersección entre la ingeniería de precisión suiza y la vanguardia estética. Cada pieza es un manifiesto de durabilidad y diseño monocromático.</p>
    </header>

    <div class="catalog-filter-bar">
      <div class="catalog-filter-tabs">
        <button class="catalog-filter-tab active">Todos los modelos</button>
        <button class="catalog-filter-tab">Automáticos</button>
        <button class="catalog-filter-tab">Cronógrafos</button>
        <button class="catalog-filter-tab">Edición Limitada</button>
      </div>
      <div class="catalog-filter-sort">
        <span>Filtrar por:</span>
        <i data-lucide="sliders-horizontal"></i>
      </div>
    </div>

    <div class="catalog-product-grid">
      <!-- Watch 01 -->
      <article class="product-card">
        <div class="product-card-image-wrapper">
          <img
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuDjpRCXTpqO-O7FBTAcmsXNJWp-b7Yi1-KOnW_IS-kyk2i08EpZhVElY4O97pCjhCRqTlgvzxPAPMKo_EQutwW7gK226F2Q6k4qtr9gfH_4vJoXahZablHR5HOYzO9qOMd8aMiVWe0d5vtWSfIzo1UNpmVqrE03H7UjFrtvqcg2VL3Dr7HUTpYt_8Kkw_trJqUunkHgrrvsNdQB60TkPwHa2fDCdfjbV2IIfX_kHgVNto8wlh_eWc61kbccpqTeVAOUudjBu7I43pzN"
            alt="Vittorio Obsidian One"
            class="product-card-image"
          />
          <div class="product-card-badge product-card-badge-new">Nuevo</div>
        </div>
        <div class="product-card-info">
          <div class="product-card-header">
            <h3 class="product-card-name">Vittorio Obsidian One</h3>
            <span class="product-card-price">$4,250</span>
          </div>
          <p class="product-card-description">Caja de acero quirúrgico 316L con recubrimiento DLC negro mate. Movimiento automático calibre V1.</p>
          <div class="product-card-actions">
            <button class="btn-primary-vittorio-sm">Ver Detalles</button>
            <button class="btn-icon-vittorio" aria-label="Favorito">
              <i data-lucide="heart"></i>
            </button>
          </div>
        </div>
      </article>

      <article class="product-card">
        <div class="product-card-image-wrapper">
          <img
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuC-dZb_iAeLxqbX4q5wP9vhyTQJG0pWQa13Zcw7fUKvTVE6svkwJQLKxhrk423RkGtShhL1CY4_NyT8wHdWSZz0dHU28qeaN6QHZfE7XdhGXuZDoV7xUpOT7lZAAVXL6VJ6hd4PeSkgx677MrhuSYgQHzW91yTh3pXcdeyY1x2TGATc9Um7rRGCAsj8ZFU0It5kGBnH5sSv9uaDudu-s4O2_YRBDszgFXZXksi_TCoCi0JrcrJ5WU1CxToBOaMGufIRdPmKtxgoSQcV"
            alt="Steel Skeleton"
            class="product-card-image"
          />
        </div>
        <div class="product-card-info">
          <div class="product-card-header">
            <h3 class="product-card-name">Steel Skeleton</h3>
            <span class="product-card-price">$5,800</span>
          </div>
          <p class="product-card-description">Esfera esqueletizada que revela la complejidad del movimiento mecánico manual. Cristal de zafiro.</p>
          <div class="product-card-actions">
            <button class="btn-primary-vittorio-sm">Ver Detalles</button>
            <button class="btn-icon-vittorio" aria-label="Favorito">
              <i data-lucide="heart"></i>
            </button>
          </div>
        </div>
      </article>

      <article class="product-card">
        <div class="product-card-image-wrapper">
          <img
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuBobTBmQIDRuHO41garT4E0rDcEno_DBZL-EA67iLlvodKShq-7FHMONpqrjDkf1mPIwxrF2VvjaqOE1pltLUgMvhPhhEUQCLlDNP-7LibRd_6blfUJMyrIEzkoj3eLswnetJiIoi9G2x6QODpmWkop2UWq_k6jNdLbdmEwKytuAEp_vTyW6q1dSWhqwV-39E3iHxoS-suQla5lzGioAwLKZGrjHnZ21JYEldwiRUpiyjlgxbLJTxFvymv-6mPTDO4PsWaNccYpBBfF"
            alt="Monolith GMT"
            class="product-card-image"
          />
        </div>
        <div class="product-card-info">
          <div class="product-card-header">
            <h3 class="product-card-name">Monolith GMT</h3>
            <span class="product-card-price">$3,100</span>
          </div>
          <p class="product-card-description">Diseñado para el viajero global. Doble huso horario con bisel cerámico unidireccional.</p>
          <div class="product-card-actions">
            <button class="btn-primary-vittorio-sm">Ver Detalles</button>
            <button class="btn-icon-vittorio" aria-label="Favorito">
              <i data-lucide="heart"></i>
            </button>
          </div>
        </div>
      </article>

      <article class="product-card">
        <div class="product-card-image-wrapper">
          <img
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuBsJgSc5sQa6RbXH6QiCCjXKLiKeZ9zNmoPnjSfcgsvicPc-2jGUdOn0Xd4zQWXuwUPPwibXTMBl3BVik5ar8rpahj94BDb-s6aGXc2Q3DmWYKKSwo45e742ANUP87mdvQNz39wseqQ6DWbr0rz8Wh74HB6Ma8zzTT05UhE5glVDpmVoaF1gtD1-92HexTGFcjGXj4AQRrpUAdeHOUJxv9crsox6ksHfffhsjzvgXIr17mTeSMTMiBdllsHeBoGzGJsDEGfRC0aOq8S"
            alt="Titanium X"
            class="product-card-image"
          />
          <div class="product-card-badge product-card-badge-limited">Limited</div>
        </div>
        <div class="product-card-info">
          <div class="product-card-header">
            <h3 class="product-card-name">Titanium X</h3>
            <span class="product-card-price">$7,400</span>
          </div>
          <p class="product-card-description">Caja ultraligera de titanio Grado 5. Resistencia al agua hasta 200 metros. Edición limitada de 100 piezas.</p>
          <div class="product-card-actions">
            <button class="btn-primary-vittorio-sm">Ver Detalles</button>
            <button class="btn-icon-vittorio" aria-label="Favorito">
              <i data-lucide="heart"></i>
            </button>
          </div>
        </div>
      </article>

      <article class="product-card">
        <div class="product-card-image-wrapper">
          <img
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuAWoNkvfXqJN2ik1a93aqE_Pd6f9zSw01sKLwwC0affkqJ4qhdIx8RQ9CZer0iAaWyhDNGQnOECcJxU9VU17pt2UqAoIrwYrD3ez3xXGtEdOR2YpZyFUWbo-2k8m9BpID-kJhdv6UXQJO6u6WZFv37KEdS0dwexOj2qkTTgZLSL_XgJQwBTUBD98Xer6bZMbgGC2llG16V9l2yq0lsnm8Db5vCYDOs2MSZ84fBscA8G2zLfeobH_w_nkWMXavGf1FwcpyEuuZzCpkVM"
            alt="Chrono Phantom"
            class="product-card-image"
          />
        </div>
        <div class="product-card-info">
          <div class="product-card-header">
            <h3 class="product-card-name">Chrono Phantom</h3>
            <span class="product-card-price">$4,900</span>
          </div>
          <p class="product-card-description">Cronógrafo de precisión con taquímetro. Índices luminiscentes Super-LumiNova® en tono acero.</p>
          <div class="product-card-actions">
            <button class="btn-primary-vittorio-sm">Ver Detalles</button>
            <button class="btn-icon-vittorio" aria-label="Favorito">
              <i data-lucide="heart"></i>
            </button>
          </div>
        </div>
      </article>

      <article class="product-card">
        <div class="product-card-image-wrapper">
          <img
            src="https://lh3.googleusercontent.com/aida-public/AB6AXuAZKp8AIobJgCxFww3t4cn-Y-vVA2wy_CA3NwtLFUjR1CUlHDyxFC7NnPhwkzDyC-14BPu_aGafyMw-d2BTIy6gIGDFT-JbLJSAtM6AnyhJiQD9VAXFVt9Ij80K8h2tP2CHjDah-NQ2CmJIHjgEyBS15OvjaeN1v9zIyz1Rypl4TV2DZdpeKRS6S-iWw9GJ8yOrKm2tAdHKxVQkKt47dwGkVw2VR-wMAio5sHa9CnRasFmnWNOr57qZfwijLYNeZECvqHS8ntc6_I9u"
            alt="Heritage Noir"
            class="product-card-image"
          />
        </div>
        <div class="product-card-info">
          <div class="product-card-header">
            <h3 class="product-card-name">Heritage Noir</h3>
            <span class="product-card-price">$2,750</span>
          </div>
          <p class="product-card-description">Inspirado en los archivos clásicos de Vittorio. Correa de cuero italiano genuino con costura a mano.</p>
          <div class="product-card-actions">
            <button class="btn-primary-vittorio-sm">Ver Detalles</button>
            <button class="btn-icon-vittorio" aria-label="Favorito">
              <i data-lucide="heart"></i>
            </button>
          </div>
        </div>
      </article>
    </div>

    <div class="catalog-pagination">
      <p class="catalog-pagination-count">Mostrando 6 de 42 piezas</p>
      <button class="btn-outline-vittorio">Explorar Más Modelos</button>
    </div>
  </main>

@endsection
