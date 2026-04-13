<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
</head>
<body>
<nav>
<div>
<div>Vittorio</div>
<div>
<a href="{{ url('/') }}">Inicio</a>
<a href="{{ url('/catalogo') }}">Catálogo</a>
<a href="{{ url('/nosotros') }}">Quiénes Somos</a>
<a href="{{ url('/comercializacion') }}">Comercialización</a>
<a href="{{ url('/contacto') }}">Contacto</a>
</div>
<div>
<button>buscar</button>
<button>carrito</button>
<button>persona</button>
</div>
</div>
</nav>
<main>
<section>
<div>
<div>
<h1>CONTACTO</h1>
<p>Consultas sobre precisión relojera, sesiones privadas de exhibición o consultas de ingeniería a medida. Nuestro concierge está a su disposición.</p>
</div>
<div>
<img alt="Detalle de reloj mecánico" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCzced9A1HJLeB4A1Y3ZiLfEAJLh8h5NN4G6x4bgrZ3yKAX2L6nrKzqcPEQag2p6gbS5DiVAjXQj_KKjH8tsLiUTYSnFuzx0aKpogg4T14zEUWzGkg5Kz7aaryMTXTM18cDsw9X7jcGAXgmXBVAOCjzqQV1YtQT3_4mrnvzzBU_Z2GxmZKSA15-HHKpDZA9K31kSYeslMLRFG22GIoCRKO7_H3TnVOShpYieHGpXKLKCCMqKN7NMO1eQsTyIYUxcndS4PI4YppJwW-p"/>
</div>
</div>
</section>
<div>
<div>
<h2>Formulario de Consulta</h2>
<form>
<div>
<div>
<label>Nombre Completo</label>
<input placeholder="ALEXANDER VITTORIO" type="text">
</div>
<div>
<label>Correo Electrónico</label>
<input placeholder="CONCIERGE@VITTORIO.COM" type="email">
</div>
</div>
<div>
<label>Asunto</label>
<select>
<option>CONSULTA GENERAL</option>
<option>RESERVA DE SHOWROOM PRIVADO</option>
<option>SERVICIO Y MANTENIMIENTO</option>
<option>PRENSA Y MEDIOS</option>
</select>
</div>
<div>
<label>Mensaje</label>
<textarea placeholder="¿CÓMO PODEMOS AYUDARLE?" rows="4"></textarea>
</div>
<div>
<button>Enviar Mensaje</button>
</div>
</form>
</div>
<div>
<div>
<h2>Identidad Corporativa</h2>
<div>
<p>Nombre Comercial</p>
<p>VITTORIO HOROLOGY GROUP S.A.</p>
</div>
<div>
<p>Dirección Legal</p>
<address>Calle 50 #123,<br>B1900 La Plata,<br>Provincia de Buenos Aires, Argentina</address>
</div>
<div>
<p>Contacto Directo</p>
<p>+41 32 721 12 34</p>
</div>
</div>
<div>
<img alt="Mapa de ubicación" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCgKMM75A0OhUSuc5Jq68nCdl5dtPtxriDWP5KCBd4_oVrj8_1BE_xLl2OwLbGtLjlLejv3bLe5iTWA-fsXr-09iMVdO-Au9qh5u1c4YvPk0YCblLgJwCO_uyxBj1nbdoroM6bLlbRsOvsuO7FLTZRDZVkO2L_1Zf6cDrGmniwaJj1FEpAUdRLU0N6vCeY1JHJCfgN2qntuMekl4XneWTyssYmIlo2J1broVTFwNKYC5poCluGzljV6n1Sd1zUzUKz_qFxonzef7fEo"/>
<div>
<p>Ver en Maps</p>
</div>
</div>
</div>
</div>
<section>
<div>
<div>
<span>horario</span>
<h3>Horario del Taller</h3>
<p>LUN—VIE: 09:00 — 18:00<br>SÁB: SOLO CON CITA PREVIA</p>
</div>
<div>
<span>verificado</span>
<h3>Autenticación</h3>
<p>Para la verificación de serie, por favor incluya imágenes de alta resolución del movimiento.</p>
</div>
<div>
<span>correo</span>
<h3>Relaciones con Prensa</h3>
<p>Solicitudes de materiales editoriales y entrevistas: media@vittorio.com</p>
</div>
</div>
</section>
</main>
<footer>
<div>
<div>
<span>Vittorio</span>
<p>© 2024 Vittorio. Ingeniería de Precisión.</p>
</div>
<div>
<a href="{{ url('/terminos-y-condiciones') }}">Términos y Usos</a>
<a href="{{ url('/contacto') }}">Información de Contacto</a>
<a href="#">
<span>compartir</span>
Compartir
</a>
</div>
</div>
</footer>
</body>
</html>
