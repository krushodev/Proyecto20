--
-- PostgreSQL database dump
--

\restrict dGDcgAjc5hng9zkEaFG4jrorQYw9cT7Hb1361ZM0WOmfJsA2A865rjvcwdt8MWK

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2026-06-17 12:19:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 242 (class 1259 OID 29126)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 29136)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 28929)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    descripcion text,
    activo boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 28928)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 221
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 224 (class 1259 OID 28945)
-- Name: contactos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contactos (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    asunto character varying(255) NOT NULL,
    mensaje text,
    leido boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.contactos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 28944)
-- Name: contactos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contactos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contactos_id_seq OWNER TO postgres;

--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 223
-- Name: contactos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contactos_id_seq OWNED BY public.contactos.id;


--
-- TOC entry 241 (class 1259 OID 29108)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 29107)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 240
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 239 (class 1259 OID 29093)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 29078)
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 29077)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 237
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 220 (class 1259 OID 26718)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 26717)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 236 (class 1259 OID 29068)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 29147)
-- Name: producto_imagenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto_imagenes (
    id bigint NOT NULL,
    producto_id bigint NOT NULL,
    url text NOT NULL,
    tipo character varying(20) NOT NULL,
    orden smallint DEFAULT '0'::smallint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.producto_imagenes OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 29146)
-- Name: producto_imagenes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_imagenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_imagenes_id_seq OWNER TO postgres;

--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 244
-- Name: producto_imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_imagenes_id_seq OWNED BY public.producto_imagenes.id;


--
-- TOC entry 226 (class 1259 OID 28960)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id bigint NOT NULL,
    categoria_id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    descripcion text,
    precio numeric(10,2) NOT NULL,
    caja character varying(255),
    movimiento character varying(255),
    cristal character varying(255),
    resistencia character varying(255),
    correa character varying(255),
    stock integer DEFAULT 0 NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 28959)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_id_seq OWNER TO postgres;

--
-- TOC entry 5196 (class 0 OID 0)
-- Dependencies: 225
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 228 (class 1259 OID 28985)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 28984)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5197 (class 0 OID 0)
-- Dependencies: 227
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 231 (class 1259 OID 29015)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 29171)
-- Name: user_direcciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_direcciones (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    alias character varying(60) DEFAULT 'Casa'::character varying NOT NULL,
    calle character varying(200) NOT NULL,
    numero character varying(20) NOT NULL,
    ciudad character varying(100) NOT NULL,
    provincia character varying(100) NOT NULL,
    cp character varying(20) NOT NULL,
    observaciones character varying(300),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_direcciones OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 29170)
-- Name: user_direcciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_direcciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_direcciones_id_seq OWNER TO postgres;

--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 246
-- Name: user_direcciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_direcciones_id_seq OWNED BY public.user_direcciones.id;


--
-- TOC entry 230 (class 1259 OID 28996)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    rol_id bigint,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    numero_tarjeta character varying(255),
    titular_tarjeta character varying(255),
    vencimiento_tarjeta character varying(255),
    cvv_tarjeta character varying(255),
    ubicacion character varying(255)
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 28995)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 233 (class 1259 OID 29028)
-- Name: ventas_cabecera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas_cabecera (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    fecha_venta timestamp(0) without time zone,
    estado character varying(255) DEFAULT 'carrito'::character varying NOT NULL,
    total numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    nombre_destinatario character varying(150),
    calle character varying(200),
    numero character varying(20),
    ciudad character varying(100),
    provincia character varying(100),
    codigo_postal character varying(20),
    metodo_pago character varying(30),
    estado_pago character varying(30) DEFAULT 'pendiente'::character varying NOT NULL,
    user_direccion_id bigint,
    costo_envio numeric(10,2) DEFAULT '0'::numeric NOT NULL
);


ALTER TABLE public.ventas_cabecera OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 29027)
-- Name: ventas_cabecera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventas_cabecera_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ventas_cabecera_id_seq OWNER TO postgres;

--
-- TOC entry 5200 (class 0 OID 0)
-- Dependencies: 232
-- Name: ventas_cabecera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_cabecera_id_seq OWNED BY public.ventas_cabecera.id;


--
-- TOC entry 235 (class 1259 OID 29046)
-- Name: ventas_detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas_detalle (
    id bigint NOT NULL,
    venta_id bigint NOT NULL,
    producto_id bigint NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ventas_detalle OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 29045)
-- Name: ventas_detalle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventas_detalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ventas_detalle_id_seq OWNER TO postgres;

--
-- TOC entry 5201 (class 0 OID 0)
-- Dependencies: 234
-- Name: ventas_detalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_detalle_id_seq OWNED BY public.ventas_detalle.id;


--
-- TOC entry 4932 (class 2604 OID 28932)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 4934 (class 2604 OID 28948)
-- Name: contactos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos ALTER COLUMN id SET DEFAULT nextval('public.contactos_id_seq'::regclass);


--
-- TOC entry 4948 (class 2604 OID 29111)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 29081)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 4931 (class 2604 OID 26721)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4950 (class 2604 OID 29150)
-- Name: producto_imagenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_imagenes ALTER COLUMN id SET DEFAULT nextval('public.producto_imagenes_id_seq'::regclass);


--
-- TOC entry 4936 (class 2604 OID 28963)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 4939 (class 2604 OID 28988)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4952 (class 2604 OID 29174)
-- Name: user_direcciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_direcciones ALTER COLUMN id SET DEFAULT nextval('public.user_direcciones_id_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 28999)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4941 (class 2604 OID 29031)
-- Name: ventas_cabecera id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_cabecera ALTER COLUMN id SET DEFAULT nextval('public.ventas_cabecera_id_seq'::regclass);


--
-- TOC entry 4946 (class 2604 OID 29049)
-- Name: ventas_detalle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle ALTER COLUMN id SET DEFAULT nextval('public.ventas_detalle_id_seq'::regclass);


--
-- TOC entry 5179 (class 0 OID 29126)
-- Dependencies: 242
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5180 (class 0 OID 29136)
-- Dependencies: 243
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5159 (class 0 OID 28929)
-- Dependencies: 222
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categorias VALUES (1, 'Línea Estructural', 'linea-estructural', 'Diseños escultóricos con líneas puras y presencia estructural.', true, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.categorias VALUES (2, 'Línea Terra', 'linea-terra', 'Inspirada en paisajes naturales, combina textura, color y robustez.', true, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.categorias VALUES (3, 'Línea Vanguardia', 'linea-vanguardia', 'Geometría de impacto y alma técnica para quienes buscan carácter arquitectónico.', true, '2026-06-17 15:13:25', '2026-06-17 15:13:25');


--
-- TOC entry 5161 (class 0 OID 28945)
-- Dependencies: 224
-- Data for Name: contactos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contactos VALUES (1, 'Lucía Acosta', 'luc''ia.acosta86@outlook.com', 'Error en el pedido recibido', 'Hola, hice una compra online y recibí un reloj diferente al que pedí. El color es distinto al que aparecía en la foto. ¿Cómo hago para cambiarlo? Adjunto el número de pedido: #2847.', false, '2026-06-09 11:13:27', '2026-06-09 11:13:27');
INSERT INTO public.contactos VALUES (2, 'Agustina Martínez', 'agustina.mart''inez32@yahoo.com.ar', 'Error en el pedido recibido', 'Hola, hice una compra online y recibí un reloj diferente al que pedí. El color es distinto al que aparecía en la foto. ¿Cómo hago para cambiarlo? Adjunto el número de pedido: #2847.', false, '2026-05-22 06:13:27', '2026-05-22 06:13:27');
INSERT INTO public.contactos VALUES (3, 'Sebastián Herrera', 'sebasti''an.herrera72@yahoo.com.ar', 'Compra de reloj para dama', 'Buenas tardes, busco un reloj femenino delicado, preferentemente con malla metálica y esfera blanca o plateada. ¿Tienen opciones en ese estilo? ¿Puedo pasar a verlos por el local sin turno previo?', false, '2026-05-29 12:13:27', '2026-05-29 12:13:27');
INSERT INTO public.contactos VALUES (4, 'Agustina Martínez', 'agustina.mart''inez15@gmail.com', 'Consulta sobre relojes de buceo', 'Buen día, soy instructor de buceo y estoy buscando un reloj resistente al agua hasta al menos 200 metros de profundidad. ¿Tienen algún modelo que cumpla con eso? Prefiero marcas reconocidas como Seiko o Casio.', false, '2026-06-12 09:13:27', '2026-06-12 09:13:27');
INSERT INTO public.contactos VALUES (5, 'Tomás Álvarez', 'tom''as.''alvarez54@yahoo.com.ar', 'Ajuste de malla sin costo', 'Buen día, compré un reloj la semana pasada y la malla me quedó un poco grande. ¿Hacen el ajuste de eslabones en el local y hay algún costo adicional? Desde ya gracias.', false, '2026-06-02 10:13:27', '2026-06-02 10:13:27');
INSERT INTO public.contactos VALUES (6, 'Federico García', 'federico.garc''ia53@hotmail.com', 'Error en el pedido recibido', 'Hola, hice una compra online y recibí un reloj diferente al que pedí. El color es distinto al que aparecía en la foto. ¿Cómo hago para cambiarlo? Adjunto el número de pedido: #2847.', false, '2026-06-17 11:13:27', '2026-06-17 11:13:27');
INSERT INTO public.contactos VALUES (7, 'Antonella Ramos', 'antonella.ramos57@outlook.com', 'Envío a interior de la provincia', 'Hola, soy de Mar del Plata y me gustaría saber si hacen envíos a domicilio y con qué empresas trabajan. Vi unos relojes en la página que me interesaron mucho y me gustaría comprar sin tener que viajar.', false, '2026-06-02 06:13:27', '2026-06-02 06:13:27');
INSERT INTO public.contactos VALUES (8, 'Rodrigo Navarro', 'rodrigo.navarro10@live.com.ar', 'Horario del local', 'Buenas, quería saber cuál es el horario de atención del local y si trabajan los sábados. Me quedaría más cómodo pasar un fin de semana. ¿Dónde están ubicados exactamente en La Plata?', false, '2026-06-10 21:13:27', '2026-06-10 21:13:27');
INSERT INTO public.contactos VALUES (9, 'Paula Vargas', 'paula.vargas37@gmail.com', 'Problema con el cierre de la malla', 'Hola, compré un reloj hace tres semanas y el cierre de la malla metálica ya no engrana bien. ¿Esto tiene cobertura de garantía? Quisiera pasarlo a revisar o cambiarlo si es posible.', false, '2026-06-02 09:13:27', '2026-06-02 09:13:27');
INSERT INTO public.contactos VALUES (10, 'Facundo Ruiz', 'facundo.ruiz15@hotmail.com', 'Regalo de casamiento', 'Buenas, me caso en dos meses y quiero comprar un par de relojes de casamiento para mí y mi pareja. ¿Hacen descuentos por la compra de dos relojes juntos o tienen alguna promoción especial para eso?', false, '2026-05-23 23:13:27', '2026-05-23 23:13:27');
INSERT INTO public.contactos VALUES (11, 'Martín Fernández', 'mart''in.fern''andez59@outlook.com', 'Regalo de casamiento', 'Buenas, me caso en dos meses y quiero comprar un par de relojes de casamiento para mí y mi pareja. ¿Hacen descuentos por la compra de dos relojes juntos o tienen alguna promoción especial para eso?', false, '2026-05-21 02:13:27', '2026-05-21 02:13:27');
INSERT INTO public.contactos VALUES (12, 'Ezequiel Domínguez', 'ezequiel.dom''inguez26@gmail.com', 'Consulta sobre relojes cronógrafo', 'Hola, me interesa un reloj cronógrafo para usar en el trabajo. Trabajo en logística y necesito medir tiempos frecuentemente. ¿Qué modelos tienen disponibles y en qué rango de precios?', false, '2026-05-22 13:13:27', '2026-05-22 13:13:27');
INSERT INTO public.contactos VALUES (13, 'Martín Fernández', 'mart''in.fern''andez78@live.com.ar', 'Consulta sobre relojes automáticos', 'Hola, estoy interesado en adquirir mi primer reloj automático y tengo algunas dudas sobre el mantenimiento. ¿Cada cuánto hay que llevarlo a revisar? ¿Ustedes hacen ese servicio de mantenimiento?', false, '2026-06-03 14:13:27', '2026-06-03 14:13:27');
INSERT INTO public.contactos VALUES (14, 'Romina Suárez', 'romina.su''arez51@live.com.ar', 'Disponibilidad de stock', 'Hola, quería saber si tienen disponible el reloj Casio G-Shock en color negro. Lo vi en la web pero no estoy seguro si tienen en stock para retirar en el local de La Plata. Aguardo respuesta, gracias.', false, '2026-06-07 22:13:27', '2026-06-07 22:13:27');
INSERT INTO public.contactos VALUES (15, 'Rodrigo Navarro', 'rodrigo.navarro32@live.com.ar', 'Envío a interior de la provincia', 'Hola, soy de Mar del Plata y me gustaría saber si hacen envíos a domicilio y con qué empresas trabajan. Vi unos relojes en la página que me interesaron mucho y me gustaría comprar sin tener que viajar.', false, '2026-06-13 16:13:27', '2026-06-13 16:13:27');
INSERT INTO public.contactos VALUES (16, 'Leandro Ortiz', 'leandro.ortiz89@outlook.com', 'Limpieza de reloj', 'Buenas tardes, tengo un reloj de acero que está opacado y me gustaría saber si hacen limpieza o pulido del mismo. ¿Tienen ese servicio y cuánto tiempo demora?', false, '2026-05-20 15:13:27', '2026-05-20 15:13:27');
INSERT INTO public.contactos VALUES (17, 'Antonella Ramos', 'antonella.ramos29@hotmail.com', 'Consulta sobre financiación', 'Hola, quería saber si ofrecen financiación en cuotas con tarjeta de crédito y si hay algún recargo. Estoy interesado en un reloj de $150.000 aproximadamente y me vendría bien pagarlo en cuotas.', false, '2026-05-19 03:13:27', '2026-05-19 03:13:27');
INSERT INTO public.contactos VALUES (18, 'Matías Torres', 'mat''ias.torres57@live.com.ar', 'Error en el pedido recibido', 'Hola, hice una compra online y recibí un reloj diferente al que pedí. El color es distinto al que aparecía en la foto. ¿Cómo hago para cambiarlo? Adjunto el número de pedido: #2847.', false, '2026-06-03 11:13:27', '2026-06-03 11:13:27');
INSERT INTO public.contactos VALUES (19, 'Valentina Rodríguez', 'valentina.rodr''iguez61@hotmail.com', 'Consulta sobre relojes cronógrafo', 'Hola, me interesa un reloj cronógrafo para usar en el trabajo. Trabajo en logística y necesito medir tiempos frecuentemente. ¿Qué modelos tienen disponibles y en qué rango de precios?', false, '2026-06-11 09:13:27', '2026-06-11 09:13:27');
INSERT INTO public.contactos VALUES (20, 'Nicolás Pérez', 'nicol''as.p''erez17@hotmail.com', 'Revisión de reloj antiguo', 'Hola, tengo un reloj de bolsillo antiguo de la marca Longines que perteneció a mi bisabuelo y quisiera saber si lo pueden revisar para ver si funciona o se puede restaurar. ¿Trabajan con relojes de colección o antigüedades?', false, '2026-05-23 00:13:27', '2026-05-23 00:13:27');
INSERT INTO public.contactos VALUES (21, 'Camila López', 'camila.l''opez29@outlook.com', 'Consulta sobre garantía de reloj', 'Buen día, compré un reloj hace unos meses en su local y quería saber cuánto tiempo de garantía tiene y cómo funciona el proceso en caso de que tenga algún problema. Desde ya muchas gracias.', false, '2026-05-26 16:13:27', '2026-05-26 16:13:27');
INSERT INTO public.contactos VALUES (22, 'Matías Torres', 'mat''ias.torres18@live.com.ar', 'Cambio de pila de reloj', 'Buenas tardes, quisiera saber si realizan cambio de pilas y cuánto sale aproximadamente. Tengo un reloj Citizen que dejó de funcionar y me dijeron que puede ser la pila. Pueden darme un turno o simplemente llevo el reloj?', false, '2026-06-14 00:13:27', '2026-06-14 00:13:27');
INSERT INTO public.contactos VALUES (23, 'Federico García', 'federico.garc''ia45@live.com.ar', 'Cambio de pila de reloj', 'Buenas tardes, quisiera saber si realizan cambio de pilas y cuánto sale aproximadamente. Tengo un reloj Citizen que dejó de funcionar y me dijeron que puede ser la pila. Pueden darme un turno o simplemente llevo el reloj?', false, '2026-05-20 13:13:27', '2026-05-20 13:13:27');
INSERT INTO public.contactos VALUES (24, 'Leandro Ortiz', 'leandro.ortiz44@hotmail.com', 'Consulta sobre relojes cronógrafo', 'Hola, me interesa un reloj cronógrafo para usar en el trabajo. Trabajo en logística y necesito medir tiempos frecuentemente. ¿Qué modelos tienen disponibles y en qué rango de precios?', false, '2026-05-28 06:13:27', '2026-05-28 06:13:27');
INSERT INTO public.contactos VALUES (25, 'Ignacio Mendoza', 'ignacio.mendoza11@outlook.com', 'Solicito factura de compra', 'Buenas, compré un reloj en el local el mes pasado y no me dieron la factura. Necesito el comprobante para reclamar la garantía ya que el reloj tuvo un inconveniente. ¿Cómo puedo obtenerla? Gracias.', false, '2026-06-16 13:13:27', '2026-06-16 13:13:27');
INSERT INTO public.contactos VALUES (26, 'Celeste Molina', 'celeste.molina36@yahoo.com.ar', 'Compra de reloj para dama', 'Buenas tardes, busco un reloj femenino delicado, preferentemente con malla metálica y esfera blanca o plateada. ¿Tienen opciones en ese estilo? ¿Puedo pasar a verlos por el local sin turno previo?', false, '2026-06-12 12:13:27', '2026-06-12 12:13:27');
INSERT INTO public.contactos VALUES (27, 'Lucía Acosta', 'luc''ia.acosta83@yahoo.com.ar', 'Error en el pedido recibido', 'Hola, hice una compra online y recibí un reloj diferente al que pedí. El color es distinto al que aparecía en la foto. ¿Cómo hago para cambiarlo? Adjunto el número de pedido: #2847.', false, '2026-06-09 06:13:27', '2026-06-09 06:13:27');
INSERT INTO public.contactos VALUES (28, 'Rodrigo Navarro', 'rodrigo.navarro40@live.com.ar', 'Compra de reloj para dama', 'Buenas tardes, busco un reloj femenino delicado, preferentemente con malla metálica y esfera blanca o plateada. ¿Tienen opciones en ese estilo? ¿Puedo pasar a verlos por el local sin turno previo?', false, '2026-06-15 01:13:27', '2026-06-15 01:13:27');
INSERT INTO public.contactos VALUES (29, 'Noelia Blanco', 'noelia.blanco82@gmail.com', 'Compra de reloj para dama', 'Buenas tardes, busco un reloj femenino delicado, preferentemente con malla metálica y esfera blanca o plateada. ¿Tienen opciones en ese estilo? ¿Puedo pasar a verlos por el local sin turno previo?', false, '2026-06-16 11:13:27', '2026-06-16 11:13:27');
INSERT INTO public.contactos VALUES (30, 'Romina Suárez', 'romina.su''arez13@hotmail.com', 'Ajuste de malla sin costo', 'Buen día, compré un reloj la semana pasada y la malla me quedó un poco grande. ¿Hacen el ajuste de eslabones en el local y hay algún costo adicional? Desde ya gracias.', false, '2026-06-12 01:13:27', '2026-06-12 01:13:27');
INSERT INTO public.contactos VALUES (31, 'Sebastián Herrera', 'sebasti''an.herrera32@live.com.ar', 'Consulta sobre relojes automáticos', 'Hola, estoy interesado en adquirir mi primer reloj automático y tengo algunas dudas sobre el mantenimiento. ¿Cada cuánto hay que llevarlo a revisar? ¿Ustedes hacen ese servicio de mantenimiento?', false, '2026-06-08 02:13:27', '2026-06-08 02:13:27');
INSERT INTO public.contactos VALUES (32, 'Facundo Ruiz', 'facundo.ruiz69@yahoo.com.ar', 'Error en el pedido recibido', 'Hola, hice una compra online y recibí un reloj diferente al que pedí. El color es distinto al que aparecía en la foto. ¿Cómo hago para cambiarlo? Adjunto el número de pedido: #2847.', false, '2026-05-24 19:13:27', '2026-05-24 19:13:27');
INSERT INTO public.contactos VALUES (33, 'Ezequiel Domínguez', 'ezequiel.dom''inguez93@yahoo.com.ar', 'Regalo de casamiento', 'Buenas, me caso en dos meses y quiero comprar un par de relojes de casamiento para mí y mi pareja. ¿Hacen descuentos por la compra de dos relojes juntos o tienen alguna promoción especial para eso?', false, '2026-06-10 22:13:27', '2026-06-10 22:13:27');
INSERT INTO public.contactos VALUES (34, 'Micaela Gutiérrez', 'micaela.guti''errez16@outlook.com', 'Error en el pedido recibido', 'Hola, hice una compra online y recibí un reloj diferente al que pedí. El color es distinto al que aparecía en la foto. ¿Cómo hago para cambiarlo? Adjunto el número de pedido: #2847.', false, '2026-05-18 08:13:27', '2026-05-18 08:13:27');
INSERT INTO public.contactos VALUES (35, 'Diego Jiménez', 'diego.jim''enez93@live.com.ar', 'Error en el pedido recibido', 'Hola, hice una compra online y recibí un reloj diferente al que pedí. El color es distinto al que aparecía en la foto. ¿Cómo hago para cambiarlo? Adjunto el número de pedido: #2847.', false, '2026-05-27 15:13:27', '2026-05-27 15:13:27');
INSERT INTO public.contactos VALUES (36, 'Nicolás Pérez', 'nicol''as.p''erez40@gmail.com', 'Disponibilidad de stock', 'Hola, quería saber si tienen disponible el reloj Casio G-Shock en color negro. Lo vi en la web pero no estoy seguro si tienen en stock para retirar en el local de La Plata. Aguardo respuesta, gracias.', true, '2026-04-08 14:13:27', '2026-04-08 14:13:27');
INSERT INTO public.contactos VALUES (37, 'Romina Suárez', 'romina.su''arez55@outlook.com', 'Consulta sobre financiación', 'Hola, quería saber si ofrecen financiación en cuotas con tarjeta de crédito y si hay algún recargo. Estoy interesado en un reloj de $150.000 aproximadamente y me vendría bien pagarlo en cuotas.', true, '2026-01-04 13:13:27', '2026-01-04 13:13:27');
INSERT INTO public.contactos VALUES (38, 'Florencia Díaz', 'florencia.d''iaz50@hotmail.com', 'Limpieza de reloj', 'Buenas tardes, tengo un reloj de acero que está opacado y me gustaría saber si hacen limpieza o pulido del mismo. ¿Tienen ese servicio y cuánto tiempo demora?', true, '2026-04-11 15:13:27', '2026-04-11 15:13:27');
INSERT INTO public.contactos VALUES (39, 'Valentina Rodríguez', 'valentina.rodr''iguez39@hotmail.com', 'Cambio de pila de reloj', 'Buenas tardes, quisiera saber si realizan cambio de pilas y cuánto sale aproximadamente. Tengo un reloj Citizen que dejó de funcionar y me dijeron que puede ser la pila. Pueden darme un turno o simplemente llevo el reloj?', true, '2026-05-05 00:13:27', '2026-05-05 00:13:27');
INSERT INTO public.contactos VALUES (40, 'Sofía Romero', 'sof''ia.romero28@live.com.ar', 'Error en el pedido recibido', 'Hola, hice una compra online y recibí un reloj diferente al que pedí. El color es distinto al que aparecía en la foto. ¿Cómo hago para cambiarlo? Adjunto el número de pedido: #2847.', true, '2026-01-15 00:13:27', '2026-01-15 00:13:27');
INSERT INTO public.contactos VALUES (41, 'Diego Jiménez', 'diego.jim''enez62@yahoo.com.ar', 'Compra de reloj para dama', 'Buenas tardes, busco un reloj femenino delicado, preferentemente con malla metálica y esfera blanca o plateada. ¿Tienen opciones en ese estilo? ¿Puedo pasar a verlos por el local sin turno previo?', true, '2026-05-07 13:13:27', '2026-05-07 13:13:27');
INSERT INTO public.contactos VALUES (42, 'Paula Vargas', 'paula.vargas19@outlook.com', 'Compra de reloj para dama', 'Buenas tardes, busco un reloj femenino delicado, preferentemente con malla metálica y esfera blanca o plateada. ¿Tienen opciones en ese estilo? ¿Puedo pasar a verlos por el local sin turno previo?', true, '2026-02-17 16:13:27', '2026-02-17 16:13:27');
INSERT INTO public.contactos VALUES (43, 'Federico García', 'federico.garc''ia52@yahoo.com.ar', 'Problema con el cierre de la malla', 'Hola, compré un reloj hace tres semanas y el cierre de la malla metálica ya no engrana bien. ¿Esto tiene cobertura de garantía? Quisiera pasarlo a revisar o cambiarlo si es posible.', true, '2026-03-08 17:13:27', '2026-03-08 17:13:27');
INSERT INTO public.contactos VALUES (44, 'Agustina Martínez', 'agustina.mart''inez98@gmail.com', 'Consulta por compra mayorista', 'Buen día, soy vendedor ambulante en La Plata y me interesaría saber si hacen precio mayorista para relojes si compro en cantidad. ¿Con qué volumen mínimo aplica y cuál sería el descuento?', true, '2026-04-26 04:13:27', '2026-04-26 04:13:27');
INSERT INTO public.contactos VALUES (45, 'Celeste Molina', 'celeste.molina90@live.com.ar', 'Horario del local', 'Buenas, quería saber cuál es el horario de atención del local y si trabajan los sábados. Me quedaría más cómodo pasar un fin de semana. ¿Dónde están ubicados exactamente en La Plata?', true, '2026-01-18 22:13:27', '2026-01-18 22:13:27');
INSERT INTO public.contactos VALUES (46, 'Martín Fernández', 'mart''in.fern''andez83@hotmail.com', 'Revisión de reloj antiguo', 'Hola, tengo un reloj de bolsillo antiguo de la marca Longines que perteneció a mi bisabuelo y quisiera saber si lo pueden revisar para ver si funciona o se puede restaurar. ¿Trabajan con relojes de colección o antigüedades?', true, '2026-05-08 06:13:27', '2026-05-08 06:13:27');
INSERT INTO public.contactos VALUES (47, 'Florencia Díaz', 'florencia.d''iaz57@outlook.com', 'Consulta sobre financiación', 'Hola, quería saber si ofrecen financiación en cuotas con tarjeta de crédito y si hay algún recargo. Estoy interesado en un reloj de $150.000 aproximadamente y me vendría bien pagarlo en cuotas.', true, '2026-02-20 21:13:27', '2026-02-20 21:13:27');
INSERT INTO public.contactos VALUES (48, 'Andrés Medina', 'andr''es.medina74@yahoo.com.ar', 'Regalo de casamiento', 'Buenas, me caso en dos meses y quiero comprar un par de relojes de casamiento para mí y mi pareja. ¿Hacen descuentos por la compra de dos relojes juntos o tienen alguna promoción especial para eso?', true, '2026-04-15 02:13:27', '2026-04-15 02:13:27');
INSERT INTO public.contactos VALUES (49, 'Agustina Martínez', 'agustina.mart''inez34@live.com.ar', 'Consulta sobre relojes automáticos', 'Hola, estoy interesado en adquirir mi primer reloj automático y tengo algunas dudas sobre el mantenimiento. ¿Cada cuánto hay que llevarlo a revisar? ¿Ustedes hacen ese servicio de mantenimiento?', true, '2026-04-14 14:13:27', '2026-04-14 14:13:27');
INSERT INTO public.contactos VALUES (50, 'Martín Fernández', 'mart''in.fern''andez69@live.com.ar', 'Consulta sobre relojes cronógrafo', 'Hola, me interesa un reloj cronógrafo para usar en el trabajo. Trabajo en logística y necesito medir tiempos frecuentemente. ¿Qué modelos tienen disponibles y en qué rango de precios?', true, '2026-05-13 00:13:27', '2026-05-13 00:13:27');


--
-- TOC entry 5178 (class 0 OID 29108)
-- Dependencies: 241
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5176 (class 0 OID 29093)
-- Dependencies: 239
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5175 (class 0 OID 29078)
-- Dependencies: 238
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5157 (class 0 OID 26718)
-- Dependencies: 220
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations VALUES (145, '2026_05_20_193257_create_categorias_table', 1);
INSERT INTO public.migrations VALUES (146, '2026_05_20_193257_create_contactos_table', 1);
INSERT INTO public.migrations VALUES (147, '2026_05_20_193257_create_productos_table', 1);
INSERT INTO public.migrations VALUES (148, '2026_05_20_194000_create_roles_table', 1);
INSERT INTO public.migrations VALUES (149, '2026_05_20_194416_create_usuarios_table', 1);
INSERT INTO public.migrations VALUES (150, '2026_05_26_152228_create_sessions_table', 1);
INSERT INTO public.migrations VALUES (151, '2026_05_29_000001_create_ventas_cabecera_table', 1);
INSERT INTO public.migrations VALUES (152, '2026_05_29_000002_create_ventas_detalle_table', 1);
INSERT INTO public.migrations VALUES (153, '2026_05_31_000001_create_password_reset_tokens_table', 1);
INSERT INTO public.migrations VALUES (154, '2026_05_31_000002_create_jobs_table', 1);
INSERT INTO public.migrations VALUES (155, '2026_05_31_000003_create_cache_table', 1);
INSERT INTO public.migrations VALUES (156, '2026_06_03_121500_add_payment_and_location_to_usuarios_table', 1);
INSERT INTO public.migrations VALUES (157, '2026_06_08_000001_create_producto_imagenes_table', 1);
INSERT INTO public.migrations VALUES (158, '2026_06_08_000002_migrate_product_images_to_producto_imagenes', 1);
INSERT INTO public.migrations VALUES (159, '2026_06_08_000003_add_checkout_fields_to_ventas_cabecera', 1);
INSERT INTO public.migrations VALUES (160, '2026_06_08_000004_add_estado_pago_to_ventas_cabecera', 1);
INSERT INTO public.migrations VALUES (161, '2026_06_08_000005_create_user_direcciones_table', 1);
INSERT INTO public.migrations VALUES (162, '2026_06_08_000006_add_direccion_envio_to_ventas_cabecera', 1);


--
-- TOC entry 5173 (class 0 OID 29068)
-- Dependencies: 236
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5182 (class 0 OID 29147)
-- Dependencies: 245
-- Data for Name: producto_imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.producto_imagenes VALUES (1, 1, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/monolito1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (2, 1, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/monolito2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (3, 2, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/assoluto1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (4, 2, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/assoluto2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (5, 3, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/linea1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (6, 3, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/linea2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (7, 4, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/geometra1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (8, 4, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/geometra2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (9, 5, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/cubo1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (10, 5, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/cubo2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (11, 6, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/prisma1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (12, 6, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/prisma2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (13, 7, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/siena1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (14, 7, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/siena2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (15, 8, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/radice1.jpg', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (16, 8, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/radice2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (17, 9, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/bronzo1.jpg', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (18, 9, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/bronzo2.jpg', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (19, 10, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/deserto1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (20, 10, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/deserto2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (21, 11, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/foresta1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (22, 11, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/foresta2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (23, 12, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/vulcano1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (24, 12, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/vulcano2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (25, 13, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/struttura1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (26, 13, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/struttura2.jpg', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (27, 14, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/impero1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (28, 14, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/impero2.jpg', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (29, 15, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/orizzonte1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (30, 15, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/orizzonte2.jpg', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (31, 16, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/eclissi1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (32, 16, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/eclissi2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (33, 17, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/crono-tech1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (34, 17, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/crono-tech2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (35, 18, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/aero1.png', 'lifestyle', 0, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.producto_imagenes VALUES (36, 18, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/aero2.png', 'studio', 1, '2026-06-17 15:13:25', '2026-06-17 15:13:25');


--
-- TOC entry 5163 (class 0 OID 28960)
-- Dependencies: 226
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos VALUES (1, 1, 'Monolito', 'monolito', 'Un reloj escultórico con líneas puras y presencia estructural, creado para destacar en cualquier entorno.', 250000.00, 'Titanio cepillado 42mm', 'Automático Vittorio 21', 'Zafiro antirreflejo', '10 ATM', 'Silicona técnica negra', 12, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (2, 1, 'Assoluto', 'assoluto', 'Diseño minimalista y poderoso, con acabado oscuro y detalles que combinan modernidad con manufactura tradicional.', 210000.00, 'Acero PVD negro 40mm', 'Cuarzo suizo Ronda 6004B', 'Mineral endurecido', '5 ATM', 'Cuero vegano premium', 15, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (3, 1, 'Linea', 'linea', 'Una pieza sobria y versátil, con una carátula limpia y una estética atemporal para uso diario y ocasiones especiales.', 180000.00, 'Acero pulido 38mm', 'Miyota 2035', 'Mineral endurecido', '3 ATM', 'Malla milanesa de acero', 20, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (4, 1, 'Geometra', 'geometra', 'Arquitectura de vanguardia en tu muñeca. Ángulos marcados en titanio y un dial oscuro que define el lujo minimalista.', 280000.00, 'Titanio cepillado angular 41mm', 'Automático Suizo Sellita SW200-1', 'Zafiro con recubrimiento AR doble', '10 ATM', 'Acero integrado', 0, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (5, 1, 'Cubo', 'cubo', 'Estética cuadrada y pura. Una pieza que desafía lo convencional con un dial blanco inmaculado.', 190000.00, 'Acero cepillado cuadrado 39mm', 'Cuarzo Suizo', 'Zafiro plano', '5 ATM', 'Cuero negro premium', 14, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (6, 1, 'Prisma', 'prisma', 'Bisel octogonal y brazalete integrado. El pináculo de la línea estructural en una silueta icónica.', 310000.00, 'Acero pulido 42mm', 'Automático Miyota 9015', 'Zafiro con bisel octogonal', '10 ATM', 'Brazalete de acero integrado', 8, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (7, 2, 'Siena', 'siena', 'Inspirado en paisajes cálidos, Siena equilibra textura y color en una propuesta robusta y elegante.', 160000.00, 'Bronce cepillado 42mm', 'Sellita SW200', 'Zafiro antirreflejo', '8 ATM', 'Piel color arena', 8, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (8, 2, 'Radice', 'radice', 'Con un aire vintage y detalles clásicos, Radice ofrece sabor tradicional con precisión moderna.', 175000.00, 'Bronce patinado 41mm', 'Miyota 9015', 'Mineral endurecido', '10 ATM', 'Cuero natural marrón', 10, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (9, 2, 'Bronzo', 'bronzo', 'Un cronógrafo de elevado carácter, con tonos cálidos y una presencia deportiva refinada.', 220000.00, 'Acero con baño bronce 44mm', 'Cuarzo cronógrafo', 'Zafiro plano', '10 ATM', 'Nylon técnico', 7, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (10, 2, 'Deserto', 'deserto', 'Diseñado para la exploración con estética heritage. Combina bronce patinado con una textura granulada de arena fina.', 195000.00, 'Bronce patinado 40mm', 'Automático Miyota 8215', 'Zafiro abombado', '15 ATM', 'Lona canvas verde oliva', 9, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (11, 2, 'Foresta', 'foresta', 'Un reloj de campo genuino. Dial verde bosque mate contrastado con cuero marrón rústico de alta durabilidad.', 150000.00, 'Acero cepillado 39mm', 'Cuarzo de alta precisión', 'Mineral endurecido', '10 ATM', 'Cuero marrón desgastado', 18, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (12, 2, 'Vulcano', 'vulcano', 'Tonos oscuros y cálidos de roca volcánica. Caja mate robusta pensada para resistir los elementos.', 205000.00, 'Acero negro mate 43mm', 'Automático NH35', 'Zafiro abombado', '20 ATM', 'Cuero grueso marrón rojizo', 5, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (13, 3, 'Struttura', 'struttura', 'Estructura abierta, geometría de impacto y un alma técnica para quienes buscan un reloj con carácter arquitectónico.', 320000.00, 'Acero satinado 43mm', 'Sellita SW300', 'Zafiro antirreflejo', '12 ATM', 'Caucho texturado', 0, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (14, 3, 'Impero', 'impero', 'Líneas nobles y una estética refinada que convierten a Impero en un reloj de lujo contemporáneo para uso formal.', 290000.00, 'Oro rosa IP 40mm', 'Cuarzo suizo', 'Mineral endurecido', '5 ATM', 'Cuero negro estructurado', 9, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (15, 3, 'Orizzonte', 'orizzonte', 'Una pieza deportiva con detalles técnicos, ideal para quienes buscan estilo y rendimiento por igual.', 270000.00, 'Acero negro 44mm', 'Seiko NH35A', 'Zafiro antirreflejo', '20 ATM', 'Silicona deportiva', 11, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (16, 3, 'Eclissi', 'eclissi', 'El pináculo del diseño stealth. Acabados en negro PVD mate con un dial esqueletizado que revela el corazón mecánico del reloj.', 380000.00, 'Acero PVD negro mate 42mm', 'Automático Esqueletizado', 'Zafiro plano con tratamiento AR', '10 ATM', 'Cuero negro mate', 4, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (17, 3, 'Crono-Tech', 'crono-tech', 'Precisión de carreras. Dial de fibra de carbono real, detalles en rojo brillante y caja aerodinámica.', 350000.00, 'Acero y PVD negro 44mm', 'Cronógrafo Meca-Quartz', 'Zafiro', '10 ATM', 'Caucho integrado', 10, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);
INSERT INTO public.productos VALUES (18, 3, 'Aero', 'aero', 'Legibilidad pura bajo cualquier condición. Inspirado en los instrumentos de vuelo con acabados utilitarios mate.', 240000.00, 'Acero granallado gris mate 45mm', 'Automático Suizo', 'Zafiro abombado', '5 ATM', 'Nylon NATO negra resistente', 7, true, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL);


--
-- TOC entry 5165 (class 0 OID 28985)
-- Dependencies: 228
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES (1, 'admin', '2026-06-17 15:13:23', '2026-06-17 15:13:23', NULL);
INSERT INTO public.roles VALUES (2, 'cliente', '2026-06-17 15:13:23', '2026-06-17 15:13:23', NULL);


--
-- TOC entry 5168 (class 0 OID 29015)
-- Dependencies: 231
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5184 (class 0 OID 29171)
-- Dependencies: 247
-- Data for Name: user_direcciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5167 (class 0 OID 28996)
-- Dependencies: 230
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios VALUES (1, 'Admin', 'admin@admin.com', NULL, '$2y$12$hDADCyGAB1RFEtFDzWx27.3jITbwYjDBGwq3f5RdRz1fI8F/kCOiO', 1, NULL, '2026-06-17 15:13:23', '2026-06-17 15:13:23', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (2, 'Valentina Rodríguez', 'cliente1@demo.com', '2026-06-17 15:13:24', '$2y$12$k.U7vXqh4e8p37UNpZSIx.LtXOrfh5e125FRN1.6MFAnpQgs7mklG', 2, NULL, '2026-06-17 15:13:24', '2026-06-17 15:13:24', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (3, 'Martín Fernández', 'cliente2@demo.com', '2026-06-17 15:13:24', '$2y$12$Hr1pwUwf6GJtV5zYHvPef.RAbyrqxUkBcSk8fIsJWhEfX2wevVLZS', 2, NULL, '2026-06-17 15:13:24', '2026-06-17 15:13:24', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (4, 'Lucía Acosta', 'cliente3@demo.com', '2026-06-17 15:13:24', '$2y$12$5cnQGvmZ/IMLqqHLrEZUHeVlFzWgIhm9BT4VktS75y/W4LTLd6A3e', 2, NULL, '2026-06-17 15:13:24', '2026-06-17 15:13:24', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (5, 'Micaela Ortiz', 'white.tanya@example.org', '2026-06-17 15:13:24', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'CRtkQgRod6', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (6, 'Pablo Mendoza', 'gaylord.alford@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'daZ4A9jA1R', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (7, 'Nicolás Álvarez', 'connelly.hollie@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'hccnsOAuxl', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (8, 'Agustina Domínguez', 'hamill.enoch@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'fowVViefni', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (9, 'Romina Ruiz', 'telly.koepp@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'fThQFaJn4C', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (10, 'Julieta Sánchez', 'qgusikowski@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'w6lBEJQCmV', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (11, 'Florencia Cabrera', 'armando19@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'unMIYFVFmn', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (12, 'Leandro Pereyra', 'heller.brannon@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'szVmqOpi74', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (13, 'Romina Fernández', 'wupton@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'FkitAknIWg', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (14, 'Cristian Moreno', 'lbarton@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'ZArNEdh8iO', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (15, 'Matías Fernández', 'fernando.boyer@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'eYMn5EXgaD', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (16, 'Soledad Ruiz', 'addie12@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'DbByc6KiGQ', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (17, 'Gonzalo Romero', 'murray.tobin@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'HA43q9OEr6', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (18, 'Antonella Pereyra', 'johnathon21@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'BvyFXGrYnC', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (19, 'Antonella Jiménez', 'german15@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'fxLTRbwqpT', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (20, 'Soledad Torres', 'milford65@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '7hmUssk6po', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (21, 'Tomás Ortiz', 'florencio.little@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'gnTspzHNVh', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (22, 'Diego López', 'adolfo.hansen@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'A0XVdEAbM0', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (23, 'Paula Vega', 'eduardo04@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'JGuQcJEvIH', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (24, 'Micaela Suárez', 'strosin.brendon@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'DXAIHqHseA', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (25, 'Gonzalo Pérez', 'deborah72@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'C1EHBSbQvV', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (26, 'Carla Martínez', 'kian.auer@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'qZxP5UUu5K', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (27, 'Antonella Jiménez', 'pcummings@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'tj2BLb9Fns', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (28, 'Florencia Vega', 'bobbie29@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '1JNmeufmrY', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (29, 'Romina Pérez', 'enola56@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'vrSqUWzYYc', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (30, 'Vanesa Domínguez', 'spinka.candelario@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'xSHc3Mfl2F', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (31, 'Verónica Navarro', 'jamarcus.nolan@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'XwqFEWeLE3', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (32, 'Lucía Navarro', 'daphnee40@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'N1vUyTAX8e', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (33, 'Martín Sánchez', 'hunter.lang@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'T98Z9ZTTop', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (34, 'Pablo Vega', 'angeline58@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'Yy0WVAGo3o', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (35, 'Sofía Fuentes', 'kaia84@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'imqMsUidkS', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (36, 'Micaela Díaz', 'shanahan.ernestina@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'RGB5TDN3tH', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (37, 'Ezequiel Suárez', 'leonard97@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'a5px4TyN9b', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (38, 'Sebastián Vargas', 'ila.von@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'v5KQU5KnEk', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (39, 'Carla Núñez', 'yoshiko.turner@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'IjFudHM4pW', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (40, 'Ezequiel Fuentes', 'stanley71@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'k2NCCQQNp9', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (41, 'Martín Herrera', 'candice.anderson@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'Yffo1odA5K', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (42, 'Martín Martínez', 'pfannerstill.kali@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '0RJEQzjV4O', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (43, 'Martín Delgado', 'rempel.gerson@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'nnRHV14O4w', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (44, 'Leandro Suárez', 'christ.miller@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'ET7zEPwOL2', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (45, 'Noelia Pérez', 'deshaun.gleichner@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'SDk8yhDBfB', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (46, 'Andrés Díaz', 'pattie.simonis@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '4kPoyTCP2Q', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (47, 'Noelia Fuentes', 'senger.rhianna@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '7L4a2eEvye', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (48, 'Sofía Moreno', 'reynolds.christ@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '3A24j0U5xd', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (49, 'Pablo Moreno', 'christiansen.felix@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'C8tOoSJNOI', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (50, 'Sebastián Molina', 'oconner.rigoberto@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'utBL0pOmoO', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (51, 'Ignacio Paredes', 'qledner@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '6PCY3nqxyl', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (52, 'Ezequiel Gutiérrez', 'hanna06@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'ruWbWArPTJ', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (53, 'Pablo García', 'west.domenica@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '8DJSu40YKY', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (54, 'Valentina Suárez', 'schaefer.jadon@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'hhCO9RBMJK', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (55, 'Melina Pereyra', 'hintz.mertie@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'Y5ZX6vvrjc', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (56, 'Vanesa Ríos', 'monserrate76@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'JPmOWN6zu1', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (57, 'Micaela Fuentes', 'blick.major@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'qU2UNGYCKv', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (58, 'Natalia García', 'caden.jacobi@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'kjxr3IwJIe', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (59, 'Verónica López', 'toy31@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'swi5Tr0YU4', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (60, 'Andrés Navarro', 'howell39@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'k5KDbntdBr', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (61, 'Vanesa Cabrera', 'rodriguez.dillan@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'qotTF4cQMM', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (62, 'Ezequiel Moreno', 'emmet07@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'VGA03mdKp5', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (63, 'Cristian Mendoza', 'xgislason@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '03xbtEnkMe', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (64, 'Paula Vargas', 'sstehr@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'voh9QXnPo3', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (65, 'Lucía Pérez', 'ewest@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '8R5eAVrByI', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (66, 'Sofía Martínez', 'nolan.jordan@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '46rhwXPUGU', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (67, 'Julieta Ríos', 'elaina.white@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'gFheVuWUjp', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (68, 'Celeste Paredes', 'kieran.stoltenberg@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '7QalvMFsb2', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (69, 'Matías Moreno', 'avonrueden@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'shK8zEWqQx', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (70, 'Ignacio Ruiz', 'phyllis93@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '5RUp6uFPC1', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (71, 'Maximiliano Ortiz', 'johnston.tom@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'N6vG0HXNEj', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (72, 'Noelia Ramos', 'west.moses@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'aNyzIEfWLG', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (73, 'Vanesa Jiménez', 'gaylord.rollin@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'MoggIBoZNt', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (74, 'Martín Núñez', 'borer.kurt@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'k4ouwRMtFJ', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (75, 'Antonella Navarro', 'leilani.price@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'q6Aetj9CHU', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (76, 'Camila Fernández', 'janick.lemke@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'LnPV7QaZTL', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (77, 'Vanesa Benítez', 'kaleb14@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'iIxblaWJhE', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (78, 'Cristian Paredes', 'litzy.parker@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '7Fw7WD3xBv', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (79, 'Joaquín Castro', 'ntorphy@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '4bNT1xCnjD', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (80, 'Noelia Romero', 'kuphal.stanton@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'kmg9St8SlX', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (81, 'Camila Silva', 'velva.dietrich@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'txT6UjFord', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (82, 'Sebastián Acosta', 'talon52@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'OdUgzhgzHZ', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (83, 'Rodrigo Sánchez', 'casimer73@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '9uwXvk8oHF', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (84, 'Celeste Mendoza', 'louvenia83@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'nzzwzqlT2W', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (85, 'Verónica Rodríguez', 'kassulke.hellen@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'PidLsjYOJF', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (86, 'Ignacio Paredes', 'allie.hodkiewicz@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'f8mdKSBbuV', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (87, 'Soledad Heredia', 'ledner.kayli@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'ibhWnwMqC0', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (88, 'Javier Gutiérrez', 'dach.brisa@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '2Rn3nNESXF', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (89, 'Rodrigo López', 'fokeefe@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'sstEOtQ7ij', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (90, 'Maximiliano Díaz', 'hweimann@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'w9R2gv1vFC', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (91, 'Natalia Álvarez', 'nienow.zackary@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'hvEiVcpv4U', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (92, 'Melina López', 'moen.cristian@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'gRoakOdQ7E', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (93, 'Gonzalo Molina', 'alena.rau@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'gvnOpkTq34', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (94, 'Maximiliano López', 'koepp.noel@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'MG0LXjQepe', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (95, 'Antonella Paredes', 'cpredovic@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'Y6QuFCWoLM', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (96, 'Facundo Fernández', 'brennan.ledner@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'iOGNh5jSnf', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (97, 'Ignacio Martínez', 'demetris.borer@example.net', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'K0mOEL4w8H', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (98, 'Camila Núñez', 'lschaefer@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, '4m5MSlF7nM', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (99, 'Romina Ortiz', 'jessie07@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'C4Lic1H0N7', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (100, 'Romina Ramos', 'annetta01@example.com', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'TRYdLoeZ0S', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (101, 'Julieta Acosta', 'wmarks@example.org', '2026-06-17 15:13:25', '$2y$12$.pnbO8lGS9aQU7gFz6TcE.8cT62d2FFgFljRWNAXTeFJJGHOmDspK', 2, 'QOVd7PS5ND', '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5170 (class 0 OID 29028)
-- Dependencies: 233
-- Data for Name: ventas_cabecera; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ventas_cabecera VALUES (1, 2, NULL, 'carrito', 385000.00, '2026-06-17 15:13:25', '2026-06-17 15:13:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pendiente', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (2, 29, '2025-10-24 11:13:25', 'confirmado', 1620000.00, '2025-10-24 11:13:25', '2026-06-17 15:13:25', 'Agustina Martínez', 'Calle 116', '1609', 'La Plata - City Bell', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (3, 30, '2025-02-07 08:13:25', 'confirmado', 250000.00, '2025-02-07 08:13:25', '2026-06-17 15:13:25', 'Agustina Martínez', 'Calle 63', '1273', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (4, 71, '2024-03-18 20:13:25', 'confirmado', 1470000.00, '2024-03-18 20:13:25', '2026-06-17 15:13:25', 'Matías Torres', 'Calle 12', '2073', 'La Plata - Ringuelet', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (5, 29, '2025-02-16 16:13:25', 'confirmado', 2520000.00, '2025-02-16 16:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle 51', '2152', 'La Plata - Berisso', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (6, 78, '2024-11-12 18:13:25', 'confirmado', 410000.00, '2024-11-12 18:13:25', '2026-06-17 15:13:25', 'Nicolás Pérez', 'Calle 38', '669', 'La Plata - Melchor Romero', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (7, 89, '2024-01-19 06:13:25', 'confirmado', 1880000.00, '2024-01-19 06:13:25', '2026-06-17 15:13:25', 'Facundo Ruiz', 'Calle 57', '426', 'La Plata - Gonnet', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (8, 26, '2024-12-03 14:13:25', 'confirmado', 2250000.00, '2024-12-03 14:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle 8', '2049', 'La Plata - Berisso', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (9, 96, '2024-12-16 04:13:25', 'confirmado', 1495000.00, '2024-12-16 04:13:25', '2026-06-17 15:13:25', 'Leandro Ortiz', 'Calle 1', '544', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (10, 83, '2024-01-23 04:13:25', 'confirmado', 880000.00, '2024-01-23 04:13:25', '2026-06-17 15:13:25', 'Micaela Gutiérrez', 'Calle 38', '2442', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (11, 11, '2025-08-12 01:13:25', 'confirmado', 480000.00, '2025-08-12 01:13:25', '2026-06-17 15:13:25', 'Natalia Moreno', 'Calle 90', '905', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (12, 58, '2026-06-17 12:13:25', 'confirmado', 715000.00, '2026-06-17 12:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle 76', '2339', 'La Plata - City Bell', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (13, 78, '2023-12-23 07:13:25', 'confirmado', 1130000.00, '2023-12-23 07:13:25', '2026-06-17 15:13:25', 'Sofía Romero', 'Calle Diagonal 74', '816', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (14, 38, '2024-12-24 19:13:25', 'confirmado', 1590000.00, '2024-12-24 19:13:25', '2026-06-17 15:13:25', 'Matías Torres', 'Calle 44', '2377', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (15, 48, '2023-07-28 11:13:25', 'confirmado', 1420000.00, '2023-07-28 11:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle Avenida 13', '2119', 'La Plata - City Bell', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (16, 85, '2024-10-01 12:13:25', 'confirmado', 1140000.00, '2024-10-01 12:13:25', '2026-06-17 15:13:25', 'Lucía Acosta', 'Calle Avenida 32', '1047', 'La Plata - Ensenada', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (17, 68, '2025-01-20 02:13:25', 'confirmado', 590000.00, '2025-01-20 02:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle 90', '1474', 'La Plata - Melchor Romero', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (18, 51, '2026-03-01 06:13:25', 'confirmado', 1370000.00, '2026-03-01 06:13:25', '2026-06-17 15:13:25', 'Matías Torres', 'Calle 63', '2235', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (19, 2, '2025-06-23 02:13:25', 'confirmado', 615000.00, '2025-06-23 02:13:25', '2026-06-17 15:13:25', 'Camila López', 'Calle 51', '1253', 'La Plata - Melchor Romero', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (20, 36, '2024-04-12 12:13:25', 'confirmado', 320000.00, '2024-04-12 12:13:25', '2026-06-17 15:13:25', 'Leandro Ortiz', 'Calle 4', '1469', 'La Plata - Ensenada', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (21, 94, '2023-09-20 10:13:25', 'confirmado', 1330000.00, '2023-09-20 10:13:25', '2026-06-17 15:13:25', 'Martín Fernández', 'Calle 13', '878', 'La Plata - City Bell', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (22, 55, '2024-12-29 07:13:25', 'confirmado', 385000.00, '2024-12-29 07:13:25', '2026-06-17 15:13:25', 'Gonzalo Sánchez', 'Calle 44', '1504', 'La Plata - Centro', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (23, 101, '2025-12-17 07:13:25', 'confirmado', 1050000.00, '2025-12-17 07:13:25', '2026-06-17 15:13:25', 'Tomás Álvarez', 'Calle 3', '2985', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (24, 26, '2023-07-12 02:13:25', 'confirmado', 1170000.00, '2023-07-12 02:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle 122', '1739', 'La Plata - Gonnet', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (25, 93, '2025-02-06 01:13:25', 'confirmado', 320000.00, '2025-02-06 01:13:25', '2026-06-17 15:13:25', 'Micaela Gutiérrez', 'Calle 90', '1378', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (26, 42, '2024-01-11 23:13:25', 'confirmado', 585000.00, '2024-01-11 23:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle 7', '336', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (27, 38, '2026-02-11 23:13:25', 'confirmado', 875000.00, '2026-02-11 23:13:25', '2026-06-17 15:13:25', 'Martín Fernández', 'Calle 6', '1920', 'La Plata - Centro', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (28, 87, '2024-10-17 06:13:25', 'confirmado', 1460000.00, '2024-10-17 06:13:25', '2026-06-17 15:13:25', 'Agustina Martínez', 'Calle 6', '167', 'La Plata - Abasto', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (29, 60, '2024-10-26 21:13:25', 'confirmado', 240000.00, '2024-10-26 21:13:25', '2026-06-17 15:13:25', 'Sofía Romero', 'Calle 5', '1317', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (30, 24, '2025-10-07 01:13:25', 'confirmado', 720000.00, '2025-10-07 01:13:25', '2026-06-17 15:13:25', 'Leandro Ortiz', 'Calle 60', '988', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (31, 77, '2026-01-07 21:13:25', 'confirmado', 1030000.00, '2026-01-07 21:13:25', '2026-06-17 15:13:25', 'Micaela Gutiérrez', 'Calle 72', '435', 'La Plata - Ringuelet', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (32, 88, '2024-03-10 20:13:25', 'confirmado', 1480000.00, '2024-03-10 20:13:25', '2026-06-17 15:13:25', 'Nicolás Pérez', 'Calle Diagonal 80', '1906', 'La Plata - Centro', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (33, 55, '2025-06-07 19:13:25', 'confirmado', 480000.00, '2025-06-07 19:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle Diagonal 79', '1785', 'La Plata - Gonnet', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (34, 19, '2024-10-13 09:13:25', 'confirmado', 975000.00, '2024-10-13 09:13:25', '2026-06-17 15:13:25', 'Florencia Díaz', 'Calle 10', '309', 'La Plata - Ensenada', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (35, 19, '2024-01-24 07:13:25', 'confirmado', 1075000.00, '2024-01-24 07:13:25', '2026-06-17 15:13:25', 'Facundo Ruiz', 'Calle Diagonal 73', '2254', 'La Plata - Berisso', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (36, 30, '2025-08-22 02:13:25', 'confirmado', 760000.00, '2025-08-22 02:13:25', '2026-06-17 15:13:25', 'Natalia Moreno', 'Calle 137', '1376', 'La Plata - City Bell', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (37, 9, '2024-12-15 13:13:25', 'confirmado', 640000.00, '2024-12-15 13:13:25', '2026-06-17 15:13:25', 'Gonzalo Sánchez', 'Calle Diagonal 79', '536', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (38, 34, '2024-03-06 06:13:25', 'confirmado', 890000.00, '2024-03-06 06:13:25', '2026-06-17 15:13:25', 'Diego Jiménez', 'Calle 2', '2336', 'La Plata - Ensenada', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (39, 76, '2023-08-10 19:13:25', 'confirmado', 220000.00, '2023-08-10 19:13:25', '2026-06-17 15:13:25', 'Agustina Martínez', 'Calle 90', '2320', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (40, 90, '2023-09-19 18:13:25', 'confirmado', 1915000.00, '2023-09-19 18:13:25', '2026-06-17 15:13:25', 'Micaela Gutiérrez', 'Calle Avenida 66', '2099', 'La Plata - Berisso', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (41, 49, '2025-01-11 21:13:25', 'confirmado', 1770000.00, '2025-01-11 21:13:25', '2026-06-17 15:13:25', 'Nicolás Pérez', 'Calle 7', '1488', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (42, 5, '2024-02-07 22:13:25', 'confirmado', 720000.00, '2024-02-07 22:13:25', '2026-06-17 15:13:25', 'Martín Fernández', 'Calle 3', '544', 'La Plata - Villa Elvira', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (43, 38, '2024-04-21 09:13:25', 'confirmado', 1140000.00, '2024-04-21 09:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle Avenida 66', '970', 'La Plata - City Bell', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (44, 81, '2023-06-25 18:13:25', 'confirmado', 1445000.00, '2023-06-25 18:13:25', '2026-06-17 15:13:25', 'Micaela Gutiérrez', 'Calle 57', '2984', 'La Plata - Abasto', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (45, 90, '2023-11-16 21:13:25', 'confirmado', 480000.00, '2023-11-16 21:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle 72', '2441', 'La Plata - Abasto', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (46, 5, '2024-08-18 12:13:25', 'confirmado', 300000.00, '2024-08-18 12:13:25', '2026-06-17 15:13:25', 'Sebastián Herrera', 'Calle 4', '2899', 'La Plata - Ensenada', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (47, 28, '2025-03-09 16:13:25', 'confirmado', 380000.00, '2025-03-09 16:13:25', '2026-06-17 15:13:25', 'Tomás Álvarez', 'Calle 4', '1544', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (48, 75, '2023-10-24 11:13:25', 'confirmado', 720000.00, '2023-10-24 11:13:25', '2026-06-17 15:13:25', 'Sebastián Herrera', 'Calle 13', '2661', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (49, 54, '2026-04-21 02:13:25', 'confirmado', 1100000.00, '2026-04-21 02:13:25', '2026-06-17 15:13:25', 'Sebastián Herrera', 'Calle 7', '2618', 'La Plata - Ensenada', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (50, 89, '2023-08-17 09:13:25', 'confirmado', 970000.00, '2023-08-17 09:13:25', '2026-06-17 15:13:25', 'Diego Jiménez', 'Calle 81', '497', 'La Plata - Villa Elvira', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (51, 55, '2025-02-01 20:13:25', 'confirmado', 745000.00, '2025-02-01 20:13:25', '2026-06-17 15:13:25', 'Paula Vargas', 'Calle 3', '1933', 'La Plata - Villa Elvira', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (52, 12, '2025-12-11 15:13:25', 'confirmado', 1435000.00, '2025-12-11 15:13:25', '2026-06-17 15:13:25', 'Matías Torres', 'Calle 57', '2389', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (53, 64, '2025-12-14 03:13:25', 'confirmado', 1065000.00, '2025-12-14 03:13:25', '2026-06-17 15:13:25', 'Gonzalo Sánchez', 'Calle 1', '2329', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (54, 15, '2025-09-10 23:13:25', 'confirmado', 510000.00, '2025-09-10 23:13:25', '2026-06-17 15:13:25', 'Florencia Díaz', 'Calle Avenida 7', '883', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (55, 98, '2023-07-05 14:13:25', 'confirmado', 960000.00, '2023-07-05 14:13:25', '2026-06-17 15:13:25', 'Natalia Moreno', 'Calle 72', '243', 'La Plata - Berisso', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (56, 11, '2024-06-08 16:13:25', 'confirmado', 585000.00, '2024-06-08 16:13:25', '2026-06-17 15:13:25', 'Diego Jiménez', 'Calle 57', '587', 'La Plata - Gonnet', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (57, 37, '2023-10-08 20:13:25', 'confirmado', 1335000.00, '2023-10-08 20:13:25', '2026-06-17 15:13:25', 'Nicolás Pérez', 'Calle 9', '2471', 'La Plata - Villa Elisa', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (58, 28, '2023-06-26 00:13:25', 'confirmado', 220000.00, '2023-06-26 00:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle Avenida 44', '139', 'La Plata - Ringuelet', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (59, 68, '2023-12-27 11:13:25', 'confirmado', 615000.00, '2023-12-27 11:13:25', '2026-06-17 15:13:25', 'Sofía Romero', 'Calle Avenida 13', '341', 'La Plata - Abasto', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (60, 58, '2024-01-23 23:13:25', 'confirmado', 1160000.00, '2024-01-23 23:13:25', '2026-06-17 15:13:25', 'Natalia Moreno', 'Calle 76', '2372', 'La Plata - Berisso', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (61, 19, '2026-03-05 11:13:25', 'confirmado', 810000.00, '2026-03-05 11:13:25', '2026-06-17 15:13:25', 'Diego Jiménez', 'Calle 51', '1139', 'La Plata - City Bell', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (62, 82, '2024-08-02 06:13:25', 'confirmado', 1140000.00, '2024-08-02 06:13:25', '2026-06-17 15:13:25', 'Camila López', 'Calle Diagonal 80', '2628', 'La Plata - Ensenada', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (63, 27, '2024-03-30 04:13:25', 'confirmado', 750000.00, '2024-03-30 04:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle 90', '2176', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (64, 37, '2023-06-24 07:13:25', 'confirmado', 1310000.00, '2023-06-24 07:13:25', '2026-06-17 15:13:25', 'Sebastián Herrera', 'Calle 4', '103', 'La Plata - Gonnet', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (65, 62, '2025-09-24 13:13:25', 'confirmado', 720000.00, '2025-09-24 13:13:25', '2026-06-17 15:13:25', 'Natalia Moreno', 'Calle Avenida 7', '1542', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (66, 82, '2025-10-02 11:13:25', 'confirmado', 1560000.00, '2025-10-02 11:13:25', '2026-06-17 15:13:25', 'Facundo Ruiz', 'Calle Diagonal 80', '2999', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (67, 93, '2023-07-06 14:13:25', 'confirmado', 1800000.00, '2023-07-06 14:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle Diagonal 73', '1145', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (68, 81, '2024-02-15 09:13:25', 'confirmado', 760000.00, '2024-02-15 09:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle 7', '2472', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (69, 86, '2023-11-13 08:13:25', 'confirmado', 570000.00, '2023-11-13 08:13:25', '2026-06-17 15:13:25', 'Tomás Álvarez', 'Calle 5', '1349', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (70, 27, '2024-06-05 07:13:25', 'confirmado', 1170000.00, '2024-06-05 07:13:25', '2026-06-17 15:13:25', 'Facundo Ruiz', 'Calle Avenida 13', '1138', 'La Plata - Gonnet', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (71, 77, '2026-02-02 17:13:25', 'confirmado', 525000.00, '2026-02-02 17:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle Diagonal 74', '2827', 'La Plata - Ringuelet', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (72, 66, '2023-08-11 10:13:25', 'confirmado', 240000.00, '2023-08-11 10:13:25', '2026-06-17 15:13:25', 'Matías Torres', 'Calle 14', '530', 'La Plata - Ensenada', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (73, 64, '2023-06-30 00:13:25', 'confirmado', 1200000.00, '2023-06-30 00:13:25', '2026-06-17 15:13:25', 'Agustina Martínez', 'Calle 13', '949', 'La Plata - City Bell', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (74, 77, '2025-10-06 07:13:25', 'confirmado', 210000.00, '2025-10-06 07:13:25', '2026-06-17 15:13:25', 'Gonzalo Sánchez', 'Calle 2', '1690', 'La Plata - Villa Elisa', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (75, 17, '2024-02-26 17:13:25', 'confirmado', 290000.00, '2024-02-26 17:13:25', '2026-06-17 15:13:25', 'Agustina Martínez', 'Calle 66', '2890', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (76, 51, '2025-09-22 00:13:25', 'confirmado', 825000.00, '2025-09-22 00:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle 2', '1776', 'La Plata - Villa Elvira', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (77, 74, '2023-07-03 07:13:25', 'confirmado', 1510000.00, '2023-07-03 07:13:25', '2026-06-17 15:13:25', 'Florencia Díaz', 'Calle Avenida 32', '2488', 'La Plata - Berisso', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (78, 84, '2025-07-04 23:13:25', 'confirmado', 390000.00, '2025-07-04 23:13:25', '2026-06-17 15:13:25', 'Lucía Acosta', 'Calle Avenida 32', '2588', 'La Plata - Berisso', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (79, 83, '2026-04-27 19:13:25', 'confirmado', 460000.00, '2026-04-27 19:13:25', '2026-06-17 15:13:25', 'Facundo Ruiz', 'Calle 84', '2483', 'La Plata - Los Hornos', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (80, 4, '2025-06-08 13:13:25', 'confirmado', 660000.00, '2025-06-08 13:13:25', '2026-06-17 15:13:25', 'Diego Jiménez', 'Calle Diagonal 80', '818', 'La Plata - Villa Elvira', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (81, 20, '2024-01-13 12:13:25', 'confirmado', 810000.00, '2024-01-13 12:13:25', '2026-06-17 15:13:25', 'Natalia Moreno', 'Calle 11', '2987', 'La Plata - Gonnet', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (82, 36, '2025-06-03 21:13:25', 'confirmado', 1095000.00, '2025-06-03 21:13:25', '2026-06-17 15:13:25', 'Federico García', 'Calle 7', '2227', 'La Plata - Ensenada', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (83, 51, '2024-02-09 18:13:25', 'confirmado', 660000.00, '2024-02-09 18:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle 57', '772', 'La Plata - Tolosa', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (84, 74, '2023-09-10 19:13:25', 'confirmado', 1970000.00, '2023-09-10 19:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle 3', '1576', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (85, 67, '2024-06-22 17:13:25', 'confirmado', 270000.00, '2024-06-22 17:13:25', '2026-06-17 15:13:25', 'Matías Torres', 'Calle 14', '710', 'La Plata - Ringuelet', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (86, 2, '2025-10-16 07:13:25', 'confirmado', 820000.00, '2025-10-16 07:13:25', '2026-06-17 15:13:25', 'Paula Vargas', 'Calle 10', '2830', 'La Plata - Villa Elisa', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (87, 18, '2024-07-27 05:13:25', 'confirmado', 810000.00, '2024-07-27 05:13:25', '2026-06-17 15:13:25', 'Agustina Martínez', 'Calle Avenida 32', '1414', 'La Plata - Villa Elisa', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (88, 41, '2024-02-22 07:13:25', 'confirmado', 350000.00, '2024-02-22 07:13:25', '2026-06-17 15:13:25', 'Camila López', 'Calle 57', '118', 'La Plata - Centro', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (89, 33, '2026-03-05 23:13:25', 'confirmado', 1340000.00, '2026-03-05 23:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle Avenida 32', '883', 'La Plata - Ensenada', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (90, 16, '2025-10-02 10:13:25', 'confirmado', 1090000.00, '2025-10-02 10:13:25', '2026-06-17 15:13:25', 'Leandro Ortiz', 'Calle 38', '2927', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (91, 49, '2025-08-02 06:13:25', 'confirmado', 630000.00, '2025-08-02 06:13:25', '2026-06-17 15:13:25', 'Nicolás Pérez', 'Calle 1', '953', 'La Plata - City Bell', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (92, 18, '2025-05-07 19:13:25', 'confirmado', 1255000.00, '2025-05-07 19:13:25', '2026-06-17 15:13:25', 'Paula Vargas', 'Calle Avenida 7', '685', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (93, 19, '2026-05-01 04:13:25', 'confirmado', 195000.00, '2026-05-01 04:13:25', '2026-06-17 15:13:25', 'Sebastián Herrera', 'Calle 63', '1029', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (94, 83, '2023-07-02 12:13:25', 'confirmado', 1390000.00, '2023-07-02 12:13:25', '2026-06-17 15:13:25', 'Tomás Álvarez', 'Calle 63', '443', 'La Plata - Villa Elvira', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (95, 61, '2025-10-20 22:13:25', 'confirmado', 1310000.00, '2025-10-20 22:13:25', '2026-06-17 15:13:25', 'Natalia Moreno', 'Calle 7', '2646', 'La Plata - Ringuelet', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (96, 61, '2025-11-03 00:13:25', 'confirmado', 210000.00, '2025-11-03 00:13:25', '2026-06-17 15:13:25', 'Nicolás Pérez', 'Calle 2', '1190', 'La Plata - Villa Elisa', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (97, 50, '2024-10-07 10:13:25', 'confirmado', 1310000.00, '2024-10-07 10:13:25', '2026-06-17 15:13:25', 'Natalia Moreno', 'Calle Diagonal 79', '1246', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (98, 71, '2025-02-25 04:13:25', 'confirmado', 1120000.00, '2025-02-25 04:13:25', '2026-06-17 15:13:25', 'Gonzalo Sánchez', 'Calle 10', '1998', 'La Plata - Melchor Romero', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (99, 72, '2026-05-05 21:13:25', 'confirmado', 1190000.00, '2026-05-05 21:13:25', '2026-06-17 15:13:25', 'Nicolás Pérez', 'Calle 81', '990', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (100, 28, '2023-11-07 13:13:25', 'confirmado', 980000.00, '2023-11-07 13:13:25', '2026-06-17 15:13:25', 'Sofía Romero', 'Calle 7', '733', 'La Plata - Berisso', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (101, 60, '2024-03-24 15:13:25', 'confirmado', 1375000.00, '2024-03-24 15:13:25', '2026-06-17 15:13:25', 'Gonzalo Sánchez', 'Calle Diagonal 79', '1117', 'La Plata - Villa Elisa', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (102, 34, '2025-08-10 02:13:25', 'confirmado', 940000.00, '2025-08-10 02:13:25', '2026-06-17 15:13:25', 'Natalia Moreno', 'Calle 51', '320', 'La Plata - Los Hornos', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (103, 86, '2024-10-25 14:13:25', 'confirmado', 700000.00, '2024-10-25 14:13:25', '2026-06-17 15:13:25', 'Gonzalo Sánchez', 'Calle 90', '1112', 'La Plata - Villa Elisa', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (104, 64, '2025-04-30 03:13:25', 'confirmado', 855000.00, '2025-04-30 03:13:25', '2026-06-17 15:13:25', 'Micaela Gutiérrez', 'Calle 10', '2230', 'La Plata - City Bell', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (105, 15, '2024-11-07 06:13:25', 'confirmado', 630000.00, '2024-11-07 06:13:25', '2026-06-17 15:13:25', 'Diego Jiménez', 'Calle 10', '2796', 'La Plata - Centro', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (106, 50, '2024-09-17 12:13:25', 'confirmado', 270000.00, '2024-09-17 12:13:25', '2026-06-17 15:13:25', 'Sofía Romero', 'Calle 9', '2156', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (107, 19, '2024-12-03 08:13:25', 'confirmado', 685000.00, '2024-12-03 08:13:25', '2026-06-17 15:13:25', 'Micaela Gutiérrez', 'Calle 4', '2003', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (108, 38, '2024-12-11 23:13:25', 'confirmado', 390000.00, '2024-12-11 23:13:25', '2026-06-17 15:13:25', 'Tomás Álvarez', 'Calle 7', '720', 'La Plata - Abasto', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (109, 98, '2025-07-04 05:13:25', 'confirmado', 180000.00, '2025-07-04 05:13:25', '2026-06-17 15:13:25', 'Gonzalo Sánchez', 'Calle 12', '2295', 'La Plata - Gonnet', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (110, 97, '2024-09-20 03:13:25', 'confirmado', 220000.00, '2024-09-20 03:13:25', '2026-06-17 15:13:25', 'Martín Fernández', 'Calle Avenida 66', '2283', 'La Plata - Villa Elvira', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (111, 9, '2025-09-07 14:13:25', 'confirmado', 865000.00, '2025-09-07 14:13:25', '2026-06-17 15:13:25', 'Natalia Moreno', 'Calle 13', '842', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (112, 51, '2024-08-13 14:13:25', 'confirmado', 1770000.00, '2024-08-13 14:13:25', '2026-06-17 15:13:25', 'Paula Vargas', 'Calle 6', '1114', 'La Plata - Melchor Romero', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (113, 73, '2024-02-26 16:13:25', 'confirmado', 385000.00, '2024-02-26 16:13:25', '2026-06-17 15:13:25', 'Leandro Ortiz', 'Calle 66', '1211', 'La Plata - Melchor Romero', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (114, 71, '2026-05-02 06:13:25', 'confirmado', 880000.00, '2026-05-02 06:13:25', '2026-06-17 15:13:25', 'Nicolás Pérez', 'Calle 12', '1828', 'La Plata - Ringuelet', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (115, 83, '2024-01-31 09:13:25', 'confirmado', 195000.00, '2024-01-31 09:13:25', '2026-06-17 15:13:25', 'Sofía Romero', 'Calle 122', '394', 'La Plata - Villa Elvira', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (116, 45, '2025-01-23 17:13:25', 'confirmado', 1135000.00, '2025-01-23 17:13:25', '2026-06-17 15:13:25', 'Micaela Gutiérrez', 'Calle 137', '2118', 'La Plata - Villa Elvira', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (117, 26, '2026-01-26 07:13:25', 'confirmado', 1590000.00, '2026-01-26 07:13:25', '2026-06-17 15:13:25', 'Federico García', 'Calle 66', '119', 'La Plata - Villa Elvira', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (118, 24, '2025-10-17 14:13:25', 'confirmado', 380000.00, '2025-10-17 14:13:25', '2026-06-17 15:13:25', 'Martín Fernández', 'Calle 6', '1739', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (119, 56, '2024-03-29 17:13:25', 'confirmado', 250000.00, '2024-03-29 17:13:25', '2026-06-17 15:13:25', 'Camila López', 'Calle 8', '388', 'La Plata - Los Hornos', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (120, 12, '2023-08-01 05:13:25', 'confirmado', 470000.00, '2023-08-01 05:13:25', '2026-06-17 15:13:25', 'Florencia Díaz', 'Calle 90', '2662', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (121, 40, '2025-03-28 05:13:25', 'confirmado', 1330000.00, '2025-03-28 05:13:25', '2026-06-17 15:13:25', 'Paula Vargas', 'Calle Diagonal 79', '2977', 'La Plata - Abasto', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (122, 85, '2023-08-28 05:13:25', 'confirmado', 1270000.00, '2023-08-28 05:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle 6', '2228', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (123, 92, '2025-06-01 15:13:25', 'confirmado', 380000.00, '2025-06-01 15:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle 3', '2012', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (124, 12, '2026-03-16 13:13:25', 'confirmado', 195000.00, '2026-03-16 13:13:25', '2026-06-17 15:13:25', 'Agustina Martínez', 'Calle 6', '1018', 'La Plata - Centro', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (125, 75, '2024-11-15 15:13:25', 'confirmado', 350000.00, '2024-11-15 15:13:25', '2026-06-17 15:13:25', 'Tomás Álvarez', 'Calle 4', '1706', 'La Plata - Ensenada', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (126, 96, '2025-02-17 09:13:25', 'confirmado', 1830000.00, '2025-02-17 09:13:25', '2026-06-17 15:13:25', 'Micaela Gutiérrez', 'Calle Diagonal 74', '1358', 'La Plata - Villa Elvira', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (127, 57, '2025-06-27 17:13:25', 'confirmado', 630000.00, '2025-06-27 17:13:25', '2026-06-17 15:13:25', 'Sebastián Herrera', 'Calle 4', '514', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (128, 92, '2023-09-15 12:13:25', 'confirmado', 1465000.00, '2023-09-15 12:13:25', '2026-06-17 15:13:25', 'Gonzalo Sánchez', 'Calle 2', '201', 'La Plata - City Bell', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (129, 18, '2023-08-01 21:13:25', 'confirmado', 1050000.00, '2023-08-01 21:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle 8', '1931', 'La Plata - Villa Elvira', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (130, 35, '2023-10-05 05:13:25', 'confirmado', 2160000.00, '2023-10-05 05:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle Avenida 44', '1600', 'La Plata - Villa Elisa', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (131, 70, '2025-12-09 23:13:25', 'confirmado', 450000.00, '2025-12-09 23:13:25', '2026-06-17 15:13:25', 'Matías Torres', 'Calle 11', '2268', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (132, 27, '2024-11-20 17:13:25', 'confirmado', 870000.00, '2024-11-20 17:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle Avenida 32', '2156', 'La Plata - Melchor Romero', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (133, 15, '2023-07-28 16:13:25', 'confirmado', 2300000.00, '2023-07-28 16:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle 12', '462', 'La Plata - Villa Elvira', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (134, 74, '2025-12-22 02:13:25', 'confirmado', 1165000.00, '2025-12-22 02:13:25', '2026-06-17 15:13:25', 'Camila López', 'Calle 60', '2844', 'La Plata - Abasto', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (135, 69, '2024-03-17 12:13:25', 'confirmado', 1465000.00, '2024-03-17 12:13:25', '2026-06-17 15:13:25', 'Tomás Álvarez', 'Calle 63', '444', 'La Plata - Abasto', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (136, 89, '2023-12-17 19:13:25', 'confirmado', 1050000.00, '2023-12-17 19:13:25', '2026-06-17 15:13:25', 'Nicolás Pérez', 'Calle 11', '1133', 'La Plata - Gonnet', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (137, 11, '2024-07-17 02:13:25', 'confirmado', 1140000.00, '2024-07-17 02:13:25', '2026-06-17 15:13:25', 'Nicolás Pérez', 'Calle 90', '2672', 'La Plata - City Bell', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (138, 68, '2023-11-29 23:13:25', 'confirmado', 760000.00, '2023-11-29 23:13:25', '2026-06-17 15:13:25', 'Nicolás Pérez', 'Calle 1', '2048', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (139, 13, '2023-09-22 15:13:25', 'confirmado', 1050000.00, '2023-09-22 15:13:25', '2026-06-17 15:13:25', 'Sofía Romero', 'Calle 5', '419', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (140, 46, '2025-09-06 11:13:25', 'confirmado', 1095000.00, '2025-09-06 11:13:25', '2026-06-17 15:13:25', 'Martín Fernández', 'Calle 122', '2396', 'La Plata - City Bell', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (141, 58, '2025-12-05 13:13:25', 'confirmado', 650000.00, '2025-12-05 13:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle 51', '1255', 'La Plata - City Bell', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (142, 41, '2025-04-02 03:13:25', 'confirmado', 1530000.00, '2025-04-02 03:13:25', '2026-06-17 15:13:25', 'Agustina Martínez', 'Calle 14', '140', 'La Plata - Abasto', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (143, 23, '2025-02-12 14:13:25', 'confirmado', 1360000.00, '2025-02-12 14:13:25', '2026-06-17 15:13:25', 'Agustina Martínez', 'Calle Avenida 44', '2015', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (144, 85, '2024-08-01 13:13:25', 'confirmado', 990000.00, '2024-08-01 13:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle 137', '2750', 'La Plata - City Bell', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (145, 41, '2023-12-14 19:13:25', 'confirmado', 540000.00, '2023-12-14 19:13:25', '2026-06-17 15:13:25', 'Sebastián Herrera', 'Calle Avenida 44', '2686', 'La Plata - Centro', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (146, 27, '2025-03-23 23:13:25', 'confirmado', 750000.00, '2025-03-23 23:13:25', '2026-06-17 15:13:25', 'Paula Vargas', 'Calle 60', '1337', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (147, 30, '2025-11-06 11:13:25', 'confirmado', 810000.00, '2025-11-06 11:13:25', '2026-06-17 15:13:25', 'Gonzalo Sánchez', 'Calle 57', '1394', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (148, 17, '2024-03-27 00:13:25', 'confirmado', 350000.00, '2024-03-27 00:13:25', '2026-06-17 15:13:25', 'Camila López', 'Calle 7', '946', 'La Plata - Villa Elvira', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (149, 87, '2023-12-21 13:13:25', 'confirmado', 960000.00, '2023-12-21 13:13:25', '2026-06-17 15:13:25', 'Federico García', 'Calle 72', '1609', 'La Plata - Ringuelet', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (150, 69, '2024-12-22 02:13:25', 'confirmado', 480000.00, '2024-12-22 02:13:25', '2026-06-17 15:13:25', 'Micaela Gutiérrez', 'Calle 76', '1460', 'La Plata - Villa Elisa', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (151, 50, '2023-10-07 10:13:25', 'confirmado', 1440000.00, '2023-10-07 10:13:25', '2026-06-17 15:13:25', 'Sofía Romero', 'Calle 9', '2814', 'La Plata - Centro', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (152, 88, '2024-02-05 14:13:25', 'confirmado', 540000.00, '2024-02-05 14:13:25', '2026-06-17 15:13:25', 'Facundo Ruiz', 'Calle Diagonal 73', '2164', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (153, 93, '2025-03-30 06:13:25', 'confirmado', 360000.00, '2025-03-30 06:13:25', '2026-06-17 15:13:25', 'Natalia Moreno', 'Calle 32', '866', 'La Plata - Abasto', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (154, 43, '2025-12-05 05:13:25', 'confirmado', 980000.00, '2025-12-05 05:13:25', '2026-06-17 15:13:25', 'Diego Jiménez', 'Calle Diagonal 79', '671', 'La Plata - Villa Elisa', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (155, 5, '2023-06-22 20:13:25', 'confirmado', 805000.00, '2023-06-22 20:13:25', '2026-06-17 15:13:25', 'Lucía Acosta', 'Calle 3', '1084', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (156, 98, '2025-02-23 21:13:25', 'confirmado', 1665000.00, '2025-02-23 21:13:25', '2026-06-17 15:13:25', 'Tomás Álvarez', 'Calle 44', '633', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (157, 74, '2023-09-11 23:13:25', 'confirmado', 1330000.00, '2023-09-11 23:13:25', '2026-06-17 15:13:25', 'Micaela Gutiérrez', 'Calle 2', '2551', 'La Plata - Melchor Romero', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (158, 18, '2024-03-03 11:13:25', 'confirmado', 380000.00, '2024-03-03 11:13:25', '2026-06-17 15:13:25', 'Nicolás Pérez', 'Calle 116', '1422', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (159, 100, '2025-10-01 05:13:25', 'confirmado', 525000.00, '2025-10-01 05:13:25', '2026-06-17 15:13:25', 'Federico García', 'Calle 44', '2651', 'La Plata - Gonnet', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (160, 89, '2023-08-24 21:13:25', 'confirmado', 540000.00, '2023-08-24 21:13:25', '2026-06-17 15:13:25', 'Martín Fernández', 'Calle 57', '1614', 'La Plata - Villa Elvira', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (161, 64, '2026-01-26 11:13:25', 'confirmado', 780000.00, '2026-01-26 11:13:25', '2026-06-17 15:13:25', 'Lucía Acosta', 'Calle Diagonal 74', '2002', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (162, 72, '2023-08-18 08:13:25', 'confirmado', 510000.00, '2023-08-18 08:13:25', '2026-06-17 15:13:25', 'Federico García', 'Calle 10', '2316', 'La Plata - Berisso', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (163, 14, '2026-04-09 23:13:25', 'confirmado', 1020000.00, '2026-04-09 23:13:25', '2026-06-17 15:13:25', 'Valentina Rodríguez', 'Calle 44', '1286', 'La Plata - Melchor Romero', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (164, 49, '2026-06-01 18:13:25', 'confirmado', 780000.00, '2026-06-01 18:13:25', '2026-06-17 15:13:25', 'Leandro Ortiz', 'Calle 8', '983', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (165, 56, '2025-04-09 14:13:25', 'confirmado', 1290000.00, '2025-04-09 14:13:25', '2026-06-17 15:13:25', 'Agustina Martínez', 'Calle 76', '2143', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (166, 13, '2024-12-12 20:13:25', 'confirmado', 735000.00, '2024-12-12 20:13:25', '2026-06-17 15:13:25', 'Diego Jiménez', 'Calle 57', '2332', 'La Plata - Centro', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (167, 94, '2023-10-17 20:13:25', 'confirmado', 955000.00, '2023-10-17 20:13:25', '2026-06-17 15:13:25', 'Paula Vargas', 'Calle 9', '177', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (168, 73, '2023-09-15 04:13:25', 'confirmado', 1440000.00, '2023-09-15 04:13:25', '2026-06-17 15:13:25', 'Julieta Castro', 'Calle 9', '618', 'La Plata - Ensenada', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (169, 96, '2026-01-17 11:13:25', 'confirmado', 630000.00, '2026-01-17 11:13:25', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle Diagonal 74', '2745', 'La Plata - Ringuelet', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (170, 72, '2025-02-03 05:13:26', 'confirmado', 1355000.00, '2025-02-03 05:13:26', '2026-06-17 15:13:26', 'Sebastián Herrera', 'Calle 57', '1559', 'La Plata - Ringuelet', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (171, 62, '2024-02-11 23:13:26', 'confirmado', 1170000.00, '2024-02-11 23:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle 32', '521', 'La Plata - Ringuelet', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (172, 39, '2024-02-08 11:13:26', 'confirmado', 1775000.00, '2024-02-08 11:13:26', '2026-06-17 15:13:26', 'Micaela Gutiérrez', 'Calle Diagonal 80', '153', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (173, 82, '2026-05-28 23:13:26', 'confirmado', 2160000.00, '2026-05-28 23:13:26', '2026-06-17 15:13:26', 'Valentina Rodríguez', 'Calle 2', '1955', 'La Plata - Berisso', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (174, 87, '2026-05-11 19:13:26', 'confirmado', 820000.00, '2026-05-11 19:13:26', '2026-06-17 15:13:26', 'Gonzalo Sánchez', 'Calle 13', '455', 'La Plata - Gonnet', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (175, 61, '2023-12-04 14:13:26', 'confirmado', 1550000.00, '2023-12-04 14:13:26', '2026-06-17 15:13:26', 'Florencia Díaz', 'Calle Avenida 7', '2492', 'La Plata - Melchor Romero', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (176, 83, '2024-05-04 09:13:26', 'confirmado', 580000.00, '2024-05-04 09:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle 60', '1602', 'La Plata - Villa Elisa', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (177, 35, '2025-03-31 14:13:26', 'confirmado', 1330000.00, '2025-03-31 14:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle 72', '1437', 'La Plata - Gonnet', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (178, 30, '2024-03-25 07:13:26', 'confirmado', 2450000.00, '2024-03-25 07:13:26', '2026-06-17 15:13:26', 'Florencia Díaz', 'Calle Diagonal 73', '2480', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (179, 100, '2024-07-29 15:13:26', 'confirmado', 390000.00, '2024-07-29 15:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle 60', '1908', 'La Plata - Ringuelet', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (180, 16, '2024-01-08 15:13:26', 'confirmado', 1310000.00, '2024-01-08 15:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 38', '1373', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (181, 53, '2026-03-04 18:13:26', 'confirmado', 480000.00, '2026-03-04 18:13:26', '2026-06-17 15:13:26', 'Facundo Ruiz', 'Calle 14', '2947', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (182, 90, '2024-07-10 09:13:26', 'confirmado', 1980000.00, '2024-07-10 09:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle 4', '2632', 'La Plata - Centro', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (183, 20, '2023-10-24 03:13:26', 'confirmado', 1940000.00, '2023-10-24 03:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle Diagonal 73', '2345', 'La Plata - Melchor Romero', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (184, 6, '2024-06-30 23:13:26', 'confirmado', 910000.00, '2024-06-30 23:13:26', '2026-06-17 15:13:26', 'Florencia Díaz', 'Calle 57', '760', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (185, 72, '2024-10-19 05:13:26', 'confirmado', 210000.00, '2024-10-19 05:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 2', '2558', 'La Plata - City Bell', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (186, 34, '2024-10-31 07:13:26', 'confirmado', 450000.00, '2024-10-31 07:13:26', '2026-06-17 15:13:26', 'Valentina Rodríguez', 'Calle 12', '164', 'La Plata - Abasto', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (187, 2, '2025-08-09 07:13:26', 'confirmado', 1610000.00, '2025-08-09 07:13:26', '2026-06-17 15:13:26', 'Nicolás Pérez', 'Calle 57', '663', 'La Plata - Ringuelet', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (188, 61, '2026-03-08 05:13:26', 'confirmado', 1920000.00, '2026-03-08 05:13:26', '2026-06-17 15:13:26', 'Gonzalo Sánchez', 'Calle 8', '918', 'La Plata - City Bell', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (189, 57, '2026-02-12 10:13:26', 'confirmado', 1940000.00, '2026-02-12 10:13:26', '2026-06-17 15:13:26', 'Sebastián Herrera', 'Calle 44', '2143', 'La Plata - Centro', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (190, 3, '2023-11-15 22:13:26', 'confirmado', 1890000.00, '2023-11-15 22:13:26', '2026-06-17 15:13:26', 'Diego Jiménez', 'Calle Avenida 44', '2265', 'La Plata - Los Hornos', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (191, 52, '2024-09-07 16:13:26', 'confirmado', 1140000.00, '2024-09-07 16:13:26', '2026-06-17 15:13:26', 'Paula Vargas', 'Calle 38', '435', 'La Plata - Melchor Romero', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (192, 43, '2026-06-16 15:13:26', 'confirmado', 450000.00, '2026-06-16 15:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle 51', '2295', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (193, 45, '2024-06-09 02:13:26', 'confirmado', 770000.00, '2024-06-09 02:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle 5', '2624', 'La Plata - Melchor Romero', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (194, 35, '2024-11-27 19:13:26', 'confirmado', 1380000.00, '2024-11-27 19:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 76', '2102', 'La Plata - Villa Elvira', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (195, 10, '2026-03-22 19:13:26', 'confirmado', 360000.00, '2026-03-22 19:13:26', '2026-06-17 15:13:26', 'Leandro Ortiz', 'Calle 116', '295', 'La Plata - Melchor Romero', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (196, 96, '2024-06-14 19:13:26', 'confirmado', 950000.00, '2024-06-14 19:13:26', '2026-06-17 15:13:26', 'Tomás Álvarez', 'Calle 51', '794', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (197, 17, '2024-03-20 01:13:26', 'confirmado', 500000.00, '2024-03-20 01:13:26', '2026-06-17 15:13:26', 'Tomás Álvarez', 'Calle 13', '828', 'La Plata - Ensenada', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (198, 55, '2023-08-10 01:13:26', 'confirmado', 1145000.00, '2023-08-10 01:13:26', '2026-06-17 15:13:26', 'Sebastián Herrera', 'Calle 51', '2894', 'La Plata - City Bell', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (199, 65, '2026-02-18 10:13:26', 'confirmado', 840000.00, '2026-02-18 10:13:26', '2026-06-17 15:13:26', 'Leandro Ortiz', 'Calle 66', '2473', 'La Plata - Villa Elvira', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (200, 2, '2023-11-24 20:13:26', 'confirmado', 660000.00, '2023-11-24 20:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle 63', '1717', 'La Plata - Berisso', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (201, 18, '2026-01-29 03:13:26', 'confirmado', 360000.00, '2026-01-29 03:13:26', '2026-06-17 15:13:26', 'Paula Vargas', 'Calle 5', '2860', 'La Plata - Ringuelet', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (202, 81, '2023-08-01 12:13:26', 'confirmado', 1550000.00, '2023-08-01 12:13:26', '2026-06-17 15:13:26', 'Valentina Rodríguez', 'Calle 63', '2235', 'La Plata - Tolosa', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (203, 68, '2024-09-30 22:13:26', 'confirmado', 1335000.00, '2024-09-30 22:13:26', '2026-06-17 15:13:26', 'Micaela Gutiérrez', 'Calle 6', '1750', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (204, 61, '2025-05-03 18:13:26', 'confirmado', 800000.00, '2025-05-03 18:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle 9', '2510', 'La Plata - Ringuelet', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (205, 19, '2024-12-09 13:13:26', 'confirmado', 500000.00, '2024-12-09 13:13:26', '2026-06-17 15:13:26', 'Diego Jiménez', 'Calle Diagonal 73', '2578', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (206, 7, '2026-04-03 23:13:26', 'confirmado', 1160000.00, '2026-04-03 23:13:26', '2026-06-17 15:13:26', 'Tomás Álvarez', 'Calle Avenida 32', '378', 'La Plata - Abasto', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (207, 3, '2025-03-08 19:13:26', 'confirmado', 1760000.00, '2025-03-08 19:13:26', '2026-06-17 15:13:26', 'Gonzalo Sánchez', 'Calle 38', '2642', 'La Plata - Abasto', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (208, 100, '2024-08-20 02:13:26', 'confirmado', 1785000.00, '2024-08-20 02:13:26', '2026-06-17 15:13:26', 'Nicolás Pérez', 'Calle Diagonal 80', '1001', 'La Plata - Centro', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (209, 82, '2023-12-09 03:13:26', 'confirmado', 550000.00, '2023-12-09 03:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 13', '682', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (210, 57, '2025-09-23 04:13:26', 'confirmado', 250000.00, '2025-09-23 04:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 90', '2620', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (211, 79, '2025-05-28 19:13:26', 'confirmado', 1300000.00, '2025-05-28 19:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle Avenida 66', '1670', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (212, 76, '2024-06-16 07:13:26', 'confirmado', 175000.00, '2024-06-16 07:13:26', '2026-06-17 15:13:26', 'Micaela Gutiérrez', 'Calle 90', '458', 'La Plata - Berisso', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (213, 47, '2024-08-18 02:13:26', 'confirmado', 1800000.00, '2024-08-18 02:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle Avenida 7', '2362', 'La Plata - Los Hornos', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (214, 18, '2025-01-06 06:13:26', 'confirmado', 450000.00, '2025-01-06 06:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 90', '739', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (215, 4, '2024-11-02 01:13:26', 'confirmado', 1170000.00, '2024-11-02 01:13:26', '2026-06-17 15:13:26', 'Florencia Díaz', 'Calle 44', '292', 'La Plata - Berisso', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (216, 52, '2025-11-07 11:13:26', 'confirmado', 500000.00, '2025-11-07 11:13:26', '2026-06-17 15:13:26', 'Micaela Gutiérrez', 'Calle 84', '1707', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (217, 68, '2024-04-07 06:13:26', 'confirmado', 585000.00, '2024-04-07 06:13:26', '2026-06-17 15:13:26', 'Nicolás Pérez', 'Calle 12', '2000', 'La Plata - Villa Elisa', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (218, 101, '2025-05-26 09:13:26', 'confirmado', 1720000.00, '2025-05-26 09:13:26', '2026-06-17 15:13:26', 'Valentina Rodríguez', 'Calle 14', '2029', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (219, 28, '2025-01-02 02:13:26', 'confirmado', 1060000.00, '2025-01-02 02:13:26', '2026-06-17 15:13:26', 'Facundo Ruiz', 'Calle 122', '864', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (220, 40, '2025-11-10 00:13:26', 'confirmado', 1390000.00, '2025-11-10 00:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle Avenida 66', '1759', 'La Plata - Abasto', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (221, 101, '2024-01-24 12:13:26', 'confirmado', 2010000.00, '2024-01-24 12:13:26', '2026-06-17 15:13:26', 'Sebastián Herrera', 'Calle 66', '1010', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (222, 24, '2024-02-14 15:13:26', 'confirmado', 1600000.00, '2024-02-14 15:13:26', '2026-06-17 15:13:26', 'Gonzalo Sánchez', 'Calle 1', '1093', 'La Plata - Ringuelet', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (223, 88, '2024-10-27 07:13:26', 'confirmado', 1755000.00, '2024-10-27 07:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 10', '1506', 'La Plata - Ensenada', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (224, 71, '2023-06-22 17:13:26', 'confirmado', 1370000.00, '2023-06-22 17:13:26', '2026-06-17 15:13:26', 'Facundo Ruiz', 'Calle 4', '729', 'La Plata - Berisso', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (225, 52, '2025-05-10 00:13:26', 'confirmado', 1140000.00, '2025-05-10 00:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle 8', '2675', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (226, 15, '2026-01-11 18:13:26', 'confirmado', 1615000.00, '2026-01-11 18:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 12', '1291', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (227, 69, '2024-02-15 22:13:26', 'confirmado', 2430000.00, '2024-02-15 22:13:26', '2026-06-17 15:13:26', 'Leandro Ortiz', 'Calle 90', '338', 'La Plata - Gonnet', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (228, 69, '2024-09-27 05:13:26', 'confirmado', 770000.00, '2024-09-27 05:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 60', '2900', 'La Plata - City Bell', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (229, 75, '2025-08-18 15:13:26', 'confirmado', 570000.00, '2025-08-18 15:13:26', '2026-06-17 15:13:26', 'Florencia Díaz', 'Calle 11', '1913', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (230, 59, '2026-03-12 15:13:26', 'confirmado', 960000.00, '2026-03-12 15:13:26', '2026-06-17 15:13:26', 'Matías Torres', 'Calle 5', '1330', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (231, 67, '2026-04-08 17:13:26', 'confirmado', 1625000.00, '2026-04-08 17:13:26', '2026-06-17 15:13:26', 'Diego Jiménez', 'Calle 7', '2990', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (232, 97, '2024-07-02 04:13:26', 'confirmado', 760000.00, '2024-07-02 04:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle Avenida 44', '146', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (233, 4, '2024-04-05 14:13:26', 'confirmado', 300000.00, '2024-04-05 14:13:26', '2026-06-17 15:13:26', 'Tomás Álvarez', 'Calle 76', '1158', 'La Plata - Gonnet', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (234, 33, '2026-02-22 23:13:26', 'confirmado', 360000.00, '2026-02-22 23:13:26', '2026-06-17 15:13:26', 'Lucía Acosta', 'Calle 13', '2623', 'La Plata - Villa Elisa', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (235, 23, '2024-06-30 12:13:26', 'confirmado', 560000.00, '2024-06-30 12:13:26', '2026-06-17 15:13:26', 'Diego Jiménez', 'Calle Diagonal 79', '2377', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (236, 41, '2025-10-24 05:13:26', 'confirmado', 1450000.00, '2025-10-24 05:13:26', '2026-06-17 15:13:26', 'Matías Torres', 'Calle 8', '2994', 'La Plata - Abasto', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (237, 45, '2025-04-27 02:13:26', 'confirmado', 1050000.00, '2025-04-27 02:13:26', '2026-06-17 15:13:26', 'Valentina Rodríguez', 'Calle 2', '2853', 'La Plata - Tolosa', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (238, 74, '2026-06-08 05:13:26', 'confirmado', 650000.00, '2026-06-08 05:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 90', '499', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (239, 49, '2025-07-23 00:13:26', 'confirmado', 835000.00, '2025-07-23 00:13:26', '2026-06-17 15:13:26', 'Lucía Acosta', 'Calle 116', '2309', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (240, 18, '2025-05-27 20:13:26', 'confirmado', 540000.00, '2025-05-27 20:13:26', '2026-06-17 15:13:26', 'Nicolás Pérez', 'Calle Diagonal 80', '2950', 'La Plata - Abasto', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (241, 48, '2025-04-26 20:13:26', 'confirmado', 1520000.00, '2025-04-26 20:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 14', '1666', 'La Plata - City Bell', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (242, 3, '2025-10-15 12:13:26', 'confirmado', 930000.00, '2025-10-15 12:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 72', '1446', 'La Plata - Tolosa', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (243, 31, '2025-11-23 10:13:26', 'confirmado', 540000.00, '2025-11-23 10:13:26', '2026-06-17 15:13:26', 'Gonzalo Sánchez', 'Calle Diagonal 80', '482', 'La Plata - Abasto', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (244, 77, '2024-10-19 00:13:26', 'confirmado', 1590000.00, '2024-10-19 00:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle 10', '2744', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (245, 69, '2024-05-30 20:13:26', 'confirmado', 500000.00, '2024-05-30 20:13:26', '2026-06-17 15:13:26', 'Lucía Acosta', 'Calle 122', '2670', 'La Plata - Villa Elisa', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (246, 53, '2024-08-27 22:13:26', 'confirmado', 660000.00, '2024-08-27 22:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 11', '2591', 'La Plata - Villa Elvira', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (247, 12, '2024-03-21 08:13:26', 'confirmado', 1155000.00, '2024-03-21 08:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 7', '1248', 'La Plata - Ringuelet', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (248, 14, '2024-05-22 10:13:26', 'confirmado', 1200000.00, '2024-05-22 10:13:26', '2026-06-17 15:13:26', 'Sebastián Herrera', 'Calle Avenida 13', '1623', 'La Plata - City Bell', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (249, 39, '2026-01-26 04:13:26', 'confirmado', 290000.00, '2026-01-26 04:13:26', '2026-06-17 15:13:26', 'Matías Torres', 'Calle 2', '2900', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (250, 8, '2025-06-07 04:13:26', 'confirmado', 1310000.00, '2025-06-07 04:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 4', '2595', 'La Plata - Villa Elvira', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (251, 57, '2024-03-11 13:13:26', 'confirmado', 1530000.00, '2024-03-11 13:13:26', '2026-06-17 15:13:26', 'Paula Vargas', 'Calle Avenida 44', '1127', 'La Plata - Villa Elisa', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (252, 82, '2025-03-05 10:13:26', 'confirmado', 1080000.00, '2025-03-05 10:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle Avenida 66', '1040', 'La Plata - Berisso', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (253, 8, '2024-05-23 20:13:26', 'confirmado', 1710000.00, '2024-05-23 20:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle 116', '1480', 'La Plata - Ensenada', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (254, 5, '2024-09-19 02:13:26', 'confirmado', 390000.00, '2024-09-19 02:13:26', '2026-06-17 15:13:26', 'Paula Vargas', 'Calle 6', '1079', 'La Plata - Villa Elvira', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (255, 70, '2025-08-22 06:13:26', 'confirmado', 350000.00, '2025-08-22 06:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 11', '1151', 'La Plata - Tolosa', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (256, 12, '2023-07-11 01:13:26', 'confirmado', 980000.00, '2023-07-11 01:13:26', '2026-06-17 15:13:26', 'Micaela Gutiérrez', 'Calle 1', '412', 'La Plata - Centro', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (257, 63, '2024-11-22 11:13:26', 'confirmado', 930000.00, '2024-11-22 11:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle 116', '1644', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (258, 60, '2025-08-28 02:13:26', 'confirmado', 930000.00, '2025-08-28 02:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle 10', '1252', 'La Plata - Los Hornos', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (259, 60, '2026-01-30 16:13:26', 'confirmado', 615000.00, '2026-01-30 16:13:26', '2026-06-17 15:13:26', 'Matías Torres', 'Calle 2', '2212', 'La Plata - Ensenada', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (260, 53, '2025-08-07 03:13:26', 'confirmado', 540000.00, '2025-08-07 03:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle 38', '2534', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (261, 27, '2025-08-10 19:13:26', 'confirmado', 1050000.00, '2025-08-10 19:13:26', '2026-06-17 15:13:26', 'Florencia Díaz', 'Calle Diagonal 74', '177', 'La Plata - Melchor Romero', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (262, 54, '2025-10-21 03:13:26', 'confirmado', 1290000.00, '2025-10-21 03:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 57', '2386', 'La Plata - Ensenada', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (263, 7, '2025-10-06 10:13:26', 'confirmado', 480000.00, '2025-10-06 10:13:26', '2026-06-17 15:13:26', 'Matías Torres', 'Calle 63', '1237', 'La Plata - Villa Elisa', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (264, 93, '2024-08-06 13:13:26', 'confirmado', 1110000.00, '2024-08-06 13:13:26', '2026-06-17 15:13:26', 'Paula Vargas', 'Calle 32', '142', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (265, 27, '2025-10-03 11:13:26', 'confirmado', 525000.00, '2025-10-03 11:13:26', '2026-06-17 15:13:26', 'Gonzalo Sánchez', 'Calle 11', '325', 'La Plata - Ringuelet', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (266, 61, '2026-02-20 06:13:26', 'confirmado', 1825000.00, '2026-02-20 06:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle 11', '2505', 'La Plata - Berisso', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (267, 81, '2025-06-11 18:13:26', 'confirmado', 890000.00, '2025-06-11 18:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle 9', '1561', 'La Plata - Villa Elvira', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (268, 13, '2024-07-21 20:13:26', 'confirmado', 1200000.00, '2024-07-21 20:13:26', '2026-06-17 15:13:26', 'Gonzalo Sánchez', 'Calle 3', '2251', 'La Plata - Tolosa', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (269, 60, '2026-03-02 12:13:26', 'confirmado', 1525000.00, '2026-03-02 12:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle Avenida 7', '2684', 'La Plata - Abasto', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (270, 40, '2024-11-07 05:13:26', 'confirmado', 390000.00, '2024-11-07 05:13:26', '2026-06-17 15:13:26', 'Tomás Álvarez', 'Calle Diagonal 74', '1692', 'La Plata - Centro', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (271, 72, '2024-02-01 06:13:26', 'confirmado', 320000.00, '2024-02-01 06:13:26', '2026-06-17 15:13:26', 'Matías Torres', 'Calle 60', '1203', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (272, 63, '2025-06-07 07:13:26', 'confirmado', 1140000.00, '2025-06-07 07:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle Diagonal 80', '2111', 'La Plata - Abasto', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (273, 74, '2025-06-28 05:13:26', 'confirmado', 1500000.00, '2025-06-28 05:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle 1', '2004', 'La Plata - Villa Elisa', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (274, 11, '2025-10-12 21:13:26', 'confirmado', 1140000.00, '2025-10-12 21:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle 8', '2334', 'La Plata - Centro', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (275, 60, '2024-04-29 23:13:26', 'confirmado', 560000.00, '2024-04-29 23:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle 3', '716', 'La Plata - Ringuelet', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (276, 12, '2024-05-21 01:13:26', 'confirmado', 160000.00, '2024-05-21 01:13:26', '2026-06-17 15:13:26', 'Lucía Acosta', 'Calle 5', '2167', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (277, 48, '2024-11-18 19:13:26', 'confirmado', 765000.00, '2024-11-18 19:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle Avenida 7', '2021', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (278, 30, '2024-06-08 00:13:26', 'confirmado', 390000.00, '2024-06-08 00:13:26', '2026-06-17 15:13:26', 'Leandro Ortiz', 'Calle 2', '2873', 'La Plata - Villa Elvira', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (279, 87, '2023-07-22 05:13:26', 'confirmado', 360000.00, '2023-07-22 05:13:26', '2026-06-17 15:13:26', 'Gonzalo Sánchez', 'Calle 12', '475', 'La Plata - Villa Elisa', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (280, 101, '2024-06-05 13:13:26', 'confirmado', 540000.00, '2024-06-05 13:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle 76', '510', 'La Plata - Los Hornos', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (281, 98, '2023-09-12 11:13:26', 'confirmado', 300000.00, '2023-09-12 11:13:26', '2026-06-17 15:13:26', 'Matías Torres', 'Calle 63', '756', 'La Plata - Tolosa', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (282, 86, '2024-06-17 10:13:26', 'confirmado', 550000.00, '2024-06-17 10:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle Avenida 32', '1680', 'La Plata - Villa Elisa', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (283, 97, '2025-08-28 04:13:26', 'confirmado', 1050000.00, '2025-08-28 04:13:26', '2026-06-17 15:13:26', 'Gonzalo Sánchez', 'Calle Avenida 32', '850', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (284, 81, '2023-06-23 15:13:26', 'confirmado', 180000.00, '2023-06-23 15:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 14', '1528', 'La Plata - Abasto', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (285, 39, '2025-09-17 02:13:26', 'confirmado', 525000.00, '2025-09-17 02:13:26', '2026-06-17 15:13:26', 'Facundo Ruiz', 'Calle Diagonal 73', '1113', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (286, 83, '2023-10-08 19:13:26', 'confirmado', 1110000.00, '2023-10-08 19:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle Avenida 44', '2015', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (287, 40, '2024-04-25 20:13:26', 'confirmado', 540000.00, '2024-04-25 20:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle 1', '2285', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (288, 96, '2023-11-27 13:13:26', 'confirmado', 1250000.00, '2023-11-27 13:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle Avenida 13', '2369', 'La Plata - Melchor Romero', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (289, 7, '2026-02-25 09:13:26', 'confirmado', 1575000.00, '2026-02-25 09:13:26', '2026-06-17 15:13:26', 'Lucía Acosta', 'Calle 12', '1644', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (290, 52, '2024-08-12 17:13:26', 'confirmado', 1495000.00, '2024-08-12 17:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle 11', '1238', 'La Plata - Villa Elisa', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (291, 28, '2025-02-16 04:13:26', 'confirmado', 970000.00, '2025-02-16 04:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 6', '444', 'La Plata - Villa Elvira', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (292, 38, '2025-03-05 16:13:26', 'confirmado', 1740000.00, '2025-03-05 16:13:26', '2026-06-17 15:13:26', 'Valentina Rodríguez', 'Calle 51', '2834', 'La Plata - Berisso', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (293, 79, '2024-08-12 00:13:26', 'confirmado', 1430000.00, '2024-08-12 00:13:26', '2026-06-17 15:13:26', 'Nicolás Pérez', 'Calle 5', '2072', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (294, 95, '2023-06-30 21:13:26', 'confirmado', 885000.00, '2023-06-30 21:13:26', '2026-06-17 15:13:26', 'Lucía Acosta', 'Calle 11', '1956', 'La Plata - Villa Elisa', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (295, 61, '2024-05-20 02:13:26', 'confirmado', 540000.00, '2024-05-20 02:13:26', '2026-06-17 15:13:26', 'Sebastián Herrera', 'Calle Diagonal 80', '692', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (296, 39, '2026-03-06 14:13:26', 'confirmado', 1180000.00, '2026-03-06 14:13:26', '2026-06-17 15:13:26', 'Facundo Ruiz', 'Calle 63', '2582', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (297, 82, '2025-05-12 05:13:26', 'confirmado', 1635000.00, '2025-05-12 05:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle 76', '2274', 'La Plata - Melchor Romero', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (298, 31, '2025-02-07 20:13:26', 'confirmado', 1470000.00, '2025-02-07 20:13:26', '2026-06-17 15:13:26', 'Facundo Ruiz', 'Calle 6', '2772', 'La Plata - Villa Elisa', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (299, 98, '2026-03-16 07:13:26', 'confirmado', 175000.00, '2026-03-16 07:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle Avenida 32', '2733', 'La Plata - Berisso', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (300, 34, '2026-05-31 15:13:26', 'confirmado', 480000.00, '2026-05-31 15:13:26', '2026-06-17 15:13:26', 'Martín Fernández', 'Calle 1', '210', 'La Plata - Tolosa', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (301, 11, '2024-01-01 08:13:26', 'confirmado', 1165000.00, '2024-01-01 08:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 84', '1918', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (302, 13, '2025-09-02 23:13:26', 'confirmado', 620000.00, '2025-09-02 23:13:26', '2026-06-17 15:13:26', 'Facundo Ruiz', 'Calle 60', '759', 'La Plata - Ringuelet', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (303, 20, '2024-07-08 02:13:26', 'confirmado', 1065000.00, '2024-07-08 02:13:26', '2026-06-17 15:13:26', 'Facundo Ruiz', 'Calle Avenida 32', '1781', 'La Plata - Ensenada', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (304, 68, '2025-07-10 11:13:26', 'confirmado', 480000.00, '2025-07-10 11:13:26', '2026-06-17 15:13:26', 'Micaela Gutiérrez', 'Calle 116', '1475', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (305, 72, '2023-08-13 03:13:26', 'confirmado', 975000.00, '2023-08-13 03:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle 72', '1554', 'La Plata - Tolosa', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (306, 70, '2026-02-21 10:13:26', 'confirmado', 825000.00, '2026-02-21 10:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle 122', '1577', 'La Plata - Los Hornos', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (307, 54, '2024-03-02 23:13:26', 'confirmado', 980000.00, '2024-03-02 23:13:26', '2026-06-17 15:13:26', 'Paula Vargas', 'Calle 11', '1700', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (308, 46, '2026-03-11 13:13:26', 'confirmado', 1260000.00, '2026-03-11 13:13:26', '2026-06-17 15:13:26', 'Paula Vargas', 'Calle 116', '876', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (309, 66, '2024-12-27 23:13:26', 'confirmado', 450000.00, '2024-12-27 23:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle Diagonal 80', '2293', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (310, 93, '2023-06-27 13:13:26', 'confirmado', 180000.00, '2023-06-27 13:13:26', '2026-06-17 15:13:26', 'Tomás Álvarez', 'Calle Diagonal 74', '461', 'La Plata - Ringuelet', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (311, 6, '2025-12-26 19:13:26', 'confirmado', 970000.00, '2025-12-26 19:13:26', '2026-06-17 15:13:26', 'Nicolás Pérez', 'Calle 122', '1635', 'La Plata - Abasto', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (312, 24, '2023-12-14 03:13:26', 'confirmado', 420000.00, '2023-12-14 03:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle 7', '2445', 'La Plata - Berisso', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (313, 94, '2024-06-26 04:13:26', 'confirmado', 1470000.00, '2024-06-26 04:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 60', '1787', 'La Plata - Tolosa', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (314, 79, '2026-04-21 11:13:26', 'confirmado', 190000.00, '2026-04-21 11:13:26', '2026-06-17 15:13:26', 'Nicolás Pérez', 'Calle 8', '1424', 'La Plata - Ensenada', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (315, 72, '2025-04-24 21:13:26', 'confirmado', 640000.00, '2025-04-24 21:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle 12', '1814', 'La Plata - Melchor Romero', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (316, 95, '2026-02-19 02:13:26', 'confirmado', 1225000.00, '2026-02-19 02:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle Diagonal 73', '2070', 'La Plata - Abasto', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (317, 38, '2025-07-27 10:13:26', 'confirmado', 695000.00, '2025-07-27 10:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle Diagonal 80', '1876', 'La Plata - Melchor Romero', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (318, 93, '2026-05-18 20:13:26', 'confirmado', 195000.00, '2026-05-18 20:13:26', '2026-06-17 15:13:26', 'Facundo Ruiz', 'Calle 2', '686', 'La Plata - Gonnet', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (319, 61, '2024-08-13 14:13:26', 'confirmado', 840000.00, '2024-08-13 14:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 8', '2433', 'La Plata - Melchor Romero', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (320, 24, '2023-12-16 09:13:26', 'confirmado', 1880000.00, '2023-12-16 09:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle 32', '1008', 'La Plata - Los Hornos', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (321, 21, '2023-11-12 15:13:26', 'confirmado', 175000.00, '2023-11-12 15:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 60', '214', 'La Plata - Centro', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (322, 85, '2026-06-15 02:13:26', 'confirmado', 180000.00, '2026-06-15 02:13:26', '2026-06-17 15:13:26', 'Florencia Díaz', 'Calle 51', '122', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (323, 55, '2024-09-25 00:13:26', 'confirmado', 1230000.00, '2024-09-25 00:13:26', '2026-06-17 15:13:26', 'Sebastián Herrera', 'Calle Diagonal 74', '1877', 'La Plata - Centro', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (324, 48, '2025-01-06 19:13:26', 'confirmado', 650000.00, '2025-01-06 19:13:26', '2026-06-17 15:13:26', 'Florencia Díaz', 'Calle 10', '1837', 'La Plata - Centro', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (325, 21, '2024-07-18 09:13:26', 'confirmado', 1050000.00, '2024-07-18 09:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 72', '486', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (326, 56, '2024-09-07 11:13:26', 'confirmado', 1250000.00, '2024-09-07 11:13:26', '2026-06-17 15:13:26', 'Sebastián Herrera', 'Calle Diagonal 73', '1979', 'La Plata - Villa Elvira', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (327, 35, '2026-02-15 10:13:26', 'confirmado', 1120000.00, '2026-02-15 10:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle 66', '1844', 'La Plata - Berisso', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (328, 22, '2023-09-28 12:13:26', 'confirmado', 680000.00, '2023-09-28 12:13:26', '2026-06-17 15:13:26', 'Micaela Gutiérrez', 'Calle 63', '1473', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (329, 8, '2023-08-10 22:13:26', 'confirmado', 1300000.00, '2023-08-10 22:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 11', '1318', 'La Plata - Ringuelet', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (330, 87, '2024-10-10 04:13:26', 'confirmado', 1520000.00, '2024-10-10 04:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle Avenida 66', '964', 'La Plata - Los Hornos', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (331, 45, '2024-09-30 10:13:26', 'confirmado', 1010000.00, '2024-09-30 10:13:26', '2026-06-17 15:13:26', 'Nicolás Pérez', 'Calle Avenida 7', '2198', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (332, 74, '2025-10-18 21:13:26', 'confirmado', 1140000.00, '2025-10-18 21:13:26', '2026-06-17 15:13:26', 'Florencia Díaz', 'Calle Avenida 66', '2928', 'La Plata - Berisso', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (333, 42, '2025-07-22 20:13:26', 'confirmado', 930000.00, '2025-07-22 20:13:26', '2026-06-17 15:13:26', 'Martín Fernández', 'Calle Diagonal 74', '394', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (334, 21, '2025-10-26 04:13:26', 'confirmado', 560000.00, '2025-10-26 04:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle Diagonal 73', '1884', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (335, 5, '2025-10-05 20:13:26', 'confirmado', 1300000.00, '2025-10-05 20:13:26', '2026-06-17 15:13:26', 'Diego Jiménez', 'Calle 84', '2685', 'La Plata - Melchor Romero', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (336, 60, '2024-10-19 15:13:26', 'confirmado', 875000.00, '2024-10-19 15:13:26', '2026-06-17 15:13:26', 'Leandro Ortiz', 'Calle 51', '1664', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (337, 36, '2023-06-17 17:13:26', 'confirmado', 1970000.00, '2023-06-17 17:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle 1', '2999', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (338, 47, '2025-05-19 04:13:26', 'confirmado', 870000.00, '2025-05-19 04:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 76', '1210', 'La Plata - Berisso', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (339, 101, '2024-08-30 11:13:26', 'confirmado', 1200000.00, '2024-08-30 11:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle 3', '1605', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (340, 43, '2026-04-05 09:13:26', 'confirmado', 825000.00, '2026-04-05 09:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 14', '1456', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (341, 8, '2023-06-23 03:13:26', 'confirmado', 950000.00, '2023-06-23 03:13:26', '2026-06-17 15:13:26', 'Leandro Ortiz', 'Calle 84', '1923', 'La Plata - Berisso', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (342, 85, '2025-06-03 22:13:26', 'confirmado', 770000.00, '2025-06-03 22:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 10', '1242', 'La Plata - Centro', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (343, 47, '2025-02-28 22:13:26', 'confirmado', 1140000.00, '2025-02-28 22:13:26', '2026-06-17 15:13:26', 'Sebastián Herrera', 'Calle Avenida 7', '2632', 'La Plata - Ensenada', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (344, 83, '2025-08-22 05:13:26', 'confirmado', 350000.00, '2025-08-22 05:13:26', '2026-06-17 15:13:26', 'Tomás Álvarez', 'Calle Diagonal 73', '2848', 'La Plata - Villa Elisa', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (345, 46, '2025-12-17 04:13:26', 'confirmado', 300000.00, '2025-12-17 04:13:26', '2026-06-17 15:13:26', 'Tomás Álvarez', 'Calle 5', '245', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (346, 21, '2024-10-27 15:13:26', 'confirmado', 1050000.00, '2024-10-27 15:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle Diagonal 79', '2060', 'La Plata - Villa Elisa', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (347, 6, '2025-10-17 12:13:26', 'confirmado', 160000.00, '2025-10-17 12:13:26', '2026-06-17 15:13:26', 'Paula Vargas', 'Calle 81', '1612', 'La Plata - Centro', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (348, 78, '2025-02-04 19:13:26', 'confirmado', 750000.00, '2025-02-04 19:13:26', '2026-06-17 15:13:26', 'Nicolás Pérez', 'Calle 60', '2936', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (349, 80, '2025-07-07 09:13:26', 'confirmado', 1770000.00, '2025-07-07 09:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle 76', '117', 'La Plata - Abasto', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (350, 48, '2023-06-21 22:13:26', 'confirmado', 670000.00, '2023-06-21 22:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle 12', '129', 'La Plata - Los Hornos', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (351, 101, '2024-04-30 08:13:26', 'confirmado', 645000.00, '2024-04-30 08:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 13', '1923', 'La Plata - Abasto', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (352, 21, '2026-02-04 23:13:26', 'confirmado', 1690000.00, '2026-02-04 23:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle Avenida 66', '1133', 'La Plata - Tolosa', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (353, 81, '2023-07-20 07:13:26', 'confirmado', 915000.00, '2023-07-20 07:13:26', '2026-06-17 15:13:26', 'Leandro Ortiz', 'Calle 60', '537', 'La Plata - Berisso', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (354, 96, '2024-02-05 06:13:26', 'confirmado', 860000.00, '2024-02-05 06:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle 10', '1574', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (355, 38, '2023-11-09 21:13:26', 'confirmado', 615000.00, '2023-11-09 21:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle 2', '1428', 'La Plata - City Bell', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (356, 100, '2025-03-31 00:13:26', 'confirmado', 1935000.00, '2025-03-31 00:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 44', '2554', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (357, 85, '2025-11-08 04:13:26', 'confirmado', 865000.00, '2025-11-08 04:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle 4', '424', 'La Plata - City Bell', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (358, 11, '2024-07-16 09:13:26', 'confirmado', 1300000.00, '2024-07-16 09:13:26', '2026-06-17 15:13:26', 'Diego Jiménez', 'Calle 57', '939', 'La Plata - Ringuelet', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (359, 72, '2026-01-16 17:13:26', 'confirmado', 800000.00, '2026-01-16 17:13:26', '2026-06-17 15:13:26', 'Tomás Álvarez', 'Calle 9', '1738', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (360, 51, '2025-10-22 01:13:26', 'confirmado', 220000.00, '2025-10-22 01:13:26', '2026-06-17 15:13:26', 'Lucía Acosta', 'Calle 81', '1985', 'La Plata - City Bell', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (361, 35, '2024-10-04 06:13:26', 'confirmado', 880000.00, '2024-10-04 06:13:26', '2026-06-17 15:13:26', 'Facundo Ruiz', 'Calle 4', '1172', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (362, 86, '2026-05-21 09:13:26', 'confirmado', 1720000.00, '2026-05-21 09:13:26', '2026-06-17 15:13:26', 'Valentina Rodríguez', 'Calle 116', '782', 'La Plata - Ensenada', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (363, 52, '2025-04-24 22:13:26', 'confirmado', 1140000.00, '2025-04-24 22:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle 122', '414', 'La Plata - Villa Elvira', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (364, 57, '2026-03-05 21:13:26', 'confirmado', 1020000.00, '2026-03-05 21:13:26', '2026-06-17 15:13:26', 'Gonzalo Sánchez', 'Calle 6', '1107', 'La Plata - Villa Elvira', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (365, 30, '2025-01-01 06:13:26', 'confirmado', 390000.00, '2025-01-01 06:13:26', '2026-06-17 15:13:26', 'Facundo Ruiz', 'Calle 137', '2127', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (366, 99, '2025-06-22 15:13:26', 'confirmado', 2160000.00, '2025-06-22 15:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle 8', '996', 'La Plata - Abasto', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (367, 16, '2026-03-15 07:13:26', 'confirmado', 985000.00, '2026-03-15 07:13:26', '2026-06-17 15:13:26', 'Sofía Romero', 'Calle Diagonal 73', '1701', 'La Plata - Berisso', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (368, 94, '2024-07-04 18:13:26', 'confirmado', 205000.00, '2024-07-04 18:13:26', '2026-06-17 15:13:26', 'Tomás Álvarez', 'Calle Diagonal 74', '764', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (369, 75, '2024-04-07 06:13:26', 'confirmado', 805000.00, '2024-04-07 06:13:26', '2026-06-17 15:13:26', 'Nicolás Pérez', 'Calle 10', '1592', 'La Plata - Ensenada', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (370, 98, '2025-04-20 20:13:26', 'confirmado', 540000.00, '2025-04-20 20:13:26', '2026-06-17 15:13:26', 'Paula Vargas', 'Calle 66', '435', 'La Plata - Melchor Romero', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (371, 72, '2026-01-02 09:13:26', 'confirmado', 395000.00, '2026-01-02 09:13:26', '2026-06-17 15:13:26', 'Agustina Martínez', 'Calle 63', '2337', 'La Plata - Ensenada', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (372, 83, '2025-04-21 22:13:26', 'confirmado', 1490000.00, '2025-04-21 22:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle Avenida 66', '1482', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (373, 44, '2024-12-31 14:13:26', 'confirmado', 1510000.00, '2024-12-31 14:13:26', '2026-06-17 15:13:26', 'Julieta Castro', 'Calle 76', '168', 'La Plata - Ensenada', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (374, 58, '2026-03-09 00:13:26', 'confirmado', 150000.00, '2026-03-09 00:13:26', '2026-06-17 15:13:26', 'Camila López', 'Calle 2', '1457', 'La Plata - Villa Elisa', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (375, 82, '2024-07-19 22:13:26', 'confirmado', 380000.00, '2024-07-19 22:13:26', '2026-06-17 15:13:26', 'Federico García', 'Calle 11', '1548', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (376, 83, '2024-03-15 13:13:26', 'confirmado', 2420000.00, '2024-03-15 13:13:26', '2026-06-17 15:13:26', 'Leandro Ortiz', 'Calle Diagonal 74', '2435', 'La Plata - Tolosa', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (377, 19, '2025-10-20 15:13:26', 'confirmado', 1240000.00, '2025-10-20 15:13:26', '2026-06-17 15:13:26', 'Martín Fernández', 'Calle 7', '2178', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (378, 69, '2024-05-29 05:13:26', 'confirmado', 630000.00, '2024-05-29 05:13:26', '2026-06-17 15:13:26', 'Leandro Ortiz', 'Calle Avenida 7', '947', 'La Plata - Berisso', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (379, 95, '2024-12-17 09:13:26', 'confirmado', 1245000.00, '2024-12-17 09:13:26', '2026-06-17 15:13:26', 'Matías Torres', 'Calle 12', '2264', 'La Plata - Ringuelet', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (380, 96, '2024-06-17 11:13:26', 'confirmado', 770000.00, '2024-06-17 11:13:26', '2026-06-17 15:13:26', 'Leandro Ortiz', 'Calle 14', '873', 'La Plata - Centro', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (381, 27, '2025-09-23 01:13:26', 'confirmado', 480000.00, '2025-09-23 01:13:26', '2026-06-17 15:13:26', 'Natalia Moreno', 'Calle Diagonal 79', '1779', 'La Plata - Berisso', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (382, 49, '2025-06-19 04:13:26', 'confirmado', 640000.00, '2025-06-19 04:13:26', '2026-06-17 15:13:26', 'Martín Fernández', 'Calle Diagonal 79', '234', 'La Plata - Villa Elisa', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (383, 31, '2024-08-25 09:13:26', 'confirmado', 790000.00, '2024-08-25 09:13:26', '2026-06-17 15:13:26', 'Micaela Gutiérrez', 'Calle 1', '2102', 'La Plata - Melchor Romero', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (384, 44, '2024-04-03 16:13:27', 'confirmado', 570000.00, '2024-04-03 16:13:27', '2026-06-17 15:13:27', 'Sofía Romero', 'Calle Avenida 32', '2334', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (385, 52, '2025-10-02 19:13:27', 'confirmado', 500000.00, '2025-10-02 19:13:27', '2026-06-17 15:13:27', 'Natalia Moreno', 'Calle 2', '1625', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (386, 64, '2025-09-16 03:13:27', 'confirmado', 1265000.00, '2025-09-16 03:13:27', '2026-06-17 15:13:27', 'Sofía Romero', 'Calle 12', '1496', 'La Plata - Abasto', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (387, 81, '2024-10-26 20:13:27', 'confirmado', 1440000.00, '2024-10-26 20:13:27', '2026-06-17 15:13:27', 'Julieta Castro', 'Calle 12', '1761', 'La Plata - Centro', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (388, 4, '2023-10-16 12:13:27', 'confirmado', 380000.00, '2023-10-16 12:13:27', '2026-06-17 15:13:27', 'Martín Fernández', 'Calle 90', '2135', 'La Plata - Villa Elvira', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (389, 39, '2025-05-21 11:13:27', 'confirmado', 290000.00, '2025-05-21 11:13:27', '2026-06-17 15:13:27', 'Gonzalo Sánchez', 'Calle 5', '1732', 'La Plata - Abasto', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (390, 58, '2025-12-01 09:13:27', 'confirmado', 1170000.00, '2025-12-01 09:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle 5', '677', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (391, 46, '2024-07-15 17:13:27', 'confirmado', 505000.00, '2024-07-15 17:13:27', '2026-06-17 15:13:27', 'Florencia Díaz', 'Calle 8', '977', 'La Plata - Abasto', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (392, 77, '2026-01-26 08:13:27', 'confirmado', 1140000.00, '2026-01-26 08:13:27', '2026-06-17 15:13:27', 'Lucía Acosta', 'Calle Avenida 32', '2833', 'La Plata - Tolosa', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (393, 53, '2024-09-01 07:13:27', 'confirmado', 1870000.00, '2024-09-01 07:13:27', '2026-06-17 15:13:27', 'Micaela Gutiérrez', 'Calle 38', '1837', 'La Plata - Villa Elisa', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (394, 80, '2025-12-02 23:13:27', 'confirmado', 2205000.00, '2025-12-02 23:13:27', '2026-06-17 15:13:27', 'Florencia Díaz', 'Calle 14', '950', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (395, 43, '2024-01-27 14:13:27', 'confirmado', 775000.00, '2024-01-27 14:13:27', '2026-06-17 15:13:27', 'Micaela Gutiérrez', 'Calle 57', '234', 'La Plata - Ringuelet', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (396, 16, '2025-11-08 16:13:27', 'confirmado', 850000.00, '2025-11-08 16:13:27', '2026-06-17 15:13:27', 'Facundo Ruiz', 'Calle 6', '1113', 'La Plata - Berisso', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (397, 70, '2024-03-06 12:13:27', 'confirmado', 160000.00, '2024-03-06 12:13:27', '2026-06-17 15:13:27', 'Natalia Moreno', 'Calle 12', '270', 'La Plata - Ringuelet', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (398, 74, '2023-09-24 00:13:27', 'confirmado', 1425000.00, '2023-09-24 00:13:27', '2026-06-17 15:13:27', 'Florencia Díaz', 'Calle 84', '602', 'La Plata - Villa Elisa', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (399, 89, '2024-10-05 04:13:27', 'confirmado', 870000.00, '2024-10-05 04:13:27', '2026-06-17 15:13:27', 'Martín Fernández', 'Calle 122', '2385', 'La Plata - Tolosa', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (400, 95, '2025-09-14 12:13:27', 'confirmado', 1085000.00, '2025-09-14 12:13:27', '2026-06-17 15:13:27', 'Facundo Ruiz', 'Calle 5', '1082', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (401, 95, '2024-11-04 14:13:27', 'confirmado', 980000.00, '2024-11-04 14:13:27', '2026-06-17 15:13:27', 'Agustina Martínez', 'Calle 8', '2423', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (402, 58, '2026-06-02 19:13:27', 'confirmado', 350000.00, '2026-06-02 19:13:27', '2026-06-17 15:13:27', 'Camila López', 'Calle 66', '649', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (403, 101, '2024-01-25 20:13:27', 'confirmado', 900000.00, '2024-01-25 20:13:27', '2026-06-17 15:13:27', 'Sebastián Herrera', 'Calle 51', '632', 'La Plata - Centro', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (404, 67, '2025-05-06 01:13:27', 'confirmado', 450000.00, '2025-05-06 01:13:27', '2026-06-17 15:13:27', 'Gonzalo Sánchez', 'Calle 38', '1169', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (405, 15, '2025-09-28 08:13:27', 'confirmado', 1140000.00, '2025-09-28 08:13:27', '2026-06-17 15:13:27', 'Nicolás Pérez', 'Calle 60', '2111', 'La Plata - Villa Elisa', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (406, 42, '2024-10-03 07:13:27', 'confirmado', 540000.00, '2024-10-03 07:13:27', '2026-06-17 15:13:27', 'Lucía Acosta', 'Calle 12', '944', 'La Plata - Abasto', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (407, 76, '2024-11-18 04:13:27', 'confirmado', 1005000.00, '2024-11-18 04:13:27', '2026-06-17 15:13:27', 'Martín Fernández', 'Calle 116', '1965', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (408, 31, '2024-04-14 13:13:27', 'confirmado', 1470000.00, '2024-04-14 13:13:27', '2026-06-17 15:13:27', 'Martín Fernández', 'Calle 63', '880', 'La Plata - Centro', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (409, 55, '2025-09-20 20:13:27', 'confirmado', 1310000.00, '2025-09-20 20:13:27', '2026-06-17 15:13:27', 'Leandro Ortiz', 'Calle 38', '2633', 'La Plata - Ensenada', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (410, 54, '2026-03-20 01:13:27', 'confirmado', 1140000.00, '2026-03-20 01:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle Avenida 13', '938', 'La Plata - Villa Elisa', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (411, 19, '2024-12-07 01:13:27', 'confirmado', 480000.00, '2024-12-07 01:13:27', '2026-06-17 15:13:27', 'Leandro Ortiz', 'Calle Avenida 13', '2491', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (412, 51, '2025-11-12 17:13:27', 'confirmado', 2160000.00, '2025-11-12 17:13:27', '2026-06-17 15:13:27', 'Nicolás Pérez', 'Calle 4', '2874', 'La Plata - Tolosa', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (413, 98, '2024-02-09 19:13:27', 'confirmado', 1510000.00, '2024-02-09 19:13:27', '2026-06-17 15:13:27', 'Julieta Castro', 'Calle 13', '991', 'La Plata - Gonnet', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (414, 27, '2024-03-08 07:13:27', 'confirmado', 570000.00, '2024-03-08 07:13:27', '2026-06-17 15:13:27', 'Tomás Álvarez', 'Calle Avenida 66', '150', 'La Plata - Melchor Romero', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (415, 19, '2023-06-30 08:13:27', 'confirmado', 1040000.00, '2023-06-30 08:13:27', '2026-06-17 15:13:27', 'Natalia Moreno', 'Calle 11', '2161', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (416, 98, '2026-02-13 11:13:27', 'confirmado', 730000.00, '2026-02-13 11:13:27', '2026-06-17 15:13:27', 'Lucía Acosta', 'Calle Diagonal 73', '823', 'La Plata - Centro', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (417, 89, '2025-04-09 07:13:27', 'confirmado', 940000.00, '2025-04-09 07:13:27', '2026-06-17 15:13:27', 'Lucía Acosta', 'Calle 7', '2739', 'La Plata - Tolosa', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (418, 48, '2025-10-07 08:13:27', 'confirmado', 700000.00, '2025-10-07 08:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle 116', '1676', 'La Plata - Villa Elisa', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (419, 87, '2025-10-03 14:13:27', 'confirmado', 310000.00, '2025-10-03 14:13:27', '2026-06-17 15:13:27', 'Gonzalo Sánchez', 'Calle 44', '1190', 'La Plata - Berisso', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (420, 2, '2023-06-30 13:13:27', 'confirmado', 825000.00, '2023-06-30 13:13:27', '2026-06-17 15:13:27', 'Agustina Martínez', 'Calle 13', '2914', 'La Plata - Ringuelet', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (421, 90, '2025-04-22 02:13:27', 'confirmado', 1230000.00, '2025-04-22 02:13:27', '2026-06-17 15:13:27', 'Matías Torres', 'Calle 122', '2304', 'La Plata - Los Hornos', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (422, 66, '2024-05-11 19:13:27', 'confirmado', 1345000.00, '2024-05-11 19:13:27', '2026-06-17 15:13:27', 'Gonzalo Sánchez', 'Calle Avenida 32', '1856', 'La Plata - City Bell', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (423, 88, '2026-05-10 05:13:27', 'confirmado', 410000.00, '2026-05-10 05:13:27', '2026-06-17 15:13:27', 'Tomás Álvarez', 'Calle 66', '1336', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (424, 51, '2025-10-27 16:13:27', 'confirmado', 745000.00, '2025-10-27 16:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle Avenida 7', '1946', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (425, 55, '2026-02-06 14:13:27', 'confirmado', 620000.00, '2026-02-06 14:13:27', '2026-06-17 15:13:27', 'Facundo Ruiz', 'Calle 51', '1146', 'La Plata - Villa Elisa', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (426, 50, '2024-08-14 15:13:27', 'confirmado', 350000.00, '2024-08-14 15:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle 81', '1490', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (427, 17, '2025-01-12 07:13:27', 'confirmado', 870000.00, '2025-01-12 07:13:27', '2026-06-17 15:13:27', 'Camila López', 'Calle Diagonal 79', '2433', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (428, 32, '2024-02-06 07:13:27', 'confirmado', 1010000.00, '2024-02-06 07:13:27', '2026-06-17 15:13:27', 'Paula Vargas', 'Calle 38', '2366', 'La Plata - Villa Elvira', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (429, 80, '2024-04-12 23:13:27', 'confirmado', 450000.00, '2024-04-12 23:13:27', '2026-06-17 15:13:27', 'Sebastián Herrera', 'Calle 38', '931', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (430, 55, '2025-01-28 00:13:27', 'confirmado', 1200000.00, '2025-01-28 00:13:27', '2026-06-17 15:13:27', 'Camila López', 'Calle 6', '1974', 'La Plata - Centro', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (431, 52, '2026-05-16 20:13:27', 'confirmado', 300000.00, '2026-05-16 20:13:27', '2026-06-17 15:13:27', 'Sebastián Herrera', 'Calle 12', '1342', 'La Plata - Ringuelet', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (432, 97, '2025-02-06 01:13:27', 'confirmado', 1710000.00, '2025-02-06 01:13:27', '2026-06-17 15:13:27', 'Sofía Romero', 'Calle 1', '2295', 'La Plata - City Bell', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (433, 30, '2025-03-31 22:13:27', 'confirmado', 1315000.00, '2025-03-31 22:13:27', '2026-06-17 15:13:27', 'Florencia Díaz', 'Calle 8', '377', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (434, 10, '2026-06-06 09:13:27', 'confirmado', 795000.00, '2026-06-06 09:13:27', '2026-06-17 15:13:27', 'Micaela Gutiérrez', 'Calle 122', '475', 'La Plata - Tolosa', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (435, 14, '2026-02-04 17:13:27', 'confirmado', 1700000.00, '2026-02-04 17:13:27', '2026-06-17 15:13:27', 'Camila López', 'Calle 7', '2791', 'La Plata - Abasto', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (436, 57, '2026-05-10 05:13:27', 'confirmado', 2205000.00, '2026-05-10 05:13:27', '2026-06-17 15:13:27', 'Natalia Moreno', 'Calle Avenida 13', '1378', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (437, 80, '2025-09-11 12:13:27', 'confirmado', 1100000.00, '2025-09-11 12:13:27', '2026-06-17 15:13:27', 'Valentina Rodríguez', 'Calle 57', '1856', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (438, 81, '2026-03-26 20:13:27', 'confirmado', 1390000.00, '2026-03-26 20:13:27', '2026-06-17 15:13:27', 'Martín Fernández', 'Calle 3', '1345', 'La Plata - Villa Elvira', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (439, 6, '2025-02-21 19:13:27', 'confirmado', 1090000.00, '2025-02-21 19:13:27', '2026-06-17 15:13:27', 'Nicolás Pérez', 'Calle 60', '527', 'La Plata - Villa Elisa', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (440, 16, '2024-07-14 16:13:27', 'confirmado', 1050000.00, '2024-07-14 16:13:27', '2026-06-17 15:13:27', 'Paula Vargas', 'Calle Diagonal 79', '431', 'La Plata - City Bell', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (441, 65, '2024-10-22 08:13:27', 'confirmado', 150000.00, '2024-10-22 08:13:27', '2026-06-17 15:13:27', 'Paula Vargas', 'Calle 5', '2690', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (442, 35, '2026-04-19 23:13:27', 'confirmado', 1280000.00, '2026-04-19 23:13:27', '2026-06-17 15:13:27', 'Valentina Rodríguez', 'Calle 13', '2324', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (443, 65, '2024-10-12 08:13:27', 'confirmado', 800000.00, '2024-10-12 08:13:27', '2026-06-17 15:13:27', 'Nicolás Pérez', 'Calle Diagonal 80', '474', 'La Plata - Villa Elisa', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (444, 80, '2023-10-29 15:13:27', 'confirmado', 620000.00, '2023-10-29 15:13:27', '2026-06-17 15:13:27', 'Facundo Ruiz', 'Calle 90', '387', 'La Plata - Centro', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (445, 44, '2024-07-30 02:13:27', 'confirmado', 1010000.00, '2024-07-30 02:13:27', '2026-06-17 15:13:27', 'Sofía Romero', 'Calle 9', '1881', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (446, 21, '2023-08-25 10:13:27', 'confirmado', 1190000.00, '2023-08-25 10:13:27', '2026-06-17 15:13:27', 'Florencia Díaz', 'Calle 51', '215', 'La Plata - Tolosa', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (447, 62, '2024-09-04 01:13:27', 'confirmado', 1675000.00, '2024-09-04 01:13:27', '2026-06-17 15:13:27', 'Florencia Díaz', 'Calle 14', '2913', 'La Plata - Ensenada', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (448, 61, '2025-08-18 07:13:27', 'confirmado', 1080000.00, '2025-08-18 07:13:27', '2026-06-17 15:13:27', 'Federico García', 'Calle 10', '2914', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (449, 35, '2026-04-02 14:13:27', 'confirmado', 930000.00, '2026-04-02 14:13:27', '2026-06-17 15:13:27', 'Federico García', 'Calle 90', '2306', 'La Plata - Ringuelet', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (450, 33, '2023-11-08 12:13:27', 'confirmado', 1890000.00, '2023-11-08 12:13:27', '2026-06-17 15:13:27', 'Tomás Álvarez', 'Calle Avenida 32', '195', 'La Plata - Gonnet', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (451, 13, '2025-04-28 08:13:27', 'confirmado', 1330000.00, '2025-04-28 08:13:27', '2026-06-17 15:13:27', 'Micaela Gutiérrez', 'Calle 116', '2897', 'La Plata - Tolosa', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (452, 29, '2024-10-07 11:13:27', 'confirmado', 210000.00, '2024-10-07 11:13:27', '2026-06-17 15:13:27', 'Matías Torres', 'Calle 57', '2224', 'La Plata - Villa Elvira', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (453, 45, '2024-06-04 17:13:27', 'confirmado', 1130000.00, '2024-06-04 17:13:27', '2026-06-17 15:13:27', 'Lucía Acosta', 'Calle 72', '2251', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (454, 37, '2024-11-20 18:13:27', 'confirmado', 1890000.00, '2024-11-20 18:13:27', '2026-06-17 15:13:27', 'Federico García', 'Calle 7', '2067', 'La Plata - Centro', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (455, 78, '2025-11-24 04:13:27', 'confirmado', 700000.00, '2025-11-24 04:13:27', '2026-06-17 15:13:27', 'Martín Fernández', 'Calle 90', '2907', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (456, 63, '2024-03-14 06:13:27', 'confirmado', 195000.00, '2024-03-14 06:13:27', '2026-06-17 15:13:27', 'Nicolás Pérez', 'Calle 1', '563', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (457, 80, '2025-01-22 14:13:27', 'confirmado', 910000.00, '2025-01-22 14:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle 63', '2264', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (458, 49, '2024-03-29 03:13:27', 'confirmado', 2310000.00, '2024-03-29 03:13:27', '2026-06-17 15:13:27', 'Valentina Rodríguez', 'Calle 9', '662', 'La Plata - Berisso', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (459, 42, '2023-07-28 05:13:27', 'confirmado', 720000.00, '2023-07-28 05:13:27', '2026-06-17 15:13:27', 'Valentina Rodríguez', 'Calle 14', '2743', 'La Plata - Tolosa', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (460, 86, '2026-04-10 13:13:27', 'confirmado', 1205000.00, '2026-04-10 13:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle 3', '332', 'La Plata - Melchor Romero', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (461, 82, '2025-02-27 00:13:27', 'confirmado', 1555000.00, '2025-02-27 00:13:27', '2026-06-17 15:13:27', 'Nicolás Pérez', 'Calle 2', '605', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (462, 82, '2026-02-23 18:13:27', 'confirmado', 1235000.00, '2026-02-23 18:13:27', '2026-06-17 15:13:27', 'Sofía Romero', 'Calle 84', '1517', 'La Plata - Tolosa', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (463, 20, '2025-01-23 16:13:27', 'confirmado', 310000.00, '2025-01-23 16:13:27', '2026-06-17 15:13:27', 'Nicolás Pérez', 'Calle 10', '2080', 'La Plata - Berisso', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (464, 17, '2025-02-15 01:13:27', 'confirmado', 1050000.00, '2025-02-15 01:13:27', '2026-06-17 15:13:27', 'Sebastián Herrera', 'Calle Diagonal 73', '838', 'La Plata - Abasto', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (465, 91, '2025-05-22 23:13:27', 'confirmado', 1420000.00, '2025-05-22 23:13:27', '2026-06-17 15:13:27', 'Micaela Gutiérrez', 'Calle 6', '489', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (466, 44, '2026-01-29 09:13:27', 'confirmado', 1120000.00, '2026-01-29 09:13:27', '2026-06-17 15:13:27', 'Gonzalo Sánchez', 'Calle Diagonal 80', '1542', 'La Plata - Tolosa', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (467, 73, '2024-12-25 18:13:27', 'confirmado', 1230000.00, '2024-12-25 18:13:27', '2026-06-17 15:13:27', 'Camila López', 'Calle 7', '813', 'La Plata - Centro', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (468, 67, '2024-02-21 06:13:27', 'confirmado', 660000.00, '2024-02-21 06:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle Diagonal 73', '1592', 'La Plata - Berisso', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (469, 24, '2023-06-24 01:13:27', 'confirmado', 750000.00, '2023-06-24 01:13:27', '2026-06-17 15:13:27', 'Sofía Romero', 'Calle 13', '1575', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (470, 53, '2025-12-17 04:13:27', 'confirmado', 1270000.00, '2025-12-17 04:13:27', '2026-06-17 15:13:27', 'Nicolás Pérez', 'Calle Avenida 7', '986', 'La Plata - Centro', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (471, 10, '2024-08-07 20:13:27', 'confirmado', 1525000.00, '2024-08-07 20:13:27', '2026-06-17 15:13:27', 'Facundo Ruiz', 'Calle 44', '1537', 'La Plata - Ensenada', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (472, 6, '2025-08-20 04:13:27', 'confirmado', 480000.00, '2025-08-20 04:13:27', '2026-06-17 15:13:27', 'Nicolás Pérez', 'Calle Avenida 13', '241', 'La Plata - Gonnet', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (473, 68, '2023-07-24 01:13:27', 'confirmado', 320000.00, '2023-07-24 01:13:27', '2026-06-17 15:13:27', 'Nicolás Pérez', 'Calle Diagonal 79', '1218', 'La Plata - Melchor Romero', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (474, 63, '2024-11-12 11:13:27', 'confirmado', 1925000.00, '2024-11-12 11:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle 5', '2687', 'La Plata - Tolosa', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (475, 93, '2025-02-25 13:13:27', 'confirmado', 910000.00, '2025-02-25 13:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle 8', '2149', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (476, 96, '2024-06-03 08:13:27', 'confirmado', 720000.00, '2024-06-03 08:13:27', '2026-06-17 15:13:27', 'Paula Vargas', 'Calle 6', '686', 'La Plata - Abasto', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (477, 6, '2024-06-05 22:13:27', 'confirmado', 1720000.00, '2024-06-05 22:13:27', '2026-06-17 15:13:27', 'Facundo Ruiz', 'Calle 8', '604', 'La Plata - Centro', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (478, 93, '2023-11-22 19:13:27', 'confirmado', 1050000.00, '2023-11-22 19:13:27', '2026-06-17 15:13:27', 'Agustina Martínez', 'Calle 44', '1531', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (479, 92, '2026-03-14 06:13:27', 'confirmado', 1080000.00, '2026-03-14 06:13:27', '2026-06-17 15:13:27', 'Lucía Acosta', 'Calle Diagonal 73', '1618', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (480, 29, '2025-01-08 01:13:27', 'confirmado', 1330000.00, '2025-01-08 01:13:27', '2026-06-17 15:13:27', 'Gonzalo Sánchez', 'Calle 57', '242', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (481, 10, '2026-06-05 16:13:27', 'confirmado', 920000.00, '2026-06-05 16:13:27', '2026-06-17 15:13:27', 'Federico García', 'Calle 72', '1260', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (482, 47, '2025-12-16 07:13:27', 'confirmado', 615000.00, '2025-12-16 07:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle Avenida 66', '1709', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (483, 17, '2024-12-27 17:13:27', 'confirmado', 1770000.00, '2024-12-27 17:13:27', '2026-06-17 15:13:27', 'Facundo Ruiz', 'Calle 13', '225', 'La Plata - Centro', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (484, 71, '2024-07-05 16:13:27', 'confirmado', 470000.00, '2024-07-05 16:13:27', '2026-06-17 15:13:27', 'Leandro Ortiz', 'Calle Avenida 7', '993', 'La Plata - Centro', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (485, 71, '2025-11-15 02:13:27', 'confirmado', 1680000.00, '2025-11-15 02:13:27', '2026-06-17 15:13:27', 'Camila López', 'Calle 60', '2130', 'La Plata - Ringuelet', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (486, 30, '2025-02-22 00:13:27', 'confirmado', 480000.00, '2025-02-22 00:13:27', '2026-06-17 15:13:27', 'Natalia Moreno', 'Calle 57', '1882', 'La Plata - Centro', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (487, 57, '2024-08-05 06:13:27', 'confirmado', 540000.00, '2024-08-05 06:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle 7', '1672', 'La Plata - Melchor Romero', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (488, 52, '2024-07-15 02:13:27', 'confirmado', 1180000.00, '2024-07-15 02:13:27', '2026-06-17 15:13:27', 'Valentina Rodríguez', 'Calle 76', '2976', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (489, 32, '2023-12-20 13:13:27', 'confirmado', 540000.00, '2023-12-20 13:13:27', '2026-06-17 15:13:27', 'Matías Torres', 'Calle 10', '2285', 'La Plata - Los Hornos', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (490, 33, '2024-11-16 09:13:27', 'confirmado', 1335000.00, '2024-11-16 09:13:27', '2026-06-17 15:13:27', 'Nicolás Pérez', 'Calle Avenida 32', '1317', 'La Plata - City Bell', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (491, 24, '2024-08-03 19:13:27', 'confirmado', 1430000.00, '2024-08-03 19:13:27', '2026-06-17 15:13:27', 'Facundo Ruiz', 'Calle 6', '1763', 'La Plata - Ensenada', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (492, 62, '2025-02-28 13:13:27', 'confirmado', 1200000.00, '2025-02-28 13:13:27', '2026-06-17 15:13:27', 'Micaela Gutiérrez', 'Calle 12', '759', 'La Plata - Tolosa', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (493, 22, '2026-05-07 21:13:27', 'confirmado', 1250000.00, '2026-05-07 21:13:27', '2026-06-17 15:13:27', 'Gonzalo Sánchez', 'Calle 81', '2462', 'La Plata - Berisso', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (494, 61, '2023-11-19 01:13:27', 'confirmado', 620000.00, '2023-11-19 01:13:27', '2026-06-17 15:13:27', 'Natalia Moreno', 'Calle 84', '1786', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (495, 52, '2023-11-28 15:13:27', 'confirmado', 870000.00, '2023-11-28 15:13:27', '2026-06-17 15:13:27', 'Gonzalo Sánchez', 'Calle 66', '1102', 'La Plata - Melchor Romero', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (496, 31, '2024-12-26 21:13:27', 'confirmado', 1820000.00, '2024-12-26 21:13:27', '2026-06-17 15:13:27', 'Martín Fernández', 'Calle 60', '1717', 'La Plata - Centro', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (497, 96, '2025-06-26 08:13:27', 'confirmado', 1430000.00, '2025-06-26 08:13:27', '2026-06-17 15:13:27', 'Martín Fernández', 'Calle 72', '150', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (498, 79, '2024-03-26 08:13:27', 'confirmado', 720000.00, '2024-03-26 08:13:27', '2026-06-17 15:13:27', 'Diego Jiménez', 'Calle 122', '1453', 'La Plata - Ringuelet', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (499, 98, '2025-11-19 22:13:27', 'confirmado', 710000.00, '2025-11-19 22:13:27', '2026-06-17 15:13:27', 'Valentina Rodríguez', 'Calle 7', '2785', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (500, 49, '2025-05-30 16:13:27', 'confirmado', 1680000.00, '2025-05-30 16:13:27', '2026-06-17 15:13:27', 'Nicolás Pérez', 'Calle 8', '1749', 'La Plata - Villa Elisa', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (501, 66, '2024-01-21 02:13:27', 'confirmado', 740000.00, '2024-01-21 02:13:27', '2026-06-17 15:13:27', 'Tomás Álvarez', 'Calle 14', '1527', 'La Plata - Abasto', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 3200.00);


--
-- TOC entry 5172 (class 0 OID 29046)
-- Dependencies: 235
-- Data for Name: ventas_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ventas_detalle VALUES (1, 1, 10, 1, 195000.00, 195000.00, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.ventas_detalle VALUES (2, 1, 5, 1, 190000.00, 190000.00, '2026-06-17 15:13:25', '2026-06-17 15:13:25');
INSERT INTO public.ventas_detalle VALUES (3, 2, 2, 2, 210000.00, 420000.00, '2025-10-24 11:13:25', '2025-10-24 11:13:25');
INSERT INTO public.ventas_detalle VALUES (4, 2, 9, 3, 220000.00, 660000.00, '2025-10-24 11:13:25', '2025-10-24 11:13:25');
INSERT INTO public.ventas_detalle VALUES (5, 2, 15, 2, 270000.00, 540000.00, '2025-10-24 11:13:25', '2025-10-24 11:13:25');
INSERT INTO public.ventas_detalle VALUES (6, 3, 1, 1, 250000.00, 250000.00, '2025-02-07 08:13:25', '2025-02-07 08:13:25');
INSERT INTO public.ventas_detalle VALUES (7, 4, 2, 1, 210000.00, 210000.00, '2024-03-18 20:13:25', '2024-03-18 20:13:25');
INSERT INTO public.ventas_detalle VALUES (8, 4, 10, 2, 195000.00, 390000.00, '2024-03-18 20:13:25', '2024-03-18 20:13:25');
INSERT INTO public.ventas_detalle VALUES (9, 4, 14, 3, 290000.00, 870000.00, '2024-03-18 20:13:25', '2024-03-18 20:13:25');
INSERT INTO public.ventas_detalle VALUES (10, 5, 5, 3, 190000.00, 570000.00, '2025-02-16 16:13:25', '2025-02-16 16:13:25');
INSERT INTO public.ventas_detalle VALUES (11, 5, 15, 3, 270000.00, 810000.00, '2025-02-16 16:13:25', '2025-02-16 16:13:25');
INSERT INTO public.ventas_detalle VALUES (12, 5, 16, 3, 380000.00, 1140000.00, '2025-02-16 16:13:25', '2025-02-16 16:13:25');
INSERT INTO public.ventas_detalle VALUES (13, 6, 12, 2, 205000.00, 410000.00, '2024-11-12 18:13:25', '2024-11-12 18:13:25');
INSERT INTO public.ventas_detalle VALUES (14, 7, 7, 3, 160000.00, 480000.00, '2024-01-19 06:13:25', '2024-01-19 06:13:25');
INSERT INTO public.ventas_detalle VALUES (15, 7, 8, 2, 175000.00, 350000.00, '2024-01-19 06:13:25', '2024-01-19 06:13:25');
INSERT INTO public.ventas_detalle VALUES (16, 7, 17, 3, 350000.00, 1050000.00, '2024-01-19 06:13:25', '2024-01-19 06:13:25');
INSERT INTO public.ventas_detalle VALUES (17, 8, 12, 2, 205000.00, 410000.00, '2024-12-03 14:13:25', '2024-12-03 14:13:25');
INSERT INTO public.ventas_detalle VALUES (18, 8, 16, 3, 380000.00, 1140000.00, '2024-12-03 14:13:25', '2024-12-03 14:13:25');
INSERT INTO public.ventas_detalle VALUES (19, 8, 17, 2, 350000.00, 700000.00, '2024-12-03 14:13:25', '2024-12-03 14:13:25');
INSERT INTO public.ventas_detalle VALUES (20, 9, 3, 1, 180000.00, 180000.00, '2024-12-16 04:13:25', '2024-12-16 04:13:25');
INSERT INTO public.ventas_detalle VALUES (21, 9, 8, 1, 175000.00, 175000.00, '2024-12-16 04:13:25', '2024-12-16 04:13:25');
INSERT INTO public.ventas_detalle VALUES (22, 9, 16, 3, 380000.00, 1140000.00, '2024-12-16 04:13:25', '2024-12-16 04:13:25');
INSERT INTO public.ventas_detalle VALUES (23, 10, 11, 2, 150000.00, 300000.00, '2024-01-23 04:13:25', '2024-01-23 04:13:25');
INSERT INTO public.ventas_detalle VALUES (24, 10, 14, 2, 290000.00, 580000.00, '2024-01-23 04:13:25', '2024-01-23 04:13:25');
INSERT INTO public.ventas_detalle VALUES (25, 11, 7, 3, 160000.00, 480000.00, '2025-08-12 01:13:25', '2025-08-12 01:13:25');
INSERT INTO public.ventas_detalle VALUES (26, 12, 5, 2, 190000.00, 380000.00, '2026-06-17 12:13:25', '2026-06-17 12:13:25');
INSERT INTO public.ventas_detalle VALUES (27, 12, 7, 1, 160000.00, 160000.00, '2026-06-17 12:13:25', '2026-06-17 12:13:25');
INSERT INTO public.ventas_detalle VALUES (28, 12, 8, 1, 175000.00, 175000.00, '2026-06-17 12:13:25', '2026-06-17 12:13:25');
INSERT INTO public.ventas_detalle VALUES (29, 13, 11, 2, 150000.00, 300000.00, '2023-12-23 07:13:25', '2023-12-23 07:13:25');
INSERT INTO public.ventas_detalle VALUES (30, 13, 17, 1, 350000.00, 350000.00, '2023-12-23 07:13:25', '2023-12-23 07:13:25');
INSERT INTO public.ventas_detalle VALUES (31, 13, 18, 2, 240000.00, 480000.00, '2023-12-23 07:13:25', '2023-12-23 07:13:25');
INSERT INTO public.ventas_detalle VALUES (32, 14, 9, 3, 220000.00, 660000.00, '2024-12-24 19:13:25', '2024-12-24 19:13:25');
INSERT INTO public.ventas_detalle VALUES (33, 14, 11, 3, 150000.00, 450000.00, '2024-12-24 19:13:25', '2024-12-24 19:13:25');
INSERT INTO public.ventas_detalle VALUES (34, 14, 18, 2, 240000.00, 480000.00, '2024-12-24 19:13:25', '2024-12-24 19:13:25');
INSERT INTO public.ventas_detalle VALUES (35, 15, 17, 2, 350000.00, 700000.00, '2023-07-28 11:13:25', '2023-07-28 11:13:25');
INSERT INTO public.ventas_detalle VALUES (36, 15, 18, 3, 240000.00, 720000.00, '2023-07-28 11:13:25', '2023-07-28 11:13:25');
INSERT INTO public.ventas_detalle VALUES (37, 16, 7, 3, 160000.00, 480000.00, '2024-10-01 12:13:25', '2024-10-01 12:13:25');
INSERT INTO public.ventas_detalle VALUES (38, 16, 9, 3, 220000.00, 660000.00, '2024-10-01 12:13:25', '2024-10-01 12:13:25');
INSERT INTO public.ventas_detalle VALUES (39, 17, 7, 2, 160000.00, 320000.00, '2025-01-20 02:13:25', '2025-01-20 02:13:25');
INSERT INTO public.ventas_detalle VALUES (40, 17, 15, 1, 270000.00, 270000.00, '2025-01-20 02:13:25', '2025-01-20 02:13:25');
INSERT INTO public.ventas_detalle VALUES (41, 18, 2, 1, 210000.00, 210000.00, '2026-03-01 06:13:25', '2026-03-01 06:13:25');
INSERT INTO public.ventas_detalle VALUES (42, 18, 6, 2, 310000.00, 620000.00, '2026-03-01 06:13:25', '2026-03-01 06:13:25');
INSERT INTO public.ventas_detalle VALUES (43, 18, 15, 2, 270000.00, 540000.00, '2026-03-01 06:13:25', '2026-03-01 06:13:25');
INSERT INTO public.ventas_detalle VALUES (44, 19, 12, 3, 205000.00, 615000.00, '2025-06-23 02:13:25', '2025-06-23 02:13:25');
INSERT INTO public.ventas_detalle VALUES (45, 20, 7, 2, 160000.00, 320000.00, '2024-04-12 12:13:25', '2024-04-12 12:13:25');
INSERT INTO public.ventas_detalle VALUES (46, 21, 5, 3, 190000.00, 570000.00, '2023-09-20 10:13:25', '2023-09-20 10:13:25');
INSERT INTO public.ventas_detalle VALUES (47, 21, 16, 2, 380000.00, 760000.00, '2023-09-20 10:13:25', '2023-09-20 10:13:25');
INSERT INTO public.ventas_detalle VALUES (48, 22, 5, 1, 190000.00, 190000.00, '2024-12-29 07:13:25', '2024-12-29 07:13:25');
INSERT INTO public.ventas_detalle VALUES (49, 22, 10, 1, 195000.00, 195000.00, '2024-12-29 07:13:25', '2024-12-29 07:13:25');
INSERT INTO public.ventas_detalle VALUES (50, 23, 2, 2, 210000.00, 420000.00, '2025-12-17 07:13:25', '2025-12-17 07:13:25');
INSERT INTO public.ventas_detalle VALUES (51, 23, 7, 3, 160000.00, 480000.00, '2025-12-17 07:13:25', '2025-12-17 07:13:25');
INSERT INTO public.ventas_detalle VALUES (52, 23, 11, 1, 150000.00, 150000.00, '2025-12-17 07:13:25', '2025-12-17 07:13:25');
INSERT INTO public.ventas_detalle VALUES (53, 24, 1, 3, 250000.00, 750000.00, '2023-07-12 02:13:25', '2023-07-12 02:13:25');
INSERT INTO public.ventas_detalle VALUES (54, 24, 2, 2, 210000.00, 420000.00, '2023-07-12 02:13:25', '2023-07-12 02:13:25');
INSERT INTO public.ventas_detalle VALUES (55, 25, 7, 2, 160000.00, 320000.00, '2025-02-06 01:13:25', '2025-02-06 01:13:25');
INSERT INTO public.ventas_detalle VALUES (56, 26, 10, 3, 195000.00, 585000.00, '2024-01-11 23:13:25', '2024-01-11 23:13:25');
INSERT INTO public.ventas_detalle VALUES (57, 27, 7, 2, 160000.00, 320000.00, '2026-02-11 23:13:25', '2026-02-11 23:13:25');
INSERT INTO public.ventas_detalle VALUES (58, 27, 8, 1, 175000.00, 175000.00, '2026-02-11 23:13:25', '2026-02-11 23:13:25');
INSERT INTO public.ventas_detalle VALUES (59, 27, 16, 1, 380000.00, 380000.00, '2026-02-11 23:13:25', '2026-02-11 23:13:25');
INSERT INTO public.ventas_detalle VALUES (60, 28, 16, 2, 380000.00, 760000.00, '2024-10-17 06:13:25', '2024-10-17 06:13:25');
INSERT INTO public.ventas_detalle VALUES (61, 28, 17, 2, 350000.00, 700000.00, '2024-10-17 06:13:25', '2024-10-17 06:13:25');
INSERT INTO public.ventas_detalle VALUES (62, 29, 18, 1, 240000.00, 240000.00, '2024-10-26 21:13:25', '2024-10-26 21:13:25');
INSERT INTO public.ventas_detalle VALUES (63, 30, 3, 1, 180000.00, 180000.00, '2025-10-07 01:13:25', '2025-10-07 01:13:25');
INSERT INTO public.ventas_detalle VALUES (64, 30, 7, 1, 160000.00, 160000.00, '2025-10-07 01:13:25', '2025-10-07 01:13:25');
INSERT INTO public.ventas_detalle VALUES (65, 30, 16, 1, 380000.00, 380000.00, '2025-10-07 01:13:25', '2025-10-07 01:13:25');
INSERT INTO public.ventas_detalle VALUES (66, 31, 1, 1, 250000.00, 250000.00, '2026-01-07 21:13:25', '2026-01-07 21:13:25');
INSERT INTO public.ventas_detalle VALUES (67, 31, 11, 2, 150000.00, 300000.00, '2026-01-07 21:13:25', '2026-01-07 21:13:25');
INSERT INTO public.ventas_detalle VALUES (68, 31, 18, 2, 240000.00, 480000.00, '2026-01-07 21:13:25', '2026-01-07 21:13:25');
INSERT INTO public.ventas_detalle VALUES (69, 32, 6, 2, 310000.00, 620000.00, '2024-03-10 20:13:25', '2024-03-10 20:13:25');
INSERT INTO public.ventas_detalle VALUES (70, 32, 7, 2, 160000.00, 320000.00, '2024-03-10 20:13:25', '2024-03-10 20:13:25');
INSERT INTO public.ventas_detalle VALUES (71, 32, 15, 2, 270000.00, 540000.00, '2024-03-10 20:13:25', '2024-03-10 20:13:25');
INSERT INTO public.ventas_detalle VALUES (72, 33, 18, 2, 240000.00, 480000.00, '2025-06-07 19:13:25', '2025-06-07 19:13:25');
INSERT INTO public.ventas_detalle VALUES (73, 34, 5, 2, 190000.00, 380000.00, '2024-10-13 09:13:25', '2024-10-13 09:13:25');
INSERT INTO public.ventas_detalle VALUES (74, 34, 10, 2, 195000.00, 390000.00, '2024-10-13 09:13:25', '2024-10-13 09:13:25');
INSERT INTO public.ventas_detalle VALUES (75, 34, 12, 1, 205000.00, 205000.00, '2024-10-13 09:13:25', '2024-10-13 09:13:25');
INSERT INTO public.ventas_detalle VALUES (76, 35, 1, 1, 250000.00, 250000.00, '2024-01-24 07:13:25', '2024-01-24 07:13:25');
INSERT INTO public.ventas_detalle VALUES (77, 35, 6, 2, 310000.00, 620000.00, '2024-01-24 07:13:25', '2024-01-24 07:13:25');
INSERT INTO public.ventas_detalle VALUES (78, 35, 12, 1, 205000.00, 205000.00, '2024-01-24 07:13:25', '2024-01-24 07:13:25');
INSERT INTO public.ventas_detalle VALUES (79, 36, 16, 2, 380000.00, 760000.00, '2025-08-22 02:13:25', '2025-08-22 02:13:25');
INSERT INTO public.ventas_detalle VALUES (80, 37, 1, 1, 250000.00, 250000.00, '2024-12-15 13:13:25', '2024-12-15 13:13:25');
INSERT INTO public.ventas_detalle VALUES (81, 37, 10, 2, 195000.00, 390000.00, '2024-12-15 13:13:25', '2024-12-15 13:13:25');
INSERT INTO public.ventas_detalle VALUES (82, 38, 8, 2, 175000.00, 350000.00, '2024-03-06 06:13:25', '2024-03-06 06:13:25');
INSERT INTO public.ventas_detalle VALUES (83, 38, 15, 2, 270000.00, 540000.00, '2024-03-06 06:13:25', '2024-03-06 06:13:25');
INSERT INTO public.ventas_detalle VALUES (84, 39, 9, 1, 220000.00, 220000.00, '2023-08-10 19:13:25', '2023-08-10 19:13:25');
INSERT INTO public.ventas_detalle VALUES (85, 40, 6, 3, 310000.00, 930000.00, '2023-09-19 18:13:25', '2023-09-19 18:13:25');
INSERT INTO public.ventas_detalle VALUES (86, 40, 8, 1, 175000.00, 175000.00, '2023-09-19 18:13:25', '2023-09-19 18:13:25');
INSERT INTO public.ventas_detalle VALUES (87, 40, 15, 3, 270000.00, 810000.00, '2023-09-19 18:13:25', '2023-09-19 18:13:25');
INSERT INTO public.ventas_detalle VALUES (88, 41, 5, 3, 190000.00, 570000.00, '2025-01-11 21:13:25', '2025-01-11 21:13:25');
INSERT INTO public.ventas_detalle VALUES (89, 41, 10, 3, 195000.00, 585000.00, '2025-01-11 21:13:25', '2025-01-11 21:13:25');
INSERT INTO public.ventas_detalle VALUES (90, 41, 12, 3, 205000.00, 615000.00, '2025-01-11 21:13:25', '2025-01-11 21:13:25');
INSERT INTO public.ventas_detalle VALUES (91, 42, 18, 3, 240000.00, 720000.00, '2024-02-07 22:13:25', '2024-02-07 22:13:25');
INSERT INTO public.ventas_detalle VALUES (92, 43, 16, 3, 380000.00, 1140000.00, '2024-04-21 09:13:25', '2024-04-21 09:13:25');
INSERT INTO public.ventas_detalle VALUES (93, 44, 7, 3, 160000.00, 480000.00, '2023-06-25 18:13:25', '2023-06-25 18:13:25');
INSERT INTO public.ventas_detalle VALUES (94, 44, 8, 3, 175000.00, 525000.00, '2023-06-25 18:13:25', '2023-06-25 18:13:25');
INSERT INTO public.ventas_detalle VALUES (95, 44, 9, 2, 220000.00, 440000.00, '2023-06-25 18:13:25', '2023-06-25 18:13:25');
INSERT INTO public.ventas_detalle VALUES (96, 45, 7, 3, 160000.00, 480000.00, '2023-11-16 21:13:25', '2023-11-16 21:13:25');
INSERT INTO public.ventas_detalle VALUES (97, 46, 11, 2, 150000.00, 300000.00, '2024-08-18 12:13:25', '2024-08-18 12:13:25');
INSERT INTO public.ventas_detalle VALUES (98, 47, 5, 2, 190000.00, 380000.00, '2025-03-09 16:13:25', '2025-03-09 16:13:25');
INSERT INTO public.ventas_detalle VALUES (99, 48, 18, 3, 240000.00, 720000.00, '2023-10-24 11:13:25', '2023-10-24 11:13:25');
INSERT INTO public.ventas_detalle VALUES (100, 49, 6, 2, 310000.00, 620000.00, '2026-04-21 02:13:25', '2026-04-21 02:13:25');
INSERT INTO public.ventas_detalle VALUES (101, 49, 7, 3, 160000.00, 480000.00, '2026-04-21 02:13:25', '2026-04-21 02:13:25');
INSERT INTO public.ventas_detalle VALUES (102, 50, 6, 2, 310000.00, 620000.00, '2023-08-17 09:13:25', '2023-08-17 09:13:25');
INSERT INTO public.ventas_detalle VALUES (103, 50, 8, 2, 175000.00, 350000.00, '2023-08-17 09:13:25', '2023-08-17 09:13:25');
INSERT INTO public.ventas_detalle VALUES (104, 51, 8, 3, 175000.00, 525000.00, '2025-02-01 20:13:25', '2025-02-01 20:13:25');
INSERT INTO public.ventas_detalle VALUES (105, 51, 9, 1, 220000.00, 220000.00, '2025-02-01 20:13:25', '2025-02-01 20:13:25');
INSERT INTO public.ventas_detalle VALUES (106, 52, 3, 3, 180000.00, 540000.00, '2025-12-11 15:13:25', '2025-12-11 15:13:25');
INSERT INTO public.ventas_detalle VALUES (107, 52, 6, 1, 310000.00, 310000.00, '2025-12-11 15:13:25', '2025-12-11 15:13:25');
INSERT INTO public.ventas_detalle VALUES (108, 52, 10, 3, 195000.00, 585000.00, '2025-12-11 15:13:25', '2025-12-11 15:13:25');
INSERT INTO public.ventas_detalle VALUES (109, 53, 2, 3, 210000.00, 630000.00, '2025-12-14 03:13:25', '2025-12-14 03:13:25');
INSERT INTO public.ventas_detalle VALUES (110, 53, 10, 1, 195000.00, 195000.00, '2025-12-14 03:13:25', '2025-12-14 03:13:25');
INSERT INTO public.ventas_detalle VALUES (111, 53, 18, 1, 240000.00, 240000.00, '2025-12-14 03:13:25', '2025-12-14 03:13:25');
INSERT INTO public.ventas_detalle VALUES (112, 54, 7, 1, 160000.00, 160000.00, '2025-09-10 23:13:25', '2025-09-10 23:13:25');
INSERT INTO public.ventas_detalle VALUES (113, 54, 8, 2, 175000.00, 350000.00, '2025-09-10 23:13:25', '2025-09-10 23:13:25');
INSERT INTO public.ventas_detalle VALUES (114, 55, 7, 3, 160000.00, 480000.00, '2023-07-05 14:13:25', '2023-07-05 14:13:25');
INSERT INTO public.ventas_detalle VALUES (115, 55, 18, 2, 240000.00, 480000.00, '2023-07-05 14:13:25', '2023-07-05 14:13:25');
INSERT INTO public.ventas_detalle VALUES (116, 56, 5, 2, 190000.00, 380000.00, '2024-06-08 16:13:25', '2024-06-08 16:13:25');
INSERT INTO public.ventas_detalle VALUES (117, 56, 12, 1, 205000.00, 205000.00, '2024-06-08 16:13:25', '2024-06-08 16:13:25');
INSERT INTO public.ventas_detalle VALUES (118, 57, 10, 1, 195000.00, 195000.00, '2023-10-08 20:13:25', '2023-10-08 20:13:25');
INSERT INTO public.ventas_detalle VALUES (119, 57, 16, 3, 380000.00, 1140000.00, '2023-10-08 20:13:25', '2023-10-08 20:13:25');
INSERT INTO public.ventas_detalle VALUES (120, 58, 9, 1, 220000.00, 220000.00, '2023-06-26 00:13:25', '2023-06-26 00:13:25');
INSERT INTO public.ventas_detalle VALUES (121, 59, 12, 3, 205000.00, 615000.00, '2023-12-27 11:13:25', '2023-12-27 11:13:25');
INSERT INTO public.ventas_detalle VALUES (122, 60, 5, 2, 190000.00, 380000.00, '2024-01-23 23:13:25', '2024-01-23 23:13:25');
INSERT INTO public.ventas_detalle VALUES (123, 60, 11, 2, 150000.00, 300000.00, '2024-01-23 23:13:25', '2024-01-23 23:13:25');
INSERT INTO public.ventas_detalle VALUES (124, 60, 18, 2, 240000.00, 480000.00, '2024-01-23 23:13:25', '2024-01-23 23:13:25');
INSERT INTO public.ventas_detalle VALUES (125, 61, 15, 3, 270000.00, 810000.00, '2026-03-05 11:13:25', '2026-03-05 11:13:25');
INSERT INTO public.ventas_detalle VALUES (126, 62, 1, 1, 250000.00, 250000.00, '2024-08-02 06:13:25', '2024-08-02 06:13:25');
INSERT INTO public.ventas_detalle VALUES (127, 62, 9, 2, 220000.00, 440000.00, '2024-08-02 06:13:25', '2024-08-02 06:13:25');
INSERT INTO public.ventas_detalle VALUES (128, 62, 11, 3, 150000.00, 450000.00, '2024-08-02 06:13:25', '2024-08-02 06:13:25');
INSERT INTO public.ventas_detalle VALUES (129, 63, 1, 3, 250000.00, 750000.00, '2024-03-30 04:13:25', '2024-03-30 04:13:25');
INSERT INTO public.ventas_detalle VALUES (130, 64, 1, 1, 250000.00, 250000.00, '2023-06-24 07:13:25', '2023-06-24 07:13:25');
INSERT INTO public.ventas_detalle VALUES (131, 64, 11, 2, 150000.00, 300000.00, '2023-06-24 07:13:25', '2023-06-24 07:13:25');
INSERT INTO public.ventas_detalle VALUES (132, 64, 16, 2, 380000.00, 760000.00, '2023-06-24 07:13:25', '2023-06-24 07:13:25');
INSERT INTO public.ventas_detalle VALUES (133, 65, 8, 3, 175000.00, 525000.00, '2025-09-24 13:13:25', '2025-09-24 13:13:25');
INSERT INTO public.ventas_detalle VALUES (134, 65, 10, 1, 195000.00, 195000.00, '2025-09-24 13:13:25', '2025-09-24 13:13:25');
INSERT INTO public.ventas_detalle VALUES (135, 66, 1, 3, 250000.00, 750000.00, '2025-10-02 11:13:25', '2025-10-02 11:13:25');
INSERT INTO public.ventas_detalle VALUES (136, 66, 15, 3, 270000.00, 810000.00, '2025-10-02 11:13:25', '2025-10-02 11:13:25');
INSERT INTO public.ventas_detalle VALUES (137, 67, 6, 3, 310000.00, 930000.00, '2023-07-06 14:13:25', '2023-07-06 14:13:25');
INSERT INTO public.ventas_detalle VALUES (138, 67, 10, 2, 195000.00, 390000.00, '2023-07-06 14:13:25', '2023-07-06 14:13:25');
INSERT INTO public.ventas_detalle VALUES (139, 67, 18, 2, 240000.00, 480000.00, '2023-07-06 14:13:25', '2023-07-06 14:13:25');
INSERT INTO public.ventas_detalle VALUES (140, 68, 8, 2, 175000.00, 350000.00, '2024-02-15 09:13:25', '2024-02-15 09:13:25');
INSERT INTO public.ventas_detalle VALUES (141, 68, 12, 2, 205000.00, 410000.00, '2024-02-15 09:13:25', '2024-02-15 09:13:25');
INSERT INTO public.ventas_detalle VALUES (142, 69, 5, 3, 190000.00, 570000.00, '2023-11-13 08:13:25', '2023-11-13 08:13:25');
INSERT INTO public.ventas_detalle VALUES (143, 70, 2, 3, 210000.00, 630000.00, '2024-06-05 07:13:25', '2024-06-05 07:13:25');
INSERT INTO public.ventas_detalle VALUES (144, 70, 15, 2, 270000.00, 540000.00, '2024-06-05 07:13:25', '2024-06-05 07:13:25');
INSERT INTO public.ventas_detalle VALUES (145, 71, 7, 2, 160000.00, 320000.00, '2026-02-02 17:13:25', '2026-02-02 17:13:25');
INSERT INTO public.ventas_detalle VALUES (146, 71, 12, 1, 205000.00, 205000.00, '2026-02-02 17:13:25', '2026-02-02 17:13:25');
INSERT INTO public.ventas_detalle VALUES (147, 72, 18, 1, 240000.00, 240000.00, '2023-08-11 10:13:25', '2023-08-11 10:13:25');
INSERT INTO public.ventas_detalle VALUES (148, 73, 9, 2, 220000.00, 440000.00, '2023-06-30 00:13:25', '2023-06-30 00:13:25');
INSERT INTO public.ventas_detalle VALUES (149, 73, 16, 2, 380000.00, 760000.00, '2023-06-30 00:13:25', '2023-06-30 00:13:25');
INSERT INTO public.ventas_detalle VALUES (150, 74, 2, 1, 210000.00, 210000.00, '2025-10-06 07:13:25', '2025-10-06 07:13:25');
INSERT INTO public.ventas_detalle VALUES (151, 75, 14, 1, 290000.00, 290000.00, '2024-02-26 17:13:25', '2024-02-26 17:13:25');
INSERT INTO public.ventas_detalle VALUES (152, 76, 2, 1, 210000.00, 210000.00, '2025-09-22 00:13:25', '2025-09-22 00:13:25');
INSERT INTO public.ventas_detalle VALUES (153, 76, 12, 3, 205000.00, 615000.00, '2025-09-22 00:13:25', '2025-09-22 00:13:25');
INSERT INTO public.ventas_detalle VALUES (154, 77, 1, 3, 250000.00, 750000.00, '2023-07-03 07:13:25', '2023-07-03 07:13:25');
INSERT INTO public.ventas_detalle VALUES (155, 77, 16, 2, 380000.00, 760000.00, '2023-07-03 07:13:25', '2023-07-03 07:13:25');
INSERT INTO public.ventas_detalle VALUES (156, 78, 10, 2, 195000.00, 390000.00, '2025-07-04 23:13:25', '2025-07-04 23:13:25');
INSERT INTO public.ventas_detalle VALUES (157, 79, 1, 1, 250000.00, 250000.00, '2026-04-27 19:13:25', '2026-04-27 19:13:25');
INSERT INTO public.ventas_detalle VALUES (158, 79, 2, 1, 210000.00, 210000.00, '2026-04-27 19:13:25', '2026-04-27 19:13:25');
INSERT INTO public.ventas_detalle VALUES (159, 80, 9, 3, 220000.00, 660000.00, '2025-06-08 13:13:25', '2025-06-08 13:13:25');
INSERT INTO public.ventas_detalle VALUES (160, 81, 15, 3, 270000.00, 810000.00, '2024-01-13 12:13:25', '2024-01-13 12:13:25');
INSERT INTO public.ventas_detalle VALUES (161, 82, 7, 3, 160000.00, 480000.00, '2025-06-03 21:13:25', '2025-06-03 21:13:25');
INSERT INTO public.ventas_detalle VALUES (162, 82, 12, 3, 205000.00, 615000.00, '2025-06-03 21:13:25', '2025-06-03 21:13:25');
INSERT INTO public.ventas_detalle VALUES (163, 83, 9, 3, 220000.00, 660000.00, '2024-02-09 18:13:25', '2024-02-09 18:13:25');
INSERT INTO public.ventas_detalle VALUES (164, 84, 7, 1, 160000.00, 160000.00, '2023-09-10 19:13:25', '2023-09-10 19:13:25');
INSERT INTO public.ventas_detalle VALUES (165, 84, 16, 2, 380000.00, 760000.00, '2023-09-10 19:13:25', '2023-09-10 19:13:25');
INSERT INTO public.ventas_detalle VALUES (166, 84, 17, 3, 350000.00, 1050000.00, '2023-09-10 19:13:25', '2023-09-10 19:13:25');
INSERT INTO public.ventas_detalle VALUES (167, 85, 15, 1, 270000.00, 270000.00, '2024-06-22 17:13:25', '2024-06-22 17:13:25');
INSERT INTO public.ventas_detalle VALUES (168, 86, 1, 2, 250000.00, 500000.00, '2025-10-16 07:13:25', '2025-10-16 07:13:25');
INSERT INTO public.ventas_detalle VALUES (169, 86, 7, 2, 160000.00, 320000.00, '2025-10-16 07:13:25', '2025-10-16 07:13:25');
INSERT INTO public.ventas_detalle VALUES (170, 87, 3, 3, 180000.00, 540000.00, '2024-07-27 05:13:25', '2024-07-27 05:13:25');
INSERT INTO public.ventas_detalle VALUES (171, 87, 15, 1, 270000.00, 270000.00, '2024-07-27 05:13:25', '2024-07-27 05:13:25');
INSERT INTO public.ventas_detalle VALUES (172, 88, 5, 1, 190000.00, 190000.00, '2024-02-22 07:13:25', '2024-02-22 07:13:25');
INSERT INTO public.ventas_detalle VALUES (173, 88, 7, 1, 160000.00, 160000.00, '2024-02-22 07:13:25', '2024-02-22 07:13:25');
INSERT INTO public.ventas_detalle VALUES (174, 89, 14, 2, 290000.00, 580000.00, '2026-03-05 23:13:25', '2026-03-05 23:13:25');
INSERT INTO public.ventas_detalle VALUES (175, 89, 16, 2, 380000.00, 760000.00, '2026-03-05 23:13:25', '2026-03-05 23:13:25');
INSERT INTO public.ventas_detalle VALUES (176, 90, 5, 3, 190000.00, 570000.00, '2025-10-02 10:13:25', '2025-10-02 10:13:25');
INSERT INTO public.ventas_detalle VALUES (177, 90, 9, 1, 220000.00, 220000.00, '2025-10-02 10:13:25', '2025-10-02 10:13:25');
INSERT INTO public.ventas_detalle VALUES (178, 90, 11, 2, 150000.00, 300000.00, '2025-10-02 10:13:25', '2025-10-02 10:13:25');
INSERT INTO public.ventas_detalle VALUES (179, 91, 2, 3, 210000.00, 630000.00, '2025-08-02 06:13:25', '2025-08-02 06:13:25');
INSERT INTO public.ventas_detalle VALUES (180, 92, 7, 2, 160000.00, 320000.00, '2025-05-07 19:13:25', '2025-05-07 19:13:25');
INSERT INTO public.ventas_detalle VALUES (181, 92, 10, 3, 195000.00, 585000.00, '2025-05-07 19:13:25', '2025-05-07 19:13:25');
INSERT INTO public.ventas_detalle VALUES (182, 92, 17, 1, 350000.00, 350000.00, '2025-05-07 19:13:25', '2025-05-07 19:13:25');
INSERT INTO public.ventas_detalle VALUES (183, 93, 10, 1, 195000.00, 195000.00, '2026-05-01 04:13:25', '2026-05-01 04:13:25');
INSERT INTO public.ventas_detalle VALUES (184, 94, 6, 2, 310000.00, 620000.00, '2023-07-02 12:13:25', '2023-07-02 12:13:25');
INSERT INTO public.ventas_detalle VALUES (185, 94, 7, 3, 160000.00, 480000.00, '2023-07-02 12:13:25', '2023-07-02 12:13:25');
INSERT INTO public.ventas_detalle VALUES (186, 94, 14, 1, 290000.00, 290000.00, '2023-07-02 12:13:25', '2023-07-02 12:13:25');
INSERT INTO public.ventas_detalle VALUES (187, 95, 6, 3, 310000.00, 930000.00, '2025-10-20 22:13:25', '2025-10-20 22:13:25');
INSERT INTO public.ventas_detalle VALUES (188, 95, 16, 1, 380000.00, 380000.00, '2025-10-20 22:13:25', '2025-10-20 22:13:25');
INSERT INTO public.ventas_detalle VALUES (189, 96, 2, 1, 210000.00, 210000.00, '2025-11-03 00:13:25', '2025-11-03 00:13:25');
INSERT INTO public.ventas_detalle VALUES (190, 97, 1, 2, 250000.00, 500000.00, '2024-10-07 10:13:25', '2024-10-07 10:13:25');
INSERT INTO public.ventas_detalle VALUES (191, 97, 15, 3, 270000.00, 810000.00, '2024-10-07 10:13:25', '2024-10-07 10:13:25');
INSERT INTO public.ventas_detalle VALUES (192, 98, 2, 2, 210000.00, 420000.00, '2025-02-25 04:13:25', '2025-02-25 04:13:25');
INSERT INTO public.ventas_detalle VALUES (193, 98, 7, 1, 160000.00, 160000.00, '2025-02-25 04:13:25', '2025-02-25 04:13:25');
INSERT INTO public.ventas_detalle VALUES (194, 98, 15, 2, 270000.00, 540000.00, '2025-02-25 04:13:25', '2025-02-25 04:13:25');
INSERT INTO public.ventas_detalle VALUES (195, 99, 9, 1, 220000.00, 220000.00, '2026-05-05 21:13:25', '2026-05-05 21:13:25');
INSERT INTO public.ventas_detalle VALUES (196, 99, 10, 2, 195000.00, 390000.00, '2026-05-05 21:13:25', '2026-05-05 21:13:25');
INSERT INTO public.ventas_detalle VALUES (197, 99, 14, 2, 290000.00, 580000.00, '2026-05-05 21:13:25', '2026-05-05 21:13:25');
INSERT INTO public.ventas_detalle VALUES (198, 100, 7, 3, 160000.00, 480000.00, '2023-11-07 13:13:25', '2023-11-07 13:13:25');
INSERT INTO public.ventas_detalle VALUES (199, 100, 11, 1, 150000.00, 150000.00, '2023-11-07 13:13:25', '2023-11-07 13:13:25');
INSERT INTO public.ventas_detalle VALUES (200, 100, 17, 1, 350000.00, 350000.00, '2023-11-07 13:13:25', '2023-11-07 13:13:25');
INSERT INTO public.ventas_detalle VALUES (201, 101, 3, 3, 180000.00, 540000.00, '2024-03-24 15:13:25', '2024-03-24 15:13:25');
INSERT INTO public.ventas_detalle VALUES (202, 101, 6, 1, 310000.00, 310000.00, '2024-03-24 15:13:25', '2024-03-24 15:13:25');
INSERT INTO public.ventas_detalle VALUES (203, 101, 8, 3, 175000.00, 525000.00, '2024-03-24 15:13:25', '2024-03-24 15:13:25');
INSERT INTO public.ventas_detalle VALUES (204, 102, 17, 2, 350000.00, 700000.00, '2025-08-10 02:13:25', '2025-08-10 02:13:25');
INSERT INTO public.ventas_detalle VALUES (205, 102, 18, 1, 240000.00, 240000.00, '2025-08-10 02:13:25', '2025-08-10 02:13:25');
INSERT INTO public.ventas_detalle VALUES (206, 103, 17, 2, 350000.00, 700000.00, '2024-10-25 14:13:25', '2024-10-25 14:13:25');
INSERT INTO public.ventas_detalle VALUES (207, 104, 12, 3, 205000.00, 615000.00, '2025-04-30 03:13:25', '2025-04-30 03:13:25');
INSERT INTO public.ventas_detalle VALUES (208, 104, 18, 1, 240000.00, 240000.00, '2025-04-30 03:13:25', '2025-04-30 03:13:25');
INSERT INTO public.ventas_detalle VALUES (209, 105, 2, 3, 210000.00, 630000.00, '2024-11-07 06:13:25', '2024-11-07 06:13:25');
INSERT INTO public.ventas_detalle VALUES (210, 106, 15, 1, 270000.00, 270000.00, '2024-09-17 12:13:25', '2024-09-17 12:13:25');
INSERT INTO public.ventas_detalle VALUES (211, 107, 7, 3, 160000.00, 480000.00, '2024-12-03 08:13:25', '2024-12-03 08:13:25');
INSERT INTO public.ventas_detalle VALUES (212, 107, 12, 1, 205000.00, 205000.00, '2024-12-03 08:13:25', '2024-12-03 08:13:25');
INSERT INTO public.ventas_detalle VALUES (213, 108, 10, 2, 195000.00, 390000.00, '2024-12-11 23:13:25', '2024-12-11 23:13:25');
INSERT INTO public.ventas_detalle VALUES (214, 109, 3, 1, 180000.00, 180000.00, '2025-07-04 05:13:25', '2025-07-04 05:13:25');
INSERT INTO public.ventas_detalle VALUES (215, 110, 9, 1, 220000.00, 220000.00, '2024-09-20 03:13:25', '2024-09-20 03:13:25');
INSERT INTO public.ventas_detalle VALUES (216, 111, 9, 3, 220000.00, 660000.00, '2025-09-07 14:13:25', '2025-09-07 14:13:25');
INSERT INTO public.ventas_detalle VALUES (217, 111, 12, 1, 205000.00, 205000.00, '2025-09-07 14:13:25', '2025-09-07 14:13:25');
INSERT INTO public.ventas_detalle VALUES (218, 112, 7, 3, 160000.00, 480000.00, '2024-08-13 14:13:25', '2024-08-13 14:13:25');
INSERT INTO public.ventas_detalle VALUES (219, 112, 11, 1, 150000.00, 150000.00, '2024-08-13 14:13:25', '2024-08-13 14:13:25');
INSERT INTO public.ventas_detalle VALUES (220, 112, 16, 3, 380000.00, 1140000.00, '2024-08-13 14:13:25', '2024-08-13 14:13:25');
INSERT INTO public.ventas_detalle VALUES (221, 113, 5, 1, 190000.00, 190000.00, '2024-02-26 16:13:25', '2024-02-26 16:13:25');
INSERT INTO public.ventas_detalle VALUES (222, 113, 10, 1, 195000.00, 195000.00, '2024-02-26 16:13:25', '2024-02-26 16:13:25');
INSERT INTO public.ventas_detalle VALUES (223, 114, 9, 1, 220000.00, 220000.00, '2026-05-02 06:13:25', '2026-05-02 06:13:25');
INSERT INTO public.ventas_detalle VALUES (224, 114, 10, 2, 195000.00, 390000.00, '2026-05-02 06:13:25', '2026-05-02 06:13:25');
INSERT INTO public.ventas_detalle VALUES (225, 114, 15, 1, 270000.00, 270000.00, '2026-05-02 06:13:25', '2026-05-02 06:13:25');
INSERT INTO public.ventas_detalle VALUES (226, 115, 10, 1, 195000.00, 195000.00, '2024-01-31 09:13:25', '2024-01-31 09:13:25');
INSERT INTO public.ventas_detalle VALUES (227, 116, 11, 3, 150000.00, 450000.00, '2025-01-23 17:13:25', '2025-01-23 17:13:25');
INSERT INTO public.ventas_detalle VALUES (228, 116, 12, 1, 205000.00, 205000.00, '2025-01-23 17:13:25', '2025-01-23 17:13:25');
INSERT INTO public.ventas_detalle VALUES (229, 116, 18, 2, 240000.00, 480000.00, '2025-01-23 17:13:25', '2025-01-23 17:13:25');
INSERT INTO public.ventas_detalle VALUES (230, 117, 1, 3, 250000.00, 750000.00, '2026-01-26 07:13:25', '2026-01-26 07:13:25');
INSERT INTO public.ventas_detalle VALUES (231, 117, 6, 2, 310000.00, 620000.00, '2026-01-26 07:13:25', '2026-01-26 07:13:25');
INSERT INTO public.ventas_detalle VALUES (232, 117, 9, 1, 220000.00, 220000.00, '2026-01-26 07:13:25', '2026-01-26 07:13:25');
INSERT INTO public.ventas_detalle VALUES (233, 118, 5, 2, 190000.00, 380000.00, '2025-10-17 14:13:25', '2025-10-17 14:13:25');
INSERT INTO public.ventas_detalle VALUES (234, 119, 1, 1, 250000.00, 250000.00, '2024-03-29 17:13:25', '2024-03-29 17:13:25');
INSERT INTO public.ventas_detalle VALUES (235, 120, 1, 1, 250000.00, 250000.00, '2023-08-01 05:13:25', '2023-08-01 05:13:25');
INSERT INTO public.ventas_detalle VALUES (236, 120, 9, 1, 220000.00, 220000.00, '2023-08-01 05:13:25', '2023-08-01 05:13:25');
INSERT INTO public.ventas_detalle VALUES (237, 121, 1, 2, 250000.00, 500000.00, '2025-03-28 05:13:25', '2025-03-28 05:13:25');
INSERT INTO public.ventas_detalle VALUES (238, 121, 5, 2, 190000.00, 380000.00, '2025-03-28 05:13:25', '2025-03-28 05:13:25');
INSERT INTO public.ventas_detalle VALUES (239, 121, 11, 3, 150000.00, 450000.00, '2025-03-28 05:13:25', '2025-03-28 05:13:25');
INSERT INTO public.ventas_detalle VALUES (240, 122, 5, 3, 190000.00, 570000.00, '2023-08-28 05:13:25', '2023-08-28 05:13:25');
INSERT INTO public.ventas_detalle VALUES (241, 122, 12, 2, 205000.00, 410000.00, '2023-08-28 05:13:25', '2023-08-28 05:13:25');
INSERT INTO public.ventas_detalle VALUES (242, 122, 14, 1, 290000.00, 290000.00, '2023-08-28 05:13:25', '2023-08-28 05:13:25');
INSERT INTO public.ventas_detalle VALUES (243, 123, 5, 2, 190000.00, 380000.00, '2025-06-01 15:13:25', '2025-06-01 15:13:25');
INSERT INTO public.ventas_detalle VALUES (244, 124, 10, 1, 195000.00, 195000.00, '2026-03-16 13:13:25', '2026-03-16 13:13:25');
INSERT INTO public.ventas_detalle VALUES (245, 125, 17, 1, 350000.00, 350000.00, '2024-11-15 15:13:25', '2024-11-15 15:13:25');
INSERT INTO public.ventas_detalle VALUES (246, 126, 3, 3, 180000.00, 540000.00, '2025-02-17 09:13:25', '2025-02-17 09:13:25');
INSERT INTO public.ventas_detalle VALUES (247, 126, 11, 1, 150000.00, 150000.00, '2025-02-17 09:13:25', '2025-02-17 09:13:25');
INSERT INTO public.ventas_detalle VALUES (248, 126, 16, 3, 380000.00, 1140000.00, '2025-02-17 09:13:25', '2025-02-17 09:13:25');
INSERT INTO public.ventas_detalle VALUES (249, 127, 2, 3, 210000.00, 630000.00, '2025-06-27 17:13:25', '2025-06-27 17:13:25');
INSERT INTO public.ventas_detalle VALUES (250, 128, 5, 3, 190000.00, 570000.00, '2023-09-15 12:13:25', '2023-09-15 12:13:25');
INSERT INTO public.ventas_detalle VALUES (251, 128, 8, 1, 175000.00, 175000.00, '2023-09-15 12:13:25', '2023-09-15 12:13:25');
INSERT INTO public.ventas_detalle VALUES (252, 128, 18, 3, 240000.00, 720000.00, '2023-09-15 12:13:25', '2023-09-15 12:13:25');
INSERT INTO public.ventas_detalle VALUES (253, 129, 17, 3, 350000.00, 1050000.00, '2023-08-01 21:13:25', '2023-08-01 21:13:25');
INSERT INTO public.ventas_detalle VALUES (254, 130, 3, 3, 180000.00, 540000.00, '2023-10-05 05:13:25', '2023-10-05 05:13:25');
INSERT INTO public.ventas_detalle VALUES (255, 130, 7, 3, 160000.00, 480000.00, '2023-10-05 05:13:25', '2023-10-05 05:13:25');
INSERT INTO public.ventas_detalle VALUES (256, 130, 16, 3, 380000.00, 1140000.00, '2023-10-05 05:13:25', '2023-10-05 05:13:25');
INSERT INTO public.ventas_detalle VALUES (257, 131, 11, 3, 150000.00, 450000.00, '2025-12-09 23:13:25', '2025-12-09 23:13:25');
INSERT INTO public.ventas_detalle VALUES (258, 132, 14, 3, 290000.00, 870000.00, '2024-11-20 17:13:25', '2024-11-20 17:13:25');
INSERT INTO public.ventas_detalle VALUES (259, 133, 2, 3, 210000.00, 630000.00, '2023-07-28 16:13:25', '2023-07-28 16:13:25');
INSERT INTO public.ventas_detalle VALUES (260, 133, 6, 2, 310000.00, 620000.00, '2023-07-28 16:13:25', '2023-07-28 16:13:25');
INSERT INTO public.ventas_detalle VALUES (261, 133, 17, 3, 350000.00, 1050000.00, '2023-07-28 16:13:25', '2023-07-28 16:13:25');
INSERT INTO public.ventas_detalle VALUES (262, 134, 10, 3, 195000.00, 585000.00, '2025-12-22 02:13:25', '2025-12-22 02:13:25');
INSERT INTO public.ventas_detalle VALUES (263, 134, 14, 2, 290000.00, 580000.00, '2025-12-22 02:13:25', '2025-12-22 02:13:25');
INSERT INTO public.ventas_detalle VALUES (264, 135, 1, 1, 250000.00, 250000.00, '2024-03-17 12:13:25', '2024-03-17 12:13:25');
INSERT INTO public.ventas_detalle VALUES (265, 135, 2, 3, 210000.00, 630000.00, '2024-03-17 12:13:25', '2024-03-17 12:13:25');
INSERT INTO public.ventas_detalle VALUES (266, 135, 10, 3, 195000.00, 585000.00, '2024-03-17 12:13:25', '2024-03-17 12:13:25');
INSERT INTO public.ventas_detalle VALUES (267, 136, 17, 3, 350000.00, 1050000.00, '2023-12-17 19:13:25', '2023-12-17 19:13:25');
INSERT INTO public.ventas_detalle VALUES (268, 137, 6, 1, 310000.00, 310000.00, '2024-07-17 02:13:25', '2024-07-17 02:13:25');
INSERT INTO public.ventas_detalle VALUES (269, 137, 8, 2, 175000.00, 350000.00, '2024-07-17 02:13:25', '2024-07-17 02:13:25');
INSERT INTO public.ventas_detalle VALUES (270, 137, 18, 2, 240000.00, 480000.00, '2024-07-17 02:13:25', '2024-07-17 02:13:25');
INSERT INTO public.ventas_detalle VALUES (271, 138, 16, 2, 380000.00, 760000.00, '2023-11-29 23:13:25', '2023-11-29 23:13:25');
INSERT INTO public.ventas_detalle VALUES (272, 139, 8, 2, 175000.00, 350000.00, '2023-09-22 15:13:25', '2023-09-22 15:13:25');
INSERT INTO public.ventas_detalle VALUES (273, 139, 17, 2, 350000.00, 700000.00, '2023-09-22 15:13:25', '2023-09-22 15:13:25');
INSERT INTO public.ventas_detalle VALUES (274, 140, 12, 3, 205000.00, 615000.00, '2025-09-06 11:13:25', '2025-09-06 11:13:25');
INSERT INTO public.ventas_detalle VALUES (275, 140, 18, 2, 240000.00, 480000.00, '2025-09-06 11:13:25', '2025-09-06 11:13:25');
INSERT INTO public.ventas_detalle VALUES (276, 141, 12, 2, 205000.00, 410000.00, '2025-12-05 13:13:25', '2025-12-05 13:13:25');
INSERT INTO public.ventas_detalle VALUES (277, 141, 18, 1, 240000.00, 240000.00, '2025-12-05 13:13:25', '2025-12-05 13:13:25');
INSERT INTO public.ventas_detalle VALUES (278, 142, 7, 3, 160000.00, 480000.00, '2025-04-02 03:13:25', '2025-04-02 03:13:25');
INSERT INTO public.ventas_detalle VALUES (279, 142, 17, 3, 350000.00, 1050000.00, '2025-04-02 03:13:25', '2025-04-02 03:13:25');
INSERT INTO public.ventas_detalle VALUES (280, 143, 1, 1, 250000.00, 250000.00, '2025-02-12 14:13:25', '2025-02-12 14:13:25');
INSERT INTO public.ventas_detalle VALUES (281, 143, 14, 3, 290000.00, 870000.00, '2025-02-12 14:13:25', '2025-02-12 14:13:25');
INSERT INTO public.ventas_detalle VALUES (282, 143, 18, 1, 240000.00, 240000.00, '2025-02-12 14:13:25', '2025-02-12 14:13:25');
INSERT INTO public.ventas_detalle VALUES (283, 144, 15, 1, 270000.00, 270000.00, '2024-08-01 13:13:25', '2024-08-01 13:13:25');
INSERT INTO public.ventas_detalle VALUES (284, 144, 18, 3, 240000.00, 720000.00, '2024-08-01 13:13:25', '2024-08-01 13:13:25');
INSERT INTO public.ventas_detalle VALUES (285, 145, 15, 2, 270000.00, 540000.00, '2023-12-14 19:13:25', '2023-12-14 19:13:25');
INSERT INTO public.ventas_detalle VALUES (286, 146, 6, 1, 310000.00, 310000.00, '2025-03-23 23:13:25', '2025-03-23 23:13:25');
INSERT INTO public.ventas_detalle VALUES (287, 146, 9, 2, 220000.00, 440000.00, '2025-03-23 23:13:25', '2025-03-23 23:13:25');
INSERT INTO public.ventas_detalle VALUES (288, 147, 2, 2, 210000.00, 420000.00, '2025-11-06 11:13:25', '2025-11-06 11:13:25');
INSERT INTO public.ventas_detalle VALUES (289, 147, 10, 2, 195000.00, 390000.00, '2025-11-06 11:13:25', '2025-11-06 11:13:25');
INSERT INTO public.ventas_detalle VALUES (290, 148, 17, 1, 350000.00, 350000.00, '2024-03-27 00:13:25', '2024-03-27 00:13:25');
INSERT INTO public.ventas_detalle VALUES (291, 149, 1, 1, 250000.00, 250000.00, '2023-12-21 13:13:25', '2023-12-21 13:13:25');
INSERT INTO public.ventas_detalle VALUES (292, 149, 2, 2, 210000.00, 420000.00, '2023-12-21 13:13:25', '2023-12-21 13:13:25');
INSERT INTO public.ventas_detalle VALUES (293, 149, 14, 1, 290000.00, 290000.00, '2023-12-21 13:13:25', '2023-12-21 13:13:25');
INSERT INTO public.ventas_detalle VALUES (294, 150, 18, 2, 240000.00, 480000.00, '2024-12-22 02:13:25', '2024-12-22 02:13:25');
INSERT INTO public.ventas_detalle VALUES (295, 151, 2, 1, 210000.00, 210000.00, '2023-10-07 10:13:25', '2023-10-07 10:13:25');
INSERT INTO public.ventas_detalle VALUES (296, 151, 3, 1, 180000.00, 180000.00, '2023-10-07 10:13:25', '2023-10-07 10:13:25');
INSERT INTO public.ventas_detalle VALUES (297, 151, 17, 3, 350000.00, 1050000.00, '2023-10-07 10:13:25', '2023-10-07 10:13:25');
INSERT INTO public.ventas_detalle VALUES (298, 152, 3, 3, 180000.00, 540000.00, '2024-02-05 14:13:25', '2024-02-05 14:13:25');
INSERT INTO public.ventas_detalle VALUES (299, 153, 3, 2, 180000.00, 360000.00, '2025-03-30 06:13:25', '2025-03-30 06:13:25');
INSERT INTO public.ventas_detalle VALUES (300, 154, 2, 1, 210000.00, 210000.00, '2025-12-05 05:13:25', '2025-12-05 05:13:25');
INSERT INTO public.ventas_detalle VALUES (301, 154, 14, 1, 290000.00, 290000.00, '2025-12-05 05:13:25', '2025-12-05 05:13:25');
INSERT INTO public.ventas_detalle VALUES (302, 154, 18, 2, 240000.00, 480000.00, '2025-12-05 05:13:25', '2025-12-05 05:13:25');
INSERT INTO public.ventas_detalle VALUES (303, 155, 2, 3, 210000.00, 630000.00, '2023-06-22 20:13:25', '2023-06-22 20:13:25');
INSERT INTO public.ventas_detalle VALUES (304, 155, 8, 1, 175000.00, 175000.00, '2023-06-22 20:13:25', '2023-06-22 20:13:25');
INSERT INTO public.ventas_detalle VALUES (305, 156, 2, 1, 210000.00, 210000.00, '2025-02-23 21:13:25', '2025-02-23 21:13:25');
INSERT INTO public.ventas_detalle VALUES (306, 156, 10, 3, 195000.00, 585000.00, '2025-02-23 21:13:25', '2025-02-23 21:13:25');
INSERT INTO public.ventas_detalle VALUES (307, 156, 14, 3, 290000.00, 870000.00, '2025-02-23 21:13:25', '2025-02-23 21:13:25');
INSERT INTO public.ventas_detalle VALUES (308, 157, 2, 3, 210000.00, 630000.00, '2023-09-11 23:13:25', '2023-09-11 23:13:25');
INSERT INTO public.ventas_detalle VALUES (309, 157, 17, 2, 350000.00, 700000.00, '2023-09-11 23:13:25', '2023-09-11 23:13:25');
INSERT INTO public.ventas_detalle VALUES (310, 158, 5, 2, 190000.00, 380000.00, '2024-03-03 11:13:25', '2024-03-03 11:13:25');
INSERT INTO public.ventas_detalle VALUES (311, 159, 8, 3, 175000.00, 525000.00, '2025-10-01 05:13:25', '2025-10-01 05:13:25');
INSERT INTO public.ventas_detalle VALUES (312, 160, 10, 2, 195000.00, 390000.00, '2023-08-24 21:13:25', '2023-08-24 21:13:25');
INSERT INTO public.ventas_detalle VALUES (313, 160, 11, 1, 150000.00, 150000.00, '2023-08-24 21:13:25', '2023-08-24 21:13:25');
INSERT INTO public.ventas_detalle VALUES (314, 161, 6, 2, 310000.00, 620000.00, '2026-01-26 11:13:25', '2026-01-26 11:13:25');
INSERT INTO public.ventas_detalle VALUES (315, 161, 7, 1, 160000.00, 160000.00, '2026-01-26 11:13:25', '2026-01-26 11:13:25');
INSERT INTO public.ventas_detalle VALUES (316, 162, 7, 1, 160000.00, 160000.00, '2023-08-18 08:13:25', '2023-08-18 08:13:25');
INSERT INTO public.ventas_detalle VALUES (317, 162, 8, 2, 175000.00, 350000.00, '2023-08-18 08:13:25', '2023-08-18 08:13:25');
INSERT INTO public.ventas_detalle VALUES (318, 163, 7, 2, 160000.00, 320000.00, '2026-04-09 23:13:25', '2026-04-09 23:13:25');
INSERT INTO public.ventas_detalle VALUES (319, 163, 9, 1, 220000.00, 220000.00, '2026-04-09 23:13:25', '2026-04-09 23:13:25');
INSERT INTO public.ventas_detalle VALUES (320, 163, 18, 2, 240000.00, 480000.00, '2026-04-09 23:13:25', '2026-04-09 23:13:25');
INSERT INTO public.ventas_detalle VALUES (321, 164, 5, 1, 190000.00, 190000.00, '2026-06-01 18:13:25', '2026-06-01 18:13:25');
INSERT INTO public.ventas_detalle VALUES (322, 164, 8, 2, 175000.00, 350000.00, '2026-06-01 18:13:25', '2026-06-01 18:13:25');
INSERT INTO public.ventas_detalle VALUES (323, 164, 18, 1, 240000.00, 240000.00, '2026-06-01 18:13:25', '2026-06-01 18:13:25');
INSERT INTO public.ventas_detalle VALUES (324, 165, 3, 2, 180000.00, 360000.00, '2025-04-09 14:13:25', '2025-04-09 14:13:25');
INSERT INTO public.ventas_detalle VALUES (325, 165, 10, 2, 195000.00, 390000.00, '2025-04-09 14:13:25', '2025-04-09 14:13:25');
INSERT INTO public.ventas_detalle VALUES (326, 165, 15, 2, 270000.00, 540000.00, '2025-04-09 14:13:25', '2025-04-09 14:13:25');
INSERT INTO public.ventas_detalle VALUES (327, 166, 3, 3, 180000.00, 540000.00, '2024-12-12 20:13:25', '2024-12-12 20:13:25');
INSERT INTO public.ventas_detalle VALUES (328, 166, 10, 1, 195000.00, 195000.00, '2024-12-12 20:13:25', '2024-12-12 20:13:25');
INSERT INTO public.ventas_detalle VALUES (329, 167, 5, 1, 190000.00, 190000.00, '2023-10-17 20:13:25', '2023-10-17 20:13:25');
INSERT INTO public.ventas_detalle VALUES (330, 167, 8, 3, 175000.00, 525000.00, '2023-10-17 20:13:25', '2023-10-17 20:13:25');
INSERT INTO public.ventas_detalle VALUES (331, 167, 18, 1, 240000.00, 240000.00, '2023-10-17 20:13:25', '2023-10-17 20:13:25');
INSERT INTO public.ventas_detalle VALUES (332, 168, 11, 2, 150000.00, 300000.00, '2023-09-15 04:13:25', '2023-09-15 04:13:25');
INSERT INTO public.ventas_detalle VALUES (333, 168, 16, 3, 380000.00, 1140000.00, '2023-09-15 04:13:25', '2023-09-15 04:13:25');
INSERT INTO public.ventas_detalle VALUES (334, 169, 5, 1, 190000.00, 190000.00, '2026-01-17 11:13:25', '2026-01-17 11:13:25');
INSERT INTO public.ventas_detalle VALUES (335, 169, 9, 2, 220000.00, 440000.00, '2026-01-17 11:13:25', '2026-01-17 11:13:25');
INSERT INTO public.ventas_detalle VALUES (336, 170, 11, 3, 150000.00, 450000.00, '2025-02-03 05:13:26', '2025-02-03 05:13:26');
INSERT INTO public.ventas_detalle VALUES (337, 170, 12, 1, 205000.00, 205000.00, '2025-02-03 05:13:26', '2025-02-03 05:13:26');
INSERT INTO public.ventas_detalle VALUES (338, 170, 17, 2, 350000.00, 700000.00, '2025-02-03 05:13:26', '2025-02-03 05:13:26');
INSERT INTO public.ventas_detalle VALUES (339, 171, 5, 2, 190000.00, 380000.00, '2024-02-11 23:13:26', '2024-02-11 23:13:26');
INSERT INTO public.ventas_detalle VALUES (340, 171, 6, 1, 310000.00, 310000.00, '2024-02-11 23:13:26', '2024-02-11 23:13:26');
INSERT INTO public.ventas_detalle VALUES (341, 171, 18, 2, 240000.00, 480000.00, '2024-02-11 23:13:26', '2024-02-11 23:13:26');
INSERT INTO public.ventas_detalle VALUES (342, 172, 7, 2, 160000.00, 320000.00, '2024-02-08 11:13:26', '2024-02-08 11:13:26');
INSERT INTO public.ventas_detalle VALUES (343, 172, 10, 3, 195000.00, 585000.00, '2024-02-08 11:13:26', '2024-02-08 11:13:26');
INSERT INTO public.ventas_detalle VALUES (344, 172, 14, 3, 290000.00, 870000.00, '2024-02-08 11:13:26', '2024-02-08 11:13:26');
INSERT INTO public.ventas_detalle VALUES (345, 173, 11, 2, 150000.00, 300000.00, '2026-05-28 23:13:26', '2026-05-28 23:13:26');
INSERT INTO public.ventas_detalle VALUES (346, 173, 15, 3, 270000.00, 810000.00, '2026-05-28 23:13:26', '2026-05-28 23:13:26');
INSERT INTO public.ventas_detalle VALUES (347, 173, 17, 3, 350000.00, 1050000.00, '2026-05-28 23:13:26', '2026-05-28 23:13:26');
INSERT INTO public.ventas_detalle VALUES (348, 174, 2, 3, 210000.00, 630000.00, '2026-05-11 19:13:26', '2026-05-11 19:13:26');
INSERT INTO public.ventas_detalle VALUES (349, 174, 5, 1, 190000.00, 190000.00, '2026-05-11 19:13:26', '2026-05-11 19:13:26');
INSERT INTO public.ventas_detalle VALUES (350, 175, 3, 2, 180000.00, 360000.00, '2023-12-04 14:13:26', '2023-12-04 14:13:26');
INSERT INTO public.ventas_detalle VALUES (351, 175, 15, 3, 270000.00, 810000.00, '2023-12-04 14:13:26', '2023-12-04 14:13:26');
INSERT INTO public.ventas_detalle VALUES (352, 175, 16, 1, 380000.00, 380000.00, '2023-12-04 14:13:26', '2023-12-04 14:13:26');
INSERT INTO public.ventas_detalle VALUES (353, 176, 7, 1, 160000.00, 160000.00, '2024-05-04 09:13:26', '2024-05-04 09:13:26');
INSERT INTO public.ventas_detalle VALUES (354, 176, 11, 1, 150000.00, 150000.00, '2024-05-04 09:13:26', '2024-05-04 09:13:26');
INSERT INTO public.ventas_detalle VALUES (355, 176, 15, 1, 270000.00, 270000.00, '2024-05-04 09:13:26', '2024-05-04 09:13:26');
INSERT INTO public.ventas_detalle VALUES (356, 177, 9, 2, 220000.00, 440000.00, '2025-03-31 14:13:26', '2025-03-31 14:13:26');
INSERT INTO public.ventas_detalle VALUES (357, 177, 12, 2, 205000.00, 410000.00, '2025-03-31 14:13:26', '2025-03-31 14:13:26');
INSERT INTO public.ventas_detalle VALUES (358, 177, 18, 2, 240000.00, 480000.00, '2025-03-31 14:13:26', '2025-03-31 14:13:26');
INSERT INTO public.ventas_detalle VALUES (359, 178, 5, 2, 190000.00, 380000.00, '2024-03-25 07:13:26', '2024-03-25 07:13:26');
INSERT INTO public.ventas_detalle VALUES (360, 178, 6, 3, 310000.00, 930000.00, '2024-03-25 07:13:26', '2024-03-25 07:13:26');
INSERT INTO public.ventas_detalle VALUES (361, 178, 16, 3, 380000.00, 1140000.00, '2024-03-25 07:13:26', '2024-03-25 07:13:26');
INSERT INTO public.ventas_detalle VALUES (362, 179, 10, 2, 195000.00, 390000.00, '2024-07-29 15:13:26', '2024-07-29 15:13:26');
INSERT INTO public.ventas_detalle VALUES (363, 180, 8, 3, 175000.00, 525000.00, '2024-01-08 15:13:26', '2024-01-08 15:13:26');
INSERT INTO public.ventas_detalle VALUES (364, 180, 12, 1, 205000.00, 205000.00, '2024-01-08 15:13:26', '2024-01-08 15:13:26');
INSERT INTO public.ventas_detalle VALUES (365, 180, 14, 2, 290000.00, 580000.00, '2024-01-08 15:13:26', '2024-01-08 15:13:26');
INSERT INTO public.ventas_detalle VALUES (366, 181, 18, 2, 240000.00, 480000.00, '2026-03-04 18:13:26', '2026-03-04 18:13:26');
INSERT INTO public.ventas_detalle VALUES (367, 182, 2, 3, 210000.00, 630000.00, '2024-07-10 09:13:26', '2024-07-10 09:13:26');
INSERT INTO public.ventas_detalle VALUES (368, 182, 11, 2, 150000.00, 300000.00, '2024-07-10 09:13:26', '2024-07-10 09:13:26');
INSERT INTO public.ventas_detalle VALUES (369, 182, 17, 3, 350000.00, 1050000.00, '2024-07-10 09:13:26', '2024-07-10 09:13:26');
INSERT INTO public.ventas_detalle VALUES (370, 183, 8, 2, 175000.00, 350000.00, '2023-10-24 03:13:26', '2023-10-24 03:13:26');
INSERT INTO public.ventas_detalle VALUES (371, 183, 14, 3, 290000.00, 870000.00, '2023-10-24 03:13:26', '2023-10-24 03:13:26');
INSERT INTO public.ventas_detalle VALUES (372, 183, 18, 3, 240000.00, 720000.00, '2023-10-24 03:13:26', '2023-10-24 03:13:26');
INSERT INTO public.ventas_detalle VALUES (373, 184, 6, 2, 310000.00, 620000.00, '2024-06-30 23:13:26', '2024-06-30 23:13:26');
INSERT INTO public.ventas_detalle VALUES (374, 184, 14, 1, 290000.00, 290000.00, '2024-06-30 23:13:26', '2024-06-30 23:13:26');
INSERT INTO public.ventas_detalle VALUES (375, 185, 2, 1, 210000.00, 210000.00, '2024-10-19 05:13:26', '2024-10-19 05:13:26');
INSERT INTO public.ventas_detalle VALUES (376, 186, 11, 3, 150000.00, 450000.00, '2024-10-31 07:13:26', '2024-10-31 07:13:26');
INSERT INTO public.ventas_detalle VALUES (377, 187, 3, 3, 180000.00, 540000.00, '2025-08-09 07:13:26', '2025-08-09 07:13:26');
INSERT INTO public.ventas_detalle VALUES (378, 187, 17, 1, 350000.00, 350000.00, '2025-08-09 07:13:26', '2025-08-09 07:13:26');
INSERT INTO public.ventas_detalle VALUES (379, 187, 18, 3, 240000.00, 720000.00, '2025-08-09 07:13:26', '2025-08-09 07:13:26');
INSERT INTO public.ventas_detalle VALUES (380, 188, 14, 3, 290000.00, 870000.00, '2026-03-08 05:13:26', '2026-03-08 05:13:26');
INSERT INTO public.ventas_detalle VALUES (381, 188, 17, 3, 350000.00, 1050000.00, '2026-03-08 05:13:26', '2026-03-08 05:13:26');
INSERT INTO public.ventas_detalle VALUES (382, 189, 8, 2, 175000.00, 350000.00, '2026-02-12 10:13:26', '2026-02-12 10:13:26');
INSERT INTO public.ventas_detalle VALUES (383, 189, 15, 2, 270000.00, 540000.00, '2026-02-12 10:13:26', '2026-02-12 10:13:26');
INSERT INTO public.ventas_detalle VALUES (384, 189, 17, 3, 350000.00, 1050000.00, '2026-02-12 10:13:26', '2026-02-12 10:13:26');
INSERT INTO public.ventas_detalle VALUES (385, 190, 1, 3, 250000.00, 750000.00, '2023-11-15 22:13:26', '2023-11-15 22:13:26');
INSERT INTO public.ventas_detalle VALUES (386, 190, 16, 3, 380000.00, 1140000.00, '2023-11-15 22:13:26', '2023-11-15 22:13:26');
INSERT INTO public.ventas_detalle VALUES (387, 191, 2, 2, 210000.00, 420000.00, '2024-09-07 16:13:26', '2024-09-07 16:13:26');
INSERT INTO public.ventas_detalle VALUES (388, 191, 18, 3, 240000.00, 720000.00, '2024-09-07 16:13:26', '2024-09-07 16:13:26');
INSERT INTO public.ventas_detalle VALUES (389, 192, 11, 3, 150000.00, 450000.00, '2026-06-16 15:13:26', '2026-06-16 15:13:26');
INSERT INTO public.ventas_detalle VALUES (390, 193, 5, 2, 190000.00, 380000.00, '2024-06-09 02:13:26', '2024-06-09 02:13:26');
INSERT INTO public.ventas_detalle VALUES (391, 193, 10, 2, 195000.00, 390000.00, '2024-06-09 02:13:26', '2024-06-09 02:13:26');
INSERT INTO public.ventas_detalle VALUES (392, 194, 1, 3, 250000.00, 750000.00, '2024-11-27 19:13:26', '2024-11-27 19:13:26');
INSERT INTO public.ventas_detalle VALUES (393, 194, 7, 3, 160000.00, 480000.00, '2024-11-27 19:13:26', '2024-11-27 19:13:26');
INSERT INTO public.ventas_detalle VALUES (394, 194, 11, 1, 150000.00, 150000.00, '2024-11-27 19:13:26', '2024-11-27 19:13:26');
INSERT INTO public.ventas_detalle VALUES (395, 195, 3, 2, 180000.00, 360000.00, '2026-03-22 19:13:26', '2026-03-22 19:13:26');
INSERT INTO public.ventas_detalle VALUES (396, 196, 5, 3, 190000.00, 570000.00, '2024-06-14 19:13:26', '2024-06-14 19:13:26');
INSERT INTO public.ventas_detalle VALUES (397, 196, 16, 1, 380000.00, 380000.00, '2024-06-14 19:13:26', '2024-06-14 19:13:26');
INSERT INTO public.ventas_detalle VALUES (398, 197, 1, 2, 250000.00, 500000.00, '2024-03-20 01:13:26', '2024-03-20 01:13:26');
INSERT INTO public.ventas_detalle VALUES (399, 198, 2, 1, 210000.00, 210000.00, '2023-08-10 01:13:26', '2023-08-10 01:13:26');
INSERT INTO public.ventas_detalle VALUES (400, 198, 8, 2, 175000.00, 350000.00, '2023-08-10 01:13:26', '2023-08-10 01:13:26');
INSERT INTO public.ventas_detalle VALUES (401, 198, 10, 3, 195000.00, 585000.00, '2023-08-10 01:13:26', '2023-08-10 01:13:26');
INSERT INTO public.ventas_detalle VALUES (402, 199, 3, 3, 180000.00, 540000.00, '2026-02-18 10:13:26', '2026-02-18 10:13:26');
INSERT INTO public.ventas_detalle VALUES (403, 199, 11, 2, 150000.00, 300000.00, '2026-02-18 10:13:26', '2026-02-18 10:13:26');
INSERT INTO public.ventas_detalle VALUES (404, 200, 3, 1, 180000.00, 180000.00, '2023-11-24 20:13:26', '2023-11-24 20:13:26');
INSERT INTO public.ventas_detalle VALUES (405, 200, 18, 2, 240000.00, 480000.00, '2023-11-24 20:13:26', '2023-11-24 20:13:26');
INSERT INTO public.ventas_detalle VALUES (406, 201, 3, 2, 180000.00, 360000.00, '2026-01-29 03:13:26', '2026-01-29 03:13:26');
INSERT INTO public.ventas_detalle VALUES (407, 202, 1, 2, 250000.00, 500000.00, '2023-08-01 12:13:26', '2023-08-01 12:13:26');
INSERT INTO public.ventas_detalle VALUES (408, 202, 17, 3, 350000.00, 1050000.00, '2023-08-01 12:13:26', '2023-08-01 12:13:26');
INSERT INTO public.ventas_detalle VALUES (409, 203, 2, 3, 210000.00, 630000.00, '2024-09-30 22:13:26', '2024-09-30 22:13:26');
INSERT INTO public.ventas_detalle VALUES (410, 203, 3, 1, 180000.00, 180000.00, '2024-09-30 22:13:26', '2024-09-30 22:13:26');
INSERT INTO public.ventas_detalle VALUES (411, 203, 8, 3, 175000.00, 525000.00, '2024-09-30 22:13:26', '2024-09-30 22:13:26');
INSERT INTO public.ventas_detalle VALUES (412, 204, 2, 1, 210000.00, 210000.00, '2025-05-03 18:13:26', '2025-05-03 18:13:26');
INSERT INTO public.ventas_detalle VALUES (413, 204, 11, 2, 150000.00, 300000.00, '2025-05-03 18:13:26', '2025-05-03 18:13:26');
INSERT INTO public.ventas_detalle VALUES (414, 204, 14, 1, 290000.00, 290000.00, '2025-05-03 18:13:26', '2025-05-03 18:13:26');
INSERT INTO public.ventas_detalle VALUES (415, 205, 1, 2, 250000.00, 500000.00, '2024-12-09 13:13:26', '2024-12-09 13:13:26');
INSERT INTO public.ventas_detalle VALUES (416, 206, 1, 2, 250000.00, 500000.00, '2026-04-03 23:13:26', '2026-04-03 23:13:26');
INSERT INTO public.ventas_detalle VALUES (417, 206, 9, 3, 220000.00, 660000.00, '2026-04-03 23:13:26', '2026-04-03 23:13:26');
INSERT INTO public.ventas_detalle VALUES (418, 207, 11, 2, 150000.00, 300000.00, '2025-03-08 19:13:26', '2025-03-08 19:13:26');
INSERT INTO public.ventas_detalle VALUES (419, 207, 12, 2, 205000.00, 410000.00, '2025-03-08 19:13:26', '2025-03-08 19:13:26');
INSERT INTO public.ventas_detalle VALUES (420, 207, 17, 3, 350000.00, 1050000.00, '2025-03-08 19:13:26', '2025-03-08 19:13:26');
INSERT INTO public.ventas_detalle VALUES (421, 208, 3, 2, 180000.00, 360000.00, '2024-08-20 02:13:26', '2024-08-20 02:13:26');
INSERT INTO public.ventas_detalle VALUES (422, 208, 12, 3, 205000.00, 615000.00, '2024-08-20 02:13:26', '2024-08-20 02:13:26');
INSERT INTO public.ventas_detalle VALUES (423, 208, 15, 3, 270000.00, 810000.00, '2024-08-20 02:13:26', '2024-08-20 02:13:26');
INSERT INTO public.ventas_detalle VALUES (424, 209, 6, 1, 310000.00, 310000.00, '2023-12-09 03:13:26', '2023-12-09 03:13:26');
INSERT INTO public.ventas_detalle VALUES (425, 209, 18, 1, 240000.00, 240000.00, '2023-12-09 03:13:26', '2023-12-09 03:13:26');
INSERT INTO public.ventas_detalle VALUES (426, 210, 1, 1, 250000.00, 250000.00, '2025-09-23 04:13:26', '2025-09-23 04:13:26');
INSERT INTO public.ventas_detalle VALUES (427, 211, 14, 2, 290000.00, 580000.00, '2025-05-28 19:13:26', '2025-05-28 19:13:26');
INSERT INTO public.ventas_detalle VALUES (428, 211, 18, 3, 240000.00, 720000.00, '2025-05-28 19:13:26', '2025-05-28 19:13:26');
INSERT INTO public.ventas_detalle VALUES (429, 212, 8, 1, 175000.00, 175000.00, '2024-06-16 07:13:26', '2024-06-16 07:13:26');
INSERT INTO public.ventas_detalle VALUES (430, 213, 6, 3, 310000.00, 930000.00, '2024-08-18 02:13:26', '2024-08-18 02:13:26');
INSERT INTO public.ventas_detalle VALUES (431, 213, 14, 3, 290000.00, 870000.00, '2024-08-18 02:13:26', '2024-08-18 02:13:26');
INSERT INTO public.ventas_detalle VALUES (432, 214, 11, 3, 150000.00, 450000.00, '2025-01-06 06:13:26', '2025-01-06 06:13:26');
INSERT INTO public.ventas_detalle VALUES (433, 215, 2, 3, 210000.00, 630000.00, '2024-11-02 01:13:26', '2024-11-02 01:13:26');
INSERT INTO public.ventas_detalle VALUES (434, 215, 15, 2, 270000.00, 540000.00, '2024-11-02 01:13:26', '2024-11-02 01:13:26');
INSERT INTO public.ventas_detalle VALUES (435, 216, 1, 2, 250000.00, 500000.00, '2025-11-07 11:13:26', '2025-11-07 11:13:26');
INSERT INTO public.ventas_detalle VALUES (436, 217, 10, 3, 195000.00, 585000.00, '2024-04-07 06:13:26', '2024-04-07 06:13:26');
INSERT INTO public.ventas_detalle VALUES (437, 218, 2, 2, 210000.00, 420000.00, '2025-05-26 09:13:26', '2025-05-26 09:13:26');
INSERT INTO public.ventas_detalle VALUES (438, 218, 14, 2, 290000.00, 580000.00, '2025-05-26 09:13:26', '2025-05-26 09:13:26');
INSERT INTO public.ventas_detalle VALUES (439, 218, 18, 3, 240000.00, 720000.00, '2025-05-26 09:13:26', '2025-05-26 09:13:26');
INSERT INTO public.ventas_detalle VALUES (440, 219, 3, 3, 180000.00, 540000.00, '2025-01-02 02:13:26', '2025-01-02 02:13:26');
INSERT INTO public.ventas_detalle VALUES (441, 219, 9, 1, 220000.00, 220000.00, '2025-01-02 02:13:26', '2025-01-02 02:13:26');
INSERT INTO public.ventas_detalle VALUES (442, 219, 11, 2, 150000.00, 300000.00, '2025-01-02 02:13:26', '2025-01-02 02:13:26');
INSERT INTO public.ventas_detalle VALUES (443, 220, 5, 3, 190000.00, 570000.00, '2025-11-10 00:13:26', '2025-11-10 00:13:26');
INSERT INTO public.ventas_detalle VALUES (444, 220, 14, 2, 290000.00, 580000.00, '2025-11-10 00:13:26', '2025-11-10 00:13:26');
INSERT INTO public.ventas_detalle VALUES (445, 220, 18, 1, 240000.00, 240000.00, '2025-11-10 00:13:26', '2025-11-10 00:13:26');
INSERT INTO public.ventas_detalle VALUES (446, 221, 9, 2, 220000.00, 440000.00, '2024-01-24 12:13:26', '2024-01-24 12:13:26');
INSERT INTO public.ventas_detalle VALUES (447, 221, 14, 3, 290000.00, 870000.00, '2024-01-24 12:13:26', '2024-01-24 12:13:26');
INSERT INTO public.ventas_detalle VALUES (448, 221, 17, 2, 350000.00, 700000.00, '2024-01-24 12:13:26', '2024-01-24 12:13:26');
INSERT INTO public.ventas_detalle VALUES (449, 222, 1, 3, 250000.00, 750000.00, '2024-02-14 15:13:26', '2024-02-14 15:13:26');
INSERT INTO public.ventas_detalle VALUES (450, 222, 14, 2, 290000.00, 580000.00, '2024-02-14 15:13:26', '2024-02-14 15:13:26');
INSERT INTO public.ventas_detalle VALUES (451, 222, 15, 1, 270000.00, 270000.00, '2024-02-14 15:13:26', '2024-02-14 15:13:26');
INSERT INTO public.ventas_detalle VALUES (452, 223, 12, 3, 205000.00, 615000.00, '2024-10-27 07:13:26', '2024-10-27 07:13:26');
INSERT INTO public.ventas_detalle VALUES (453, 223, 14, 3, 290000.00, 870000.00, '2024-10-27 07:13:26', '2024-10-27 07:13:26');
INSERT INTO public.ventas_detalle VALUES (454, 223, 15, 1, 270000.00, 270000.00, '2024-10-27 07:13:26', '2024-10-27 07:13:26');
INSERT INTO public.ventas_detalle VALUES (455, 224, 3, 3, 180000.00, 540000.00, '2023-06-22 17:13:26', '2023-06-22 17:13:26');
INSERT INTO public.ventas_detalle VALUES (456, 224, 7, 3, 160000.00, 480000.00, '2023-06-22 17:13:26', '2023-06-22 17:13:26');
INSERT INTO public.ventas_detalle VALUES (457, 224, 17, 1, 350000.00, 350000.00, '2023-06-22 17:13:26', '2023-06-22 17:13:26');
INSERT INTO public.ventas_detalle VALUES (458, 225, 16, 3, 380000.00, 1140000.00, '2025-05-10 00:13:26', '2025-05-10 00:13:26');
INSERT INTO public.ventas_detalle VALUES (459, 226, 11, 2, 150000.00, 300000.00, '2026-01-11 18:13:26', '2026-01-11 18:13:26');
INSERT INTO public.ventas_detalle VALUES (460, 226, 12, 3, 205000.00, 615000.00, '2026-01-11 18:13:26', '2026-01-11 18:13:26');
INSERT INTO public.ventas_detalle VALUES (461, 226, 17, 2, 350000.00, 700000.00, '2026-01-11 18:13:26', '2026-01-11 18:13:26');
INSERT INTO public.ventas_detalle VALUES (462, 227, 1, 3, 250000.00, 750000.00, '2024-02-15 22:13:26', '2024-02-15 22:13:26');
INSERT INTO public.ventas_detalle VALUES (463, 227, 15, 2, 270000.00, 540000.00, '2024-02-15 22:13:26', '2024-02-15 22:13:26');
INSERT INTO public.ventas_detalle VALUES (464, 227, 16, 3, 380000.00, 1140000.00, '2024-02-15 22:13:26', '2024-02-15 22:13:26');
INSERT INTO public.ventas_detalle VALUES (465, 228, 10, 2, 195000.00, 390000.00, '2024-09-27 05:13:26', '2024-09-27 05:13:26');
INSERT INTO public.ventas_detalle VALUES (466, 228, 16, 1, 380000.00, 380000.00, '2024-09-27 05:13:26', '2024-09-27 05:13:26');
INSERT INTO public.ventas_detalle VALUES (467, 229, 5, 3, 190000.00, 570000.00, '2025-08-18 15:13:26', '2025-08-18 15:13:26');
INSERT INTO public.ventas_detalle VALUES (468, 230, 1, 3, 250000.00, 750000.00, '2026-03-12 15:13:26', '2026-03-12 15:13:26');
INSERT INTO public.ventas_detalle VALUES (469, 230, 2, 1, 210000.00, 210000.00, '2026-03-12 15:13:26', '2026-03-12 15:13:26');
INSERT INTO public.ventas_detalle VALUES (470, 231, 12, 3, 205000.00, 615000.00, '2026-04-08 17:13:26', '2026-04-08 17:13:26');
INSERT INTO public.ventas_detalle VALUES (471, 231, 14, 1, 290000.00, 290000.00, '2026-04-08 17:13:26', '2026-04-08 17:13:26');
INSERT INTO public.ventas_detalle VALUES (472, 231, 18, 3, 240000.00, 720000.00, '2026-04-08 17:13:26', '2026-04-08 17:13:26');
INSERT INTO public.ventas_detalle VALUES (473, 232, 3, 1, 180000.00, 180000.00, '2024-07-02 04:13:26', '2024-07-02 04:13:26');
INSERT INTO public.ventas_detalle VALUES (474, 232, 14, 2, 290000.00, 580000.00, '2024-07-02 04:13:26', '2024-07-02 04:13:26');
INSERT INTO public.ventas_detalle VALUES (475, 233, 11, 2, 150000.00, 300000.00, '2024-04-05 14:13:26', '2024-04-05 14:13:26');
INSERT INTO public.ventas_detalle VALUES (476, 234, 3, 2, 180000.00, 360000.00, '2026-02-22 23:13:26', '2026-02-22 23:13:26');
INSERT INTO public.ventas_detalle VALUES (477, 235, 11, 1, 150000.00, 150000.00, '2024-06-30 12:13:26', '2024-06-30 12:13:26');
INSERT INTO public.ventas_detalle VALUES (478, 235, 12, 2, 205000.00, 410000.00, '2024-06-30 12:13:26', '2024-06-30 12:13:26');
INSERT INTO public.ventas_detalle VALUES (479, 236, 7, 2, 160000.00, 320000.00, '2025-10-24 05:13:26', '2025-10-24 05:13:26');
INSERT INTO public.ventas_detalle VALUES (480, 236, 12, 2, 205000.00, 410000.00, '2025-10-24 05:13:26', '2025-10-24 05:13:26');
INSERT INTO public.ventas_detalle VALUES (481, 236, 18, 3, 240000.00, 720000.00, '2025-10-24 05:13:26', '2025-10-24 05:13:26');
INSERT INTO public.ventas_detalle VALUES (482, 237, 17, 3, 350000.00, 1050000.00, '2025-04-27 02:13:26', '2025-04-27 02:13:26');
INSERT INTO public.ventas_detalle VALUES (483, 238, 11, 2, 150000.00, 300000.00, '2026-06-08 05:13:26', '2026-06-08 05:13:26');
INSERT INTO public.ventas_detalle VALUES (484, 238, 17, 1, 350000.00, 350000.00, '2026-06-08 05:13:26', '2026-06-08 05:13:26');
INSERT INTO public.ventas_detalle VALUES (485, 239, 6, 1, 310000.00, 310000.00, '2025-07-23 00:13:26', '2025-07-23 00:13:26');
INSERT INTO public.ventas_detalle VALUES (486, 239, 8, 3, 175000.00, 525000.00, '2025-07-23 00:13:26', '2025-07-23 00:13:26');
INSERT INTO public.ventas_detalle VALUES (487, 240, 10, 2, 195000.00, 390000.00, '2025-05-27 20:13:26', '2025-05-27 20:13:26');
INSERT INTO public.ventas_detalle VALUES (488, 240, 11, 1, 150000.00, 150000.00, '2025-05-27 20:13:26', '2025-05-27 20:13:26');
INSERT INTO public.ventas_detalle VALUES (489, 241, 2, 2, 210000.00, 420000.00, '2025-04-26 20:13:26', '2025-04-26 20:13:26');
INSERT INTO public.ventas_detalle VALUES (490, 241, 6, 2, 310000.00, 620000.00, '2025-04-26 20:13:26', '2025-04-26 20:13:26');
INSERT INTO public.ventas_detalle VALUES (491, 241, 7, 3, 160000.00, 480000.00, '2025-04-26 20:13:26', '2025-04-26 20:13:26');
INSERT INTO public.ventas_detalle VALUES (492, 242, 6, 3, 310000.00, 930000.00, '2025-10-15 12:13:26', '2025-10-15 12:13:26');
INSERT INTO public.ventas_detalle VALUES (493, 243, 15, 2, 270000.00, 540000.00, '2025-11-23 10:13:26', '2025-11-23 10:13:26');
INSERT INTO public.ventas_detalle VALUES (494, 244, 5, 3, 190000.00, 570000.00, '2024-10-19 00:13:26', '2024-10-19 00:13:26');
INSERT INTO public.ventas_detalle VALUES (495, 244, 7, 3, 160000.00, 480000.00, '2024-10-19 00:13:26', '2024-10-19 00:13:26');
INSERT INTO public.ventas_detalle VALUES (496, 244, 15, 2, 270000.00, 540000.00, '2024-10-19 00:13:26', '2024-10-19 00:13:26');
INSERT INTO public.ventas_detalle VALUES (497, 245, 1, 2, 250000.00, 500000.00, '2024-05-30 20:13:26', '2024-05-30 20:13:26');
INSERT INTO public.ventas_detalle VALUES (498, 246, 3, 2, 180000.00, 360000.00, '2024-08-27 22:13:26', '2024-08-27 22:13:26');
INSERT INTO public.ventas_detalle VALUES (499, 246, 11, 2, 150000.00, 300000.00, '2024-08-27 22:13:26', '2024-08-27 22:13:26');
INSERT INTO public.ventas_detalle VALUES (500, 247, 7, 2, 160000.00, 320000.00, '2024-03-21 08:13:26', '2024-03-21 08:13:26');
INSERT INTO public.ventas_detalle VALUES (501, 247, 9, 1, 220000.00, 220000.00, '2024-03-21 08:13:26', '2024-03-21 08:13:26');
INSERT INTO public.ventas_detalle VALUES (502, 247, 12, 3, 205000.00, 615000.00, '2024-03-21 08:13:26', '2024-03-21 08:13:26');
INSERT INTO public.ventas_detalle VALUES (503, 248, 6, 3, 310000.00, 930000.00, '2024-05-22 10:13:26', '2024-05-22 10:13:26');
INSERT INTO public.ventas_detalle VALUES (504, 248, 15, 1, 270000.00, 270000.00, '2024-05-22 10:13:26', '2024-05-22 10:13:26');
INSERT INTO public.ventas_detalle VALUES (505, 249, 14, 1, 290000.00, 290000.00, '2026-01-26 04:13:26', '2026-01-26 04:13:26');
INSERT INTO public.ventas_detalle VALUES (506, 250, 1, 2, 250000.00, 500000.00, '2025-06-07 04:13:26', '2025-06-07 04:13:26');
INSERT INTO public.ventas_detalle VALUES (507, 250, 2, 2, 210000.00, 420000.00, '2025-06-07 04:13:26', '2025-06-07 04:13:26');
INSERT INTO public.ventas_detalle VALUES (508, 250, 10, 2, 195000.00, 390000.00, '2025-06-07 04:13:26', '2025-06-07 04:13:26');
INSERT INTO public.ventas_detalle VALUES (509, 251, 3, 3, 180000.00, 540000.00, '2024-03-11 13:13:26', '2024-03-11 13:13:26');
INSERT INTO public.ventas_detalle VALUES (510, 251, 11, 3, 150000.00, 450000.00, '2024-03-11 13:13:26', '2024-03-11 13:13:26');
INSERT INTO public.ventas_detalle VALUES (511, 251, 15, 2, 270000.00, 540000.00, '2024-03-11 13:13:26', '2024-03-11 13:13:26');
INSERT INTO public.ventas_detalle VALUES (512, 252, 9, 3, 220000.00, 660000.00, '2025-03-05 10:13:26', '2025-03-05 10:13:26');
INSERT INTO public.ventas_detalle VALUES (513, 252, 11, 1, 150000.00, 150000.00, '2025-03-05 10:13:26', '2025-03-05 10:13:26');
INSERT INTO public.ventas_detalle VALUES (514, 252, 15, 1, 270000.00, 270000.00, '2025-03-05 10:13:26', '2025-03-05 10:13:26');
INSERT INTO public.ventas_detalle VALUES (515, 253, 2, 1, 210000.00, 210000.00, '2024-05-23 20:13:26', '2024-05-23 20:13:26');
INSERT INTO public.ventas_detalle VALUES (516, 253, 5, 3, 190000.00, 570000.00, '2024-05-23 20:13:26', '2024-05-23 20:13:26');
INSERT INTO public.ventas_detalle VALUES (517, 253, 6, 3, 310000.00, 930000.00, '2024-05-23 20:13:26', '2024-05-23 20:13:26');
INSERT INTO public.ventas_detalle VALUES (518, 254, 10, 2, 195000.00, 390000.00, '2024-09-19 02:13:26', '2024-09-19 02:13:26');
INSERT INTO public.ventas_detalle VALUES (519, 255, 8, 2, 175000.00, 350000.00, '2025-08-22 06:13:26', '2025-08-22 06:13:26');
INSERT INTO public.ventas_detalle VALUES (520, 256, 2, 3, 210000.00, 630000.00, '2023-07-11 01:13:26', '2023-07-11 01:13:26');
INSERT INTO public.ventas_detalle VALUES (521, 256, 8, 2, 175000.00, 350000.00, '2023-07-11 01:13:26', '2023-07-11 01:13:26');
INSERT INTO public.ventas_detalle VALUES (522, 257, 10, 2, 195000.00, 390000.00, '2024-11-22 11:13:26', '2024-11-22 11:13:26');
INSERT INTO public.ventas_detalle VALUES (523, 257, 15, 2, 270000.00, 540000.00, '2024-11-22 11:13:26', '2024-11-22 11:13:26');
INSERT INTO public.ventas_detalle VALUES (524, 258, 6, 3, 310000.00, 930000.00, '2025-08-28 02:13:26', '2025-08-28 02:13:26');
INSERT INTO public.ventas_detalle VALUES (525, 259, 12, 3, 205000.00, 615000.00, '2026-01-30 16:13:26', '2026-01-30 16:13:26');
INSERT INTO public.ventas_detalle VALUES (526, 260, 3, 3, 180000.00, 540000.00, '2025-08-07 03:13:26', '2025-08-07 03:13:26');
INSERT INTO public.ventas_detalle VALUES (527, 261, 5, 3, 190000.00, 570000.00, '2025-08-10 19:13:26', '2025-08-10 19:13:26');
INSERT INTO public.ventas_detalle VALUES (528, 261, 7, 3, 160000.00, 480000.00, '2025-08-10 19:13:26', '2025-08-10 19:13:26');
INSERT INTO public.ventas_detalle VALUES (529, 262, 6, 2, 310000.00, 620000.00, '2025-10-21 03:13:26', '2025-10-21 03:13:26');
INSERT INTO public.ventas_detalle VALUES (530, 262, 7, 2, 160000.00, 320000.00, '2025-10-21 03:13:26', '2025-10-21 03:13:26');
INSERT INTO public.ventas_detalle VALUES (531, 262, 17, 1, 350000.00, 350000.00, '2025-10-21 03:13:26', '2025-10-21 03:13:26');
INSERT INTO public.ventas_detalle VALUES (532, 263, 7, 3, 160000.00, 480000.00, '2025-10-06 10:13:26', '2025-10-06 10:13:26');
INSERT INTO public.ventas_detalle VALUES (533, 264, 2, 2, 210000.00, 420000.00, '2024-08-06 13:13:26', '2024-08-06 13:13:26');
INSERT INTO public.ventas_detalle VALUES (534, 264, 6, 1, 310000.00, 310000.00, '2024-08-06 13:13:26', '2024-08-06 13:13:26');
INSERT INTO public.ventas_detalle VALUES (535, 264, 16, 1, 380000.00, 380000.00, '2024-08-06 13:13:26', '2024-08-06 13:13:26');
INSERT INTO public.ventas_detalle VALUES (536, 265, 8, 3, 175000.00, 525000.00, '2025-10-03 11:13:26', '2025-10-03 11:13:26');
INSERT INTO public.ventas_detalle VALUES (537, 266, 12, 1, 205000.00, 205000.00, '2026-02-20 06:13:26', '2026-02-20 06:13:26');
INSERT INTO public.ventas_detalle VALUES (538, 266, 16, 3, 380000.00, 1140000.00, '2026-02-20 06:13:26', '2026-02-20 06:13:26');
INSERT INTO public.ventas_detalle VALUES (539, 266, 18, 2, 240000.00, 480000.00, '2026-02-20 06:13:26', '2026-02-20 06:13:26');
INSERT INTO public.ventas_detalle VALUES (540, 267, 15, 2, 270000.00, 540000.00, '2025-06-11 18:13:26', '2025-06-11 18:13:26');
INSERT INTO public.ventas_detalle VALUES (541, 267, 17, 1, 350000.00, 350000.00, '2025-06-11 18:13:26', '2025-06-11 18:13:26');
INSERT INTO public.ventas_detalle VALUES (542, 268, 10, 2, 195000.00, 390000.00, '2024-07-21 20:13:26', '2024-07-21 20:13:26');
INSERT INTO public.ventas_detalle VALUES (543, 268, 15, 3, 270000.00, 810000.00, '2024-07-21 20:13:26', '2024-07-21 20:13:26');
INSERT INTO public.ventas_detalle VALUES (544, 269, 6, 2, 310000.00, 620000.00, '2026-03-02 12:13:26', '2026-03-02 12:13:26');
INSERT INTO public.ventas_detalle VALUES (545, 269, 8, 3, 175000.00, 525000.00, '2026-03-02 12:13:26', '2026-03-02 12:13:26');
INSERT INTO public.ventas_detalle VALUES (546, 269, 16, 1, 380000.00, 380000.00, '2026-03-02 12:13:26', '2026-03-02 12:13:26');
INSERT INTO public.ventas_detalle VALUES (547, 270, 10, 2, 195000.00, 390000.00, '2024-11-07 05:13:26', '2024-11-07 05:13:26');
INSERT INTO public.ventas_detalle VALUES (548, 271, 7, 2, 160000.00, 320000.00, '2024-02-01 06:13:26', '2024-02-01 06:13:26');
INSERT INTO public.ventas_detalle VALUES (549, 272, 5, 2, 190000.00, 380000.00, '2025-06-07 07:13:26', '2025-06-07 07:13:26');
INSERT INTO public.ventas_detalle VALUES (550, 272, 16, 2, 380000.00, 760000.00, '2025-06-07 07:13:26', '2025-06-07 07:13:26');
INSERT INTO public.ventas_detalle VALUES (551, 273, 2, 2, 210000.00, 420000.00, '2025-06-28 05:13:26', '2025-06-28 05:13:26');
INSERT INTO public.ventas_detalle VALUES (552, 273, 6, 3, 310000.00, 930000.00, '2025-06-28 05:13:26', '2025-06-28 05:13:26');
INSERT INTO public.ventas_detalle VALUES (553, 273, 11, 1, 150000.00, 150000.00, '2025-06-28 05:13:26', '2025-06-28 05:13:26');
INSERT INTO public.ventas_detalle VALUES (554, 274, 16, 3, 380000.00, 1140000.00, '2025-10-12 21:13:26', '2025-10-12 21:13:26');
INSERT INTO public.ventas_detalle VALUES (555, 275, 2, 1, 210000.00, 210000.00, '2024-04-29 23:13:26', '2024-04-29 23:13:26');
INSERT INTO public.ventas_detalle VALUES (556, 275, 17, 1, 350000.00, 350000.00, '2024-04-29 23:13:26', '2024-04-29 23:13:26');
INSERT INTO public.ventas_detalle VALUES (557, 276, 7, 1, 160000.00, 160000.00, '2024-05-21 01:13:26', '2024-05-21 01:13:26');
INSERT INTO public.ventas_detalle VALUES (558, 277, 2, 1, 210000.00, 210000.00, '2024-11-18 19:13:26', '2024-11-18 19:13:26');
INSERT INTO public.ventas_detalle VALUES (559, 277, 5, 2, 190000.00, 380000.00, '2024-11-18 19:13:26', '2024-11-18 19:13:26');
INSERT INTO public.ventas_detalle VALUES (560, 277, 8, 1, 175000.00, 175000.00, '2024-11-18 19:13:26', '2024-11-18 19:13:26');
INSERT INTO public.ventas_detalle VALUES (561, 278, 10, 2, 195000.00, 390000.00, '2024-06-08 00:13:26', '2024-06-08 00:13:26');
INSERT INTO public.ventas_detalle VALUES (562, 279, 3, 2, 180000.00, 360000.00, '2023-07-22 05:13:26', '2023-07-22 05:13:26');
INSERT INTO public.ventas_detalle VALUES (563, 280, 3, 3, 180000.00, 540000.00, '2024-06-05 13:13:26', '2024-06-05 13:13:26');
INSERT INTO public.ventas_detalle VALUES (564, 281, 11, 2, 150000.00, 300000.00, '2023-09-12 11:13:26', '2023-09-12 11:13:26');
INSERT INTO public.ventas_detalle VALUES (565, 282, 7, 1, 160000.00, 160000.00, '2024-06-17 10:13:26', '2024-06-17 10:13:26');
INSERT INTO public.ventas_detalle VALUES (566, 282, 10, 2, 195000.00, 390000.00, '2024-06-17 10:13:26', '2024-06-17 10:13:26');
INSERT INTO public.ventas_detalle VALUES (567, 283, 8, 2, 175000.00, 350000.00, '2025-08-28 04:13:26', '2025-08-28 04:13:26');
INSERT INTO public.ventas_detalle VALUES (568, 283, 17, 2, 350000.00, 700000.00, '2025-08-28 04:13:26', '2025-08-28 04:13:26');
INSERT INTO public.ventas_detalle VALUES (569, 284, 3, 1, 180000.00, 180000.00, '2023-06-23 15:13:26', '2023-06-23 15:13:26');
INSERT INTO public.ventas_detalle VALUES (570, 285, 8, 3, 175000.00, 525000.00, '2025-09-17 02:13:26', '2025-09-17 02:13:26');
INSERT INTO public.ventas_detalle VALUES (571, 286, 2, 3, 210000.00, 630000.00, '2023-10-08 19:13:26', '2023-10-08 19:13:26');
INSERT INTO public.ventas_detalle VALUES (572, 286, 5, 1, 190000.00, 190000.00, '2023-10-08 19:13:26', '2023-10-08 19:13:26');
INSERT INTO public.ventas_detalle VALUES (573, 286, 14, 1, 290000.00, 290000.00, '2023-10-08 19:13:26', '2023-10-08 19:13:26');
INSERT INTO public.ventas_detalle VALUES (574, 287, 15, 2, 270000.00, 540000.00, '2024-04-25 20:13:26', '2024-04-25 20:13:26');
INSERT INTO public.ventas_detalle VALUES (575, 288, 1, 1, 250000.00, 250000.00, '2023-11-27 13:13:26', '2023-11-27 13:13:26');
INSERT INTO public.ventas_detalle VALUES (576, 288, 11, 2, 150000.00, 300000.00, '2023-11-27 13:13:26', '2023-11-27 13:13:26');
INSERT INTO public.ventas_detalle VALUES (577, 288, 17, 2, 350000.00, 700000.00, '2023-11-27 13:13:26', '2023-11-27 13:13:26');
INSERT INTO public.ventas_detalle VALUES (578, 289, 11, 1, 150000.00, 150000.00, '2026-02-25 09:13:26', '2026-02-25 09:13:26');
INSERT INTO public.ventas_detalle VALUES (579, 289, 12, 3, 205000.00, 615000.00, '2026-02-25 09:13:26', '2026-02-25 09:13:26');
INSERT INTO public.ventas_detalle VALUES (580, 289, 15, 3, 270000.00, 810000.00, '2026-02-25 09:13:26', '2026-02-25 09:13:26');
INSERT INTO public.ventas_detalle VALUES (581, 290, 12, 1, 205000.00, 205000.00, '2024-08-12 17:13:26', '2024-08-12 17:13:26');
INSERT INTO public.ventas_detalle VALUES (582, 290, 15, 3, 270000.00, 810000.00, '2024-08-12 17:13:26', '2024-08-12 17:13:26');
INSERT INTO public.ventas_detalle VALUES (583, 290, 18, 2, 240000.00, 480000.00, '2024-08-12 17:13:26', '2024-08-12 17:13:26');
INSERT INTO public.ventas_detalle VALUES (584, 291, 1, 3, 250000.00, 750000.00, '2025-02-16 04:13:26', '2025-02-16 04:13:26');
INSERT INTO public.ventas_detalle VALUES (585, 291, 9, 1, 220000.00, 220000.00, '2025-02-16 04:13:26', '2025-02-16 04:13:26');
INSERT INTO public.ventas_detalle VALUES (586, 292, 8, 2, 175000.00, 350000.00, '2025-03-05 16:13:26', '2025-03-05 16:13:26');
INSERT INTO public.ventas_detalle VALUES (587, 292, 14, 2, 290000.00, 580000.00, '2025-03-05 16:13:26', '2025-03-05 16:13:26');
INSERT INTO public.ventas_detalle VALUES (588, 292, 15, 3, 270000.00, 810000.00, '2025-03-05 16:13:26', '2025-03-05 16:13:26');
INSERT INTO public.ventas_detalle VALUES (589, 293, 5, 2, 190000.00, 380000.00, '2024-08-12 00:13:26', '2024-08-12 00:13:26');
INSERT INTO public.ventas_detalle VALUES (590, 293, 17, 3, 350000.00, 1050000.00, '2024-08-12 00:13:26', '2024-08-12 00:13:26');
INSERT INTO public.ventas_detalle VALUES (591, 294, 6, 1, 310000.00, 310000.00, '2023-06-30 21:13:26', '2023-06-30 21:13:26');
INSERT INTO public.ventas_detalle VALUES (592, 294, 10, 1, 195000.00, 195000.00, '2023-06-30 21:13:26', '2023-06-30 21:13:26');
INSERT INTO public.ventas_detalle VALUES (593, 294, 16, 1, 380000.00, 380000.00, '2023-06-30 21:13:26', '2023-06-30 21:13:26');
INSERT INTO public.ventas_detalle VALUES (594, 295, 5, 2, 190000.00, 380000.00, '2024-05-20 02:13:26', '2024-05-20 02:13:26');
INSERT INTO public.ventas_detalle VALUES (595, 295, 7, 1, 160000.00, 160000.00, '2024-05-20 02:13:26', '2024-05-20 02:13:26');
INSERT INTO public.ventas_detalle VALUES (596, 296, 1, 2, 250000.00, 500000.00, '2026-03-06 14:13:26', '2026-03-06 14:13:26');
INSERT INTO public.ventas_detalle VALUES (597, 296, 9, 2, 220000.00, 440000.00, '2026-03-06 14:13:26', '2026-03-06 14:13:26');
INSERT INTO public.ventas_detalle VALUES (598, 296, 18, 1, 240000.00, 240000.00, '2026-03-06 14:13:26', '2026-03-06 14:13:26');
INSERT INTO public.ventas_detalle VALUES (599, 297, 10, 3, 195000.00, 585000.00, '2025-05-12 05:13:26', '2025-05-12 05:13:26');
INSERT INTO public.ventas_detalle VALUES (600, 297, 17, 3, 350000.00, 1050000.00, '2025-05-12 05:13:26', '2025-05-12 05:13:26');
INSERT INTO public.ventas_detalle VALUES (601, 298, 2, 2, 210000.00, 420000.00, '2025-02-07 20:13:26', '2025-02-07 20:13:26');
INSERT INTO public.ventas_detalle VALUES (602, 298, 17, 3, 350000.00, 1050000.00, '2025-02-07 20:13:26', '2025-02-07 20:13:26');
INSERT INTO public.ventas_detalle VALUES (603, 299, 8, 1, 175000.00, 175000.00, '2026-03-16 07:13:26', '2026-03-16 07:13:26');
INSERT INTO public.ventas_detalle VALUES (604, 300, 18, 2, 240000.00, 480000.00, '2026-05-31 15:13:26', '2026-05-31 15:13:26');
INSERT INTO public.ventas_detalle VALUES (605, 301, 6, 1, 310000.00, 310000.00, '2024-01-01 08:13:26', '2024-01-01 08:13:26');
INSERT INTO public.ventas_detalle VALUES (606, 301, 12, 3, 205000.00, 615000.00, '2024-01-01 08:13:26', '2024-01-01 08:13:26');
INSERT INTO public.ventas_detalle VALUES (607, 301, 18, 1, 240000.00, 240000.00, '2024-01-01 08:13:26', '2024-01-01 08:13:26');
INSERT INTO public.ventas_detalle VALUES (608, 302, 6, 2, 310000.00, 620000.00, '2025-09-02 23:13:26', '2025-09-02 23:13:26');
INSERT INTO public.ventas_detalle VALUES (609, 303, 10, 3, 195000.00, 585000.00, '2024-07-08 02:13:26', '2024-07-08 02:13:26');
INSERT INTO public.ventas_detalle VALUES (610, 303, 18, 2, 240000.00, 480000.00, '2024-07-08 02:13:26', '2024-07-08 02:13:26');
INSERT INTO public.ventas_detalle VALUES (611, 304, 7, 3, 160000.00, 480000.00, '2025-07-10 11:13:26', '2025-07-10 11:13:26');
INSERT INTO public.ventas_detalle VALUES (612, 305, 2, 1, 210000.00, 210000.00, '2023-08-13 03:13:26', '2023-08-13 03:13:26');
INSERT INTO public.ventas_detalle VALUES (613, 305, 3, 1, 180000.00, 180000.00, '2023-08-13 03:13:26', '2023-08-13 03:13:26');
INSERT INTO public.ventas_detalle VALUES (614, 305, 10, 3, 195000.00, 585000.00, '2023-08-13 03:13:26', '2023-08-13 03:13:26');
INSERT INTO public.ventas_detalle VALUES (615, 306, 8, 2, 175000.00, 350000.00, '2026-02-21 10:13:26', '2026-02-21 10:13:26');
INSERT INTO public.ventas_detalle VALUES (616, 306, 12, 1, 205000.00, 205000.00, '2026-02-21 10:13:26', '2026-02-21 10:13:26');
INSERT INTO public.ventas_detalle VALUES (617, 306, 15, 1, 270000.00, 270000.00, '2026-02-21 10:13:26', '2026-02-21 10:13:26');
INSERT INTO public.ventas_detalle VALUES (618, 307, 1, 2, 250000.00, 500000.00, '2024-03-02 23:13:26', '2024-03-02 23:13:26');
INSERT INTO public.ventas_detalle VALUES (619, 307, 5, 1, 190000.00, 190000.00, '2024-03-02 23:13:26', '2024-03-02 23:13:26');
INSERT INTO public.ventas_detalle VALUES (620, 307, 14, 1, 290000.00, 290000.00, '2024-03-02 23:13:26', '2024-03-02 23:13:26');
INSERT INTO public.ventas_detalle VALUES (621, 308, 15, 2, 270000.00, 540000.00, '2026-03-11 13:13:26', '2026-03-11 13:13:26');
INSERT INTO public.ventas_detalle VALUES (622, 308, 18, 3, 240000.00, 720000.00, '2026-03-11 13:13:26', '2026-03-11 13:13:26');
INSERT INTO public.ventas_detalle VALUES (623, 309, 11, 3, 150000.00, 450000.00, '2024-12-27 23:13:26', '2024-12-27 23:13:26');
INSERT INTO public.ventas_detalle VALUES (624, 310, 3, 1, 180000.00, 180000.00, '2023-06-27 13:13:26', '2023-06-27 13:13:26');
INSERT INTO public.ventas_detalle VALUES (625, 311, 7, 1, 160000.00, 160000.00, '2025-12-26 19:13:26', '2025-12-26 19:13:26');
INSERT INTO public.ventas_detalle VALUES (626, 311, 15, 3, 270000.00, 810000.00, '2025-12-26 19:13:26', '2025-12-26 19:13:26');
INSERT INTO public.ventas_detalle VALUES (627, 312, 2, 2, 210000.00, 420000.00, '2023-12-14 03:13:26', '2023-12-14 03:13:26');
INSERT INTO public.ventas_detalle VALUES (628, 313, 8, 2, 175000.00, 350000.00, '2024-06-26 04:13:26', '2024-06-26 04:13:26');
INSERT INTO public.ventas_detalle VALUES (629, 313, 14, 2, 290000.00, 580000.00, '2024-06-26 04:13:26', '2024-06-26 04:13:26');
INSERT INTO public.ventas_detalle VALUES (630, 313, 15, 2, 270000.00, 540000.00, '2024-06-26 04:13:26', '2024-06-26 04:13:26');
INSERT INTO public.ventas_detalle VALUES (631, 314, 5, 1, 190000.00, 190000.00, '2026-04-21 11:13:26', '2026-04-21 11:13:26');
INSERT INTO public.ventas_detalle VALUES (632, 315, 14, 1, 290000.00, 290000.00, '2025-04-24 21:13:26', '2025-04-24 21:13:26');
INSERT INTO public.ventas_detalle VALUES (633, 315, 17, 1, 350000.00, 350000.00, '2025-04-24 21:13:26', '2025-04-24 21:13:26');
INSERT INTO public.ventas_detalle VALUES (634, 316, 2, 3, 210000.00, 630000.00, '2026-02-19 02:13:26', '2026-02-19 02:13:26');
INSERT INTO public.ventas_detalle VALUES (635, 316, 10, 2, 195000.00, 390000.00, '2026-02-19 02:13:26', '2026-02-19 02:13:26');
INSERT INTO public.ventas_detalle VALUES (636, 316, 12, 1, 205000.00, 205000.00, '2026-02-19 02:13:26', '2026-02-19 02:13:26');
INSERT INTO public.ventas_detalle VALUES (637, 317, 5, 1, 190000.00, 190000.00, '2025-07-27 10:13:26', '2025-07-27 10:13:26');
INSERT INTO public.ventas_detalle VALUES (638, 317, 6, 1, 310000.00, 310000.00, '2025-07-27 10:13:26', '2025-07-27 10:13:26');
INSERT INTO public.ventas_detalle VALUES (639, 317, 10, 1, 195000.00, 195000.00, '2025-07-27 10:13:26', '2025-07-27 10:13:26');
INSERT INTO public.ventas_detalle VALUES (640, 318, 10, 1, 195000.00, 195000.00, '2026-05-18 20:13:26', '2026-05-18 20:13:26');
INSERT INTO public.ventas_detalle VALUES (641, 319, 11, 2, 150000.00, 300000.00, '2024-08-13 14:13:26', '2024-08-13 14:13:26');
INSERT INTO public.ventas_detalle VALUES (642, 319, 15, 2, 270000.00, 540000.00, '2024-08-13 14:13:26', '2024-08-13 14:13:26');
INSERT INTO public.ventas_detalle VALUES (643, 320, 9, 2, 220000.00, 440000.00, '2023-12-16 09:13:26', '2023-12-16 09:13:26');
INSERT INTO public.ventas_detalle VALUES (644, 320, 11, 2, 150000.00, 300000.00, '2023-12-16 09:13:26', '2023-12-16 09:13:26');
INSERT INTO public.ventas_detalle VALUES (645, 320, 16, 3, 380000.00, 1140000.00, '2023-12-16 09:13:26', '2023-12-16 09:13:26');
INSERT INTO public.ventas_detalle VALUES (646, 321, 8, 1, 175000.00, 175000.00, '2023-11-12 15:13:26', '2023-11-12 15:13:26');
INSERT INTO public.ventas_detalle VALUES (647, 322, 3, 1, 180000.00, 180000.00, '2026-06-15 02:13:26', '2026-06-15 02:13:26');
INSERT INTO public.ventas_detalle VALUES (648, 323, 3, 2, 180000.00, 360000.00, '2024-09-25 00:13:26', '2024-09-25 00:13:26');
INSERT INTO public.ventas_detalle VALUES (649, 323, 14, 3, 290000.00, 870000.00, '2024-09-25 00:13:26', '2024-09-25 00:13:26');
INSERT INTO public.ventas_detalle VALUES (650, 324, 1, 1, 250000.00, 250000.00, '2025-01-06 19:13:26', '2025-01-06 19:13:26');
INSERT INTO public.ventas_detalle VALUES (651, 324, 7, 1, 160000.00, 160000.00, '2025-01-06 19:13:26', '2025-01-06 19:13:26');
INSERT INTO public.ventas_detalle VALUES (652, 324, 18, 1, 240000.00, 240000.00, '2025-01-06 19:13:26', '2025-01-06 19:13:26');
INSERT INTO public.ventas_detalle VALUES (653, 325, 17, 3, 350000.00, 1050000.00, '2024-07-18 09:13:26', '2024-07-18 09:13:26');
INSERT INTO public.ventas_detalle VALUES (654, 326, 6, 3, 310000.00, 930000.00, '2024-09-07 11:13:26', '2024-09-07 11:13:26');
INSERT INTO public.ventas_detalle VALUES (655, 326, 7, 2, 160000.00, 320000.00, '2024-09-07 11:13:26', '2024-09-07 11:13:26');
INSERT INTO public.ventas_detalle VALUES (656, 327, 7, 1, 160000.00, 160000.00, '2026-02-15 10:13:26', '2026-02-15 10:13:26');
INSERT INTO public.ventas_detalle VALUES (657, 327, 9, 3, 220000.00, 660000.00, '2026-02-15 10:13:26', '2026-02-15 10:13:26');
INSERT INTO public.ventas_detalle VALUES (658, 327, 11, 2, 150000.00, 300000.00, '2026-02-15 10:13:26', '2026-02-15 10:13:26');
INSERT INTO public.ventas_detalle VALUES (659, 328, 5, 2, 190000.00, 380000.00, '2023-09-28 12:13:26', '2023-09-28 12:13:26');
INSERT INTO public.ventas_detalle VALUES (660, 328, 11, 2, 150000.00, 300000.00, '2023-09-28 12:13:26', '2023-09-28 12:13:26');
INSERT INTO public.ventas_detalle VALUES (661, 329, 2, 3, 210000.00, 630000.00, '2023-08-10 22:13:26', '2023-08-10 22:13:26');
INSERT INTO public.ventas_detalle VALUES (662, 329, 5, 2, 190000.00, 380000.00, '2023-08-10 22:13:26', '2023-08-10 22:13:26');
INSERT INTO public.ventas_detalle VALUES (663, 329, 14, 1, 290000.00, 290000.00, '2023-08-10 22:13:26', '2023-08-10 22:13:26');
INSERT INTO public.ventas_detalle VALUES (664, 330, 1, 3, 250000.00, 750000.00, '2024-10-10 04:13:26', '2024-10-10 04:13:26');
INSERT INTO public.ventas_detalle VALUES (665, 330, 7, 3, 160000.00, 480000.00, '2024-10-10 04:13:26', '2024-10-10 04:13:26');
INSERT INTO public.ventas_detalle VALUES (666, 330, 14, 1, 290000.00, 290000.00, '2024-10-10 04:13:26', '2024-10-10 04:13:26');
INSERT INTO public.ventas_detalle VALUES (667, 331, 6, 1, 310000.00, 310000.00, '2024-09-30 10:13:26', '2024-09-30 10:13:26');
INSERT INTO public.ventas_detalle VALUES (668, 331, 17, 2, 350000.00, 700000.00, '2024-09-30 10:13:26', '2024-09-30 10:13:26');
INSERT INTO public.ventas_detalle VALUES (669, 332, 2, 2, 210000.00, 420000.00, '2025-10-18 21:13:26', '2025-10-18 21:13:26');
INSERT INTO public.ventas_detalle VALUES (670, 332, 18, 3, 240000.00, 720000.00, '2025-10-18 21:13:26', '2025-10-18 21:13:26');
INSERT INTO public.ventas_detalle VALUES (671, 333, 3, 2, 180000.00, 360000.00, '2025-07-22 20:13:26', '2025-07-22 20:13:26');
INSERT INTO public.ventas_detalle VALUES (672, 333, 5, 1, 190000.00, 190000.00, '2025-07-22 20:13:26', '2025-07-22 20:13:26');
INSERT INTO public.ventas_detalle VALUES (673, 333, 16, 1, 380000.00, 380000.00, '2025-07-22 20:13:26', '2025-07-22 20:13:26');
INSERT INTO public.ventas_detalle VALUES (674, 334, 14, 1, 290000.00, 290000.00, '2025-10-26 04:13:26', '2025-10-26 04:13:26');
INSERT INTO public.ventas_detalle VALUES (675, 334, 15, 1, 270000.00, 270000.00, '2025-10-26 04:13:26', '2025-10-26 04:13:26');
INSERT INTO public.ventas_detalle VALUES (676, 335, 3, 3, 180000.00, 540000.00, '2025-10-05 20:13:26', '2025-10-05 20:13:26');
INSERT INTO public.ventas_detalle VALUES (677, 335, 16, 2, 380000.00, 760000.00, '2025-10-05 20:13:26', '2025-10-05 20:13:26');
INSERT INTO public.ventas_detalle VALUES (678, 336, 7, 3, 160000.00, 480000.00, '2024-10-19 15:13:26', '2024-10-19 15:13:26');
INSERT INTO public.ventas_detalle VALUES (679, 336, 8, 1, 175000.00, 175000.00, '2024-10-19 15:13:26', '2024-10-19 15:13:26');
INSERT INTO public.ventas_detalle VALUES (680, 336, 9, 1, 220000.00, 220000.00, '2024-10-19 15:13:26', '2024-10-19 15:13:26');
INSERT INTO public.ventas_detalle VALUES (681, 337, 1, 1, 250000.00, 250000.00, '2023-06-17 17:13:26', '2023-06-17 17:13:26');
INSERT INTO public.ventas_detalle VALUES (682, 337, 14, 2, 290000.00, 580000.00, '2023-06-17 17:13:26', '2023-06-17 17:13:26');
INSERT INTO public.ventas_detalle VALUES (683, 337, 16, 3, 380000.00, 1140000.00, '2023-06-17 17:13:26', '2023-06-17 17:13:26');
INSERT INTO public.ventas_detalle VALUES (684, 338, 3, 2, 180000.00, 360000.00, '2025-05-19 04:13:26', '2025-05-19 04:13:26');
INSERT INTO public.ventas_detalle VALUES (685, 338, 7, 1, 160000.00, 160000.00, '2025-05-19 04:13:26', '2025-05-19 04:13:26');
INSERT INTO public.ventas_detalle VALUES (686, 338, 17, 1, 350000.00, 350000.00, '2025-05-19 04:13:26', '2025-05-19 04:13:26');
INSERT INTO public.ventas_detalle VALUES (687, 339, 6, 1, 310000.00, 310000.00, '2024-08-30 11:13:26', '2024-08-30 11:13:26');
INSERT INTO public.ventas_detalle VALUES (688, 339, 7, 3, 160000.00, 480000.00, '2024-08-30 11:13:26', '2024-08-30 11:13:26');
INSERT INTO public.ventas_detalle VALUES (689, 339, 12, 2, 205000.00, 410000.00, '2024-08-30 11:13:26', '2024-08-30 11:13:26');
INSERT INTO public.ventas_detalle VALUES (690, 340, 2, 3, 210000.00, 630000.00, '2026-04-05 09:13:26', '2026-04-05 09:13:26');
INSERT INTO public.ventas_detalle VALUES (691, 340, 10, 1, 195000.00, 195000.00, '2026-04-05 09:13:26', '2026-04-05 09:13:26');
INSERT INTO public.ventas_detalle VALUES (692, 341, 2, 3, 210000.00, 630000.00, '2023-06-23 03:13:26', '2023-06-23 03:13:26');
INSERT INTO public.ventas_detalle VALUES (693, 341, 7, 2, 160000.00, 320000.00, '2023-06-23 03:13:26', '2023-06-23 03:13:26');
INSERT INTO public.ventas_detalle VALUES (694, 342, 7, 3, 160000.00, 480000.00, '2025-06-03 22:13:26', '2025-06-03 22:13:26');
INSERT INTO public.ventas_detalle VALUES (695, 342, 14, 1, 290000.00, 290000.00, '2025-06-03 22:13:26', '2025-06-03 22:13:26');
INSERT INTO public.ventas_detalle VALUES (696, 343, 16, 3, 380000.00, 1140000.00, '2025-02-28 22:13:26', '2025-02-28 22:13:26');
INSERT INTO public.ventas_detalle VALUES (697, 344, 17, 1, 350000.00, 350000.00, '2025-08-22 05:13:26', '2025-08-22 05:13:26');
INSERT INTO public.ventas_detalle VALUES (698, 345, 11, 2, 150000.00, 300000.00, '2025-12-17 04:13:26', '2025-12-17 04:13:26');
INSERT INTO public.ventas_detalle VALUES (699, 346, 7, 3, 160000.00, 480000.00, '2024-10-27 15:13:26', '2024-10-27 15:13:26');
INSERT INTO public.ventas_detalle VALUES (700, 346, 9, 1, 220000.00, 220000.00, '2024-10-27 15:13:26', '2024-10-27 15:13:26');
INSERT INTO public.ventas_detalle VALUES (701, 346, 17, 1, 350000.00, 350000.00, '2024-10-27 15:13:26', '2024-10-27 15:13:26');
INSERT INTO public.ventas_detalle VALUES (702, 347, 7, 1, 160000.00, 160000.00, '2025-10-17 12:13:26', '2025-10-17 12:13:26');
INSERT INTO public.ventas_detalle VALUES (703, 348, 1, 3, 250000.00, 750000.00, '2025-02-04 19:13:26', '2025-02-04 19:13:26');
INSERT INTO public.ventas_detalle VALUES (704, 349, 1, 3, 250000.00, 750000.00, '2025-07-07 09:13:26', '2025-07-07 09:13:26');
INSERT INTO public.ventas_detalle VALUES (705, 349, 2, 3, 210000.00, 630000.00, '2025-07-07 09:13:26', '2025-07-07 09:13:26');
INSERT INTO public.ventas_detalle VALUES (706, 349, 10, 2, 195000.00, 390000.00, '2025-07-07 09:13:26', '2025-07-07 09:13:26');
INSERT INTO public.ventas_detalle VALUES (707, 350, 5, 1, 190000.00, 190000.00, '2023-06-21 22:13:26', '2023-06-21 22:13:26');
INSERT INTO public.ventas_detalle VALUES (708, 350, 18, 2, 240000.00, 480000.00, '2023-06-21 22:13:26', '2023-06-21 22:13:26');
INSERT INTO public.ventas_detalle VALUES (709, 351, 10, 1, 195000.00, 195000.00, '2024-04-30 08:13:26', '2024-04-30 08:13:26');
INSERT INTO public.ventas_detalle VALUES (710, 351, 11, 3, 150000.00, 450000.00, '2024-04-30 08:13:26', '2024-04-30 08:13:26');
INSERT INTO public.ventas_detalle VALUES (711, 352, 2, 3, 210000.00, 630000.00, '2026-02-04 23:13:26', '2026-02-04 23:13:26');
INSERT INTO public.ventas_detalle VALUES (712, 352, 5, 1, 190000.00, 190000.00, '2026-02-04 23:13:26', '2026-02-04 23:13:26');
INSERT INTO public.ventas_detalle VALUES (713, 352, 14, 3, 290000.00, 870000.00, '2026-02-04 23:13:26', '2026-02-04 23:13:26');
INSERT INTO public.ventas_detalle VALUES (714, 353, 3, 2, 180000.00, 360000.00, '2023-07-20 07:13:26', '2023-07-20 07:13:26');
INSERT INTO public.ventas_detalle VALUES (715, 353, 5, 2, 190000.00, 380000.00, '2023-07-20 07:13:26', '2023-07-20 07:13:26');
INSERT INTO public.ventas_detalle VALUES (716, 353, 8, 1, 175000.00, 175000.00, '2023-07-20 07:13:26', '2023-07-20 07:13:26');
INSERT INTO public.ventas_detalle VALUES (717, 354, 7, 2, 160000.00, 320000.00, '2024-02-05 06:13:26', '2024-02-05 06:13:26');
INSERT INTO public.ventas_detalle VALUES (718, 354, 15, 2, 270000.00, 540000.00, '2024-02-05 06:13:26', '2024-02-05 06:13:26');
INSERT INTO public.ventas_detalle VALUES (719, 355, 12, 3, 205000.00, 615000.00, '2023-11-09 21:13:26', '2023-11-09 21:13:26');
INSERT INTO public.ventas_detalle VALUES (720, 356, 10, 3, 195000.00, 585000.00, '2025-03-31 00:13:26', '2025-03-31 00:13:26');
INSERT INTO public.ventas_detalle VALUES (721, 356, 14, 3, 290000.00, 870000.00, '2025-03-31 00:13:26', '2025-03-31 00:13:26');
INSERT INTO public.ventas_detalle VALUES (722, 356, 18, 2, 240000.00, 480000.00, '2025-03-31 00:13:26', '2025-03-31 00:13:26');
INSERT INTO public.ventas_detalle VALUES (723, 357, 2, 1, 210000.00, 210000.00, '2025-11-08 04:13:26', '2025-11-08 04:13:26');
INSERT INTO public.ventas_detalle VALUES (724, 357, 11, 3, 150000.00, 450000.00, '2025-11-08 04:13:26', '2025-11-08 04:13:26');
INSERT INTO public.ventas_detalle VALUES (725, 357, 12, 1, 205000.00, 205000.00, '2025-11-08 04:13:26', '2025-11-08 04:13:26');
INSERT INTO public.ventas_detalle VALUES (726, 358, 7, 1, 160000.00, 160000.00, '2024-07-16 09:13:26', '2024-07-16 09:13:26');
INSERT INTO public.ventas_detalle VALUES (727, 358, 16, 3, 380000.00, 1140000.00, '2024-07-16 09:13:26', '2024-07-16 09:13:26');
INSERT INTO public.ventas_detalle VALUES (728, 359, 7, 2, 160000.00, 320000.00, '2026-01-16 17:13:26', '2026-01-16 17:13:26');
INSERT INTO public.ventas_detalle VALUES (729, 359, 18, 2, 240000.00, 480000.00, '2026-01-16 17:13:26', '2026-01-16 17:13:26');
INSERT INTO public.ventas_detalle VALUES (730, 360, 9, 1, 220000.00, 220000.00, '2025-10-22 01:13:26', '2025-10-22 01:13:26');
INSERT INTO public.ventas_detalle VALUES (731, 361, 7, 1, 160000.00, 160000.00, '2024-10-04 06:13:26', '2024-10-04 06:13:26');
INSERT INTO public.ventas_detalle VALUES (732, 361, 18, 3, 240000.00, 720000.00, '2024-10-04 06:13:26', '2024-10-04 06:13:26');
INSERT INTO public.ventas_detalle VALUES (733, 362, 5, 2, 190000.00, 380000.00, '2026-05-21 09:13:26', '2026-05-21 09:13:26');
INSERT INTO public.ventas_detalle VALUES (734, 362, 14, 1, 290000.00, 290000.00, '2026-05-21 09:13:26', '2026-05-21 09:13:26');
INSERT INTO public.ventas_detalle VALUES (735, 362, 17, 3, 350000.00, 1050000.00, '2026-05-21 09:13:26', '2026-05-21 09:13:26');
INSERT INTO public.ventas_detalle VALUES (736, 363, 3, 3, 180000.00, 540000.00, '2025-04-24 22:13:26', '2025-04-24 22:13:26');
INSERT INTO public.ventas_detalle VALUES (737, 363, 5, 2, 190000.00, 380000.00, '2025-04-24 22:13:26', '2025-04-24 22:13:26');
INSERT INTO public.ventas_detalle VALUES (738, 363, 9, 1, 220000.00, 220000.00, '2025-04-24 22:13:26', '2025-04-24 22:13:26');
INSERT INTO public.ventas_detalle VALUES (739, 364, 7, 3, 160000.00, 480000.00, '2026-03-05 21:13:26', '2026-03-05 21:13:26');
INSERT INTO public.ventas_detalle VALUES (740, 364, 15, 2, 270000.00, 540000.00, '2026-03-05 21:13:26', '2026-03-05 21:13:26');
INSERT INTO public.ventas_detalle VALUES (741, 365, 10, 2, 195000.00, 390000.00, '2025-01-01 06:13:26', '2025-01-01 06:13:26');
INSERT INTO public.ventas_detalle VALUES (742, 366, 1, 3, 250000.00, 750000.00, '2025-06-22 15:13:26', '2025-06-22 15:13:26');
INSERT INTO public.ventas_detalle VALUES (743, 366, 15, 1, 270000.00, 270000.00, '2025-06-22 15:13:26', '2025-06-22 15:13:26');
INSERT INTO public.ventas_detalle VALUES (744, 366, 16, 3, 380000.00, 1140000.00, '2025-06-22 15:13:26', '2025-06-22 15:13:26');
INSERT INTO public.ventas_detalle VALUES (745, 367, 7, 1, 160000.00, 160000.00, '2026-03-15 07:13:26', '2026-03-15 07:13:26');
INSERT INTO public.ventas_detalle VALUES (746, 367, 8, 3, 175000.00, 525000.00, '2026-03-15 07:13:26', '2026-03-15 07:13:26');
INSERT INTO public.ventas_detalle VALUES (747, 367, 11, 2, 150000.00, 300000.00, '2026-03-15 07:13:26', '2026-03-15 07:13:26');
INSERT INTO public.ventas_detalle VALUES (748, 368, 12, 1, 205000.00, 205000.00, '2024-07-04 18:13:26', '2024-07-04 18:13:26');
INSERT INTO public.ventas_detalle VALUES (749, 369, 5, 2, 190000.00, 380000.00, '2024-04-07 06:13:26', '2024-04-07 06:13:26');
INSERT INTO public.ventas_detalle VALUES (750, 369, 9, 1, 220000.00, 220000.00, '2024-04-07 06:13:26', '2024-04-07 06:13:26');
INSERT INTO public.ventas_detalle VALUES (751, 369, 12, 1, 205000.00, 205000.00, '2024-04-07 06:13:26', '2024-04-07 06:13:26');
INSERT INTO public.ventas_detalle VALUES (752, 370, 3, 3, 180000.00, 540000.00, '2025-04-20 20:13:26', '2025-04-20 20:13:26');
INSERT INTO public.ventas_detalle VALUES (753, 371, 5, 1, 190000.00, 190000.00, '2026-01-02 09:13:26', '2026-01-02 09:13:26');
INSERT INTO public.ventas_detalle VALUES (754, 371, 12, 1, 205000.00, 205000.00, '2026-01-02 09:13:26', '2026-01-02 09:13:26');
INSERT INTO public.ventas_detalle VALUES (755, 372, 6, 2, 310000.00, 620000.00, '2025-04-21 22:13:26', '2025-04-21 22:13:26');
INSERT INTO public.ventas_detalle VALUES (756, 372, 14, 3, 290000.00, 870000.00, '2025-04-21 22:13:26', '2025-04-21 22:13:26');
INSERT INTO public.ventas_detalle VALUES (757, 373, 2, 3, 210000.00, 630000.00, '2024-12-31 14:13:26', '2024-12-31 14:13:26');
INSERT INTO public.ventas_detalle VALUES (758, 373, 11, 2, 150000.00, 300000.00, '2024-12-31 14:13:26', '2024-12-31 14:13:26');
INSERT INTO public.ventas_detalle VALUES (759, 373, 14, 2, 290000.00, 580000.00, '2024-12-31 14:13:26', '2024-12-31 14:13:26');
INSERT INTO public.ventas_detalle VALUES (760, 374, 11, 1, 150000.00, 150000.00, '2026-03-09 00:13:26', '2026-03-09 00:13:26');
INSERT INTO public.ventas_detalle VALUES (761, 375, 16, 1, 380000.00, 380000.00, '2024-07-19 22:13:26', '2024-07-19 22:13:26');
INSERT INTO public.ventas_detalle VALUES (762, 376, 12, 2, 205000.00, 410000.00, '2024-03-15 13:13:26', '2024-03-15 13:13:26');
INSERT INTO public.ventas_detalle VALUES (763, 376, 14, 3, 290000.00, 870000.00, '2024-03-15 13:13:26', '2024-03-15 13:13:26');
INSERT INTO public.ventas_detalle VALUES (764, 376, 16, 3, 380000.00, 1140000.00, '2024-03-15 13:13:26', '2024-03-15 13:13:26');
INSERT INTO public.ventas_detalle VALUES (765, 377, 6, 1, 310000.00, 310000.00, '2025-10-20 15:13:26', '2025-10-20 15:13:26');
INSERT INTO public.ventas_detalle VALUES (766, 377, 14, 2, 290000.00, 580000.00, '2025-10-20 15:13:26', '2025-10-20 15:13:26');
INSERT INTO public.ventas_detalle VALUES (767, 377, 17, 1, 350000.00, 350000.00, '2025-10-20 15:13:26', '2025-10-20 15:13:26');
INSERT INTO public.ventas_detalle VALUES (768, 378, 2, 3, 210000.00, 630000.00, '2024-05-29 05:13:26', '2024-05-29 05:13:26');
INSERT INTO public.ventas_detalle VALUES (769, 379, 3, 1, 180000.00, 180000.00, '2024-12-17 09:13:26', '2024-12-17 09:13:26');
INSERT INTO public.ventas_detalle VALUES (770, 379, 8, 3, 175000.00, 525000.00, '2024-12-17 09:13:26', '2024-12-17 09:13:26');
INSERT INTO public.ventas_detalle VALUES (771, 379, 15, 2, 270000.00, 540000.00, '2024-12-17 09:13:26', '2024-12-17 09:13:26');
INSERT INTO public.ventas_detalle VALUES (772, 380, 5, 1, 190000.00, 190000.00, '2024-06-17 11:13:26', '2024-06-17 11:13:26');
INSERT INTO public.ventas_detalle VALUES (773, 380, 14, 2, 290000.00, 580000.00, '2024-06-17 11:13:26', '2024-06-17 11:13:26');
INSERT INTO public.ventas_detalle VALUES (774, 381, 7, 3, 160000.00, 480000.00, '2025-09-23 01:13:26', '2025-09-23 01:13:26');
INSERT INTO public.ventas_detalle VALUES (775, 382, 3, 1, 180000.00, 180000.00, '2025-06-19 04:13:26', '2025-06-19 04:13:26');
INSERT INTO public.ventas_detalle VALUES (776, 382, 5, 1, 190000.00, 190000.00, '2025-06-19 04:13:26', '2025-06-19 04:13:26');
INSERT INTO public.ventas_detalle VALUES (777, 382, 15, 1, 270000.00, 270000.00, '2025-06-19 04:13:26', '2025-06-19 04:13:26');
INSERT INTO public.ventas_detalle VALUES (778, 383, 8, 2, 175000.00, 350000.00, '2024-08-25 09:13:26', '2024-08-25 09:13:26');
INSERT INTO public.ventas_detalle VALUES (779, 383, 9, 2, 220000.00, 440000.00, '2024-08-25 09:13:26', '2024-08-25 09:13:26');
INSERT INTO public.ventas_detalle VALUES (780, 384, 8, 2, 175000.00, 350000.00, '2024-04-03 16:13:27', '2024-04-03 16:13:27');
INSERT INTO public.ventas_detalle VALUES (781, 384, 9, 1, 220000.00, 220000.00, '2024-04-03 16:13:27', '2024-04-03 16:13:27');
INSERT INTO public.ventas_detalle VALUES (782, 385, 1, 2, 250000.00, 500000.00, '2025-10-02 19:13:27', '2025-10-02 19:13:27');
INSERT INTO public.ventas_detalle VALUES (783, 386, 3, 2, 180000.00, 360000.00, '2025-09-16 03:13:27', '2025-09-16 03:13:27');
INSERT INTO public.ventas_detalle VALUES (784, 386, 12, 1, 205000.00, 205000.00, '2025-09-16 03:13:27', '2025-09-16 03:13:27');
INSERT INTO public.ventas_detalle VALUES (785, 386, 17, 2, 350000.00, 700000.00, '2025-09-16 03:13:27', '2025-09-16 03:13:27');
INSERT INTO public.ventas_detalle VALUES (786, 387, 9, 1, 220000.00, 220000.00, '2024-10-26 20:13:27', '2024-10-26 20:13:27');
INSERT INTO public.ventas_detalle VALUES (787, 387, 14, 3, 290000.00, 870000.00, '2024-10-26 20:13:27', '2024-10-26 20:13:27');
INSERT INTO public.ventas_detalle VALUES (788, 387, 17, 1, 350000.00, 350000.00, '2024-10-26 20:13:27', '2024-10-26 20:13:27');
INSERT INTO public.ventas_detalle VALUES (789, 388, 5, 2, 190000.00, 380000.00, '2023-10-16 12:13:27', '2023-10-16 12:13:27');
INSERT INTO public.ventas_detalle VALUES (790, 389, 14, 1, 290000.00, 290000.00, '2025-05-21 11:13:27', '2025-05-21 11:13:27');
INSERT INTO public.ventas_detalle VALUES (791, 390, 6, 1, 310000.00, 310000.00, '2025-12-01 09:13:27', '2025-12-01 09:13:27');
INSERT INTO public.ventas_detalle VALUES (792, 390, 16, 1, 380000.00, 380000.00, '2025-12-01 09:13:27', '2025-12-01 09:13:27');
INSERT INTO public.ventas_detalle VALUES (793, 390, 18, 2, 240000.00, 480000.00, '2025-12-01 09:13:27', '2025-12-01 09:13:27');
INSERT INTO public.ventas_detalle VALUES (794, 391, 11, 2, 150000.00, 300000.00, '2024-07-15 17:13:27', '2024-07-15 17:13:27');
INSERT INTO public.ventas_detalle VALUES (795, 391, 12, 1, 205000.00, 205000.00, '2024-07-15 17:13:27', '2024-07-15 17:13:27');
INSERT INTO public.ventas_detalle VALUES (796, 392, 16, 3, 380000.00, 1140000.00, '2026-01-26 08:13:27', '2026-01-26 08:13:27');
INSERT INTO public.ventas_detalle VALUES (797, 393, 1, 2, 250000.00, 500000.00, '2024-09-01 07:13:27', '2024-09-01 07:13:27');
INSERT INTO public.ventas_detalle VALUES (798, 393, 7, 2, 160000.00, 320000.00, '2024-09-01 07:13:27', '2024-09-01 07:13:27');
INSERT INTO public.ventas_detalle VALUES (799, 393, 17, 3, 350000.00, 1050000.00, '2024-09-01 07:13:27', '2024-09-01 07:13:27');
INSERT INTO public.ventas_detalle VALUES (800, 394, 8, 3, 175000.00, 525000.00, '2025-12-02 23:13:27', '2025-12-02 23:13:27');
INSERT INTO public.ventas_detalle VALUES (801, 394, 14, 3, 290000.00, 870000.00, '2025-12-02 23:13:27', '2025-12-02 23:13:27');
INSERT INTO public.ventas_detalle VALUES (802, 394, 15, 3, 270000.00, 810000.00, '2025-12-02 23:13:27', '2025-12-02 23:13:27');
INSERT INTO public.ventas_detalle VALUES (803, 395, 2, 1, 210000.00, 210000.00, '2024-01-27 14:13:27', '2024-01-27 14:13:27');
INSERT INTO public.ventas_detalle VALUES (804, 395, 3, 2, 180000.00, 360000.00, '2024-01-27 14:13:27', '2024-01-27 14:13:27');
INSERT INTO public.ventas_detalle VALUES (805, 395, 12, 1, 205000.00, 205000.00, '2024-01-27 14:13:27', '2024-01-27 14:13:27');
INSERT INTO public.ventas_detalle VALUES (806, 396, 5, 1, 190000.00, 190000.00, '2025-11-08 16:13:27', '2025-11-08 16:13:27');
INSERT INTO public.ventas_detalle VALUES (807, 396, 10, 2, 195000.00, 390000.00, '2025-11-08 16:13:27', '2025-11-08 16:13:27');
INSERT INTO public.ventas_detalle VALUES (808, 396, 15, 1, 270000.00, 270000.00, '2025-11-08 16:13:27', '2025-11-08 16:13:27');
INSERT INTO public.ventas_detalle VALUES (809, 397, 7, 1, 160000.00, 160000.00, '2024-03-06 12:13:27', '2024-03-06 12:13:27');
INSERT INTO public.ventas_detalle VALUES (810, 398, 12, 3, 205000.00, 615000.00, '2023-09-24 00:13:27', '2023-09-24 00:13:27');
INSERT INTO public.ventas_detalle VALUES (811, 398, 15, 3, 270000.00, 810000.00, '2023-09-24 00:13:27', '2023-09-24 00:13:27');
INSERT INTO public.ventas_detalle VALUES (812, 399, 14, 3, 290000.00, 870000.00, '2024-10-05 04:13:27', '2024-10-05 04:13:27');
INSERT INTO public.ventas_detalle VALUES (813, 400, 7, 2, 160000.00, 320000.00, '2025-09-14 12:13:27', '2025-09-14 12:13:27');
INSERT INTO public.ventas_detalle VALUES (814, 400, 8, 3, 175000.00, 525000.00, '2025-09-14 12:13:27', '2025-09-14 12:13:27');
INSERT INTO public.ventas_detalle VALUES (815, 400, 18, 1, 240000.00, 240000.00, '2025-09-14 12:13:27', '2025-09-14 12:13:27');
INSERT INTO public.ventas_detalle VALUES (816, 401, 3, 3, 180000.00, 540000.00, '2024-11-04 14:13:27', '2024-11-04 14:13:27');
INSERT INTO public.ventas_detalle VALUES (817, 401, 9, 2, 220000.00, 440000.00, '2024-11-04 14:13:27', '2024-11-04 14:13:27');
INSERT INTO public.ventas_detalle VALUES (818, 402, 8, 2, 175000.00, 350000.00, '2026-06-02 19:13:27', '2026-06-02 19:13:27');
INSERT INTO public.ventas_detalle VALUES (819, 403, 2, 3, 210000.00, 630000.00, '2024-01-25 20:13:27', '2024-01-25 20:13:27');
INSERT INTO public.ventas_detalle VALUES (820, 403, 15, 1, 270000.00, 270000.00, '2024-01-25 20:13:27', '2024-01-25 20:13:27');
INSERT INTO public.ventas_detalle VALUES (821, 404, 11, 3, 150000.00, 450000.00, '2025-05-06 01:13:27', '2025-05-06 01:13:27');
INSERT INTO public.ventas_detalle VALUES (822, 405, 11, 1, 150000.00, 150000.00, '2025-09-28 08:13:27', '2025-09-28 08:13:27');
INSERT INTO public.ventas_detalle VALUES (823, 405, 15, 1, 270000.00, 270000.00, '2025-09-28 08:13:27', '2025-09-28 08:13:27');
INSERT INTO public.ventas_detalle VALUES (824, 405, 18, 3, 240000.00, 720000.00, '2025-09-28 08:13:27', '2025-09-28 08:13:27');
INSERT INTO public.ventas_detalle VALUES (825, 406, 15, 2, 270000.00, 540000.00, '2024-10-03 07:13:27', '2024-10-03 07:13:27');
INSERT INTO public.ventas_detalle VALUES (826, 407, 8, 3, 175000.00, 525000.00, '2024-11-18 04:13:27', '2024-11-18 04:13:27');
INSERT INTO public.ventas_detalle VALUES (827, 407, 18, 2, 240000.00, 480000.00, '2024-11-18 04:13:27', '2024-11-18 04:13:27');
INSERT INTO public.ventas_detalle VALUES (828, 408, 9, 1, 220000.00, 220000.00, '2024-04-14 13:13:27', '2024-04-14 13:13:27');
INSERT INTO public.ventas_detalle VALUES (829, 408, 14, 3, 290000.00, 870000.00, '2024-04-14 13:13:27', '2024-04-14 13:13:27');
INSERT INTO public.ventas_detalle VALUES (830, 408, 16, 1, 380000.00, 380000.00, '2024-04-14 13:13:27', '2024-04-14 13:13:27');
INSERT INTO public.ventas_detalle VALUES (831, 409, 6, 2, 310000.00, 620000.00, '2025-09-20 20:13:27', '2025-09-20 20:13:27');
INSERT INTO public.ventas_detalle VALUES (832, 409, 10, 2, 195000.00, 390000.00, '2025-09-20 20:13:27', '2025-09-20 20:13:27');
INSERT INTO public.ventas_detalle VALUES (833, 409, 11, 2, 150000.00, 300000.00, '2025-09-20 20:13:27', '2025-09-20 20:13:27');
INSERT INTO public.ventas_detalle VALUES (834, 410, 16, 3, 380000.00, 1140000.00, '2026-03-20 01:13:27', '2026-03-20 01:13:27');
INSERT INTO public.ventas_detalle VALUES (835, 411, 18, 2, 240000.00, 480000.00, '2024-12-07 01:13:27', '2024-12-07 01:13:27');
INSERT INTO public.ventas_detalle VALUES (836, 412, 3, 3, 180000.00, 540000.00, '2025-11-12 17:13:27', '2025-11-12 17:13:27');
INSERT INTO public.ventas_detalle VALUES (837, 412, 5, 3, 190000.00, 570000.00, '2025-11-12 17:13:27', '2025-11-12 17:13:27');
INSERT INTO public.ventas_detalle VALUES (838, 412, 17, 3, 350000.00, 1050000.00, '2025-11-12 17:13:27', '2025-11-12 17:13:27');
INSERT INTO public.ventas_detalle VALUES (839, 413, 1, 2, 250000.00, 500000.00, '2024-02-09 19:13:27', '2024-02-09 19:13:27');
INSERT INTO public.ventas_detalle VALUES (840, 413, 8, 2, 175000.00, 350000.00, '2024-02-09 19:13:27', '2024-02-09 19:13:27');
INSERT INTO public.ventas_detalle VALUES (841, 413, 9, 3, 220000.00, 660000.00, '2024-02-09 19:13:27', '2024-02-09 19:13:27');
INSERT INTO public.ventas_detalle VALUES (842, 414, 5, 3, 190000.00, 570000.00, '2024-03-08 07:13:27', '2024-03-08 07:13:27');
INSERT INTO public.ventas_detalle VALUES (843, 415, 1, 3, 250000.00, 750000.00, '2023-06-30 08:13:27', '2023-06-30 08:13:27');
INSERT INTO public.ventas_detalle VALUES (844, 415, 14, 1, 290000.00, 290000.00, '2023-06-30 08:13:27', '2023-06-30 08:13:27');
INSERT INTO public.ventas_detalle VALUES (845, 416, 16, 1, 380000.00, 380000.00, '2026-02-13 11:13:27', '2026-02-13 11:13:27');
INSERT INTO public.ventas_detalle VALUES (846, 416, 17, 1, 350000.00, 350000.00, '2026-02-13 11:13:27', '2026-02-13 11:13:27');
INSERT INTO public.ventas_detalle VALUES (847, 417, 3, 1, 180000.00, 180000.00, '2025-04-09 07:13:27', '2025-04-09 07:13:27');
INSERT INTO public.ventas_detalle VALUES (848, 417, 5, 2, 190000.00, 380000.00, '2025-04-09 07:13:27', '2025-04-09 07:13:27');
INSERT INTO public.ventas_detalle VALUES (849, 417, 16, 1, 380000.00, 380000.00, '2025-04-09 07:13:27', '2025-04-09 07:13:27');
INSERT INTO public.ventas_detalle VALUES (850, 418, 17, 2, 350000.00, 700000.00, '2025-10-07 08:13:27', '2025-10-07 08:13:27');
INSERT INTO public.ventas_detalle VALUES (851, 419, 6, 1, 310000.00, 310000.00, '2025-10-03 14:13:27', '2025-10-03 14:13:27');
INSERT INTO public.ventas_detalle VALUES (852, 420, 7, 2, 160000.00, 320000.00, '2023-06-30 13:13:27', '2023-06-30 13:13:27');
INSERT INTO public.ventas_detalle VALUES (853, 420, 11, 2, 150000.00, 300000.00, '2023-06-30 13:13:27', '2023-06-30 13:13:27');
INSERT INTO public.ventas_detalle VALUES (854, 420, 12, 1, 205000.00, 205000.00, '2023-06-30 13:13:27', '2023-06-30 13:13:27');
INSERT INTO public.ventas_detalle VALUES (855, 421, 1, 3, 250000.00, 750000.00, '2025-04-22 02:13:27', '2025-04-22 02:13:27');
INSERT INTO public.ventas_detalle VALUES (856, 421, 3, 1, 180000.00, 180000.00, '2025-04-22 02:13:27', '2025-04-22 02:13:27');
INSERT INTO public.ventas_detalle VALUES (857, 421, 11, 2, 150000.00, 300000.00, '2025-04-22 02:13:27', '2025-04-22 02:13:27');
INSERT INTO public.ventas_detalle VALUES (858, 422, 1, 1, 250000.00, 250000.00, '2024-05-11 19:13:27', '2024-05-11 19:13:27');
INSERT INTO public.ventas_detalle VALUES (859, 422, 12, 3, 205000.00, 615000.00, '2024-05-11 19:13:27', '2024-05-11 19:13:27');
INSERT INTO public.ventas_detalle VALUES (860, 422, 18, 2, 240000.00, 480000.00, '2024-05-11 19:13:27', '2024-05-11 19:13:27');
INSERT INTO public.ventas_detalle VALUES (861, 423, 12, 2, 205000.00, 410000.00, '2026-05-10 05:13:27', '2026-05-10 05:13:27');
INSERT INTO public.ventas_detalle VALUES (862, 424, 5, 1, 190000.00, 190000.00, '2025-10-27 16:13:27', '2025-10-27 16:13:27');
INSERT INTO public.ventas_detalle VALUES (863, 424, 8, 1, 175000.00, 175000.00, '2025-10-27 16:13:27', '2025-10-27 16:13:27');
INSERT INTO public.ventas_detalle VALUES (864, 424, 16, 1, 380000.00, 380000.00, '2025-10-27 16:13:27', '2025-10-27 16:13:27');
INSERT INTO public.ventas_detalle VALUES (865, 425, 16, 1, 380000.00, 380000.00, '2026-02-06 14:13:27', '2026-02-06 14:13:27');
INSERT INTO public.ventas_detalle VALUES (866, 425, 18, 1, 240000.00, 240000.00, '2026-02-06 14:13:27', '2026-02-06 14:13:27');
INSERT INTO public.ventas_detalle VALUES (867, 426, 17, 1, 350000.00, 350000.00, '2024-08-14 15:13:27', '2024-08-14 15:13:27');
INSERT INTO public.ventas_detalle VALUES (868, 427, 14, 3, 290000.00, 870000.00, '2025-01-12 07:13:27', '2025-01-12 07:13:27');
INSERT INTO public.ventas_detalle VALUES (869, 428, 9, 3, 220000.00, 660000.00, '2024-02-06 07:13:27', '2024-02-06 07:13:27');
INSERT INTO public.ventas_detalle VALUES (870, 428, 17, 1, 350000.00, 350000.00, '2024-02-06 07:13:27', '2024-02-06 07:13:27');
INSERT INTO public.ventas_detalle VALUES (871, 429, 11, 3, 150000.00, 450000.00, '2024-04-12 23:13:27', '2024-04-12 23:13:27');
INSERT INTO public.ventas_detalle VALUES (872, 430, 6, 1, 310000.00, 310000.00, '2025-01-28 00:13:27', '2025-01-28 00:13:27');
INSERT INTO public.ventas_detalle VALUES (873, 430, 8, 2, 175000.00, 350000.00, '2025-01-28 00:13:27', '2025-01-28 00:13:27');
INSERT INTO public.ventas_detalle VALUES (874, 430, 15, 2, 270000.00, 540000.00, '2025-01-28 00:13:27', '2025-01-28 00:13:27');
INSERT INTO public.ventas_detalle VALUES (875, 431, 11, 2, 150000.00, 300000.00, '2026-05-16 20:13:27', '2026-05-16 20:13:27');
INSERT INTO public.ventas_detalle VALUES (876, 432, 5, 3, 190000.00, 570000.00, '2025-02-06 01:13:27', '2025-02-06 01:13:27');
INSERT INTO public.ventas_detalle VALUES (877, 432, 16, 3, 380000.00, 1140000.00, '2025-02-06 01:13:27', '2025-02-06 01:13:27');
INSERT INTO public.ventas_detalle VALUES (878, 433, 8, 3, 175000.00, 525000.00, '2025-03-31 22:13:27', '2025-03-31 22:13:27');
INSERT INTO public.ventas_detalle VALUES (879, 433, 9, 2, 220000.00, 440000.00, '2025-03-31 22:13:27', '2025-03-31 22:13:27');
INSERT INTO public.ventas_detalle VALUES (880, 433, 17, 1, 350000.00, 350000.00, '2025-03-31 22:13:27', '2025-03-31 22:13:27');
INSERT INTO public.ventas_detalle VALUES (881, 434, 6, 2, 310000.00, 620000.00, '2026-06-06 09:13:27', '2026-06-06 09:13:27');
INSERT INTO public.ventas_detalle VALUES (882, 434, 8, 1, 175000.00, 175000.00, '2026-06-06 09:13:27', '2026-06-06 09:13:27');
INSERT INTO public.ventas_detalle VALUES (883, 435, 2, 2, 210000.00, 420000.00, '2026-02-04 17:13:27', '2026-02-04 17:13:27');
INSERT INTO public.ventas_detalle VALUES (884, 435, 6, 2, 310000.00, 620000.00, '2026-02-04 17:13:27', '2026-02-04 17:13:27');
INSERT INTO public.ventas_detalle VALUES (885, 435, 9, 3, 220000.00, 660000.00, '2026-02-04 17:13:27', '2026-02-04 17:13:27');
INSERT INTO public.ventas_detalle VALUES (886, 436, 3, 3, 180000.00, 540000.00, '2026-05-10 05:13:27', '2026-05-10 05:13:27');
INSERT INTO public.ventas_detalle VALUES (887, 436, 8, 3, 175000.00, 525000.00, '2026-05-10 05:13:27', '2026-05-10 05:13:27');
INSERT INTO public.ventas_detalle VALUES (888, 436, 16, 3, 380000.00, 1140000.00, '2026-05-10 05:13:27', '2026-05-10 05:13:27');
INSERT INTO public.ventas_detalle VALUES (889, 437, 14, 1, 290000.00, 290000.00, '2025-09-11 12:13:27', '2025-09-11 12:13:27');
INSERT INTO public.ventas_detalle VALUES (890, 437, 15, 3, 270000.00, 810000.00, '2025-09-11 12:13:27', '2025-09-11 12:13:27');
INSERT INTO public.ventas_detalle VALUES (891, 438, 1, 1, 250000.00, 250000.00, '2026-03-26 20:13:27', '2026-03-26 20:13:27');
INSERT INTO public.ventas_detalle VALUES (892, 438, 16, 3, 380000.00, 1140000.00, '2026-03-26 20:13:27', '2026-03-26 20:13:27');
INSERT INTO public.ventas_detalle VALUES (893, 439, 10, 2, 195000.00, 390000.00, '2025-02-21 19:13:27', '2025-02-21 19:13:27');
INSERT INTO public.ventas_detalle VALUES (894, 439, 17, 2, 350000.00, 700000.00, '2025-02-21 19:13:27', '2025-02-21 19:13:27');
INSERT INTO public.ventas_detalle VALUES (895, 440, 3, 2, 180000.00, 360000.00, '2024-07-14 16:13:27', '2024-07-14 16:13:27');
INSERT INTO public.ventas_detalle VALUES (896, 440, 11, 1, 150000.00, 150000.00, '2024-07-14 16:13:27', '2024-07-14 16:13:27');
INSERT INTO public.ventas_detalle VALUES (897, 440, 15, 2, 270000.00, 540000.00, '2024-07-14 16:13:27', '2024-07-14 16:13:27');
INSERT INTO public.ventas_detalle VALUES (898, 441, 11, 1, 150000.00, 150000.00, '2024-10-22 08:13:27', '2024-10-22 08:13:27');
INSERT INTO public.ventas_detalle VALUES (899, 442, 6, 2, 310000.00, 620000.00, '2026-04-19 23:13:27', '2026-04-19 23:13:27');
INSERT INTO public.ventas_detalle VALUES (900, 442, 9, 3, 220000.00, 660000.00, '2026-04-19 23:13:27', '2026-04-19 23:13:27');
INSERT INTO public.ventas_detalle VALUES (901, 443, 3, 2, 180000.00, 360000.00, '2024-10-12 08:13:27', '2024-10-12 08:13:27');
INSERT INTO public.ventas_detalle VALUES (902, 443, 9, 2, 220000.00, 440000.00, '2024-10-12 08:13:27', '2024-10-12 08:13:27');
INSERT INTO public.ventas_detalle VALUES (903, 444, 6, 2, 310000.00, 620000.00, '2023-10-29 15:13:27', '2023-10-29 15:13:27');
INSERT INTO public.ventas_detalle VALUES (904, 445, 1, 2, 250000.00, 500000.00, '2024-07-30 02:13:27', '2024-07-30 02:13:27');
INSERT INTO public.ventas_detalle VALUES (905, 445, 5, 1, 190000.00, 190000.00, '2024-07-30 02:13:27', '2024-07-30 02:13:27');
INSERT INTO public.ventas_detalle VALUES (906, 445, 7, 2, 160000.00, 320000.00, '2024-07-30 02:13:27', '2024-07-30 02:13:27');
INSERT INTO public.ventas_detalle VALUES (907, 446, 5, 3, 190000.00, 570000.00, '2023-08-25 10:13:27', '2023-08-25 10:13:27');
INSERT INTO public.ventas_detalle VALUES (908, 446, 15, 1, 270000.00, 270000.00, '2023-08-25 10:13:27', '2023-08-25 10:13:27');
INSERT INTO public.ventas_detalle VALUES (909, 446, 17, 1, 350000.00, 350000.00, '2023-08-25 10:13:27', '2023-08-25 10:13:27');
INSERT INTO public.ventas_detalle VALUES (910, 447, 6, 3, 310000.00, 930000.00, '2024-09-04 01:13:27', '2024-09-04 01:13:27');
INSERT INTO public.ventas_detalle VALUES (911, 447, 12, 1, 205000.00, 205000.00, '2024-09-04 01:13:27', '2024-09-04 01:13:27');
INSERT INTO public.ventas_detalle VALUES (912, 447, 15, 2, 270000.00, 540000.00, '2024-09-04 01:13:27', '2024-09-04 01:13:27');
INSERT INTO public.ventas_detalle VALUES (913, 448, 7, 1, 160000.00, 160000.00, '2025-08-18 07:13:27', '2025-08-18 07:13:27');
INSERT INTO public.ventas_detalle VALUES (914, 448, 9, 2, 220000.00, 440000.00, '2025-08-18 07:13:27', '2025-08-18 07:13:27');
INSERT INTO public.ventas_detalle VALUES (915, 448, 18, 2, 240000.00, 480000.00, '2025-08-18 07:13:27', '2025-08-18 07:13:27');
INSERT INTO public.ventas_detalle VALUES (916, 449, 6, 3, 310000.00, 930000.00, '2026-04-02 14:13:27', '2026-04-02 14:13:27');
INSERT INTO public.ventas_detalle VALUES (917, 450, 1, 3, 250000.00, 750000.00, '2023-11-08 12:13:27', '2023-11-08 12:13:27');
INSERT INTO public.ventas_detalle VALUES (918, 450, 9, 3, 220000.00, 660000.00, '2023-11-08 12:13:27', '2023-11-08 12:13:27');
INSERT INTO public.ventas_detalle VALUES (919, 450, 18, 2, 240000.00, 480000.00, '2023-11-08 12:13:27', '2023-11-08 12:13:27');
INSERT INTO public.ventas_detalle VALUES (920, 451, 5, 1, 190000.00, 190000.00, '2025-04-28 08:13:27', '2025-04-28 08:13:27');
INSERT INTO public.ventas_detalle VALUES (921, 451, 16, 3, 380000.00, 1140000.00, '2025-04-28 08:13:27', '2025-04-28 08:13:27');
INSERT INTO public.ventas_detalle VALUES (922, 452, 2, 1, 210000.00, 210000.00, '2024-10-07 11:13:27', '2024-10-07 11:13:27');
INSERT INTO public.ventas_detalle VALUES (923, 453, 1, 2, 250000.00, 500000.00, '2024-06-04 17:13:27', '2024-06-04 17:13:27');
INSERT INTO public.ventas_detalle VALUES (924, 453, 11, 1, 150000.00, 150000.00, '2024-06-04 17:13:27', '2024-06-04 17:13:27');
INSERT INTO public.ventas_detalle VALUES (925, 453, 18, 2, 240000.00, 480000.00, '2024-06-04 17:13:27', '2024-06-04 17:13:27');
INSERT INTO public.ventas_detalle VALUES (926, 454, 5, 2, 190000.00, 380000.00, '2024-11-20 18:13:27', '2024-11-20 18:13:27');
INSERT INTO public.ventas_detalle VALUES (927, 454, 15, 3, 270000.00, 810000.00, '2024-11-20 18:13:27', '2024-11-20 18:13:27');
INSERT INTO public.ventas_detalle VALUES (928, 454, 17, 2, 350000.00, 700000.00, '2024-11-20 18:13:27', '2024-11-20 18:13:27');
INSERT INTO public.ventas_detalle VALUES (929, 455, 17, 2, 350000.00, 700000.00, '2025-11-24 04:13:27', '2025-11-24 04:13:27');
INSERT INTO public.ventas_detalle VALUES (930, 456, 10, 1, 195000.00, 195000.00, '2024-03-14 06:13:27', '2024-03-14 06:13:27');
INSERT INTO public.ventas_detalle VALUES (931, 457, 11, 1, 150000.00, 150000.00, '2025-01-22 14:13:27', '2025-01-22 14:13:27');
INSERT INTO public.ventas_detalle VALUES (932, 457, 16, 2, 380000.00, 760000.00, '2025-01-22 14:13:27', '2025-01-22 14:13:27');
INSERT INTO public.ventas_detalle VALUES (933, 458, 3, 3, 180000.00, 540000.00, '2024-03-29 03:13:27', '2024-03-29 03:13:27');
INSERT INTO public.ventas_detalle VALUES (934, 458, 17, 3, 350000.00, 1050000.00, '2024-03-29 03:13:27', '2024-03-29 03:13:27');
INSERT INTO public.ventas_detalle VALUES (935, 458, 18, 3, 240000.00, 720000.00, '2024-03-29 03:13:27', '2024-03-29 03:13:27');
INSERT INTO public.ventas_detalle VALUES (936, 459, 18, 3, 240000.00, 720000.00, '2023-07-28 05:13:27', '2023-07-28 05:13:27');
INSERT INTO public.ventas_detalle VALUES (937, 460, 6, 2, 310000.00, 620000.00, '2026-04-10 13:13:27', '2026-04-10 13:13:27');
INSERT INTO public.ventas_detalle VALUES (938, 460, 10, 3, 195000.00, 585000.00, '2026-04-10 13:13:27', '2026-04-10 13:13:27');
INSERT INTO public.ventas_detalle VALUES (939, 461, 6, 2, 310000.00, 620000.00, '2025-02-27 00:13:27', '2025-02-27 00:13:27');
INSERT INTO public.ventas_detalle VALUES (940, 461, 10, 3, 195000.00, 585000.00, '2025-02-27 00:13:27', '2025-02-27 00:13:27');
INSERT INTO public.ventas_detalle VALUES (941, 461, 17, 1, 350000.00, 350000.00, '2025-02-27 00:13:27', '2025-02-27 00:13:27');
INSERT INTO public.ventas_detalle VALUES (942, 462, 11, 3, 150000.00, 450000.00, '2026-02-23 18:13:27', '2026-02-23 18:13:27');
INSERT INTO public.ventas_detalle VALUES (943, 462, 12, 1, 205000.00, 205000.00, '2026-02-23 18:13:27', '2026-02-23 18:13:27');
INSERT INTO public.ventas_detalle VALUES (944, 462, 14, 2, 290000.00, 580000.00, '2026-02-23 18:13:27', '2026-02-23 18:13:27');
INSERT INTO public.ventas_detalle VALUES (945, 463, 6, 1, 310000.00, 310000.00, '2025-01-23 16:13:27', '2025-01-23 16:13:27');
INSERT INTO public.ventas_detalle VALUES (946, 464, 17, 3, 350000.00, 1050000.00, '2025-02-15 01:13:27', '2025-02-15 01:13:27');
INSERT INTO public.ventas_detalle VALUES (947, 465, 1, 3, 250000.00, 750000.00, '2025-05-22 23:13:27', '2025-05-22 23:13:27');
INSERT INTO public.ventas_detalle VALUES (948, 465, 14, 1, 290000.00, 290000.00, '2025-05-22 23:13:27', '2025-05-22 23:13:27');
INSERT INTO public.ventas_detalle VALUES (949, 465, 16, 1, 380000.00, 380000.00, '2025-05-22 23:13:27', '2025-05-22 23:13:27');
INSERT INTO public.ventas_detalle VALUES (950, 466, 3, 3, 180000.00, 540000.00, '2026-01-29 09:13:27', '2026-01-29 09:13:27');
INSERT INTO public.ventas_detalle VALUES (951, 466, 14, 2, 290000.00, 580000.00, '2026-01-29 09:13:27', '2026-01-29 09:13:27');
INSERT INTO public.ventas_detalle VALUES (952, 467, 1, 3, 250000.00, 750000.00, '2024-12-25 18:13:27', '2024-12-25 18:13:27');
INSERT INTO public.ventas_detalle VALUES (953, 467, 18, 2, 240000.00, 480000.00, '2024-12-25 18:13:27', '2024-12-25 18:13:27');
INSERT INTO public.ventas_detalle VALUES (954, 468, 9, 3, 220000.00, 660000.00, '2024-02-21 06:13:27', '2024-02-21 06:13:27');
INSERT INTO public.ventas_detalle VALUES (955, 469, 1, 3, 250000.00, 750000.00, '2023-06-24 01:13:27', '2023-06-24 01:13:27');
INSERT INTO public.ventas_detalle VALUES (956, 470, 5, 1, 190000.00, 190000.00, '2025-12-17 04:13:27', '2025-12-17 04:13:27');
INSERT INTO public.ventas_detalle VALUES (957, 470, 7, 2, 160000.00, 320000.00, '2025-12-17 04:13:27', '2025-12-17 04:13:27');
INSERT INTO public.ventas_detalle VALUES (958, 470, 16, 2, 380000.00, 760000.00, '2025-12-17 04:13:27', '2025-12-17 04:13:27');
INSERT INTO public.ventas_detalle VALUES (959, 471, 2, 3, 210000.00, 630000.00, '2024-08-07 20:13:27', '2024-08-07 20:13:27');
INSERT INTO public.ventas_detalle VALUES (960, 471, 10, 1, 195000.00, 195000.00, '2024-08-07 20:13:27', '2024-08-07 20:13:27');
INSERT INTO public.ventas_detalle VALUES (961, 471, 17, 2, 350000.00, 700000.00, '2024-08-07 20:13:27', '2024-08-07 20:13:27');
INSERT INTO public.ventas_detalle VALUES (962, 472, 18, 2, 240000.00, 480000.00, '2025-08-20 04:13:27', '2025-08-20 04:13:27');
INSERT INTO public.ventas_detalle VALUES (963, 473, 7, 2, 160000.00, 320000.00, '2023-07-24 01:13:27', '2023-07-24 01:13:27');
INSERT INTO public.ventas_detalle VALUES (964, 474, 5, 2, 190000.00, 380000.00, '2024-11-12 11:13:27', '2024-11-12 11:13:27');
INSERT INTO public.ventas_detalle VALUES (965, 474, 6, 3, 310000.00, 930000.00, '2024-11-12 11:13:27', '2024-11-12 11:13:27');
INSERT INTO public.ventas_detalle VALUES (966, 474, 12, 3, 205000.00, 615000.00, '2024-11-12 11:13:27', '2024-11-12 11:13:27');
INSERT INTO public.ventas_detalle VALUES (967, 475, 11, 1, 150000.00, 150000.00, '2025-02-25 13:13:27', '2025-02-25 13:13:27');
INSERT INTO public.ventas_detalle VALUES (968, 475, 12, 2, 205000.00, 410000.00, '2025-02-25 13:13:27', '2025-02-25 13:13:27');
INSERT INTO public.ventas_detalle VALUES (969, 475, 17, 1, 350000.00, 350000.00, '2025-02-25 13:13:27', '2025-02-25 13:13:27');
INSERT INTO public.ventas_detalle VALUES (970, 476, 18, 3, 240000.00, 720000.00, '2024-06-03 08:13:27', '2024-06-03 08:13:27');
INSERT INTO public.ventas_detalle VALUES (971, 477, 14, 2, 290000.00, 580000.00, '2024-06-05 22:13:27', '2024-06-05 22:13:27');
INSERT INTO public.ventas_detalle VALUES (972, 477, 16, 3, 380000.00, 1140000.00, '2024-06-05 22:13:27', '2024-06-05 22:13:27');
INSERT INTO public.ventas_detalle VALUES (973, 478, 5, 3, 190000.00, 570000.00, '2023-11-22 19:13:27', '2023-11-22 19:13:27');
INSERT INTO public.ventas_detalle VALUES (974, 478, 18, 2, 240000.00, 480000.00, '2023-11-22 19:13:27', '2023-11-22 19:13:27');
INSERT INTO public.ventas_detalle VALUES (975, 479, 16, 1, 380000.00, 380000.00, '2026-03-14 06:13:27', '2026-03-14 06:13:27');
INSERT INTO public.ventas_detalle VALUES (976, 479, 17, 2, 350000.00, 700000.00, '2026-03-14 06:13:27', '2026-03-14 06:13:27');
INSERT INTO public.ventas_detalle VALUES (977, 480, 2, 2, 210000.00, 420000.00, '2025-01-08 01:13:27', '2025-01-08 01:13:27');
INSERT INTO public.ventas_detalle VALUES (978, 480, 11, 1, 150000.00, 150000.00, '2025-01-08 01:13:27', '2025-01-08 01:13:27');
INSERT INTO public.ventas_detalle VALUES (979, 480, 16, 2, 380000.00, 760000.00, '2025-01-08 01:13:27', '2025-01-08 01:13:27');
INSERT INTO public.ventas_detalle VALUES (980, 481, 7, 1, 160000.00, 160000.00, '2026-06-05 16:13:27', '2026-06-05 16:13:27');
INSERT INTO public.ventas_detalle VALUES (981, 481, 16, 2, 380000.00, 760000.00, '2026-06-05 16:13:27', '2026-06-05 16:13:27');
INSERT INTO public.ventas_detalle VALUES (982, 482, 12, 3, 205000.00, 615000.00, '2025-12-16 07:13:27', '2025-12-16 07:13:27');
INSERT INTO public.ventas_detalle VALUES (983, 483, 1, 3, 250000.00, 750000.00, '2024-12-27 17:13:27', '2024-12-27 17:13:27');
INSERT INTO public.ventas_detalle VALUES (984, 483, 11, 1, 150000.00, 150000.00, '2024-12-27 17:13:27', '2024-12-27 17:13:27');
INSERT INTO public.ventas_detalle VALUES (985, 483, 14, 3, 290000.00, 870000.00, '2024-12-27 17:13:27', '2024-12-27 17:13:27');
INSERT INTO public.ventas_detalle VALUES (986, 484, 7, 2, 160000.00, 320000.00, '2024-07-05 16:13:27', '2024-07-05 16:13:27');
INSERT INTO public.ventas_detalle VALUES (987, 484, 11, 1, 150000.00, 150000.00, '2024-07-05 16:13:27', '2024-07-05 16:13:27');
INSERT INTO public.ventas_detalle VALUES (988, 485, 3, 3, 180000.00, 540000.00, '2025-11-15 02:13:27', '2025-11-15 02:13:27');
INSERT INTO public.ventas_detalle VALUES (989, 485, 14, 3, 290000.00, 870000.00, '2025-11-15 02:13:27', '2025-11-15 02:13:27');
INSERT INTO public.ventas_detalle VALUES (990, 485, 15, 1, 270000.00, 270000.00, '2025-11-15 02:13:27', '2025-11-15 02:13:27');
INSERT INTO public.ventas_detalle VALUES (991, 486, 18, 2, 240000.00, 480000.00, '2025-02-22 00:13:27', '2025-02-22 00:13:27');
INSERT INTO public.ventas_detalle VALUES (992, 487, 15, 2, 270000.00, 540000.00, '2024-08-05 06:13:27', '2024-08-05 06:13:27');
INSERT INTO public.ventas_detalle VALUES (993, 488, 6, 1, 310000.00, 310000.00, '2024-07-15 02:13:27', '2024-07-15 02:13:27');
INSERT INTO public.ventas_detalle VALUES (994, 488, 10, 2, 195000.00, 390000.00, '2024-07-15 02:13:27', '2024-07-15 02:13:27');
INSERT INTO public.ventas_detalle VALUES (995, 488, 18, 2, 240000.00, 480000.00, '2024-07-15 02:13:27', '2024-07-15 02:13:27');
INSERT INTO public.ventas_detalle VALUES (996, 489, 15, 2, 270000.00, 540000.00, '2023-12-20 13:13:27', '2023-12-20 13:13:27');
INSERT INTO public.ventas_detalle VALUES (997, 490, 2, 2, 210000.00, 420000.00, '2024-11-16 09:13:27', '2024-11-16 09:13:27');
INSERT INTO public.ventas_detalle VALUES (998, 490, 11, 2, 150000.00, 300000.00, '2024-11-16 09:13:27', '2024-11-16 09:13:27');
INSERT INTO public.ventas_detalle VALUES (999, 490, 12, 3, 205000.00, 615000.00, '2024-11-16 09:13:27', '2024-11-16 09:13:27');
INSERT INTO public.ventas_detalle VALUES (1000, 491, 7, 2, 160000.00, 320000.00, '2024-08-03 19:13:27', '2024-08-03 19:13:27');
INSERT INTO public.ventas_detalle VALUES (1001, 491, 10, 2, 195000.00, 390000.00, '2024-08-03 19:13:27', '2024-08-03 19:13:27');
INSERT INTO public.ventas_detalle VALUES (1002, 491, 18, 3, 240000.00, 720000.00, '2024-08-03 19:13:27', '2024-08-03 19:13:27');
INSERT INTO public.ventas_detalle VALUES (1003, 492, 1, 3, 250000.00, 750000.00, '2025-02-28 13:13:27', '2025-02-28 13:13:27');
INSERT INTO public.ventas_detalle VALUES (1004, 492, 3, 1, 180000.00, 180000.00, '2025-02-28 13:13:27', '2025-02-28 13:13:27');
INSERT INTO public.ventas_detalle VALUES (1005, 492, 15, 1, 270000.00, 270000.00, '2025-02-28 13:13:27', '2025-02-28 13:13:27');
INSERT INTO public.ventas_detalle VALUES (1006, 493, 6, 3, 310000.00, 930000.00, '2026-05-07 21:13:27', '2026-05-07 21:13:27');
INSERT INTO public.ventas_detalle VALUES (1007, 493, 7, 2, 160000.00, 320000.00, '2026-05-07 21:13:27', '2026-05-07 21:13:27');
INSERT INTO public.ventas_detalle VALUES (1008, 494, 8, 2, 175000.00, 350000.00, '2023-11-19 01:13:27', '2023-11-19 01:13:27');
INSERT INTO public.ventas_detalle VALUES (1009, 494, 15, 1, 270000.00, 270000.00, '2023-11-19 01:13:27', '2023-11-19 01:13:27');
INSERT INTO public.ventas_detalle VALUES (1010, 495, 2, 1, 210000.00, 210000.00, '2023-11-28 15:13:27', '2023-11-28 15:13:27');
INSERT INTO public.ventas_detalle VALUES (1011, 495, 3, 2, 180000.00, 360000.00, '2023-11-28 15:13:27', '2023-11-28 15:13:27');
INSERT INTO public.ventas_detalle VALUES (1012, 495, 11, 2, 150000.00, 300000.00, '2023-11-28 15:13:27', '2023-11-28 15:13:27');
INSERT INTO public.ventas_detalle VALUES (1013, 496, 9, 3, 220000.00, 660000.00, '2024-12-26 21:13:27', '2024-12-26 21:13:27');
INSERT INTO public.ventas_detalle VALUES (1014, 496, 15, 3, 270000.00, 810000.00, '2024-12-26 21:13:27', '2024-12-26 21:13:27');
INSERT INTO public.ventas_detalle VALUES (1015, 496, 17, 1, 350000.00, 350000.00, '2024-12-26 21:13:27', '2024-12-26 21:13:27');
INSERT INTO public.ventas_detalle VALUES (1016, 497, 14, 1, 290000.00, 290000.00, '2025-06-26 08:13:27', '2025-06-26 08:13:27');
INSERT INTO public.ventas_detalle VALUES (1017, 497, 16, 3, 380000.00, 1140000.00, '2025-06-26 08:13:27', '2025-06-26 08:13:27');
INSERT INTO public.ventas_detalle VALUES (1018, 498, 6, 1, 310000.00, 310000.00, '2024-03-26 08:13:27', '2024-03-26 08:13:27');
INSERT INTO public.ventas_detalle VALUES (1019, 498, 12, 2, 205000.00, 410000.00, '2024-03-26 08:13:27', '2024-03-26 08:13:27');
INSERT INTO public.ventas_detalle VALUES (1020, 499, 11, 2, 150000.00, 300000.00, '2025-11-19 22:13:27', '2025-11-19 22:13:27');
INSERT INTO public.ventas_detalle VALUES (1021, 499, 12, 2, 205000.00, 410000.00, '2025-11-19 22:13:27', '2025-11-19 22:13:27');
INSERT INTO public.ventas_detalle VALUES (1022, 500, 14, 3, 290000.00, 870000.00, '2025-05-30 16:13:27', '2025-05-30 16:13:27');
INSERT INTO public.ventas_detalle VALUES (1023, 500, 15, 3, 270000.00, 810000.00, '2025-05-30 16:13:27', '2025-05-30 16:13:27');
INSERT INTO public.ventas_detalle VALUES (1024, 501, 3, 2, 180000.00, 360000.00, '2024-01-21 02:13:27', '2024-01-21 02:13:27');
INSERT INTO public.ventas_detalle VALUES (1025, 501, 5, 2, 190000.00, 380000.00, '2024-01-21 02:13:27', '2024-01-21 02:13:27');


--
-- TOC entry 5202 (class 0 OID 0)
-- Dependencies: 221
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 3, true);


--
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 223
-- Name: contactos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contactos_id_seq', 50, true);


--
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 240
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 237
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 5206 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 162, true);


--
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 244
-- Name: producto_imagenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_imagenes_id_seq', 36, true);


--
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 225
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 18, true);


--
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 227
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 246
-- Name: user_direcciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_direcciones_id_seq', 1, false);


--
-- TOC entry 5211 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 101, true);


--
-- TOC entry 5212 (class 0 OID 0)
-- Dependencies: 232
-- Name: ventas_cabecera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_cabecera_id_seq', 501, true);


--
-- TOC entry 5213 (class 0 OID 0)
-- Dependencies: 234
-- Name: ventas_detalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_detalle_id_seq', 1025, true);


--
-- TOC entry 4996 (class 2606 OID 29145)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 4994 (class 2606 OID 29135)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 4957 (class 2606 OID 28941)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 4959 (class 2606 OID 28943)
-- Name: categorias categorias_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_slug_unique UNIQUE (slug);


--
-- TOC entry 4961 (class 2606 OID 28958)
-- Name: contactos contactos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_pkey PRIMARY KEY (id);


--
-- TOC entry 4990 (class 2606 OID 29123)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4992 (class 2606 OID 29125)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4988 (class 2606 OID 29106)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 4985 (class 2606 OID 29091)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4955 (class 2606 OID 26726)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4983 (class 2606 OID 29076)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 4998 (class 2606 OID 29160)
-- Name: producto_imagenes producto_imagenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_imagenes
    ADD CONSTRAINT producto_imagenes_pkey PRIMARY KEY (id);


--
-- TOC entry 4963 (class 2606 OID 28976)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 4965 (class 2606 OID 28983)
-- Name: productos productos_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_slug_unique UNIQUE (slug);


--
-- TOC entry 4967 (class 2606 OID 28994)
-- Name: roles roles_nombre_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_nombre_unique UNIQUE (nombre);


--
-- TOC entry 4969 (class 2606 OID 28992)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4976 (class 2606 OID 29024)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 5000 (class 2606 OID 29187)
-- Name: user_direcciones user_direcciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_direcciones
    ADD CONSTRAINT user_direcciones_pkey PRIMARY KEY (id);


--
-- TOC entry 4971 (class 2606 OID 29014)
-- Name: usuarios usuarios_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_unique UNIQUE (email);


--
-- TOC entry 4973 (class 2606 OID 29007)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4979 (class 2606 OID 29039)
-- Name: ventas_cabecera ventas_cabecera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_cabecera
    ADD CONSTRAINT ventas_cabecera_pkey PRIMARY KEY (id);


--
-- TOC entry 4981 (class 2606 OID 29057)
-- Name: ventas_detalle ventas_detalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT ventas_detalle_pkey PRIMARY KEY (id);


--
-- TOC entry 4986 (class 1259 OID 29092)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 4974 (class 1259 OID 29026)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 4977 (class 1259 OID 29025)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 5007 (class 2606 OID 29161)
-- Name: producto_imagenes producto_imagenes_producto_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_imagenes
    ADD CONSTRAINT producto_imagenes_producto_id_foreign FOREIGN KEY (producto_id) REFERENCES public.productos(id) ON DELETE CASCADE;


--
-- TOC entry 5001 (class 2606 OID 28977)
-- Name: productos productos_categoria_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_categoria_id_foreign FOREIGN KEY (categoria_id) REFERENCES public.categorias(id) ON DELETE CASCADE;


--
-- TOC entry 5008 (class 2606 OID 29188)
-- Name: user_direcciones user_direcciones_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_direcciones
    ADD CONSTRAINT user_direcciones_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


--
-- TOC entry 5002 (class 2606 OID 29008)
-- Name: usuarios usuarios_rol_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_rol_id_foreign FOREIGN KEY (rol_id) REFERENCES public.roles(id) ON DELETE SET NULL;


--
-- TOC entry 5003 (class 2606 OID 29193)
-- Name: ventas_cabecera ventas_cabecera_user_direccion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_cabecera
    ADD CONSTRAINT ventas_cabecera_user_direccion_id_foreign FOREIGN KEY (user_direccion_id) REFERENCES public.user_direcciones(id) ON DELETE SET NULL;


--
-- TOC entry 5004 (class 2606 OID 29040)
-- Name: ventas_cabecera ventas_cabecera_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_cabecera
    ADD CONSTRAINT ventas_cabecera_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


--
-- TOC entry 5005 (class 2606 OID 29063)
-- Name: ventas_detalle ventas_detalle_producto_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT ventas_detalle_producto_id_foreign FOREIGN KEY (producto_id) REFERENCES public.productos(id) ON DELETE RESTRICT;


--
-- TOC entry 5006 (class 2606 OID 29058)
-- Name: ventas_detalle ventas_detalle_venta_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT ventas_detalle_venta_id_foreign FOREIGN KEY (venta_id) REFERENCES public.ventas_cabecera(id) ON DELETE CASCADE;


-- Completed on 2026-06-17 12:19:35

--
-- PostgreSQL database dump complete
--

\unrestrict dGDcgAjc5hng9zkEaFG4jrorQYw9cT7Hb1361ZM0WOmfJsA2A865rjvcwdt8MWK

