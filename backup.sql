--
-- PostgreSQL database dump
--

\restrict MrCTzpiCohpoX8YeTfHQhyTEI92UCNkLeg7SQRgslWbqEayNzkpNQmiFo6GdnKt

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2026-06-17 14:24:37

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

--
-- TOC entry 5202 (class 1262 OID 24604)
-- Name: Vittorio-DB; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Vittorio-DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "Vittorio-DB" OWNER TO postgres;

\unrestrict MrCTzpiCohpoX8YeTfHQhyTEI92UCNkLeg7SQRgslWbqEayNzkpNQmiFo6GdnKt
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='Vittorio-DB'"
\restrict MrCTzpiCohpoX8YeTfHQhyTEI92UCNkLeg7SQRgslWbqEayNzkpNQmiFo6GdnKt

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
-- TOC entry 242 (class 1259 OID 30592)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 30602)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 30395)
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
-- TOC entry 221 (class 1259 OID 30394)
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
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 221
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 224 (class 1259 OID 30411)
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
-- TOC entry 223 (class 1259 OID 30410)
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
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 223
-- Name: contactos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contactos_id_seq OWNED BY public.contactos.id;


--
-- TOC entry 241 (class 1259 OID 30574)
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
-- TOC entry 240 (class 1259 OID 30573)
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
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 240
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 239 (class 1259 OID 30559)
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
-- TOC entry 238 (class 1259 OID 30544)
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
-- TOC entry 237 (class 1259 OID 30543)
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
-- TOC entry 5206 (class 0 OID 0)
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
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 236 (class 1259 OID 30534)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 30613)
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
-- TOC entry 244 (class 1259 OID 30612)
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
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 244
-- Name: producto_imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_imagenes_id_seq OWNED BY public.producto_imagenes.id;


--
-- TOC entry 226 (class 1259 OID 30426)
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
-- TOC entry 225 (class 1259 OID 30425)
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
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 225
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 228 (class 1259 OID 30451)
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
-- TOC entry 227 (class 1259 OID 30450)
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
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 227
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 231 (class 1259 OID 30481)
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
-- TOC entry 247 (class 1259 OID 30637)
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
-- TOC entry 246 (class 1259 OID 30636)
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
-- TOC entry 5211 (class 0 OID 0)
-- Dependencies: 246
-- Name: user_direcciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_direcciones_id_seq OWNED BY public.user_direcciones.id;


--
-- TOC entry 249 (class 1259 OID 30667)
-- Name: user_tarjetas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tarjetas (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    ultimos_cuatro character varying(4) NOT NULL,
    titular character varying(100) NOT NULL,
    mes_exp character varying(2) NOT NULL,
    anio_exp character varying(2) NOT NULL,
    tipo character varying(20) DEFAULT 'default'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_tarjetas OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 30666)
-- Name: user_tarjetas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_tarjetas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_tarjetas_id_seq OWNER TO postgres;

--
-- TOC entry 5212 (class 0 OID 0)
-- Dependencies: 248
-- Name: user_tarjetas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_tarjetas_id_seq OWNED BY public.user_tarjetas.id;


--
-- TOC entry 230 (class 1259 OID 30462)
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
-- TOC entry 229 (class 1259 OID 30461)
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
-- TOC entry 5213 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 233 (class 1259 OID 30494)
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
-- TOC entry 232 (class 1259 OID 30493)
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
-- TOC entry 5214 (class 0 OID 0)
-- Dependencies: 232
-- Name: ventas_cabecera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_cabecera_id_seq OWNED BY public.ventas_cabecera.id;


--
-- TOC entry 235 (class 1259 OID 30512)
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
-- TOC entry 234 (class 1259 OID 30511)
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
-- TOC entry 5215 (class 0 OID 0)
-- Dependencies: 234
-- Name: ventas_detalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_detalle_id_seq OWNED BY public.ventas_detalle.id;


--
-- TOC entry 4937 (class 2604 OID 30398)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 4939 (class 2604 OID 30414)
-- Name: contactos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos ALTER COLUMN id SET DEFAULT nextval('public.contactos_id_seq'::regclass);


--
-- TOC entry 4953 (class 2604 OID 30577)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4952 (class 2604 OID 30547)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 4936 (class 2604 OID 26721)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4955 (class 2604 OID 30616)
-- Name: producto_imagenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_imagenes ALTER COLUMN id SET DEFAULT nextval('public.producto_imagenes_id_seq'::regclass);


--
-- TOC entry 4941 (class 2604 OID 30429)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 4944 (class 2604 OID 30454)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4957 (class 2604 OID 30640)
-- Name: user_direcciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_direcciones ALTER COLUMN id SET DEFAULT nextval('public.user_direcciones_id_seq'::regclass);


--
-- TOC entry 4959 (class 2604 OID 30670)
-- Name: user_tarjetas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tarjetas ALTER COLUMN id SET DEFAULT nextval('public.user_tarjetas_id_seq'::regclass);


--
-- TOC entry 4945 (class 2604 OID 30465)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4946 (class 2604 OID 30497)
-- Name: ventas_cabecera id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_cabecera ALTER COLUMN id SET DEFAULT nextval('public.ventas_cabecera_id_seq'::regclass);


--
-- TOC entry 4951 (class 2604 OID 30515)
-- Name: ventas_detalle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle ALTER COLUMN id SET DEFAULT nextval('public.ventas_detalle_id_seq'::regclass);


--
-- TOC entry 5189 (class 0 OID 30592)
-- Dependencies: 242
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5190 (class 0 OID 30602)
-- Dependencies: 243
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5169 (class 0 OID 30395)
-- Dependencies: 222
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categorias VALUES (1, 'Línea Estructural', 'linea-estructural', 'Diseños escultóricos con líneas puras y presencia estructural.', true, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.categorias VALUES (2, 'Línea Terra', 'linea-terra', 'Inspirada en paisajes naturales, combina textura, color y robustez.', true, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.categorias VALUES (3, 'Línea Vanguardia', 'linea-vanguardia', 'Geometría de impacto y alma técnica para quienes buscan carácter arquitectónico.', true, '2026-06-17 17:19:00', '2026-06-17 17:19:00');


--
-- TOC entry 5171 (class 0 OID 30411)
-- Dependencies: 224
-- Data for Name: contactos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contactos VALUES (1, 'Federico García', 'federico.garc''ia17@gmail.com', 'Consulta sobre relojes cronógrafo', 'Hola, me interesa un reloj cronógrafo para usar en el trabajo. Trabajo en logística y necesito medir tiempos frecuentemente. ¿Qué modelos tienen disponibles y en qué rango de precios?', false, '2026-06-11 08:19:04', '2026-06-11 08:19:04');
INSERT INTO public.contactos VALUES (2, 'Melina Ríos', 'melina.r''ios43@outlook.com', 'Cambio de pila de reloj', 'Buenas tardes, quisiera saber si realizan cambio de pilas y cuánto sale aproximadamente. Tengo un reloj Citizen que dejó de funcionar y me dijeron que puede ser la pila. Pueden darme un turno o simplemente llevo el reloj?', false, '2026-06-15 20:19:04', '2026-06-15 20:19:04');
INSERT INTO public.contactos VALUES (3, 'Romina Suárez', 'romina.su''arez50@outlook.com', 'Regalo de casamiento', 'Buenas, me caso en dos meses y quiero comprar un par de relojes de casamiento para mí y mi pareja. ¿Hacen descuentos por la compra de dos relojes juntos o tienen alguna promoción especial para eso?', false, '2026-06-09 22:19:04', '2026-06-09 22:19:04');
INSERT INTO public.contactos VALUES (4, 'Ezequiel Domínguez', 'ezequiel.dom''inguez20@hotmail.com', 'Consulta sobre financiación', 'Hola, quería saber si ofrecen financiación en cuotas con tarjeta de crédito y si hay algún recargo. Estoy interesado en un reloj de $150.000 aproximadamente y me vendría bien pagarlo en cuotas.', false, '2026-05-23 23:19:04', '2026-05-23 23:19:04');
INSERT INTO public.contactos VALUES (5, 'Rodrigo Navarro', 'rodrigo.navarro84@live.com.ar', 'Ajuste de malla sin costo', 'Buen día, compré un reloj la semana pasada y la malla me quedó un poco grande. ¿Hacen el ajuste de eslabones en el local y hay algún costo adicional? Desde ya gracias.', false, '2026-05-30 20:19:04', '2026-05-30 20:19:04');
INSERT INTO public.contactos VALUES (6, 'Julieta Castro', 'julieta.castro32@gmail.com', 'Consulta por reparación', 'Hola, me comunico porque tengo un reloj al que se le trabó la corona y ya no puedo ajustar la hora. Quisiera saber si lo pueden revisar y cuánto costaría arreglarlo. Es un reloj de pulsera clásico que heredé de mi abuelo.', false, '2026-05-23 09:19:04', '2026-05-23 09:19:04');
INSERT INTO public.contactos VALUES (7, 'Melina Ríos', 'melina.r''ios47@yahoo.com.ar', 'Consulta sobre relojes automáticos', 'Hola, estoy interesado en adquirir mi primer reloj automático y tengo algunas dudas sobre el mantenimiento. ¿Cada cuánto hay que llevarlo a revisar? ¿Ustedes hacen ese servicio de mantenimiento?', false, '2026-05-22 00:19:04', '2026-05-22 00:19:04');
INSERT INTO public.contactos VALUES (8, 'Lucía Acosta', 'luc''ia.acosta24@yahoo.com.ar', 'Cambio de pila de reloj', 'Buenas tardes, quisiera saber si realizan cambio de pilas y cuánto sale aproximadamente. Tengo un reloj Citizen que dejó de funcionar y me dijeron que puede ser la pila. Pueden darme un turno o simplemente llevo el reloj?', false, '2026-05-19 08:19:04', '2026-05-19 08:19:04');
INSERT INTO public.contactos VALUES (9, 'Matías Torres', 'mat''ias.torres89@hotmail.com', 'Cambio de pila de reloj', 'Buenas tardes, quisiera saber si realizan cambio de pilas y cuánto sale aproximadamente. Tengo un reloj Citizen que dejó de funcionar y me dijeron que puede ser la pila. Pueden darme un turno o simplemente llevo el reloj?', false, '2026-05-25 15:19:04', '2026-05-25 15:19:04');
INSERT INTO public.contactos VALUES (10, 'Agustina Martínez', 'agustina.mart''inez20@live.com.ar', 'Revisión de reloj antiguo', 'Hola, tengo un reloj de bolsillo antiguo de la marca Longines que perteneció a mi bisabuelo y quisiera saber si lo pueden revisar para ver si funciona o se puede restaurar. ¿Trabajan con relojes de colección o antigüedades?', false, '2026-06-15 17:19:04', '2026-06-15 17:19:04');
INSERT INTO public.contactos VALUES (11, 'Ignacio Mendoza', 'ignacio.mendoza14@gmail.com', 'Consulta sobre relojes cronógrafo', 'Hola, me interesa un reloj cronógrafo para usar en el trabajo. Trabajo en logística y necesito medir tiempos frecuentemente. ¿Qué modelos tienen disponibles y en qué rango de precios?', false, '2026-06-11 07:19:04', '2026-06-11 07:19:04');
INSERT INTO public.contactos VALUES (12, 'Natalia Moreno', 'natalia.moreno32@gmail.com', 'Consulta sobre financiación', 'Hola, quería saber si ofrecen financiación en cuotas con tarjeta de crédito y si hay algún recargo. Estoy interesado en un reloj de $150.000 aproximadamente y me vendría bien pagarlo en cuotas.', false, '2026-06-16 20:19:04', '2026-06-16 20:19:04');
INSERT INTO public.contactos VALUES (13, 'Tomás Álvarez', 'tom''as.''alvarez11@outlook.com', 'Horario del local', 'Buenas, quería saber cuál es el horario de atención del local y si trabajan los sábados. Me quedaría más cómodo pasar un fin de semana. ¿Dónde están ubicados exactamente en La Plata?', false, '2026-05-25 04:19:04', '2026-05-25 04:19:04');
INSERT INTO public.contactos VALUES (14, 'Rodrigo Navarro', 'rodrigo.navarro93@live.com.ar', 'Regalo de casamiento', 'Buenas, me caso en dos meses y quiero comprar un par de relojes de casamiento para mí y mi pareja. ¿Hacen descuentos por la compra de dos relojes juntos o tienen alguna promoción especial para eso?', false, '2026-05-30 08:19:04', '2026-05-30 08:19:04');
INSERT INTO public.contactos VALUES (15, 'Rodrigo Navarro', 'rodrigo.navarro54@live.com.ar', 'Consulta sobre relojes cronógrafo', 'Hola, me interesa un reloj cronógrafo para usar en el trabajo. Trabajo en logística y necesito medir tiempos frecuentemente. ¿Qué modelos tienen disponibles y en qué rango de precios?', false, '2026-05-26 05:19:04', '2026-05-26 05:19:04');
INSERT INTO public.contactos VALUES (16, 'Ignacio Mendoza', 'ignacio.mendoza72@hotmail.com', 'Compra de reloj para dama', 'Buenas tardes, busco un reloj femenino delicado, preferentemente con malla metálica y esfera blanca o plateada. ¿Tienen opciones en ese estilo? ¿Puedo pasar a verlos por el local sin turno previo?', false, '2026-06-11 21:19:04', '2026-06-11 21:19:04');
INSERT INTO public.contactos VALUES (17, 'Agustina Martínez', 'agustina.mart''inez57@yahoo.com.ar', 'Consulta sobre garantía de reloj', 'Buen día, compré un reloj hace unos meses en su local y quería saber cuánto tiempo de garantía tiene y cómo funciona el proceso en caso de que tenga algún problema. Desde ya muchas gracias.', false, '2026-05-24 09:19:04', '2026-05-24 09:19:04');
INSERT INTO public.contactos VALUES (18, 'Antonella Ramos', 'antonella.ramos97@yahoo.com.ar', 'Consulta sobre financiación', 'Hola, quería saber si ofrecen financiación en cuotas con tarjeta de crédito y si hay algún recargo. Estoy interesado en un reloj de $150.000 aproximadamente y me vendría bien pagarlo en cuotas.', false, '2026-06-15 11:19:04', '2026-06-15 11:19:04');
INSERT INTO public.contactos VALUES (19, 'Ezequiel Domínguez', 'ezequiel.dom''inguez77@gmail.com', 'Consulta sobre relojes automáticos', 'Hola, estoy interesado en adquirir mi primer reloj automático y tengo algunas dudas sobre el mantenimiento. ¿Cada cuánto hay que llevarlo a revisar? ¿Ustedes hacen ese servicio de mantenimiento?', false, '2026-06-15 10:19:04', '2026-06-15 10:19:04');
INSERT INTO public.contactos VALUES (20, 'Sebastián Herrera', 'sebasti''an.herrera64@yahoo.com.ar', 'Consulta por reparación', 'Hola, me comunico porque tengo un reloj al que se le trabó la corona y ya no puedo ajustar la hora. Quisiera saber si lo pueden revisar y cuánto costaría arreglarlo. Es un reloj de pulsera clásico que heredé de mi abuelo.', false, '2026-06-09 17:19:04', '2026-06-09 17:19:04');
INSERT INTO public.contactos VALUES (21, 'Ezequiel Domínguez', 'ezequiel.dom''inguez80@gmail.com', 'Consulta sobre financiación', 'Hola, quería saber si ofrecen financiación en cuotas con tarjeta de crédito y si hay algún recargo. Estoy interesado en un reloj de $150.000 aproximadamente y me vendría bien pagarlo en cuotas.', false, '2026-06-16 22:19:04', '2026-06-16 22:19:04');
INSERT INTO public.contactos VALUES (22, 'Andrés Medina', 'andr''es.medina31@gmail.com', 'Consulta sobre garantía de reloj', 'Buen día, compré un reloj hace unos meses en su local y quería saber cuánto tiempo de garantía tiene y cómo funciona el proceso en caso de que tenga algún problema. Desde ya muchas gracias.', false, '2026-06-13 04:19:04', '2026-06-13 04:19:04');
INSERT INTO public.contactos VALUES (23, 'Tomás Álvarez', 'tom''as.''alvarez58@yahoo.com.ar', 'Consulta sobre relojes automáticos', 'Hola, estoy interesado en adquirir mi primer reloj automático y tengo algunas dudas sobre el mantenimiento. ¿Cada cuánto hay que llevarlo a revisar? ¿Ustedes hacen ese servicio de mantenimiento?', false, '2026-06-16 16:19:04', '2026-06-16 16:19:04');
INSERT INTO public.contactos VALUES (24, 'Nicolás Pérez', 'nicol''as.p''erez77@yahoo.com.ar', 'Disponibilidad de stock', 'Hola, quería saber si tienen disponible el reloj Casio G-Shock en color negro. Lo vi en la web pero no estoy seguro si tienen en stock para retirar en el local de La Plata. Aguardo respuesta, gracias.', false, '2026-05-21 06:19:04', '2026-05-21 06:19:04');
INSERT INTO public.contactos VALUES (25, 'Facundo Ruiz', 'facundo.ruiz90@live.com.ar', 'Horario del local', 'Buenas, quería saber cuál es el horario de atención del local y si trabajan los sábados. Me quedaría más cómodo pasar un fin de semana. ¿Dónde están ubicados exactamente en La Plata?', false, '2026-06-05 14:19:04', '2026-06-05 14:19:04');
INSERT INTO public.contactos VALUES (26, 'Lucía Acosta', 'luc''ia.acosta51@gmail.com', 'Cambio de pila de reloj', 'Buenas tardes, quisiera saber si realizan cambio de pilas y cuánto sale aproximadamente. Tengo un reloj Citizen que dejó de funcionar y me dijeron que puede ser la pila. Pueden darme un turno o simplemente llevo el reloj?', false, '2026-06-13 11:19:04', '2026-06-13 11:19:04');
INSERT INTO public.contactos VALUES (27, 'Antonella Ramos', 'antonella.ramos69@outlook.com', 'Ajuste de malla sin costo', 'Buen día, compré un reloj la semana pasada y la malla me quedó un poco grande. ¿Hacen el ajuste de eslabones en el local y hay algún costo adicional? Desde ya gracias.', false, '2026-06-04 12:19:04', '2026-06-04 12:19:04');
INSERT INTO public.contactos VALUES (28, 'Martín Fernández', 'mart''in.fern''andez20@gmail.com', 'Revisión de reloj antiguo', 'Hola, tengo un reloj de bolsillo antiguo de la marca Longines que perteneció a mi bisabuelo y quisiera saber si lo pueden revisar para ver si funciona o se puede restaurar. ¿Trabajan con relojes de colección o antigüedades?', false, '2026-06-09 18:19:04', '2026-06-09 18:19:04');
INSERT INTO public.contactos VALUES (29, 'Federico García', 'federico.garc''ia74@outlook.com', 'Ajuste de malla sin costo', 'Buen día, compré un reloj la semana pasada y la malla me quedó un poco grande. ¿Hacen el ajuste de eslabones en el local y hay algún costo adicional? Desde ya gracias.', false, '2026-06-17 13:19:04', '2026-06-17 13:19:04');
INSERT INTO public.contactos VALUES (30, 'Facundo Ruiz', 'facundo.ruiz87@yahoo.com.ar', 'Problema con el cierre de la malla', 'Hola, compré un reloj hace tres semanas y el cierre de la malla metálica ya no engrana bien. ¿Esto tiene cobertura de garantía? Quisiera pasarlo a revisar o cambiarlo si es posible.', false, '2026-06-08 10:19:04', '2026-06-08 10:19:04');
INSERT INTO public.contactos VALUES (31, 'Camila López', 'camila.l''opez88@outlook.com', 'Limpieza de reloj', 'Buenas tardes, tengo un reloj de acero que está opacado y me gustaría saber si hacen limpieza o pulido del mismo. ¿Tienen ese servicio y cuánto tiempo demora?', false, '2026-06-06 13:19:04', '2026-06-06 13:19:04');
INSERT INTO public.contactos VALUES (32, 'Sofía Romero', 'sof''ia.romero90@hotmail.com', 'Disponibilidad de stock', 'Hola, quería saber si tienen disponible el reloj Casio G-Shock en color negro. Lo vi en la web pero no estoy seguro si tienen en stock para retirar en el local de La Plata. Aguardo respuesta, gracias.', false, '2026-05-22 19:19:04', '2026-05-22 19:19:04');
INSERT INTO public.contactos VALUES (33, 'Federico García', 'federico.garc''ia97@outlook.com', 'Envío a interior de la provincia', 'Hola, soy de Mar del Plata y me gustaría saber si hacen envíos a domicilio y con qué empresas trabajan. Vi unos relojes en la página que me interesaron mucho y me gustaría comprar sin tener que viajar.', false, '2026-06-11 04:19:04', '2026-06-11 04:19:04');
INSERT INTO public.contactos VALUES (34, 'Rodrigo Navarro', 'rodrigo.navarro31@outlook.com', 'Disponibilidad de stock', 'Hola, quería saber si tienen disponible el reloj Casio G-Shock en color negro. Lo vi en la web pero no estoy seguro si tienen en stock para retirar en el local de La Plata. Aguardo respuesta, gracias.', false, '2026-05-21 18:19:04', '2026-05-21 18:19:04');
INSERT INTO public.contactos VALUES (35, 'Diego Jiménez', 'diego.jim''enez19@yahoo.com.ar', 'Solicito factura de compra', 'Buenas, compré un reloj en el local el mes pasado y no me dieron la factura. Necesito el comprobante para reclamar la garantía ya que el reloj tuvo un inconveniente. ¿Cómo puedo obtenerla? Gracias.', false, '2026-05-28 19:19:04', '2026-05-28 19:19:04');
INSERT INTO public.contactos VALUES (36, 'Natalia Moreno', 'natalia.moreno62@live.com.ar', 'Consulta sobre financiación', 'Hola, quería saber si ofrecen financiación en cuotas con tarjeta de crédito y si hay algún recargo. Estoy interesado en un reloj de $150.000 aproximadamente y me vendría bien pagarlo en cuotas.', true, '2026-02-04 13:19:04', '2026-02-04 13:19:04');
INSERT INTO public.contactos VALUES (37, 'Agustina Martínez', 'agustina.mart''inez80@yahoo.com.ar', 'Consulta sobre garantía de reloj', 'Buen día, compré un reloj hace unos meses en su local y quería saber cuánto tiempo de garantía tiene y cómo funciona el proceso en caso de que tenga algún problema. Desde ya muchas gracias.', true, '2026-03-13 11:19:04', '2026-03-13 11:19:04');
INSERT INTO public.contactos VALUES (38, 'Agustina Martínez', 'agustina.mart''inez34@live.com.ar', 'Consulta sobre relojes cronógrafo', 'Hola, me interesa un reloj cronógrafo para usar en el trabajo. Trabajo en logística y necesito medir tiempos frecuentemente. ¿Qué modelos tienen disponibles y en qué rango de precios?', true, '2025-12-24 21:19:04', '2025-12-24 21:19:04');
INSERT INTO public.contactos VALUES (39, 'Matías Torres', 'mat''ias.torres25@yahoo.com.ar', 'Regalo de casamiento', 'Buenas, me caso en dos meses y quiero comprar un par de relojes de casamiento para mí y mi pareja. ¿Hacen descuentos por la compra de dos relojes juntos o tienen alguna promoción especial para eso?', true, '2026-02-25 16:19:04', '2026-02-25 16:19:04');
INSERT INTO public.contactos VALUES (40, 'Celeste Molina', 'celeste.molina65@yahoo.com.ar', 'Revisión de reloj antiguo', 'Hola, tengo un reloj de bolsillo antiguo de la marca Longines que perteneció a mi bisabuelo y quisiera saber si lo pueden revisar para ver si funciona o se puede restaurar. ¿Trabajan con relojes de colección o antigüedades?', true, '2025-12-19 15:19:04', '2025-12-19 15:19:04');
INSERT INTO public.contactos VALUES (41, 'Facundo Ruiz', 'facundo.ruiz28@yahoo.com.ar', 'Consulta por compra mayorista', 'Buen día, soy vendedor ambulante en La Plata y me interesaría saber si hacen precio mayorista para relojes si compro en cantidad. ¿Con qué volumen mínimo aplica y cuál sería el descuento?', true, '2026-01-22 09:19:04', '2026-01-22 09:19:04');
INSERT INTO public.contactos VALUES (42, 'Julieta Castro', 'julieta.castro84@hotmail.com', 'Ajuste de malla sin costo', 'Buen día, compré un reloj la semana pasada y la malla me quedó un poco grande. ¿Hacen el ajuste de eslabones en el local y hay algún costo adicional? Desde ya gracias.', true, '2026-01-31 13:19:04', '2026-01-31 13:19:04');
INSERT INTO public.contactos VALUES (43, 'Sofía Romero', 'sof''ia.romero78@yahoo.com.ar', 'Problema con el cierre de la malla', 'Hola, compré un reloj hace tres semanas y el cierre de la malla metálica ya no engrana bien. ¿Esto tiene cobertura de garantía? Quisiera pasarlo a revisar o cambiarlo si es posible.', true, '2026-02-16 00:19:04', '2026-02-16 00:19:04');
INSERT INTO public.contactos VALUES (44, 'Florencia Díaz', 'florencia.d''iaz73@live.com.ar', 'Horario del local', 'Buenas, quería saber cuál es el horario de atención del local y si trabajan los sábados. Me quedaría más cómodo pasar un fin de semana. ¿Dónde están ubicados exactamente en La Plata?', true, '2026-04-10 08:19:04', '2026-04-10 08:19:04');
INSERT INTO public.contactos VALUES (45, 'Antonella Ramos', 'antonella.ramos54@outlook.com', 'Precio de reloj para regalo', 'Buenas, estoy buscando un reloj para regalarle a mi papá por su cumpleaños, algo elegante pero que no sea demasiado caro, entre $50.000 y $100.000 más o menos. ¿Me podrían asesorar sobre qué opciones tienen disponibles?', true, '2026-03-04 21:19:04', '2026-03-04 21:19:04');
INSERT INTO public.contactos VALUES (46, 'Romina Suárez', 'romina.su''arez90@gmail.com', 'Revisión de reloj antiguo', 'Hola, tengo un reloj de bolsillo antiguo de la marca Longines que perteneció a mi bisabuelo y quisiera saber si lo pueden revisar para ver si funciona o se puede restaurar. ¿Trabajan con relojes de colección o antigüedades?', true, '2026-02-06 15:19:04', '2026-02-06 15:19:04');
INSERT INTO public.contactos VALUES (47, 'Ignacio Mendoza', 'ignacio.mendoza85@outlook.com', 'Consulta sobre financiación', 'Hola, quería saber si ofrecen financiación en cuotas con tarjeta de crédito y si hay algún recargo. Estoy interesado en un reloj de $150.000 aproximadamente y me vendría bien pagarlo en cuotas.', true, '2026-02-04 18:19:04', '2026-02-04 18:19:04');
INSERT INTO public.contactos VALUES (48, 'Natalia Moreno', 'natalia.moreno17@yahoo.com.ar', 'Consulta por compra mayorista', 'Buen día, soy vendedor ambulante en La Plata y me interesaría saber si hacen precio mayorista para relojes si compro en cantidad. ¿Con qué volumen mínimo aplica y cuál sería el descuento?', true, '2026-01-12 03:19:04', '2026-01-12 03:19:04');
INSERT INTO public.contactos VALUES (49, 'Paula Vargas', 'paula.vargas62@live.com.ar', 'Envío a interior de la provincia', 'Hola, soy de Mar del Plata y me gustaría saber si hacen envíos a domicilio y con qué empresas trabajan. Vi unos relojes en la página que me interesaron mucho y me gustaría comprar sin tener que viajar.', true, '2026-02-11 21:19:04', '2026-02-11 21:19:04');
INSERT INTO public.contactos VALUES (50, 'Julieta Castro', 'julieta.castro37@outlook.com', 'Error en el pedido recibido', 'Hola, hice una compra online y recibí un reloj diferente al que pedí. El color es distinto al que aparecía en la foto. ¿Cómo hago para cambiarlo? Adjunto el número de pedido: #2847.', true, '2026-01-30 01:19:04', '2026-01-30 01:19:04');


--
-- TOC entry 5188 (class 0 OID 30574)
-- Dependencies: 241
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5186 (class 0 OID 30559)
-- Dependencies: 239
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5185 (class 0 OID 30544)
-- Dependencies: 238
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5167 (class 0 OID 26718)
-- Dependencies: 220
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations VALUES (240, '2026_05_20_193257_create_categorias_table', 1);
INSERT INTO public.migrations VALUES (241, '2026_05_20_193257_create_contactos_table', 1);
INSERT INTO public.migrations VALUES (242, '2026_05_20_193257_create_productos_table', 1);
INSERT INTO public.migrations VALUES (243, '2026_05_20_194000_create_roles_table', 1);
INSERT INTO public.migrations VALUES (244, '2026_05_20_194416_create_usuarios_table', 1);
INSERT INTO public.migrations VALUES (245, '2026_05_26_152228_create_sessions_table', 1);
INSERT INTO public.migrations VALUES (246, '2026_05_29_000001_create_ventas_cabecera_table', 1);
INSERT INTO public.migrations VALUES (247, '2026_05_29_000002_create_ventas_detalle_table', 1);
INSERT INTO public.migrations VALUES (248, '2026_05_31_000001_create_password_reset_tokens_table', 1);
INSERT INTO public.migrations VALUES (249, '2026_05_31_000002_create_jobs_table', 1);
INSERT INTO public.migrations VALUES (250, '2026_05_31_000003_create_cache_table', 1);
INSERT INTO public.migrations VALUES (251, '2026_06_03_121500_add_payment_and_location_to_usuarios_table', 1);
INSERT INTO public.migrations VALUES (252, '2026_06_08_000001_create_producto_imagenes_table', 1);
INSERT INTO public.migrations VALUES (253, '2026_06_08_000002_migrate_product_images_to_producto_imagenes', 1);
INSERT INTO public.migrations VALUES (254, '2026_06_08_000003_add_checkout_fields_to_ventas_cabecera', 1);
INSERT INTO public.migrations VALUES (255, '2026_06_08_000004_add_estado_pago_to_ventas_cabecera', 1);
INSERT INTO public.migrations VALUES (256, '2026_06_08_000005_create_user_direcciones_table', 1);
INSERT INTO public.migrations VALUES (257, '2026_06_08_000006_add_direccion_envio_to_ventas_cabecera', 1);
INSERT INTO public.migrations VALUES (258, '2026_06_17_000001_create_user_tarjetas_table', 1);


--
-- TOC entry 5183 (class 0 OID 30534)
-- Dependencies: 236
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5192 (class 0 OID 30613)
-- Dependencies: 245
-- Data for Name: producto_imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.producto_imagenes VALUES (1, 1, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/monolito1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (2, 1, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/monolito2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (3, 2, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/assoluto1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (4, 2, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/assoluto2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (5, 3, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/linea1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (6, 3, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/linea2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (7, 4, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/geometra1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (8, 4, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/geometra2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (9, 5, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/cubo1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (10, 5, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/cubo2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (11, 6, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/prisma1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (12, 6, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/prisma2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (13, 7, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/siena1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (14, 7, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/siena2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (15, 8, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/radice1.jpg', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (16, 8, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/radice2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (17, 9, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/bronzo1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (18, 9, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/bronzo2.jpg', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (19, 10, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/deserto1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (20, 10, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/deserto2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (21, 11, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/foresta1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (22, 11, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/foresta2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (23, 12, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/vulcano1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (24, 12, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/vulcano2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (25, 13, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/struttura1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (26, 13, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/struttura2.jpg', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (27, 14, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/impero1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (28, 14, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/impero2.jpg', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (29, 15, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/orizzonte1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (30, 15, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/orizzonte2.jpg', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (31, 16, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/eclissi1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (32, 16, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/eclissi2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (33, 17, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/crono-tech1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (34, 17, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/crono-tech2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (35, 18, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/aero1.png', 'lifestyle', 0, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.producto_imagenes VALUES (36, 18, 'https://pub-914a132c1006414e85aff75afd7c51d6.r2.dev/assets/aero2.png', 'studio', 1, '2026-06-17 17:19:00', '2026-06-17 17:19:00');


--
-- TOC entry 5173 (class 0 OID 30426)
-- Dependencies: 226
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos VALUES (1, 1, 'Monolito', 'monolito', 'Un reloj escultórico con líneas puras y presencia estructural, creado para destacar en cualquier entorno.', 250000.00, 'Titanio cepillado 42mm', 'Automático Vittorio 21', 'Zafiro antirreflejo', '10 ATM', 'Silicona técnica negra', 12, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (2, 1, 'Assoluto', 'assoluto', 'Diseño minimalista y poderoso, con acabado oscuro y detalles que combinan modernidad con manufactura tradicional.', 210000.00, 'Acero PVD negro 40mm', 'Cuarzo suizo Ronda 6004B', 'Mineral endurecido', '5 ATM', 'Cuero vegano premium', 15, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (3, 1, 'Linea', 'linea', 'Una pieza sobria y versátil, con una carátula limpia y una estética atemporal para uso diario y ocasiones especiales.', 180000.00, 'Acero pulido 38mm', 'Miyota 2035', 'Mineral endurecido', '3 ATM', 'Malla milanesa de acero', 20, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (4, 1, 'Geometra', 'geometra', 'Arquitectura de vanguardia en tu muñeca. Ángulos marcados en titanio y un dial oscuro que define el lujo minimalista.', 280000.00, 'Titanio cepillado angular 41mm', 'Automático Suizo Sellita SW200-1', 'Zafiro con recubrimiento AR doble', '10 ATM', 'Acero integrado', 0, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (5, 1, 'Cubo', 'cubo', 'Estética cuadrada y pura. Una pieza que desafía lo convencional con un dial blanco inmaculado.', 190000.00, 'Acero cepillado cuadrado 39mm', 'Cuarzo Suizo', 'Zafiro plano', '5 ATM', 'Cuero negro premium', 14, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (6, 1, 'Prisma', 'prisma', 'Bisel octogonal y brazalete integrado. El pináculo de la línea estructural en una silueta icónica.', 310000.00, 'Acero pulido 42mm', 'Automático Miyota 9015', 'Zafiro con bisel octogonal', '10 ATM', 'Brazalete de acero integrado', 8, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (7, 2, 'Siena', 'siena', 'Inspirado en paisajes cálidos, Siena equilibra textura y color en una propuesta robusta y elegante.', 160000.00, 'Bronce cepillado 42mm', 'Sellita SW200', 'Zafiro antirreflejo', '8 ATM', 'Piel color arena', 8, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (8, 2, 'Radice', 'radice', 'Con un aire vintage y detalles clásicos, Radice ofrece sabor tradicional con precisión moderna.', 175000.00, 'Bronce patinado 41mm', 'Miyota 9015', 'Mineral endurecido', '10 ATM', 'Cuero natural marrón', 10, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (9, 2, 'Bronzo', 'bronzo', 'Un cronógrafo de elevado carácter, con tonos cálidos y una presencia deportiva refinada.', 220000.00, 'Acero con baño bronce 44mm', 'Cuarzo cronógrafo', 'Zafiro plano', '10 ATM', 'Nylon técnico', 7, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (10, 2, 'Deserto', 'deserto', 'Diseñado para la exploración con estética heritage. Combina bronce patinado con una textura granulada de arena fina.', 195000.00, 'Bronce patinado 40mm', 'Automático Miyota 8215', 'Zafiro abombado', '15 ATM', 'Lona canvas verde oliva', 9, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (11, 2, 'Foresta', 'foresta', 'Un reloj de campo genuino. Dial verde bosque mate contrastado con cuero marrón rústico de alta durabilidad.', 150000.00, 'Acero cepillado 39mm', 'Cuarzo de alta precisión', 'Mineral endurecido', '10 ATM', 'Cuero marrón desgastado', 18, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (12, 2, 'Vulcano', 'vulcano', 'Tonos oscuros y cálidos de roca volcánica. Caja mate robusta pensada para resistir los elementos.', 205000.00, 'Acero negro mate 43mm', 'Automático NH35', 'Zafiro abombado', '20 ATM', 'Cuero grueso marrón rojizo', 5, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (13, 3, 'Struttura', 'struttura', 'Estructura abierta, geometría de impacto y un alma técnica para quienes buscan un reloj con carácter arquitectónico.', 320000.00, 'Acero satinado 43mm', 'Sellita SW300', 'Zafiro antirreflejo', '12 ATM', 'Caucho texturado', 0, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (14, 3, 'Impero', 'impero', 'Líneas nobles y una estética refinada que convierten a Impero en un reloj de lujo contemporáneo para uso formal.', 290000.00, 'Oro rosa IP 40mm', 'Cuarzo suizo', 'Mineral endurecido', '5 ATM', 'Cuero negro estructurado', 9, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (15, 3, 'Orizzonte', 'orizzonte', 'Una pieza deportiva con detalles técnicos, ideal para quienes buscan estilo y rendimiento por igual.', 270000.00, 'Acero negro 44mm', 'Seiko NH35A', 'Zafiro antirreflejo', '20 ATM', 'Silicona deportiva', 11, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (16, 3, 'Eclissi', 'eclissi', 'El pináculo del diseño stealth. Acabados en negro PVD mate con un dial esqueletizado que revela el corazón mecánico del reloj.', 380000.00, 'Acero PVD negro mate 42mm', 'Automático Esqueletizado', 'Zafiro plano con tratamiento AR', '10 ATM', 'Cuero negro mate', 4, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (17, 3, 'Crono-Tech', 'crono-tech', 'Precisión de carreras. Dial de fibra de carbono real, detalles en rojo brillante y caja aerodinámica.', 350000.00, 'Acero y PVD negro 44mm', 'Cronógrafo Meca-Quartz', 'Zafiro', '10 ATM', 'Caucho integrado', 10, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);
INSERT INTO public.productos VALUES (18, 3, 'Aero', 'aero', 'Legibilidad pura bajo cualquier condición. Inspirado en los instrumentos de vuelo con acabados utilitarios mate.', 240000.00, 'Acero granallado gris mate 45mm', 'Automático Suizo', 'Zafiro abombado', '5 ATM', 'Nylon NATO negra resistente', 7, true, '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL);


--
-- TOC entry 5175 (class 0 OID 30451)
-- Dependencies: 228
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES (1, 'admin', '2026-06-17 17:18:56', '2026-06-17 17:18:56', NULL);
INSERT INTO public.roles VALUES (2, 'cliente', '2026-06-17 17:18:56', '2026-06-17 17:18:56', NULL);


--
-- TOC entry 5178 (class 0 OID 30481)
-- Dependencies: 231
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5194 (class 0 OID 30637)
-- Dependencies: 247
-- Data for Name: user_direcciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5196 (class 0 OID 30667)
-- Dependencies: 249
-- Data for Name: user_tarjetas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_tarjetas VALUES (1, 2, '4242', 'VALENTINA RODRIGUEZ', '12', '27', 'visa', '2026-06-17 17:18:57', '2026-06-17 17:18:57');
INSERT INTO public.user_tarjetas VALUES (2, 2, '5521', 'VALENTINA RODRIGUEZ', '08', '28', 'mastercard', '2026-06-17 17:18:57', '2026-06-17 17:18:57');
INSERT INTO public.user_tarjetas VALUES (3, 3, '0005', 'MARTIN FERNANDEZ', '03', '26', 'amex', '2026-06-17 17:18:58', '2026-06-17 17:18:58');
INSERT INTO public.user_tarjetas VALUES (4, 4, '6234', 'LUCIA ACOSTA', '06', '29', 'naranja', '2026-06-17 17:18:59', '2026-06-17 17:18:59');
INSERT INTO public.user_tarjetas VALUES (5, 54, '7370', 'JOSEFINA QUEZADA', '12', '26', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (6, 55, '0810', 'BRUNO AGUILERA', '08', '27', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (7, 56, '1493', 'FLORENCIA CALDERA', '01', '26', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (8, 57, '2932', 'JACOBO HERRERA', '02', '26', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (9, 58, '5193', 'HIPóLITO MERINO', '10', '29', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (10, 59, '7323', 'SOFíA LARA', '09', '29', 'mastercard', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (11, 60, '1643', 'OLIVIA BéTANCOURT', '03', '27', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (12, 61, '1239', 'ALLISON OLMOS', '01', '26', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (13, 62, '8268', 'ISABELLA PABóN', '04', '29', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (14, 63, '2503', 'OLIVIA VENEGAS', '06', '27', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (15, 64, '8729', 'MARíA PAULA GODOY', '11', '27', 'mastercard', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (16, 65, '5652', 'ANA GALLEGOS', '03', '29', 'mastercard', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (17, 66, '1585', 'LUANA RIVAS', '01', '29', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (18, 67, '4328', 'PEDRO CARRERA', '05', '28', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (19, 68, '1240', 'MíA ESPINOSA', '10', '29', 'mastercard', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (20, 69, '7922', 'RAFAEL CASANOVA', '11', '29', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (21, 70, '3500', 'LUIS BARELA', '05', '28', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (22, 71, '2920', 'FRANCISCO BARRERA', '03', '28', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (23, 72, '1048', 'SAMANTHA REYNOSO', '05', '27', 'amex', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (24, 73, '7934', 'MATTHEW TAFOYA', '12', '27', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (25, 74, '4487', 'CRISTóBAL PERALES', '05', '28', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (26, 75, '4187', 'GABRIEL SAIZ', '05', '27', 'mastercard', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (27, 76, '7527', 'JUANA CANALES', '10', '29', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (28, 77, '8610', 'NADIA SANDOVAL', '02', '28', 'amex', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (29, 78, '3451', 'VALENTINO MARRERO', '12', '28', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (30, 79, '7193', 'SEBASTIáN OQUENDO', '08', '28', 'mastercard', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (31, 80, '9085', 'DAVID ARTEAGA', '03', '29', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (32, 81, '9995', 'DIEGO JURADO', '09', '28', 'amex', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (33, 82, '8156', 'GABRIEL TAFOYA', '05', '27', 'amex', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (34, 83, '0918', 'JUAN DAVID VACA', '03', '27', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (35, 83, '9600', 'MAGDALENA CASAS', '07', '29', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (36, 84, '4672', 'NATALIA OQUENDO', '05', '29', 'mastercard', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (37, 84, '1023', 'DAMIáN RODRíGEZ', '02', '26', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (38, 85, '4430', 'ANDRéS CASANOVA', '03', '29', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (39, 85, '6596', 'ADRIANA MIRAMONTES', '09', '29', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (40, 86, '2963', 'JUAN DAVID HERRERA', '03', '29', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (41, 86, '1754', 'EDUARDO RODRíGUEZ', '05', '27', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (42, 87, '0572', 'JUAN MOJICA', '10', '26', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (43, 87, '4187', 'DAVID VILLA', '12', '27', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (44, 88, '8052', 'JESúS OLIVAS', '03', '27', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (45, 88, '0132', 'ALONSO BARRAGáN', '11', '27', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (46, 89, '0130', 'SANTIAGO RODRíGUEZ', '02', '28', 'mastercard', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (47, 89, '9845', 'VIOLETA ABEYTA', '04', '27', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (48, 90, '8390', 'GABRIEL ROSARIO', '12', '28', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (49, 90, '5397', 'JULIETA POLANCO', '10', '28', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (50, 91, '1147', 'EMILIANO LOZANO', '05', '28', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (51, 91, '2430', 'FRANCO SOSA', '10', '27', 'mastercard', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (52, 92, '4188', 'JUAN DIEGO BRITO', '07', '26', 'amex', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (53, 92, '8571', 'PAULA APARICIO', '11', '26', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (54, 93, '0234', 'MARIANGEL ENRíQUEZ', '02', '27', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (55, 93, '9939', 'ANTHONY NEVáREZ', '07', '27', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (56, 94, '7157', 'MáXIMO SALDIVAR', '04', '29', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (57, 94, '5233', 'ALMA MADRID', '08', '26', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (58, 95, '1419', 'LUCIANA BáEZ', '04', '29', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (59, 95, '4023', 'JULIETA BUSTAMANTE', '10', '29', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (60, 96, '7958', 'JOSEFA ESQUIVEL', '03', '26', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (61, 96, '2652', 'JOSEFINA NAVA', '12', '27', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (62, 97, '9424', 'ANA PAULA TOLEDO', '04', '27', 'mastercard', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (63, 97, '8207', 'JESúS TAPIA', '12', '27', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (64, 98, '9989', 'JULIETA HERRERA', '12', '27', 'mastercard', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (65, 98, '7973', 'EMILIA MAGAñA', '07', '28', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (66, 99, '5642', 'KEVIN SALAZAR', '04', '27', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (67, 99, '4130', 'LOLA MáRQUEZ', '08', '28', 'naranja', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (68, 100, '8027', 'ARIADNA GIRóN', '11', '27', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (69, 100, '1352', 'ALLISON ESTRADA', '10', '28', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (70, 101, '2413', 'MARIANA PRIETO', '04', '27', 'cabal', '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.user_tarjetas VALUES (71, 101, '9726', 'DAMIáN DELGADILLO', '10', '26', 'visa', '2026-06-17 17:19:00', '2026-06-17 17:19:00');


--
-- TOC entry 5177 (class 0 OID 30462)
-- Dependencies: 230
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios VALUES (1, 'Admin', 'admin@admin.com', NULL, '$2y$12$1vsAZX3HXoCS1pKtC1sUjODPn58uAiNAMYqMFlEEspqvaHs6Astgm', 1, NULL, '2026-06-17 17:18:57', '2026-06-17 17:18:57', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (2, 'Valentina Rodríguez', 'cliente1@demo.com', '2026-06-17 17:18:57', '$2y$12$8DLo1o1lPtQhm.hoG7LM9.UjuwqiGOaXi668uWMViw.pal4ZEKTqm', 2, NULL, '2026-06-17 17:18:57', '2026-06-17 17:18:57', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (3, 'Martín Fernández', 'cliente2@demo.com', '2026-06-17 17:18:58', '$2y$12$HDikAuM206FHP2iXMh1thOUILGsUaG5VWOymm6qSPaA6KOtuEWkzy', 2, NULL, '2026-06-17 17:18:58', '2026-06-17 17:18:58', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (4, 'Lucía Acosta', 'cliente3@demo.com', '2026-06-17 17:18:58', '$2y$12$4H4uy5vyLqDU4Ldel.ITkO90yvpVoZlJw7irzFMT3FxLk2NAxCTd6', 2, NULL, '2026-06-17 17:18:58', '2026-06-17 17:18:58', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (5, 'Romina Vega', 'kcalvillo@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'SFUg1LQMM8', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (6, 'Verónica Molina', 'isabella49@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'pjIy2MS68L', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (7, 'Facundo Ramos', 'alejandro68@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'u3QwuJw9Qp', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (8, 'Maximiliano Ríos', 'ppaz@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'OIuhLMzFQe', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (9, 'Diego Moreno', 'marmas@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'fw86ht3iQa', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (10, 'Paula Pérez', 'berrios.mariafernanda@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'yjbitVusPq', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (11, 'Javier Sánchez', 'lola23@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'yb6WneNbCM', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (12, 'Natalia Martínez', 'rebeca.olvera@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'vOJajnXPJm', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (13, 'Florencia Benítez', 'tomas.escamilla@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '5Inn6cP74h', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (14, 'Micaela Medina', 'magdalena84@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'gnU0qQnCeQ', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (15, 'Antonella Castro', 'maestas.julia@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'CuDD1lYZIe', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (16, 'Vanesa Pereyra', 'orta.miguelangel@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'wKNkeSxoYC', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (17, 'Celeste Ramos', 'fsolis@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'DnTQ2fkvQa', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (18, 'Sofía Vega', 'sebastian70@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'IUVMz3Kp9V', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (19, 'Cristian Vargas', 'esteban00@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'WaWAGQETDv', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (20, 'Facundo Romero', 'ricardo14@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'Nv9yn1CSJ8', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (21, 'Sebastián Vega', 'pedroza.renata@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'Pa4buyIiDB', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (22, 'Rodrigo Núñez', 'emilia.quintanilla@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'JCplNl5sf5', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (23, 'Antonella Martínez', 'parmas@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '7EcWWhdarz', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (24, 'Tomás Pereyra', 'martina07@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'XNlsvtxFNI', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (25, 'Leandro Pereyra', 'hidalgo.ibarra@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'sZS9pbTczV', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (26, 'Micaela Torres', 'odelarosa@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'HeQZTKjxLn', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (27, 'Facundo Rodríguez', 'trejo.paula@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'sbr8Bt6pAn', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (28, 'Marcos Domínguez', 'kmontemayor@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'NHL9LAjVeK', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (29, 'Melina Mendoza', 'bguzman@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'HWFXgsxlGE', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (30, 'Julieta Mendoza', 'villalobos.mario@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '5hNFrPT9oW', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (31, 'Verónica Rodríguez', 'agustin.santillan@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'DWouYJdPub', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (32, 'Sofía Navarro', 'alexander52@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'dGbO8B8fFo', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (33, 'Romina Delgado', 'lucas.brito@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'Ux1wiByrU5', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (34, 'Natalia Álvarez', 'bahena.mariacamila@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'mQ3syJpil1', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (35, 'Sofía Ríos', 'leonardo58@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'opEFryfAiD', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (36, 'Sofía Romero', 'kmaestas@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '3iQL5DxJMA', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (37, 'Leandro Sánchez', 'juanmanuel70@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'habbXw1c3c', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (38, 'Pablo Pereyra', 'lola.riojas@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'WzAPnrjGG6', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (39, 'Vanesa Romero', 'nadia.mora@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '4UOLeJZaLy', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (40, 'Maximiliano Núñez', 'varela.manuel@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'mBMnDgi6zU', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (41, 'Diego Silva', 'irene28@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'xpKx14vDnO', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (42, 'Cristian Medina', 'rodarte.ariana@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'l6EnIPQMZD', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (43, 'Federico López', 'luciana.ontiveros@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '1yrqUcvvEC', '2026-06-17 17:18:59', '2026-06-17 17:18:59', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (44, 'Vanesa Herrera', 'matias.christopher@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'bmfecIhUoS', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (45, 'Gonzalo Martínez', 'alexa11@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'YXYOsKtVQF', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (46, 'Leandro Medina', 'nieto.aitana@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '3Wcuzd48BR', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (47, 'Martín Mendoza', 'isabel19@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '7Wm8G5c3e3', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (48, 'Leandro Silva', 'camila69@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '8dZwgpbdFv', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (49, 'Diego Pérez', 'lautaro34@example.org', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'bAwkyNVoit', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (50, 'Noelia Castro', 'florez.ximena@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'UjKi5dasAn', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (51, 'Paula Benítez', 'dylan90@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'z4C2sbapcc', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (52, 'Carla Ruiz', 'adriana78@example.net', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'xtPI3PA7Xn', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (53, 'Maximiliano Ortiz', 'tduran@example.com', '2026-06-17 17:18:59', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'Ua0ZRyLzW8', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (54, 'Pablo Fuentes', 'gallegos.juandiego@example.org', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'Zv9eZS4DUE', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (55, 'Romina Delgado', 'matthew07@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'vzW4HNM9Iu', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (56, 'Romina Torres', 'ruiz.nahuel@example.org', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'JepiSkQqld', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (57, 'Javier Vega', 'pedro.delgado@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'khtAUPtOGs', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (58, 'Soledad Ríos', 'jayala@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'K1f6eUyzE8', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (59, 'Rodrigo Molina', 'armijo.isabella@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'PnbSehbGVP', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (60, 'Cristian Domínguez', 'hsantana@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'OFlYli7Pz3', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (61, 'Marcos Núñez', 'fabiana23@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'AVtVpjfq17', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (62, 'Valentina Pérez', 'marin.luna@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'baOj7t1ZfW', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (63, 'Carla Suárez', 'valladares.lorenzo@example.org', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'aHcLQefPWs', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (64, 'Soledad Molina', 'arredondo.miguelangel@example.org', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'UKRQRsWxwz', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (65, 'Sebastián Rodríguez', 'malicea@example.org', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'Ij2dX2NDJ6', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (66, 'Verónica Delgado', 'maximo.orellana@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'K774ryiqwS', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (67, 'Federico Martínez', 'colivas@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '8BCJzCqTKD', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (68, 'Natalia Romero', 'cepeda.isabel@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'rHPYke5Vny', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (69, 'Daniela Delgado', 'melgar.andres@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'L55toLhLIs', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (70, 'Rodrigo Benítez', 'alonso75@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'LEpUf33TkC', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (71, 'Julieta Jiménez', 'concepcion.ana@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '6ShdCpP5Dr', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (72, 'Julieta Ramos', 'valentina.fajardo@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '4NpmTc52AR', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (73, 'Julieta Moreno', 'benjamin.soto@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'vD60bSDAhO', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (74, 'Ezequiel Álvarez', 'mariajose.laureano@example.org', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'NJdlliGQv6', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (75, 'Rodrigo López', 'emilia08@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'z8u6MCHMqc', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (76, 'Celeste Moreno', 'ariana01@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'WkPqBUjtS1', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (77, 'Rodrigo Álvarez', 'fabiana.romo@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'Ah7avRrKWm', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (78, 'Diego Ramos', 'agustin.toledo@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'C8GF18PPLc', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (79, 'Maximiliano Herrera', 'eescobedo@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'hLBM5IG8Ba', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (80, 'Javier Ramos', 'sechevarria@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'tT2EOwiOgN', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (81, 'Celeste Blanco', 'rafael.chapa@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'EDM2YSnHvE', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (82, 'Verónica Ortiz', 'lceballos@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'hJ7K3lQ6By', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (83, 'Cristian Molina', 'victoria05@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'rg6vaiBFcT', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (84, 'Valentina Ibáñez', 'jorge78@example.org', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'zctP6Qih2D', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (85, 'Micaela Pereyra', 'jcasarez@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, '5K80aqVbgT', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (86, 'Gonzalo García', 'daniel55@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'raSD4jlzn4', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (87, 'Carla Rodríguez', 'orosco.agustin@example.org', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'hQGIQvhHxj', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (88, 'Pablo Ruiz', 'victoria34@example.org', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'VADghROIJR', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (89, 'Romina Jiménez', 'amador.constanza@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'ZhSZQuafZO', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (90, 'Romina Mendoza', 'agustin94@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'x2IgszPhlv', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (91, 'Gonzalo Díaz', 'corona.santiago@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'KxpqST8HzY', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (92, 'Soledad Ramos', 'zuniga.ana@example.org', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'vZg9NVYDuy', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (93, 'Javier Medina', 'ivanna22@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'gl9XTeQSCD', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (94, 'Celeste Fuentes', 'tovar.juanesteban@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'TpxfJIDzpW', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (95, 'Diego Pérez', 'alejandro11@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'TuoHhiBarl', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (96, 'Antonella Castro', 'ortiz.anthony@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'QqPZwPBCt1', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (97, 'Lucía Herrera', 'franco.elias@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'ATIKmMgrkS', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (98, 'Rodrigo Navarro', 'almanza.ornela@example.org', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'x1peUhdxgg', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (99, 'Ezequiel Martínez', 'tdelafuente@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'wAxne4Mffm', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (100, 'Lucía Silva', 'yadorno@example.net', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'K8I48DMtkv', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.usuarios VALUES (101, 'Romina Gutiérrez', 'valentin.rivas@example.com', '2026-06-17 17:19:00', '$2y$12$uP2fmSX6STiwmHYl0ItbAOfORKf6sEoJvxo3Z7NJpClycW78f8qnu', 2, 'sAwX5GBrIU', '2026-06-17 17:19:00', '2026-06-17 17:19:00', NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5180 (class 0 OID 30494)
-- Dependencies: 233
-- Data for Name: ventas_cabecera; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ventas_cabecera VALUES (1, 2, NULL, 'carrito', 530000.00, '2026-06-17 17:19:00', '2026-06-17 17:19:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pendiente', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (2, 42, '2023-10-23 01:19:01', 'confirmado', 160000.00, '2023-10-23 01:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle 44', '524', 'La Plata - Ringuelet', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (3, 23, '2025-05-11 10:19:01', 'confirmado', 175000.00, '2025-05-11 10:19:01', '2026-06-17 17:19:01', 'Federico García', 'Calle 8', '2646', 'La Plata - Centro', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (4, 84, '2026-03-21 22:19:01', 'confirmado', 700000.00, '2026-03-21 22:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle 63', '2468', 'La Plata - Los Hornos', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (5, 54, '2025-05-14 17:19:01', 'confirmado', 585000.00, '2025-05-14 17:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle Avenida 7', '1764', 'La Plata - Abasto', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (6, 38, '2025-03-21 02:19:01', 'confirmado', 595000.00, '2025-03-21 02:19:01', '2026-06-17 17:19:01', 'Micaela Gutiérrez', 'Calle 32', '345', 'La Plata - Tolosa', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (7, 6, '2024-03-08 02:19:01', 'confirmado', 1690000.00, '2024-03-08 02:19:01', '2026-06-17 17:19:01', 'Federico García', 'Calle 84', '2144', 'La Plata - Villa Elisa', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (8, 21, '2023-10-23 13:19:01', 'confirmado', 720000.00, '2023-10-23 13:19:01', '2026-06-17 17:19:01', 'Gonzalo Sánchez', 'Calle Avenida 13', '2278', 'La Plata - Los Hornos', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (9, 59, '2023-12-27 02:19:01', 'confirmado', 240000.00, '2023-12-27 02:19:01', '2026-06-17 17:19:01', 'Valentina Rodríguez', 'Calle 13', '2523', 'La Plata - Centro', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (10, 39, '2025-12-06 17:19:01', 'confirmado', 1700000.00, '2025-12-06 17:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle Avenida 32', '2369', 'La Plata - Ensenada', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (11, 58, '2025-12-29 17:19:01', 'confirmado', 1350000.00, '2025-12-29 17:19:01', '2026-06-17 17:19:01', 'Federico García', 'Calle 6', '939', 'La Plata - Tolosa', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (12, 42, '2023-12-15 09:19:01', 'confirmado', 500000.00, '2023-12-15 09:19:01', '2026-06-17 17:19:01', 'Sebastián Herrera', 'Calle Diagonal 80', '1829', 'La Plata - City Bell', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (13, 11, '2025-03-30 14:19:01', 'confirmado', 160000.00, '2025-03-30 14:19:01', '2026-06-17 17:19:01', 'Gonzalo Sánchez', 'Calle 10', '1151', 'La Plata - Villa Elisa', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (14, 47, '2025-03-27 01:19:01', 'confirmado', 1340000.00, '2025-03-27 01:19:01', '2026-06-17 17:19:01', 'Facundo Ruiz', 'Calle 66', '2630', 'La Plata - Los Hornos', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (15, 17, '2024-04-29 20:19:01', 'confirmado', 675000.00, '2024-04-29 20:19:01', '2026-06-17 17:19:01', 'Matías Torres', 'Calle 14', '2139', 'La Plata - Ensenada', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (16, 42, '2025-04-02 15:19:01', 'confirmado', 160000.00, '2025-04-02 15:19:01', '2026-06-17 17:19:01', 'Sebastián Herrera', 'Calle Avenida 7', '319', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (17, 51, '2024-04-12 10:19:01', 'confirmado', 150000.00, '2024-04-12 10:19:01', '2026-06-17 17:19:01', 'Sofía Romero', 'Calle 6', '1433', 'La Plata - City Bell', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (18, 40, '2025-05-10 01:19:01', 'confirmado', 530000.00, '2025-05-10 01:19:01', '2026-06-17 17:19:01', 'Tomás Álvarez', 'Calle 32', '1569', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (19, 94, '2024-03-01 23:19:01', 'confirmado', 1150000.00, '2024-03-01 23:19:01', '2026-06-17 17:19:01', 'Lucía Acosta', 'Calle Avenida 13', '1869', 'La Plata - Abasto', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (20, 53, '2024-11-28 23:19:01', 'confirmado', 150000.00, '2024-11-28 23:19:01', '2026-06-17 17:19:01', 'Facundo Ruiz', 'Calle 72', '2035', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (21, 76, '2025-03-22 20:19:01', 'confirmado', 1020000.00, '2025-03-22 20:19:01', '2026-06-17 17:19:01', 'Valentina Rodríguez', 'Calle 60', '2122', 'La Plata - Villa Elvira', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (22, 41, '2024-06-29 12:19:01', 'confirmado', 1720000.00, '2024-06-29 12:19:01', '2026-06-17 17:19:01', 'Paula Vargas', 'Calle 7', '2940', 'La Plata - Ringuelet', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (23, 55, '2023-12-05 14:19:01', 'confirmado', 1130000.00, '2023-12-05 14:19:01', '2026-06-17 17:19:01', 'Lucía Acosta', 'Calle 7', '734', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (24, 40, '2026-03-03 21:19:01', 'confirmado', 1155000.00, '2026-03-03 21:19:01', '2026-06-17 17:19:01', 'Facundo Ruiz', 'Calle 76', '764', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (25, 19, '2024-04-13 00:19:01', 'confirmado', 1845000.00, '2024-04-13 00:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle 84', '2216', 'La Plata - City Bell', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (26, 31, '2025-12-02 00:19:01', 'confirmado', 540000.00, '2025-12-02 00:19:01', '2026-06-17 17:19:01', 'Matías Torres', 'Calle 72', '2051', 'La Plata - Melchor Romero', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (27, 31, '2025-01-25 17:19:01', 'confirmado', 1140000.00, '2025-01-25 17:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle Avenida 66', '1961', 'La Plata - Tolosa', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (28, 38, '2025-03-22 15:19:01', 'confirmado', 1700000.00, '2025-03-22 15:19:01', '2026-06-17 17:19:01', 'Federico García', 'Calle 12', '678', 'La Plata - Tolosa', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (29, 23, '2024-12-30 11:19:01', 'confirmado', 1235000.00, '2024-12-30 11:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle Diagonal 73', '213', 'La Plata - Berisso', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (30, 46, '2023-07-07 09:19:01', 'confirmado', 1180000.00, '2023-07-07 09:19:01', '2026-06-17 17:19:01', 'Facundo Ruiz', 'Calle Diagonal 80', '134', 'La Plata - Abasto', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (31, 85, '2024-08-02 20:19:01', 'confirmado', 2190000.00, '2024-08-02 20:19:01', '2026-06-17 17:19:01', 'Sofía Romero', 'Calle 60', '2863', 'La Plata - Villa Elisa', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (32, 76, '2025-07-25 11:19:01', 'confirmado', 950000.00, '2025-07-25 11:19:01', '2026-06-17 17:19:01', 'Tomás Álvarez', 'Calle 76', '536', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (33, 90, '2024-08-04 08:19:01', 'confirmado', 965000.00, '2024-08-04 08:19:01', '2026-06-17 17:19:01', 'Micaela Gutiérrez', 'Calle 3', '1161', 'La Plata - Los Hornos', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (34, 73, '2025-09-25 16:19:01', 'confirmado', 810000.00, '2025-09-25 16:19:01', '2026-06-17 17:19:01', 'Paula Vargas', 'Calle 8', '1677', 'La Plata - Villa Elvira', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (35, 47, '2024-10-21 05:19:01', 'confirmado', 800000.00, '2024-10-21 05:19:01', '2026-06-17 17:19:01', 'Micaela Gutiérrez', 'Calle Diagonal 79', '1402', 'La Plata - Melchor Romero', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (36, 3, '2024-09-24 11:19:01', 'confirmado', 760000.00, '2024-09-24 11:19:01', '2026-06-17 17:19:01', 'Agustina Martínez', 'Calle 14', '1360', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (37, 82, '2024-01-16 10:19:01', 'confirmado', 740000.00, '2024-01-16 10:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle 38', '548', 'La Plata - Abasto', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (38, 10, '2023-08-10 05:19:01', 'confirmado', 1510000.00, '2023-08-10 05:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle Avenida 32', '2400', 'La Plata - Centro', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (39, 57, '2025-11-18 02:19:01', 'confirmado', 270000.00, '2025-11-18 02:19:01', '2026-06-17 17:19:01', 'Lucía Acosta', 'Calle 7', '2058', 'La Plata - Centro', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (40, 42, '2026-02-07 18:19:01', 'confirmado', 420000.00, '2026-02-07 18:19:01', '2026-06-17 17:19:01', 'Lucía Acosta', 'Calle 14', '2727', 'La Plata - Gonnet', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (41, 21, '2026-01-03 13:19:01', 'confirmado', 695000.00, '2026-01-03 13:19:01', '2026-06-17 17:19:01', 'Sofía Romero', 'Calle Diagonal 73', '768', 'La Plata - Berisso', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (42, 94, '2026-04-25 05:19:01', 'confirmado', 570000.00, '2026-04-25 05:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle 5', '1749', 'La Plata - Villa Elvira', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (43, 4, '2024-12-11 06:19:01', 'confirmado', 1680000.00, '2024-12-11 06:19:01', '2026-06-17 17:19:01', 'Micaela Gutiérrez', 'Calle 66', '289', 'La Plata - Gonnet', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (44, 20, '2025-04-11 06:19:01', 'confirmado', 1350000.00, '2025-04-11 06:19:01', '2026-06-17 17:19:01', 'Sofía Romero', 'Calle 6', '998', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (45, 69, '2024-04-25 09:19:01', 'confirmado', 585000.00, '2024-04-25 09:19:01', '2026-06-17 17:19:01', 'Federico García', 'Calle 81', '612', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (46, 34, '2024-11-19 21:19:01', 'confirmado', 935000.00, '2024-11-19 21:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle 90', '2046', 'La Plata - Centro', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (47, 15, '2024-10-13 06:19:01', 'confirmado', 390000.00, '2024-10-13 06:19:01', '2026-06-17 17:19:01', 'Natalia Moreno', 'Calle 14', '472', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (48, 21, '2025-01-20 07:19:01', 'confirmado', 310000.00, '2025-01-20 07:19:01', '2026-06-17 17:19:01', 'Leandro Ortiz', 'Calle Avenida 7', '219', 'La Plata - Ensenada', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (49, 16, '2023-10-16 01:19:01', 'confirmado', 810000.00, '2023-10-16 01:19:01', '2026-06-17 17:19:01', 'Matías Torres', 'Calle 12', '1389', 'La Plata - Ensenada', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (50, 11, '2026-05-24 10:19:01', 'confirmado', 1590000.00, '2026-05-24 10:19:01', '2026-06-17 17:19:01', 'Gonzalo Sánchez', 'Calle 4', '1795', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (51, 82, '2025-12-19 21:19:01', 'confirmado', 1040000.00, '2025-12-19 21:19:01', '2026-06-17 17:19:01', 'Nicolás Pérez', 'Calle 81', '2029', 'La Plata - Berisso', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (52, 78, '2025-08-15 06:19:01', 'confirmado', 180000.00, '2025-08-15 06:19:01', '2026-06-17 17:19:01', 'Agustina Martínez', 'Calle 84', '1154', 'La Plata - Centro', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (53, 29, '2026-04-20 19:19:01', 'confirmado', 620000.00, '2026-04-20 19:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle Avenida 66', '2005', 'La Plata - Abasto', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (54, 80, '2024-10-15 01:19:01', 'confirmado', 250000.00, '2024-10-15 01:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle 11', '1442', 'La Plata - Ensenada', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (55, 81, '2024-05-22 23:19:01', 'confirmado', 290000.00, '2024-05-22 23:19:01', '2026-06-17 17:19:01', 'Agustina Martínez', 'Calle 90', '1532', 'La Plata - Centro', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (56, 60, '2023-07-18 13:19:01', 'confirmado', 615000.00, '2023-07-18 13:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle 51', '391', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (57, 64, '2023-11-13 19:19:01', 'confirmado', 800000.00, '2023-11-13 19:19:01', '2026-06-17 17:19:01', 'Agustina Martínez', 'Calle 63', '1981', 'La Plata - Berisso', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (58, 8, '2025-02-06 04:19:01', 'confirmado', 580000.00, '2025-02-06 04:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle Avenida 32', '411', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (59, 7, '2024-01-16 11:19:01', 'confirmado', 320000.00, '2024-01-16 11:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle 76', '191', 'La Plata - Ensenada', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (60, 87, '2026-01-05 04:19:01', 'confirmado', 290000.00, '2026-01-05 04:19:01', '2026-06-17 17:19:01', 'Agustina Martínez', 'Calle 4', '1390', 'La Plata - City Bell', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (61, 101, '2026-03-05 13:19:01', 'confirmado', 880000.00, '2026-03-05 13:19:01', '2026-06-17 17:19:01', 'Gonzalo Sánchez', 'Calle 38', '2518', 'La Plata - Abasto', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (62, 90, '2023-11-04 19:19:01', 'confirmado', 2020000.00, '2023-11-04 19:19:01', '2026-06-17 17:19:01', 'Sofía Romero', 'Calle Avenida 66', '629', 'La Plata - Abasto', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (63, 10, '2023-10-21 22:19:01', 'confirmado', 845000.00, '2023-10-21 22:19:01', '2026-06-17 17:19:01', 'Leandro Ortiz', 'Calle 2', '1928', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (64, 43, '2026-02-04 15:19:01', 'confirmado', 1315000.00, '2026-02-04 15:19:01', '2026-06-17 17:19:01', 'Tomás Álvarez', 'Calle 5', '2384', 'La Plata - Gonnet', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (65, 93, '2025-05-02 01:19:01', 'confirmado', 1530000.00, '2025-05-02 01:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle Avenida 13', '2063', 'La Plata - Villa Elisa', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (66, 2, '2024-09-06 05:19:01', 'confirmado', 990000.00, '2024-09-06 05:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle 38', '2453', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (67, 14, '2025-08-19 07:19:01', 'confirmado', 310000.00, '2025-08-19 07:19:01', '2026-06-17 17:19:01', 'Leandro Ortiz', 'Calle 116', '920', 'La Plata - Ensenada', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (68, 81, '2026-01-30 01:19:01', 'confirmado', 1355000.00, '2026-01-30 01:19:01', '2026-06-17 17:19:01', 'Sebastián Herrera', 'Calle 5', '909', 'La Plata - Abasto', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (69, 100, '2025-12-08 16:19:01', 'confirmado', 930000.00, '2025-12-08 16:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle 7', '2243', 'La Plata - Melchor Romero', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (70, 80, '2023-09-15 13:19:01', 'confirmado', 2270000.00, '2023-09-15 13:19:01', '2026-06-17 17:19:01', 'Natalia Moreno', 'Calle 38', '1889', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (71, 75, '2025-08-07 16:19:01', 'confirmado', 810000.00, '2025-08-07 16:19:01', '2026-06-17 17:19:01', 'Paula Vargas', 'Calle Diagonal 80', '2441', 'La Plata - Melchor Romero', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (72, 58, '2024-11-10 04:19:01', 'confirmado', 1020000.00, '2024-11-10 04:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle Diagonal 80', '1778', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (73, 24, '2024-02-25 19:19:01', 'confirmado', 205000.00, '2024-02-25 19:19:01', '2026-06-17 17:19:01', 'Natalia Moreno', 'Calle 137', '2680', 'La Plata - Berisso', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (74, 35, '2024-02-11 02:19:01', 'confirmado', 860000.00, '2024-02-11 02:19:01', '2026-06-17 17:19:01', 'Sofía Romero', 'Calle 7', '2550', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (75, 89, '2025-07-10 09:19:01', 'confirmado', 560000.00, '2025-07-10 09:19:01', '2026-06-17 17:19:01', 'Agustina Martínez', 'Calle Diagonal 79', '627', 'La Plata - Los Hornos', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (76, 100, '2025-11-17 07:19:01', 'confirmado', 920000.00, '2025-11-17 07:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle 7', '1434', 'La Plata - Villa Elvira', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (77, 23, '2025-09-03 17:19:01', 'confirmado', 1320000.00, '2025-09-03 17:19:01', '2026-06-17 17:19:01', 'Gonzalo Sánchez', 'Calle 57', '940', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (78, 72, '2026-04-09 12:19:01', 'confirmado', 1670000.00, '2026-04-09 12:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle 122', '2542', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (79, 17, '2025-03-18 19:19:01', 'confirmado', 540000.00, '2025-03-18 19:19:01', '2026-06-17 17:19:01', 'Nicolás Pérez', 'Calle Avenida 44', '931', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (80, 17, '2025-11-14 22:19:01', 'confirmado', 630000.00, '2025-11-14 22:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle 13', '1915', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (81, 76, '2024-10-22 08:19:01', 'confirmado', 615000.00, '2024-10-22 08:19:01', '2026-06-17 17:19:01', 'Sebastián Herrera', 'Calle Avenida 13', '420', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (82, 31, '2025-01-25 18:19:01', 'confirmado', 780000.00, '2025-01-25 18:19:01', '2026-06-17 17:19:01', 'Sofía Romero', 'Calle 76', '272', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (83, 88, '2024-02-08 05:19:01', 'confirmado', 615000.00, '2024-02-08 05:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle Diagonal 79', '433', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (84, 6, '2024-10-19 21:19:01', 'confirmado', 1710000.00, '2024-10-19 21:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle Avenida 13', '2848', 'La Plata - City Bell', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (85, 23, '2025-09-29 19:19:01', 'confirmado', 1050000.00, '2025-09-29 19:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle 10', '2569', 'La Plata - Abasto', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (86, 53, '2023-11-06 09:19:01', 'confirmado', 1285000.00, '2023-11-06 09:19:01', '2026-06-17 17:19:01', 'Leandro Ortiz', 'Calle 9', '2123', 'La Plata - Tolosa', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (87, 91, '2025-07-02 04:19:01', 'confirmado', 840000.00, '2025-07-02 04:19:01', '2026-06-17 17:19:01', 'Federico García', 'Calle Avenida 7', '1524', 'La Plata - Ringuelet', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (88, 43, '2024-11-07 02:19:01', 'confirmado', 965000.00, '2024-11-07 02:19:01', '2026-06-17 17:19:01', 'Nicolás Pérez', 'Calle 66', '1452', 'La Plata - Villa Elvira', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (89, 74, '2026-01-25 03:19:01', 'confirmado', 1460000.00, '2026-01-25 03:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle 8', '916', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (90, 41, '2024-10-07 22:19:01', 'confirmado', 730000.00, '2024-10-07 22:19:01', '2026-06-17 17:19:01', 'Valentina Rodríguez', 'Calle 60', '1422', 'La Plata - Tolosa', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (91, 3, '2025-09-21 14:19:01', 'confirmado', 420000.00, '2025-09-21 14:19:01', '2026-06-17 17:19:01', 'Paula Vargas', 'Calle 1', '2483', 'La Plata - Abasto', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (92, 89, '2025-06-22 05:19:01', 'confirmado', 310000.00, '2025-06-22 05:19:01', '2026-06-17 17:19:01', 'Agustina Martínez', 'Calle 116', '113', 'La Plata - Abasto', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (93, 7, '2026-02-26 10:19:01', 'confirmado', 2400000.00, '2026-02-26 10:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle Avenida 44', '523', 'La Plata - Centro', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (94, 71, '2024-10-23 11:19:01', 'confirmado', 175000.00, '2024-10-23 11:19:01', '2026-06-17 17:19:01', 'Tomás Álvarez', 'Calle 66', '2144', 'La Plata - Abasto', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (95, 31, '2024-10-30 03:19:01', 'confirmado', 1440000.00, '2024-10-30 03:19:01', '2026-06-17 17:19:01', 'Lucía Acosta', 'Calle 81', '2850', 'La Plata - Berisso', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (96, 9, '2025-07-20 01:19:01', 'confirmado', 745000.00, '2025-07-20 01:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle 6', '2780', 'La Plata - Abasto', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (97, 60, '2025-10-25 11:19:01', 'confirmado', 870000.00, '2025-10-25 11:19:01', '2026-06-17 17:19:01', 'Agustina Martínez', 'Calle 116', '1431', 'La Plata - Villa Elisa', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (98, 73, '2023-09-13 06:19:01', 'confirmado', 1710000.00, '2023-09-13 06:19:01', '2026-06-17 17:19:01', 'Micaela Gutiérrez', 'Calle 11', '2421', 'La Plata - Los Hornos', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (99, 8, '2025-11-09 20:19:01', 'confirmado', 855000.00, '2025-11-09 20:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle 66', '2539', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (100, 27, '2023-09-28 11:19:01', 'confirmado', 1920000.00, '2023-09-28 11:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle Diagonal 73', '293', 'La Plata - City Bell', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (101, 29, '2024-10-13 12:19:01', 'confirmado', 945000.00, '2024-10-13 12:19:01', '2026-06-17 17:19:01', 'Federico García', 'Calle Diagonal 73', '1996', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (102, 33, '2023-12-30 05:19:01', 'confirmado', 1360000.00, '2023-12-30 05:19:01', '2026-06-17 17:19:01', 'Natalia Moreno', 'Calle 2', '1215', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (103, 50, '2023-11-16 02:19:01', 'confirmado', 350000.00, '2023-11-16 02:19:01', '2026-06-17 17:19:01', 'Facundo Ruiz', 'Calle 84', '2526', 'La Plata - City Bell', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (104, 71, '2025-06-07 09:19:01', 'confirmado', 760000.00, '2025-06-07 09:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle 63', '2997', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (105, 40, '2025-03-15 07:19:01', 'confirmado', 1410000.00, '2025-03-15 07:19:01', '2026-06-17 17:19:01', 'Lucía Acosta', 'Calle 10', '1688', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (106, 2, '2023-11-30 08:19:01', 'confirmado', 1775000.00, '2023-11-30 08:19:01', '2026-06-17 17:19:01', 'Sebastián Herrera', 'Calle Avenida 32', '2304', 'La Plata - Villa Elisa', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (107, 31, '2026-05-22 03:19:01', 'confirmado', 870000.00, '2026-05-22 03:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle 63', '1249', 'La Plata - Abasto', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (108, 15, '2023-07-26 05:19:01', 'confirmado', 1160000.00, '2023-07-26 05:19:01', '2026-06-17 17:19:01', 'Lucía Acosta', 'Calle 12', '1733', 'La Plata - City Bell', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (109, 44, '2023-12-11 22:19:01', 'confirmado', 585000.00, '2023-12-11 22:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle 2', '2488', 'La Plata - Melchor Romero', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (110, 73, '2023-06-28 02:19:01', 'confirmado', 930000.00, '2023-06-28 02:19:01', '2026-06-17 17:19:01', 'Gonzalo Sánchez', 'Calle 72', '474', 'La Plata - Melchor Romero', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (111, 31, '2024-03-05 07:19:01', 'confirmado', 1100000.00, '2024-03-05 07:19:01', '2026-06-17 17:19:01', 'Sebastián Herrera', 'Calle 4', '1103', 'La Plata - Gonnet', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (112, 3, '2026-01-11 01:19:01', 'confirmado', 1130000.00, '2026-01-11 01:19:01', '2026-06-17 17:19:01', 'Sebastián Herrera', 'Calle 84', '2715', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (113, 75, '2024-04-29 23:19:01', 'confirmado', 655000.00, '2024-04-29 23:19:01', '2026-06-17 17:19:01', 'Agustina Martínez', 'Calle 1', '2653', 'La Plata - Melchor Romero', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (114, 48, '2023-09-25 23:19:01', 'confirmado', 1540000.00, '2023-09-25 23:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle 60', '2206', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (115, 58, '2024-01-26 14:19:01', 'confirmado', 750000.00, '2024-01-26 14:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle 10', '1750', 'La Plata - Centro', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (116, 89, '2025-05-24 09:19:01', 'confirmado', 1500000.00, '2025-05-24 09:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle Diagonal 73', '947', 'La Plata - Villa Elisa', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (117, 38, '2024-07-04 23:19:01', 'confirmado', 2130000.00, '2024-07-04 23:19:01', '2026-06-17 17:19:01', 'Leandro Ortiz', 'Calle 72', '1952', 'La Plata - Melchor Romero', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (118, 5, '2025-03-02 05:19:01', 'confirmado', 840000.00, '2025-03-02 05:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle 10', '1447', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (119, 19, '2023-10-05 23:19:01', 'confirmado', 910000.00, '2023-10-05 23:19:01', '2026-06-17 17:19:01', 'Tomás Álvarez', 'Calle 10', '1637', 'La Plata - City Bell', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (120, 87, '2025-03-04 01:19:01', 'confirmado', 560000.00, '2025-03-04 01:19:01', '2026-06-17 17:19:01', 'Agustina Martínez', 'Calle Diagonal 80', '769', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (121, 64, '2024-03-01 06:19:01', 'confirmado', 1560000.00, '2024-03-01 06:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle 5', '418', 'La Plata - Abasto', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (122, 99, '2023-10-28 23:19:01', 'confirmado', 930000.00, '2023-10-28 23:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle 9', '1627', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (123, 78, '2025-12-14 23:19:01', 'confirmado', 1205000.00, '2025-12-14 23:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle Diagonal 79', '2103', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (124, 26, '2024-04-20 15:19:01', 'confirmado', 2115000.00, '2024-04-20 15:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle 57', '413', 'La Plata - Villa Elisa', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (125, 30, '2025-08-19 22:19:01', 'confirmado', 900000.00, '2025-08-19 22:19:01', '2026-06-17 17:19:01', 'Natalia Moreno', 'Calle 76', '2649', 'La Plata - Centro', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (126, 67, '2024-07-19 21:19:01', 'confirmado', 335000.00, '2024-07-19 21:19:01', '2026-06-17 17:19:01', 'Sebastián Herrera', 'Calle 63', '1073', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (127, 42, '2026-03-04 17:19:01', 'confirmado', 350000.00, '2026-03-04 17:19:01', '2026-06-17 17:19:01', 'Valentina Rodríguez', 'Calle 51', '2963', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (128, 8, '2025-10-09 17:19:01', 'confirmado', 540000.00, '2025-10-09 17:19:01', '2026-06-17 17:19:01', 'Natalia Moreno', 'Calle Avenida 44', '256', 'La Plata - Ringuelet', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (129, 51, '2024-11-19 02:19:01', 'confirmado', 1300000.00, '2024-11-19 02:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle 122', '373', 'La Plata - Villa Elvira', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (130, 67, '2024-09-26 07:19:01', 'confirmado', 385000.00, '2024-09-26 07:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle Diagonal 74', '668', 'La Plata - City Bell', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (131, 75, '2023-11-16 02:19:01', 'confirmado', 870000.00, '2023-11-16 02:19:01', '2026-06-17 17:19:01', 'Lucía Acosta', 'Calle 116', '1607', 'La Plata - Ringuelet', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (132, 57, '2024-09-02 03:19:01', 'confirmado', 550000.00, '2024-09-02 03:19:01', '2026-06-17 17:19:01', 'Valentina Rodríguez', 'Calle 72', '966', 'La Plata - Tolosa', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (133, 83, '2025-11-17 02:19:01', 'confirmado', 1230000.00, '2025-11-17 02:19:01', '2026-06-17 17:19:01', 'Paula Vargas', 'Calle Diagonal 74', '1422', 'La Plata - Ensenada', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (134, 36, '2023-12-01 15:19:01', 'confirmado', 270000.00, '2023-12-01 15:19:01', '2026-06-17 17:19:01', 'Natalia Moreno', 'Calle 1', '2162', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (135, 87, '2025-08-08 02:19:01', 'confirmado', 1950000.00, '2025-08-08 02:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle 90', '2997', 'La Plata - Melchor Romero', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (136, 23, '2023-09-19 23:19:01', 'confirmado', 1050000.00, '2023-09-19 23:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle 9', '2881', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (137, 58, '2026-06-10 11:19:01', 'confirmado', 540000.00, '2026-06-10 11:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle 2', '2520', 'La Plata - Ringuelet', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (138, 60, '2025-09-23 22:19:01', 'confirmado', 900000.00, '2025-09-23 22:19:01', '2026-06-17 17:19:01', 'Nicolás Pérez', 'Calle 12', '1458', 'La Plata - Melchor Romero', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (139, 9, '2024-01-19 15:19:01', 'confirmado', 700000.00, '2024-01-19 15:19:01', '2026-06-17 17:19:01', 'Tomás Álvarez', 'Calle 60', '444', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (140, 14, '2025-01-12 05:19:01', 'confirmado', 630000.00, '2025-01-12 05:19:01', '2026-06-17 17:19:01', 'Nicolás Pérez', 'Calle 2', '1522', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (141, 100, '2023-08-25 13:19:01', 'confirmado', 1810000.00, '2023-08-25 13:19:01', '2026-06-17 17:19:01', 'Natalia Moreno', 'Calle Diagonal 80', '2802', 'La Plata - Gonnet', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (142, 40, '2025-08-05 21:19:01', 'confirmado', 380000.00, '2025-08-05 21:19:01', '2026-06-17 17:19:01', 'Valentina Rodríguez', 'Calle 60', '2309', 'La Plata - Villa Elisa', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (143, 87, '2023-07-24 11:19:01', 'confirmado', 870000.00, '2023-07-24 11:19:01', '2026-06-17 17:19:01', 'Gonzalo Sánchez', 'Calle Avenida 7', '1082', 'La Plata - Centro', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (144, 65, '2023-12-27 00:19:01', 'confirmado', 1175000.00, '2023-12-27 00:19:01', '2026-06-17 17:19:01', 'Nicolás Pérez', 'Calle 7', '2858', 'La Plata - Ringuelet', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (145, 40, '2024-02-13 06:19:01', 'confirmado', 1380000.00, '2024-02-13 06:19:01', '2026-06-17 17:19:01', 'Sofía Romero', 'Calle 90', '274', 'La Plata - City Bell', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (146, 82, '2024-05-23 05:19:01', 'confirmado', 795000.00, '2024-05-23 05:19:01', '2026-06-17 17:19:01', 'Tomás Álvarez', 'Calle Diagonal 73', '1093', 'La Plata - Centro', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (147, 70, '2025-03-25 10:19:01', 'confirmado', 855000.00, '2025-03-25 10:19:01', '2026-06-17 17:19:01', 'Leandro Ortiz', 'Calle Diagonal 79', '1063', 'La Plata - Centro', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (148, 66, '2025-06-05 04:19:01', 'confirmado', 760000.00, '2025-06-05 04:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle 84', '1746', 'La Plata - City Bell', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (149, 6, '2026-05-04 07:19:01', 'confirmado', 1470000.00, '2026-05-04 07:19:01', '2026-06-17 17:19:01', 'Nicolás Pérez', 'Calle 7', '2337', 'La Plata - Melchor Romero', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (150, 51, '2024-07-13 20:19:01', 'confirmado', 1460000.00, '2024-07-13 20:19:01', '2026-06-17 17:19:01', 'Lucía Acosta', 'Calle 3', '1690', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (151, 70, '2024-04-19 16:19:01', 'confirmado', 870000.00, '2024-04-19 16:19:01', '2026-06-17 17:19:01', 'Valentina Rodríguez', 'Calle 72', '2493', 'La Plata - Abasto', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (152, 82, '2026-04-27 21:19:01', 'confirmado', 990000.00, '2026-04-27 21:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle 137', '2243', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (153, 69, '2025-10-13 18:19:01', 'confirmado', 1290000.00, '2025-10-13 18:19:01', '2026-06-17 17:19:01', 'Matías Torres', 'Calle 7', '2281', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (154, 69, '2024-09-29 05:19:01', 'confirmado', 1765000.00, '2024-09-29 05:19:01', '2026-06-17 17:19:01', 'Gonzalo Sánchez', 'Calle Diagonal 74', '2265', 'La Plata - Abasto', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (155, 26, '2025-11-12 11:19:01', 'confirmado', 1350000.00, '2025-11-12 11:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle 122', '2195', 'La Plata - Melchor Romero', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (156, 58, '2026-05-17 02:19:01', 'confirmado', 1025000.00, '2026-05-17 02:19:01', '2026-06-17 17:19:01', 'Sebastián Herrera', 'Calle 60', '2763', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (157, 7, '2024-08-19 19:19:01', 'confirmado', 180000.00, '2024-08-19 19:19:01', '2026-06-17 17:19:01', 'Federico García', 'Calle 66', '974', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (158, 60, '2024-08-17 11:19:01', 'confirmado', 935000.00, '2024-08-17 11:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle 12', '2471', 'La Plata - Abasto', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (159, 66, '2025-10-08 18:19:01', 'confirmado', 740000.00, '2025-10-08 18:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle 4', '1110', 'La Plata - Ensenada', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (160, 41, '2025-10-05 16:19:01', 'confirmado', 1200000.00, '2025-10-05 16:19:01', '2026-06-17 17:19:01', 'Facundo Ruiz', 'Calle 81', '1356', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (161, 34, '2026-04-04 11:19:01', 'confirmado', 240000.00, '2026-04-04 11:19:01', '2026-06-17 17:19:01', 'Matías Torres', 'Calle Diagonal 79', '606', 'La Plata - Berisso', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (162, 97, '2026-06-02 15:19:01', 'confirmado', 1600000.00, '2026-06-02 15:19:01', '2026-06-17 17:19:01', 'Nicolás Pérez', 'Calle 4', '215', 'La Plata - Abasto', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (163, 55, '2024-02-22 12:19:01', 'confirmado', 150000.00, '2024-02-22 12:19:01', '2026-06-17 17:19:01', 'Paula Vargas', 'Calle Diagonal 73', '1443', 'La Plata - Abasto', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (164, 62, '2026-01-25 20:19:01', 'confirmado', 1570000.00, '2026-01-25 20:19:01', '2026-06-17 17:19:01', 'Lucía Acosta', 'Calle 2', '1384', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (165, 67, '2023-07-14 06:19:01', 'confirmado', 620000.00, '2023-07-14 06:19:01', '2026-06-17 17:19:01', 'Agustina Martínez', 'Calle Avenida 7', '209', 'La Plata - Tolosa', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (166, 41, '2024-08-04 04:19:01', 'confirmado', 1350000.00, '2024-08-04 04:19:01', '2026-06-17 17:19:01', 'Leandro Ortiz', 'Calle 90', '687', 'La Plata - Villa Elvira', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (167, 23, '2025-02-14 09:19:01', 'confirmado', 445000.00, '2025-02-14 09:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle 116', '2884', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (168, 98, '2025-03-03 06:19:01', 'confirmado', 870000.00, '2025-03-03 06:19:01', '2026-06-17 17:19:01', 'Facundo Ruiz', 'Calle 3', '2233', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (169, 74, '2024-06-11 06:19:01', 'confirmado', 1705000.00, '2024-06-11 06:19:01', '2026-06-17 17:19:01', 'Lucía Acosta', 'Calle Avenida 13', '1055', 'La Plata - Ensenada', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (170, 28, '2024-12-31 14:19:01', 'confirmado', 900000.00, '2024-12-31 14:19:01', '2026-06-17 17:19:01', 'Gonzalo Sánchez', 'Calle 60', '2527', 'La Plata - Ensenada', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (171, 74, '2026-01-14 19:19:01', 'confirmado', 1610000.00, '2026-01-14 19:19:01', '2026-06-17 17:19:01', 'Tomás Álvarez', 'Calle Avenida 66', '1701', 'La Plata - Tolosa', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (172, 19, '2026-01-04 20:19:01', 'confirmado', 855000.00, '2026-01-04 20:19:01', '2026-06-17 17:19:01', 'Sofía Romero', 'Calle 90', '897', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (173, 72, '2025-05-15 16:19:01', 'confirmado', 730000.00, '2025-05-15 16:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle Avenida 13', '1262', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (174, 64, '2025-06-14 17:19:01', 'confirmado', 1265000.00, '2025-06-14 17:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle 72', '951', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (175, 87, '2025-06-28 15:19:01', 'confirmado', 1020000.00, '2025-06-28 15:19:01', '2026-06-17 17:19:01', 'Sebastián Herrera', 'Calle Diagonal 74', '1863', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (176, 11, '2025-03-03 08:19:01', 'confirmado', 240000.00, '2025-03-03 08:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle Avenida 32', '942', 'La Plata - Melchor Romero', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (177, 29, '2025-12-26 20:19:01', 'confirmado', 860000.00, '2025-12-26 20:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle Avenida 32', '2722', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (178, 38, '2026-06-09 05:19:01', 'confirmado', 1160000.00, '2026-06-09 05:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle Avenida 32', '2333', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (179, 50, '2024-09-12 05:19:01', 'confirmado', 540000.00, '2024-09-12 05:19:01', '2026-06-17 17:19:01', 'Micaela Gutiérrez', 'Calle Diagonal 79', '2409', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (180, 42, '2026-05-31 14:19:01', 'confirmado', 420000.00, '2026-05-31 14:19:01', '2026-06-17 17:19:01', 'Federico García', 'Calle 57', '1139', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (181, 66, '2024-10-12 03:19:01', 'confirmado', 1060000.00, '2024-10-12 03:19:01', '2026-06-17 17:19:01', 'Nicolás Pérez', 'Calle 66', '976', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (182, 82, '2025-05-22 14:19:01', 'confirmado', 160000.00, '2025-05-22 14:19:01', '2026-06-17 17:19:01', 'Paula Vargas', 'Calle 57', '1171', 'La Plata - Ensenada', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (183, 89, '2024-05-23 16:19:01', 'confirmado', 1230000.00, '2024-05-23 16:19:01', '2026-06-17 17:19:01', 'Tomás Álvarez', 'Calle 3', '2819', 'La Plata - Los Hornos', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (184, 45, '2024-09-01 22:19:01', 'confirmado', 540000.00, '2024-09-01 22:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle Diagonal 80', '1678', 'La Plata - Centro', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (185, 15, '2024-08-05 16:19:01', 'confirmado', 950000.00, '2024-08-05 16:19:01', '2026-06-17 17:19:01', 'Martín Fernández', 'Calle 13', '2888', 'La Plata - City Bell', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (186, 73, '2026-01-26 04:19:01', 'confirmado', 695000.00, '2026-01-26 04:19:01', '2026-06-17 17:19:01', 'Facundo Ruiz', 'Calle 84', '1287', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (187, 25, '2024-04-09 12:19:01', 'confirmado', 1050000.00, '2024-04-09 12:19:01', '2026-06-17 17:19:01', 'Agustina Martínez', 'Calle Avenida 7', '2481', 'La Plata - Gonnet', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (188, 22, '2023-09-17 01:19:01', 'confirmado', 2010000.00, '2023-09-17 01:19:01', '2026-06-17 17:19:01', 'Natalia Moreno', 'Calle 7', '2695', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (189, 91, '2024-12-26 02:19:01', 'confirmado', 680000.00, '2024-12-26 02:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle 14', '2634', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (190, 67, '2024-03-28 20:19:01', 'confirmado', 2010000.00, '2024-03-28 20:19:01', '2026-06-17 17:19:01', 'Federico García', 'Calle 44', '2034', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (191, 46, '2025-03-19 12:19:01', 'confirmado', 920000.00, '2025-03-19 12:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle 137', '786', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (192, 12, '2025-06-17 06:19:01', 'confirmado', 2295000.00, '2025-06-17 06:19:01', '2026-06-17 17:19:01', 'Tomás Álvarez', 'Calle 116', '2917', 'La Plata - Villa Elvira', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (193, 92, '2025-08-27 17:19:01', 'confirmado', 930000.00, '2025-08-27 17:19:01', '2026-06-17 17:19:01', 'Federico García', 'Calle 3', '2778', 'La Plata - Gonnet', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (194, 52, '2024-01-11 00:19:01', 'confirmado', 210000.00, '2024-01-11 00:19:01', '2026-06-17 17:19:01', 'Paula Vargas', 'Calle 122', '106', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (195, 91, '2026-04-05 19:19:01', 'confirmado', 900000.00, '2026-04-05 19:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle Diagonal 79', '1675', 'La Plata - Ringuelet', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (196, 15, '2024-04-07 18:19:01', 'confirmado', 1375000.00, '2024-04-07 18:19:01', '2026-06-17 17:19:01', 'Sebastián Herrera', 'Calle Diagonal 80', '1551', 'La Plata - City Bell', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (197, 49, '2023-07-01 14:19:01', 'confirmado', 840000.00, '2023-07-01 14:19:01', '2026-06-17 17:19:01', 'Valentina Rodríguez', 'Calle 72', '1898', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (198, 56, '2024-08-17 04:19:01', 'confirmado', 180000.00, '2024-08-17 04:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle Avenida 13', '1427', 'La Plata - Centro', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (199, 85, '2025-06-06 12:19:01', 'confirmado', 1680000.00, '2025-06-06 12:19:01', '2026-06-17 17:19:01', 'Matías Torres', 'Calle 9', '2138', 'La Plata - Centro', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (200, 6, '2025-09-26 19:19:01', 'confirmado', 980000.00, '2025-09-26 19:19:01', '2026-06-17 17:19:01', 'Facundo Ruiz', 'Calle Avenida 44', '441', 'La Plata - City Bell', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (201, 77, '2026-06-13 20:19:01', 'confirmado', 1010000.00, '2026-06-13 20:19:01', '2026-06-17 17:19:01', 'Julieta Castro', 'Calle 6', '2542', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (202, 19, '2025-08-13 07:19:01', 'confirmado', 1650000.00, '2025-08-13 07:19:01', '2026-06-17 17:19:01', 'Florencia Díaz', 'Calle 44', '1784', 'La Plata - Gonnet', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (203, 70, '2025-08-12 15:19:01', 'confirmado', 810000.00, '2025-08-12 15:19:01', '2026-06-17 17:19:01', 'Nicolás Pérez', 'Calle 44', '669', 'La Plata - Villa Elvira', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (204, 35, '2025-04-02 02:19:01', 'confirmado', 795000.00, '2025-04-02 02:19:01', '2026-06-17 17:19:01', 'Micaela Gutiérrez', 'Calle 13', '1639', 'La Plata - Abasto', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (205, 39, '2024-08-08 21:19:01', 'confirmado', 1160000.00, '2024-08-08 21:19:01', '2026-06-17 17:19:01', 'Diego Jiménez', 'Calle 137', '726', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (206, 12, '2026-06-06 01:19:01', 'confirmado', 1420000.00, '2026-06-06 01:19:01', '2026-06-17 17:19:01', 'Sofía Romero', 'Calle 116', '2694', 'La Plata - Ensenada', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (207, 41, '2024-02-27 14:19:01', 'confirmado', 1465000.00, '2024-02-27 14:19:01', '2026-06-17 17:19:01', 'Facundo Ruiz', 'Calle Avenida 44', '930', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (208, 49, '2023-11-27 20:19:01', 'confirmado', 1375000.00, '2023-11-27 20:19:01', '2026-06-17 17:19:01', 'Leandro Ortiz', 'Calle Diagonal 79', '2528', 'La Plata - Berisso', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (209, 22, '2023-07-12 19:19:01', 'confirmado', 1910000.00, '2023-07-12 19:19:01', '2026-06-17 17:19:01', 'Nicolás Pérez', 'Calle Avenida 66', '1587', 'La Plata - Berisso', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (210, 6, '2024-01-15 08:19:01', 'confirmado', 480000.00, '2024-01-15 08:19:01', '2026-06-17 17:19:01', 'Sofía Romero', 'Calle 63', '1281', 'La Plata - Centro', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (211, 98, '2025-10-17 02:19:01', 'confirmado', 540000.00, '2025-10-17 02:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle 76', '1350', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (212, 79, '2025-03-17 00:19:01', 'confirmado', 925000.00, '2025-03-17 00:19:01', '2026-06-17 17:19:01', 'Facundo Ruiz', 'Calle Avenida 13', '334', 'La Plata - Ensenada', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (213, 6, '2025-03-18 04:19:01', 'confirmado', 500000.00, '2025-03-18 04:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle Diagonal 79', '703', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (214, 34, '2025-09-16 07:19:01', 'confirmado', 1710000.00, '2025-09-16 07:19:01', '2026-06-17 17:19:01', 'Camila López', 'Calle 90', '692', 'La Plata - Abasto', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (215, 17, '2023-07-13 03:19:01', 'confirmado', 420000.00, '2023-07-13 03:19:01', '2026-06-17 17:19:01', 'Federico García', 'Calle 122', '561', 'La Plata - Melchor Romero', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (216, 75, '2024-10-31 15:19:02', 'confirmado', 560000.00, '2024-10-31 15:19:02', '2026-06-17 17:19:02', 'Gonzalo Sánchez', 'Calle 90', '2660', 'La Plata - Tolosa', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (217, 99, '2024-10-15 01:19:02', 'confirmado', 1695000.00, '2024-10-15 01:19:02', '2026-06-17 17:19:02', 'Leandro Ortiz', 'Calle 60', '2453', 'La Plata - Abasto', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (218, 22, '2025-02-22 20:19:02', 'confirmado', 1425000.00, '2025-02-22 20:19:02', '2026-06-17 17:19:02', 'Valentina Rodríguez', 'Calle 76', '306', 'La Plata - Melchor Romero', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (219, 3, '2023-09-01 08:19:02', 'confirmado', 160000.00, '2023-09-01 08:19:02', '2026-06-17 17:19:02', 'Florencia Díaz', 'Calle 11', '916', 'La Plata - Ensenada', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (220, 66, '2026-04-25 05:19:02', 'confirmado', 350000.00, '2026-04-25 05:19:02', '2026-06-17 17:19:02', 'Tomás Álvarez', 'Calle Avenida 7', '2690', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (221, 96, '2024-07-26 14:19:02', 'confirmado', 515000.00, '2024-07-26 14:19:02', '2026-06-17 17:19:02', 'Martín Fernández', 'Calle 63', '412', 'La Plata - Ensenada', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (222, 19, '2023-09-09 04:19:02', 'confirmado', 1560000.00, '2023-09-09 04:19:02', '2026-06-17 17:19:02', 'Valentina Rodríguez', 'Calle Avenida 32', '2036', 'La Plata - Centro', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (223, 62, '2025-11-05 07:19:02', 'confirmado', 450000.00, '2025-11-05 07:19:02', '2026-06-17 17:19:02', 'Matías Torres', 'Calle Diagonal 80', '1856', 'La Plata - Gonnet', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (224, 16, '2024-06-06 04:19:02', 'confirmado', 310000.00, '2024-06-06 04:19:02', '2026-06-17 17:19:02', 'Valentina Rodríguez', 'Calle Avenida 44', '1089', 'La Plata - Ensenada', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (225, 73, '2025-12-13 07:19:02', 'confirmado', 1210000.00, '2025-12-13 07:19:02', '2026-06-17 17:19:02', 'Valentina Rodríguez', 'Calle 72', '707', 'La Plata - Ensenada', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (226, 19, '2023-10-10 08:19:02', 'confirmado', 270000.00, '2023-10-10 08:19:02', '2026-06-17 17:19:02', 'Sofía Romero', 'Calle 1', '1181', 'La Plata - Los Hornos', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (227, 38, '2024-12-18 17:19:02', 'confirmado', 1040000.00, '2024-12-18 17:19:02', '2026-06-17 17:19:02', 'Nicolás Pérez', 'Calle 32', '869', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (228, 13, '2025-12-25 15:19:02', 'confirmado', 1380000.00, '2025-12-25 15:19:02', '2026-06-17 17:19:02', 'Agustina Martínez', 'Calle 10', '1790', 'La Plata - Centro', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (229, 11, '2024-09-28 16:19:02', 'confirmado', 420000.00, '2024-09-28 16:19:02', '2026-06-17 17:19:02', 'Lucía Acosta', 'Calle 7', '125', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (230, 65, '2025-07-06 21:19:02', 'confirmado', 720000.00, '2025-07-06 21:19:02', '2026-06-17 17:19:02', 'Facundo Ruiz', 'Calle 84', '588', 'La Plata - Berisso', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (231, 96, '2025-05-08 21:19:02', 'confirmado', 175000.00, '2025-05-08 21:19:02', '2026-06-17 17:19:02', 'Martín Fernández', 'Calle Avenida 44', '2068', 'La Plata - Villa Elisa', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (232, 98, '2025-02-05 13:19:02', 'confirmado', 160000.00, '2025-02-05 13:19:02', '2026-06-17 17:19:02', 'Gonzalo Sánchez', 'Calle 3', '1757', 'La Plata - Villa Elisa', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (233, 18, '2025-10-10 14:19:02', 'confirmado', 1020000.00, '2025-10-10 14:19:02', '2026-06-17 17:19:02', 'Tomás Álvarez', 'Calle 3', '2131', 'La Plata - Villa Elvira', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (234, 31, '2025-11-13 14:19:02', 'confirmado', 1040000.00, '2025-11-13 14:19:02', '2026-06-17 17:19:02', 'Facundo Ruiz', 'Calle 63', '2244', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (235, 43, '2025-12-29 04:19:02', 'confirmado', 1095000.00, '2025-12-29 04:19:02', '2026-06-17 17:19:02', 'Tomás Álvarez', 'Calle 84', '247', 'La Plata - Villa Elvira', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (236, 33, '2023-11-27 00:19:02', 'confirmado', 690000.00, '2023-11-27 00:19:02', '2026-06-17 17:19:02', 'Natalia Moreno', 'Calle 137', '2640', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (237, 100, '2023-10-24 18:19:02', 'confirmado', 720000.00, '2023-10-24 18:19:02', '2026-06-17 17:19:02', 'Matías Torres', 'Calle 38', '330', 'La Plata - Ringuelet', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (238, 37, '2023-08-01 12:19:02', 'confirmado', 910000.00, '2023-08-01 12:19:02', '2026-06-17 17:19:02', 'Diego Jiménez', 'Calle Diagonal 79', '529', 'La Plata - Ringuelet', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (239, 60, '2025-08-15 16:19:02', 'confirmado', 1730000.00, '2025-08-15 16:19:02', '2026-06-17 17:19:02', 'Martín Fernández', 'Calle 76', '923', 'La Plata - Ringuelet', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (240, 87, '2024-12-21 04:19:02', 'confirmado', 1035000.00, '2024-12-21 04:19:02', '2026-06-17 17:19:02', 'Nicolás Pérez', 'Calle Avenida 66', '1227', 'La Plata - Berisso', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (241, 14, '2023-07-07 09:19:02', 'confirmado', 1620000.00, '2023-07-07 09:19:02', '2026-06-17 17:19:02', 'Gonzalo Sánchez', 'Calle 76', '282', 'La Plata - Villa Elisa', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (242, 15, '2026-02-27 14:19:02', 'confirmado', 1280000.00, '2026-02-27 14:19:02', '2026-06-17 17:19:02', 'Lucía Acosta', 'Calle 11', '2102', 'La Plata - Villa Elisa', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (243, 14, '2025-01-11 12:19:02', 'confirmado', 1155000.00, '2025-01-11 12:19:02', '2026-06-17 17:19:02', 'Paula Vargas', 'Calle 51', '2726', 'La Plata - Los Hornos', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (244, 97, '2026-01-17 03:19:02', 'confirmado', 1050000.00, '2026-01-17 03:19:02', '2026-06-17 17:19:02', 'Leandro Ortiz', 'Calle 60', '921', 'La Plata - Ringuelet', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (245, 63, '2023-10-04 09:19:02', 'confirmado', 410000.00, '2023-10-04 09:19:02', '2026-06-17 17:19:02', 'Florencia Díaz', 'Calle 3', '1848', 'La Plata - Berisso', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (246, 95, '2024-11-04 03:19:02', 'confirmado', 1110000.00, '2024-11-04 03:19:02', '2026-06-17 17:19:02', 'Matías Torres', 'Calle 13', '889', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (247, 32, '2024-05-27 05:19:02', 'confirmado', 810000.00, '2024-05-27 05:19:02', '2026-06-17 17:19:02', 'Julieta Castro', 'Calle 12', '672', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (248, 95, '2025-02-08 22:19:02', 'confirmado', 1100000.00, '2025-02-08 22:19:02', '2026-06-17 17:19:02', 'Gonzalo Sánchez', 'Calle 122', '1075', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (249, 50, '2024-11-27 19:19:02', 'confirmado', 615000.00, '2024-11-27 19:19:02', '2026-06-17 17:19:02', 'Tomás Álvarez', 'Calle Avenida 66', '1089', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (250, 67, '2026-06-03 06:19:02', 'confirmado', 1850000.00, '2026-06-03 06:19:02', '2026-06-17 17:19:02', 'Natalia Moreno', 'Calle 57', '970', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (251, 89, '2025-08-04 02:19:02', 'confirmado', 2340000.00, '2025-08-04 02:19:02', '2026-06-17 17:19:02', 'Facundo Ruiz', 'Calle 9', '1214', 'La Plata - Abasto', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (252, 7, '2025-06-08 05:19:02', 'confirmado', 420000.00, '2025-06-08 05:19:02', '2026-06-17 17:19:02', 'Sebastián Herrera', 'Calle Avenida 7', '2596', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (253, 8, '2024-02-16 16:19:02', 'confirmado', 1540000.00, '2024-02-16 16:19:02', '2026-06-17 17:19:02', 'Agustina Martínez', 'Calle 2', '188', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (254, 65, '2024-12-13 04:19:02', 'confirmado', 1130000.00, '2024-12-13 04:19:02', '2026-06-17 17:19:02', 'Natalia Moreno', 'Calle 10', '751', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (255, 48, '2024-05-02 15:19:02', 'confirmado', 1605000.00, '2024-05-02 15:19:02', '2026-06-17 17:19:02', 'Agustina Martínez', 'Calle 63', '1440', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (256, 40, '2023-11-12 15:19:02', 'confirmado', 615000.00, '2023-11-12 15:19:02', '2026-06-17 17:19:02', 'Facundo Ruiz', 'Calle 8', '2929', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (257, 59, '2025-06-14 23:19:02', 'confirmado', 2130000.00, '2025-06-14 23:19:02', '2026-06-17 17:19:02', 'Gonzalo Sánchez', 'Calle 66', '115', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (258, 72, '2024-04-19 03:19:02', 'confirmado', 1215000.00, '2024-04-19 03:19:02', '2026-06-17 17:19:02', 'Julieta Castro', 'Calle 9', '561', 'La Plata - Abasto', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (259, 42, '2025-10-22 06:19:02', 'confirmado', 1600000.00, '2025-10-22 06:19:02', '2026-06-17 17:19:02', 'Matías Torres', 'Calle Diagonal 74', '711', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (260, 66, '2026-05-02 10:19:02', 'confirmado', 1470000.00, '2026-05-02 10:19:02', '2026-06-17 17:19:02', 'Valentina Rodríguez', 'Calle 51', '103', 'La Plata - Gonnet', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (261, 62, '2025-01-11 21:19:02', 'confirmado', 1255000.00, '2025-01-11 21:19:02', '2026-06-17 17:19:02', 'Sofía Romero', 'Calle 44', '2505', 'La Plata - Ensenada', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (262, 38, '2025-04-29 14:19:02', 'confirmado', 735000.00, '2025-04-29 14:19:02', '2026-06-17 17:19:02', 'Matías Torres', 'Calle Diagonal 79', '1556', 'La Plata - Abasto', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (263, 3, '2024-12-10 18:19:02', 'confirmado', 695000.00, '2024-12-10 18:19:02', '2026-06-17 17:19:02', 'Facundo Ruiz', 'Calle 9', '357', 'La Plata - Villa Elvira', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (264, 54, '2023-10-07 00:19:02', 'confirmado', 500000.00, '2023-10-07 00:19:02', '2026-06-17 17:19:02', 'Camila López', 'Calle 10', '200', 'La Plata - Villa Elvira', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (265, 11, '2024-09-19 22:19:02', 'confirmado', 1050000.00, '2024-09-19 22:19:02', '2026-06-17 17:19:02', 'Paula Vargas', 'Calle Avenida 44', '2688', 'La Plata - Abasto', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (266, 77, '2023-11-08 15:19:02', 'confirmado', 650000.00, '2023-11-08 15:19:02', '2026-06-17 17:19:02', 'Sebastián Herrera', 'Calle 4', '478', 'La Plata - Villa Elisa', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (267, 7, '2025-08-25 03:19:02', 'confirmado', 890000.00, '2025-08-25 03:19:02', '2026-06-17 17:19:02', 'Paula Vargas', 'Calle 10', '806', 'La Plata - Ringuelet', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (268, 66, '2024-10-23 06:19:02', 'confirmado', 2110000.00, '2024-10-23 06:19:02', '2026-06-17 17:19:02', 'Nicolás Pérez', 'Calle 2', '2045', 'La Plata - Villa Elisa', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (269, 54, '2024-04-24 13:19:02', 'confirmado', 1010000.00, '2024-04-24 13:19:02', '2026-06-17 17:19:02', 'Diego Jiménez', 'Calle 1', '2184', 'La Plata - Ensenada', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (270, 70, '2024-05-10 20:19:02', 'confirmado', 1530000.00, '2024-05-10 20:19:02', '2026-06-17 17:19:02', 'Florencia Díaz', 'Calle 137', '1022', 'La Plata - Melchor Romero', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (271, 20, '2025-12-21 04:19:02', 'confirmado', 1220000.00, '2025-12-21 04:19:02', '2026-06-17 17:19:02', 'Sofía Romero', 'Calle 8', '2565', 'La Plata - Melchor Romero', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (272, 96, '2024-11-01 04:19:02', 'confirmado', 1400000.00, '2024-11-01 04:19:02', '2026-06-17 17:19:02', 'Paula Vargas', 'Calle 5', '1201', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (273, 3, '2024-11-11 03:19:02', 'confirmado', 630000.00, '2024-11-11 03:19:02', '2026-06-17 17:19:02', 'Martín Fernández', 'Calle Avenida 7', '1644', 'La Plata - City Bell', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (274, 37, '2025-07-20 19:19:02', 'confirmado', 585000.00, '2025-07-20 19:19:02', '2026-06-17 17:19:02', 'Julieta Castro', 'Calle 63', '252', 'La Plata - Gonnet', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (275, 52, '2026-03-03 16:19:02', 'confirmado', 240000.00, '2026-03-03 16:19:02', '2026-06-17 17:19:02', 'Florencia Díaz', 'Calle Avenida 7', '1236', 'La Plata - Berisso', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (276, 91, '2025-09-22 18:19:02', 'confirmado', 1905000.00, '2025-09-22 18:19:02', '2026-06-17 17:19:02', 'Tomás Álvarez', 'Calle 38', '274', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (277, 26, '2026-01-16 11:19:02', 'confirmado', 1295000.00, '2026-01-16 11:19:02', '2026-06-17 17:19:02', 'Federico García', 'Calle 6', '297', 'La Plata - Ensenada', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (278, 66, '2025-09-08 06:19:02', 'confirmado', 1815000.00, '2025-09-08 06:19:02', '2026-06-17 17:19:02', 'Facundo Ruiz', 'Calle 2', '318', 'La Plata - Villa Elvira', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (279, 49, '2024-09-26 04:19:02', 'confirmado', 1570000.00, '2024-09-26 04:19:02', '2026-06-17 17:19:02', 'Leandro Ortiz', 'Calle Avenida 66', '2593', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (280, 63, '2023-07-22 13:19:02', 'confirmado', 465000.00, '2023-07-22 13:19:02', '2026-06-17 17:19:02', 'Martín Fernández', 'Calle Avenida 44', '647', 'La Plata - Ensenada', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (281, 80, '2024-03-07 00:19:02', 'confirmado', 1140000.00, '2024-03-07 00:19:02', '2026-06-17 17:19:02', 'Nicolás Pérez', 'Calle 14', '1385', 'La Plata - Villa Elisa', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (282, 13, '2024-06-02 00:19:02', 'confirmado', 2610000.00, '2024-06-02 00:19:02', '2026-06-17 17:19:02', 'Valentina Rodríguez', 'Calle 7', '2900', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (283, 35, '2024-01-05 10:19:02', 'confirmado', 1070000.00, '2024-01-05 10:19:02', '2026-06-17 17:19:02', 'Matías Torres', 'Calle 12', '1963', 'La Plata - Tolosa', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (284, 87, '2025-01-05 05:19:02', 'confirmado', 1080000.00, '2025-01-05 05:19:02', '2026-06-17 17:19:02', 'Gonzalo Sánchez', 'Calle Diagonal 73', '2917', 'La Plata - Gonnet', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (285, 18, '2026-02-10 13:19:02', 'confirmado', 780000.00, '2026-02-10 13:19:02', '2026-06-17 17:19:02', 'Martín Fernández', 'Calle 51', '2719', 'La Plata - Ringuelet', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (286, 20, '2024-09-18 02:19:02', 'confirmado', 920000.00, '2024-09-18 02:19:02', '2026-06-17 17:19:02', 'Paula Vargas', 'Calle 76', '2281', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (287, 63, '2023-12-27 23:19:02', 'confirmado', 1850000.00, '2023-12-27 23:19:02', '2026-06-17 17:19:02', 'Martín Fernández', 'Calle Avenida 7', '2240', 'La Plata - City Bell', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (288, 65, '2026-03-11 01:19:02', 'confirmado', 420000.00, '2026-03-11 01:19:02', '2026-06-17 17:19:02', 'Leandro Ortiz', 'Calle 9', '559', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (289, 92, '2025-05-11 23:19:02', 'confirmado', 585000.00, '2025-05-11 23:19:02', '2026-06-17 17:19:02', 'Diego Jiménez', 'Calle Avenida 32', '762', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (290, 32, '2026-03-27 08:19:02', 'confirmado', 1740000.00, '2026-03-27 08:19:02', '2026-06-17 17:19:02', 'Gonzalo Sánchez', 'Calle 32', '1699', 'La Plata - City Bell', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (291, 24, '2024-04-01 16:19:02', 'confirmado', 1360000.00, '2024-04-01 16:19:02', '2026-06-17 17:19:02', 'Valentina Rodríguez', 'Calle 11', '1839', 'La Plata - Villa Elisa', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (292, 60, '2025-09-10 18:19:02', 'confirmado', 580000.00, '2025-09-10 18:19:02', '2026-06-17 17:19:02', 'Natalia Moreno', 'Calle Diagonal 74', '429', 'La Plata - Abasto', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (293, 60, '2026-06-11 03:19:02', 'confirmado', 980000.00, '2026-06-11 03:19:02', '2026-06-17 17:19:02', 'Tomás Álvarez', 'Calle 9', '1324', 'La Plata - Abasto', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (294, 61, '2026-02-21 18:19:02', 'confirmado', 1520000.00, '2026-02-21 18:19:02', '2026-06-17 17:19:02', 'Julieta Castro', 'Calle 12', '2824', 'La Plata - Villa Elvira', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (295, 70, '2025-09-07 13:19:02', 'confirmado', 2550000.00, '2025-09-07 13:19:02', '2026-06-17 17:19:02', 'Paula Vargas', 'Calle 38', '2793', 'La Plata - Melchor Romero', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (296, 80, '2023-06-23 21:19:02', 'confirmado', 350000.00, '2023-06-23 21:19:02', '2026-06-17 17:19:02', 'Julieta Castro', 'Calle 63', '2755', 'La Plata - Ringuelet', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (297, 94, '2023-10-04 15:19:02', 'confirmado', 290000.00, '2023-10-04 15:19:02', '2026-06-17 17:19:02', 'Matías Torres', 'Calle 7', '650', 'La Plata - Melchor Romero', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (298, 36, '2025-07-08 10:19:02', 'confirmado', 310000.00, '2025-07-08 10:19:02', '2026-06-17 17:19:02', 'Natalia Moreno', 'Calle 11', '1270', 'La Plata - Abasto', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (299, 84, '2026-01-12 00:19:02', 'confirmado', 750000.00, '2026-01-12 00:19:02', '2026-06-17 17:19:02', 'Matías Torres', 'Calle Diagonal 73', '1887', 'La Plata - Centro', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (300, 76, '2025-08-09 14:19:02', 'confirmado', 700000.00, '2025-08-09 14:19:02', '2026-06-17 17:19:02', 'Martín Fernández', 'Calle 12', '2770', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (301, 83, '2025-03-13 02:19:02', 'confirmado', 760000.00, '2025-03-13 02:19:02', '2026-06-17 17:19:02', 'Martín Fernández', 'Calle Avenida 44', '772', 'La Plata - Centro', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (302, 94, '2025-07-24 21:19:02', 'confirmado', 870000.00, '2025-07-24 21:19:02', '2026-06-17 17:19:02', 'Diego Jiménez', 'Calle 5', '1850', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (303, 71, '2023-11-19 09:19:02', 'confirmado', 195000.00, '2023-11-19 09:19:02', '2026-06-17 17:19:02', 'Micaela Gutiérrez', 'Calle 13', '1202', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (304, 73, '2024-10-09 20:19:02', 'confirmado', 160000.00, '2024-10-09 20:19:02', '2026-06-17 17:19:02', 'Sofía Romero', 'Calle 81', '2444', 'La Plata - Los Hornos', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (305, 70, '2024-01-14 13:19:02', 'confirmado', 300000.00, '2024-01-14 13:19:02', '2026-06-17 17:19:02', 'Camila López', 'Calle Avenida 66', '2085', 'La Plata - Ringuelet', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (306, 16, '2026-02-20 22:19:02', 'confirmado', 940000.00, '2026-02-20 22:19:02', '2026-06-17 17:19:02', 'Sebastián Herrera', 'Calle 8', '546', 'La Plata - Villa Elisa', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (307, 89, '2023-12-05 06:19:02', 'confirmado', 525000.00, '2023-12-05 06:19:02', '2026-06-17 17:19:02', 'Julieta Castro', 'Calle 13', '757', 'La Plata - Melchor Romero', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (308, 42, '2024-05-02 18:19:02', 'confirmado', 1275000.00, '2024-05-02 18:19:02', '2026-06-17 17:19:02', 'Nicolás Pérez', 'Calle 10', '2735', 'La Plata - Tolosa', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (309, 4, '2024-02-23 19:19:02', 'confirmado', 470000.00, '2024-02-23 19:19:02', '2026-06-17 17:19:02', 'Micaela Gutiérrez', 'Calle 44', '1536', 'La Plata - Los Hornos', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (310, 91, '2023-09-01 02:19:02', 'confirmado', 2115000.00, '2023-09-01 02:19:02', '2026-06-17 17:19:02', 'Camila López', 'Calle 122', '378', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (311, 82, '2025-02-01 12:19:02', 'confirmado', 350000.00, '2025-02-01 12:19:02', '2026-06-17 17:19:02', 'Natalia Moreno', 'Calle 116', '164', 'La Plata - City Bell', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (312, 52, '2025-08-31 02:19:02', 'confirmado', 1180000.00, '2025-08-31 02:19:02', '2026-06-17 17:19:02', 'Agustina Martínez', 'Calle Diagonal 79', '2988', 'La Plata - Melchor Romero', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (313, 20, '2025-12-05 14:19:02', 'confirmado', 1580000.00, '2025-12-05 14:19:02', '2026-06-17 17:19:02', 'Florencia Díaz', 'Calle 38', '1195', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (314, 12, '2025-01-26 09:19:02', 'confirmado', 1125000.00, '2025-01-26 09:19:02', '2026-06-17 17:19:02', 'Matías Torres', 'Calle Diagonal 74', '627', 'La Plata - Villa Elisa', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (315, 47, '2024-03-29 09:19:02', 'confirmado', 1190000.00, '2024-03-29 09:19:02', '2026-06-17 17:19:02', 'Federico García', 'Calle 2', '1752', 'La Plata - Berisso', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (316, 82, '2025-09-28 22:19:02', 'confirmado', 500000.00, '2025-09-28 22:19:02', '2026-06-17 17:19:02', 'Micaela Gutiérrez', 'Calle 5', '2129', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (317, 27, '2023-12-02 13:19:02', 'confirmado', 1765000.00, '2023-12-02 13:19:02', '2026-06-17 17:19:02', 'Federico García', 'Calle 84', '814', 'La Plata - Melchor Romero', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (318, 23, '2024-11-26 03:19:02', 'confirmado', 1420000.00, '2024-11-26 03:19:02', '2026-06-17 17:19:02', 'Florencia Díaz', 'Calle 1', '580', 'La Plata - Villa Elisa', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (319, 86, '2024-06-05 19:19:02', 'confirmado', 955000.00, '2024-06-05 19:19:02', '2026-06-17 17:19:02', 'Micaela Gutiérrez', 'Calle 7', '588', 'La Plata - Gonnet', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (320, 79, '2024-06-09 07:19:02', 'confirmado', 1110000.00, '2024-06-09 07:19:02', '2026-06-17 17:19:02', 'Micaela Gutiérrez', 'Calle 3', '1196', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (321, 60, '2025-07-20 11:19:02', 'confirmado', 1260000.00, '2025-07-20 11:19:02', '2026-06-17 17:19:02', 'Sofía Romero', 'Calle Diagonal 80', '1123', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (322, 75, '2024-01-15 11:19:02', 'confirmado', 860000.00, '2024-01-15 11:19:02', '2026-06-17 17:19:02', 'Camila López', 'Calle 9', '2705', 'La Plata - Berisso', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (323, 63, '2025-06-22 18:19:02', 'confirmado', 1290000.00, '2025-06-22 18:19:02', '2026-06-17 17:19:02', 'Florencia Díaz', 'Calle 12', '1636', 'La Plata - Melchor Romero', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (324, 37, '2024-06-02 01:19:02', 'confirmado', 1420000.00, '2024-06-02 01:19:02', '2026-06-17 17:19:02', 'Leandro Ortiz', 'Calle 6', '2512', 'La Plata - City Bell', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (325, 41, '2023-08-20 06:19:02', 'confirmado', 1030000.00, '2023-08-20 06:19:02', '2026-06-17 17:19:02', 'Tomás Álvarez', 'Calle Diagonal 73', '272', 'La Plata - Abasto', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (326, 11, '2024-03-26 23:19:02', 'confirmado', 190000.00, '2024-03-26 23:19:02', '2026-06-17 17:19:02', 'Matías Torres', 'Calle 1', '1861', 'La Plata - Abasto', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (327, 97, '2024-11-13 22:19:02', 'confirmado', 1095000.00, '2024-11-13 22:19:02', '2026-06-17 17:19:02', 'Matías Torres', 'Calle 81', '2070', 'La Plata - Los Hornos', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (328, 63, '2025-08-27 17:19:02', 'confirmado', 1820000.00, '2025-08-27 17:19:02', '2026-06-17 17:19:02', 'Valentina Rodríguez', 'Calle 63', '156', 'La Plata - City Bell', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (329, 58, '2023-11-28 20:19:02', 'confirmado', 550000.00, '2023-11-28 20:19:02', '2026-06-17 17:19:02', 'Natalia Moreno', 'Calle 9', '643', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (330, 37, '2024-01-08 19:19:02', 'confirmado', 380000.00, '2024-01-08 19:19:02', '2026-06-17 17:19:02', 'Gonzalo Sánchez', 'Calle Diagonal 74', '1324', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (331, 6, '2025-11-19 09:19:02', 'confirmado', 905000.00, '2025-11-19 09:19:02', '2026-06-17 17:19:02', 'Agustina Martínez', 'Calle 137', '1219', 'La Plata - Ringuelet', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (332, 31, '2024-12-08 21:19:02', 'confirmado', 1235000.00, '2024-12-08 21:19:02', '2026-06-17 17:19:02', 'Micaela Gutiérrez', 'Calle 5', '1052', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (333, 54, '2024-01-08 04:19:02', 'confirmado', 1515000.00, '2024-01-08 04:19:02', '2026-06-17 17:19:02', 'Federico García', 'Calle 76', '665', 'La Plata - Ringuelet', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (334, 67, '2023-09-19 14:19:02', 'confirmado', 2110000.00, '2023-09-19 14:19:02', '2026-06-17 17:19:02', 'Julieta Castro', 'Calle Diagonal 74', '2901', 'La Plata - Villa Elvira', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (335, 83, '2024-09-02 02:19:02', 'confirmado', 1750000.00, '2024-09-02 02:19:02', '2026-06-17 17:19:03', 'Facundo Ruiz', 'Calle 38', '1610', 'La Plata - Melchor Romero', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (336, 54, '2025-09-04 01:19:03', 'confirmado', 1285000.00, '2025-09-04 01:19:03', '2026-06-17 17:19:03', 'Natalia Moreno', 'Calle 137', '357', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (337, 16, '2024-08-26 18:19:03', 'confirmado', 1790000.00, '2024-08-26 18:19:03', '2026-06-17 17:19:03', 'Florencia Díaz', 'Calle Avenida 32', '2238', 'La Plata - Villa Elisa', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (338, 27, '2025-03-02 14:19:03', 'confirmado', 730000.00, '2025-03-02 14:19:03', '2026-06-17 17:19:03', 'Nicolás Pérez', 'Calle Avenida 32', '2786', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (339, 41, '2025-02-04 03:19:03', 'confirmado', 965000.00, '2025-02-04 03:19:03', '2026-06-17 17:19:03', 'Sofía Romero', 'Calle 76', '938', 'La Plata - Villa Elvira', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (340, 86, '2025-06-15 00:19:03', 'confirmado', 370000.00, '2025-06-15 00:19:03', '2026-06-17 17:19:03', 'Valentina Rodríguez', 'Calle 4', '1903', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (341, 98, '2024-06-30 18:19:03', 'confirmado', 800000.00, '2024-06-30 18:19:03', '2026-06-17 17:19:03', 'Leandro Ortiz', 'Calle 57', '2640', 'La Plata - Villa Elisa', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (342, 11, '2026-03-27 21:19:03', 'confirmado', 1380000.00, '2026-03-27 21:19:03', '2026-06-17 17:19:03', 'Julieta Castro', 'Calle 38', '2256', 'La Plata - Tolosa', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (343, 60, '2024-06-28 07:19:03', 'confirmado', 480000.00, '2024-06-28 07:19:03', '2026-06-17 17:19:03', 'Tomás Álvarez', 'Calle Avenida 44', '2457', 'La Plata - Tolosa', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (344, 13, '2025-08-13 03:19:03', 'confirmado', 2430000.00, '2025-08-13 03:19:03', '2026-06-17 17:19:03', 'Diego Jiménez', 'Calle 51', '386', 'La Plata - Tolosa', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (345, 85, '2025-10-29 05:19:03', 'confirmado', 1150000.00, '2025-10-29 05:19:03', '2026-06-17 17:19:03', 'Julieta Castro', 'Calle Avenida 7', '2040', 'La Plata - Tolosa', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (346, 54, '2026-04-01 08:19:03', 'confirmado', 760000.00, '2026-04-01 08:19:03', '2026-06-17 17:19:03', 'Florencia Díaz', 'Calle Diagonal 73', '882', 'La Plata - Abasto', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (347, 57, '2025-10-06 11:19:03', 'confirmado', 1810000.00, '2025-10-06 11:19:03', '2026-06-17 17:19:03', 'Camila López', 'Calle Diagonal 79', '671', 'La Plata - Villa Elvira', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (348, 53, '2024-06-25 02:19:03', 'confirmado', 1510000.00, '2024-06-25 02:19:03', '2026-06-17 17:19:03', 'Paula Vargas', 'Calle 76', '2673', 'La Plata - Tolosa', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (349, 75, '2025-09-01 18:19:03', 'confirmado', 690000.00, '2025-09-01 18:19:03', '2026-06-17 17:19:03', 'Lucía Acosta', 'Calle 66', '1028', 'La Plata - Abasto', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (350, 100, '2026-04-19 23:19:03', 'confirmado', 630000.00, '2026-04-19 23:19:03', '2026-06-17 17:19:03', 'Agustina Martínez', 'Calle Avenida 32', '1340', 'La Plata - City Bell', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (351, 35, '2023-09-21 23:19:03', 'confirmado', 2050000.00, '2023-09-21 23:19:03', '2026-06-17 17:19:03', 'Camila López', 'Calle 60', '2519', 'La Plata - Villa Elvira', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (352, 38, '2025-06-23 10:19:03', 'confirmado', 720000.00, '2025-06-23 10:19:03', '2026-06-17 17:19:03', 'Lucía Acosta', 'Calle 66', '1488', 'La Plata - Melchor Romero', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (353, 3, '2025-03-12 18:19:03', 'confirmado', 1120000.00, '2025-03-12 18:19:03', '2026-06-17 17:19:03', 'Valentina Rodríguez', 'Calle Diagonal 73', '1492', 'La Plata - Los Hornos', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (354, 24, '2024-08-22 11:19:03', 'confirmado', 800000.00, '2024-08-22 11:19:03', '2026-06-17 17:19:03', 'Paula Vargas', 'Calle 38', '524', 'La Plata - City Bell', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (355, 17, '2025-02-18 13:19:03', 'confirmado', 630000.00, '2025-02-18 13:19:03', '2026-06-17 17:19:03', 'Lucía Acosta', 'Calle 44', '1877', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (356, 23, '2023-09-05 21:19:03', 'confirmado', 1320000.00, '2023-09-05 21:19:03', '2026-06-17 17:19:03', 'Agustina Martínez', 'Calle 51', '2272', 'La Plata - Ensenada', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (357, 65, '2023-12-25 20:19:03', 'confirmado', 450000.00, '2023-12-25 20:19:03', '2026-06-17 17:19:03', 'Micaela Gutiérrez', 'Calle Diagonal 80', '2335', 'La Plata - City Bell', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (358, 89, '2023-06-27 15:19:03', 'confirmado', 650000.00, '2023-06-27 15:19:03', '2026-06-17 17:19:03', 'Martín Fernández', 'Calle 5', '957', 'La Plata - Abasto', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (359, 29, '2025-01-01 16:19:03', 'confirmado', 1020000.00, '2025-01-01 16:19:03', '2026-06-17 17:19:03', 'Federico García', 'Calle 2', '233', 'La Plata - Ensenada', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (360, 76, '2024-06-17 07:19:03', 'confirmado', 2110000.00, '2024-06-17 07:19:03', '2026-06-17 17:19:03', 'Lucía Acosta', 'Calle Diagonal 79', '652', 'La Plata - Centro', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (361, 82, '2024-05-23 09:19:03', 'confirmado', 1440000.00, '2024-05-23 09:19:03', '2026-06-17 17:19:03', 'Federico García', 'Calle 38', '2898', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (362, 40, '2026-03-23 08:19:03', 'confirmado', 360000.00, '2026-03-23 08:19:03', '2026-06-17 17:19:03', 'Micaela Gutiérrez', 'Calle 57', '1012', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (363, 101, '2025-02-18 20:19:03', 'confirmado', 1800000.00, '2025-02-18 20:19:03', '2026-06-17 17:19:03', 'Facundo Ruiz', 'Calle 13', '717', 'La Plata - Ensenada', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (364, 86, '2025-12-18 21:19:03', 'confirmado', 1060000.00, '2025-12-18 21:19:03', '2026-06-17 17:19:03', 'Paula Vargas', 'Calle 12', '1555', 'La Plata - Villa Elvira', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (365, 67, '2024-05-29 07:19:03', 'confirmado', 540000.00, '2024-05-29 07:19:03', '2026-06-17 17:19:03', 'Martín Fernández', 'Calle 4', '2549', 'La Plata - Villa Elvira', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (366, 83, '2023-10-01 15:19:03', 'confirmado', 985000.00, '2023-10-01 15:19:03', '2026-06-17 17:19:03', 'Federico García', 'Calle Avenida 7', '2290', 'La Plata - City Bell', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (367, 14, '2023-10-29 11:19:03', 'confirmado', 1595000.00, '2023-10-29 11:19:03', '2026-06-17 17:19:03', 'Nicolás Pérez', 'Calle 13', '804', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (368, 6, '2026-02-19 19:19:03', 'confirmado', 590000.00, '2026-02-19 19:19:03', '2026-06-17 17:19:03', 'Matías Torres', 'Calle Avenida 32', '2037', 'La Plata - City Bell', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (369, 95, '2023-10-18 17:19:03', 'confirmado', 950000.00, '2023-10-18 17:19:03', '2026-06-17 17:19:03', 'Camila López', 'Calle 72', '2921', 'La Plata - Villa Elvira', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (370, 2, '2025-04-08 01:19:03', 'confirmado', 410000.00, '2025-04-08 01:19:03', '2026-06-17 17:19:03', 'Valentina Rodríguez', 'Calle 7', '2671', 'La Plata - Tolosa', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (371, 45, '2024-02-06 12:19:03', 'confirmado', 600000.00, '2024-02-06 12:19:03', '2026-06-17 17:19:03', 'Nicolás Pérez', 'Calle 44', '1680', 'La Plata - Tolosa', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (372, 17, '2024-04-29 03:19:03', 'confirmado', 2000000.00, '2024-04-29 03:19:03', '2026-06-17 17:19:03', 'Camila López', 'Calle 122', '1655', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (373, 74, '2025-07-17 18:19:03', 'confirmado', 615000.00, '2025-07-17 18:19:03', '2026-06-17 17:19:03', 'Paula Vargas', 'Calle 90', '655', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (374, 40, '2026-02-26 04:19:03', 'confirmado', 1350000.00, '2026-02-26 04:19:03', '2026-06-17 17:19:03', 'Camila López', 'Calle 76', '2716', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (375, 74, '2025-09-07 23:19:03', 'confirmado', 2010000.00, '2025-09-07 23:19:03', '2026-06-17 17:19:03', 'Matías Torres', 'Calle 38', '2458', 'La Plata - Tolosa', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (376, 29, '2023-11-23 15:19:03', 'confirmado', 1420000.00, '2023-11-23 15:19:03', '2026-06-17 17:19:03', 'Sebastián Herrera', 'Calle 38', '2598', 'La Plata - Villa Elisa', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (377, 55, '2025-04-15 13:19:03', 'confirmado', 210000.00, '2025-04-15 13:19:03', '2026-06-17 17:19:03', 'Paula Vargas', 'Calle 2', '2587', 'La Plata - Villa Elisa', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (378, 65, '2025-12-25 21:19:03', 'confirmado', 1940000.00, '2025-12-25 21:19:03', '2026-06-17 17:19:03', 'Agustina Martínez', 'Calle 2', '1436', 'La Plata - Ringuelet', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (379, 78, '2024-11-20 22:19:03', 'confirmado', 905000.00, '2024-11-20 22:19:03', '2026-06-17 17:19:03', 'Sebastián Herrera', 'Calle 11', '2717', 'La Plata - Ringuelet', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (380, 93, '2024-06-24 06:19:03', 'confirmado', 310000.00, '2024-06-24 06:19:03', '2026-06-17 17:19:03', 'Diego Jiménez', 'Calle Diagonal 80', '198', 'La Plata - Villa Elisa', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (381, 97, '2025-04-05 08:19:03', 'confirmado', 2160000.00, '2025-04-05 08:19:03', '2026-06-17 17:19:03', 'Agustina Martínez', 'Calle Diagonal 73', '1688', 'La Plata - Ensenada', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (382, 46, '2023-12-26 23:19:03', 'confirmado', 1395000.00, '2023-12-26 23:19:03', '2026-06-17 17:19:03', 'Natalia Moreno', 'Calle 12', '2408', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (383, 35, '2025-12-07 12:19:03', 'confirmado', 930000.00, '2025-12-07 12:19:03', '2026-06-17 17:19:03', 'Federico García', 'Calle 6', '590', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (384, 90, '2025-09-28 00:19:03', 'confirmado', 660000.00, '2025-09-28 00:19:03', '2026-06-17 17:19:03', 'Paula Vargas', 'Calle 122', '562', 'La Plata - Melchor Romero', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (385, 98, '2025-02-16 13:19:03', 'confirmado', 1490000.00, '2025-02-16 13:19:03', '2026-06-17 17:19:03', 'Sofía Romero', 'Calle 44', '1337', 'La Plata - Berisso', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (386, 100, '2024-06-08 21:19:03', 'confirmado', 880000.00, '2024-06-08 21:19:03', '2026-06-17 17:19:03', 'Paula Vargas', 'Calle Avenida 44', '851', 'La Plata - Los Hornos', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (387, 5, '2023-11-23 21:19:03', 'confirmado', 590000.00, '2023-11-23 21:19:03', '2026-06-17 17:19:03', 'Diego Jiménez', 'Calle 76', '2668', 'La Plata - City Bell', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (388, 41, '2023-12-25 09:19:03', 'confirmado', 500000.00, '2023-12-25 09:19:03', '2026-06-17 17:19:03', 'Gonzalo Sánchez', 'Calle 66', '839', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (389, 96, '2026-03-30 03:19:03', 'confirmado', 1010000.00, '2026-03-30 03:19:03', '2026-06-17 17:19:03', 'Diego Jiménez', 'Calle 8', '2383', 'La Plata - Centro', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (390, 31, '2023-11-09 18:19:03', 'confirmado', 1655000.00, '2023-11-09 18:19:03', '2026-06-17 17:19:03', 'Leandro Ortiz', 'Calle 38', '617', 'La Plata - Abasto', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (391, 8, '2025-03-05 15:19:03', 'confirmado', 790000.00, '2025-03-05 15:19:03', '2026-06-17 17:19:03', 'Federico García', 'Calle 76', '781', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (392, 23, '2026-01-07 07:19:03', 'confirmado', 320000.00, '2026-01-07 07:19:03', '2026-06-17 17:19:03', 'Tomás Álvarez', 'Calle 10', '2831', 'La Plata - Centro', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (393, 97, '2024-12-25 05:19:03', 'confirmado', 1040000.00, '2024-12-25 05:19:03', '2026-06-17 17:19:03', 'Martín Fernández', 'Calle 10', '2216', 'La Plata - Tolosa', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (394, 100, '2024-02-23 23:19:03', 'confirmado', 580000.00, '2024-02-23 23:19:03', '2026-06-17 17:19:03', 'Micaela Gutiérrez', 'Calle Avenida 44', '550', 'La Plata - Berisso', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (395, 37, '2024-04-23 06:19:03', 'confirmado', 735000.00, '2024-04-23 06:19:03', '2026-06-17 17:19:03', 'Agustina Martínez', 'Calle 60', '1876', 'La Plata - Tolosa', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (396, 65, '2025-03-04 04:19:03', 'confirmado', 760000.00, '2025-03-04 04:19:03', '2026-06-17 17:19:03', 'Natalia Moreno', 'Calle 63', '376', 'La Plata - Ensenada', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (397, 34, '2023-10-01 11:19:03', 'confirmado', 660000.00, '2023-10-01 11:19:03', '2026-06-17 17:19:03', 'Sofía Romero', 'Calle Diagonal 74', '748', 'La Plata - Melchor Romero', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (398, 50, '2024-01-29 05:19:03', 'confirmado', 1200000.00, '2024-01-29 05:19:03', '2026-06-17 17:19:03', 'Lucía Acosta', 'Calle Avenida 44', '986', 'La Plata - Centro', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (399, 25, '2026-04-24 11:19:03', 'confirmado', 550000.00, '2026-04-24 11:19:03', '2026-06-17 17:19:03', 'Micaela Gutiérrez', 'Calle 8', '1712', 'La Plata - City Bell', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (400, 52, '2025-11-14 15:19:03', 'confirmado', 1105000.00, '2025-11-14 15:19:03', '2026-06-17 17:19:03', 'Agustina Martínez', 'Calle 90', '2552', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (401, 45, '2025-06-15 09:19:03', 'confirmado', 1355000.00, '2025-06-15 09:19:03', '2026-06-17 17:19:03', 'Sebastián Herrera', 'Calle 8', '1030', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (402, 82, '2026-02-24 19:19:03', 'confirmado', 1300000.00, '2026-02-24 19:19:03', '2026-06-17 17:19:03', 'Federico García', 'Calle 81', '2260', 'La Plata - Centro', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (403, 14, '2023-12-18 15:19:03', 'confirmado', 1460000.00, '2023-12-18 15:19:03', '2026-06-17 17:19:03', 'Paula Vargas', 'Calle 9', '1924', 'La Plata - Ensenada', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (404, 34, '2023-08-07 04:19:03', 'confirmado', 1090000.00, '2023-08-07 04:19:03', '2026-06-17 17:19:03', 'Valentina Rodríguez', 'Calle 13', '401', 'La Plata - Tolosa', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (405, 81, '2024-11-21 23:19:03', 'confirmado', 535000.00, '2024-11-21 23:19:03', '2026-06-17 17:19:03', 'Martín Fernández', 'Calle 10', '2476', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (406, 62, '2025-04-08 14:19:03', 'confirmado', 1000000.00, '2025-04-08 14:19:03', '2026-06-17 17:19:03', 'Valentina Rodríguez', 'Calle Avenida 32', '1773', 'La Plata - Ensenada', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (407, 77, '2024-04-17 08:19:03', 'confirmado', 620000.00, '2024-04-17 08:19:03', '2026-06-17 17:19:03', 'Leandro Ortiz', 'Calle 7', '2670', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (408, 52, '2024-10-28 03:19:03', 'confirmado', 1365000.00, '2024-10-28 03:19:03', '2026-06-17 17:19:03', 'Facundo Ruiz', 'Calle 7', '1594', 'La Plata - Gonnet', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (409, 3, '2025-08-18 07:19:03', 'confirmado', 1350000.00, '2025-08-18 07:19:03', '2026-06-17 17:19:03', 'Julieta Castro', 'Calle 90', '1218', 'La Plata - Ringuelet', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (410, 23, '2024-12-28 20:19:03', 'confirmado', 860000.00, '2024-12-28 20:19:03', '2026-06-17 17:19:03', 'Agustina Martínez', 'Calle 66', '334', 'La Plata - Tolosa', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (411, 99, '2025-04-26 20:19:03', 'confirmado', 395000.00, '2025-04-26 20:19:03', '2026-06-17 17:19:03', 'Tomás Álvarez', 'Calle 3', '1896', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (412, 99, '2024-09-08 13:19:03', 'confirmado', 320000.00, '2024-09-08 13:19:03', '2026-06-17 17:19:03', 'Paula Vargas', 'Calle 122', '650', 'La Plata - Los Hornos', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (413, 94, '2025-03-30 12:19:03', 'confirmado', 980000.00, '2025-03-30 12:19:03', '2026-06-17 17:19:03', 'Sebastián Herrera', 'Calle 72', '2103', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (414, 50, '2025-09-02 20:19:03', 'confirmado', 865000.00, '2025-09-02 20:19:03', '2026-06-17 17:19:03', 'Lucía Acosta', 'Calle 57', '2529', 'La Plata - Villa Elvira', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (415, 43, '2023-10-17 17:19:03', 'confirmado', 770000.00, '2023-10-17 17:19:03', '2026-06-17 17:19:03', 'Facundo Ruiz', 'Calle 10', '2392', 'La Plata - Los Hornos', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (416, 62, '2024-08-02 03:19:03', 'confirmado', 895000.00, '2024-08-02 03:19:03', '2026-06-17 17:19:03', 'Nicolás Pérez', 'Calle 84', '2344', 'La Plata - Abasto', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (417, 101, '2025-04-26 13:19:03', 'confirmado', 300000.00, '2025-04-26 13:19:03', '2026-06-17 17:19:03', 'Julieta Castro', 'Calle 51', '384', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (418, 39, '2024-08-12 12:19:03', 'confirmado', 1810000.00, '2024-08-12 12:19:03', '2026-06-17 17:19:03', 'Leandro Ortiz', 'Calle 72', '1736', 'La Plata - Villa Elvira', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (419, 67, '2026-04-21 00:19:03', 'confirmado', 1125000.00, '2026-04-21 00:19:03', '2026-06-17 17:19:03', 'Agustina Martínez', 'Calle 57', '2799', 'La Plata - Berisso', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (420, 73, '2023-08-06 08:19:03', 'confirmado', 720000.00, '2023-08-06 08:19:03', '2026-06-17 17:19:03', 'Valentina Rodríguez', 'Calle 11', '349', 'La Plata - Villa Elvira', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (421, 89, '2024-05-15 09:19:03', 'confirmado', 700000.00, '2024-05-15 09:19:03', '2026-06-17 17:19:03', 'Sebastián Herrera', 'Calle Avenida 7', '1993', 'La Plata - City Bell', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (422, 42, '2024-07-11 01:19:03', 'confirmado', 870000.00, '2024-07-11 01:19:03', '2026-06-17 17:19:03', 'Tomás Álvarez', 'Calle 12', '1916', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (423, 60, '2023-09-09 01:19:03', 'confirmado', 1920000.00, '2023-09-09 01:19:03', '2026-06-17 17:19:03', 'Martín Fernández', 'Calle 7', '2782', 'La Plata - Gonnet', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (424, 39, '2026-01-15 23:19:03', 'confirmado', 1570000.00, '2026-01-15 23:19:03', '2026-06-17 17:19:03', 'Gonzalo Sánchez', 'Calle 4', '2886', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (425, 14, '2024-08-15 19:19:03', 'confirmado', 540000.00, '2024-08-15 19:19:03', '2026-06-17 17:19:03', 'Valentina Rodríguez', 'Calle 90', '2854', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (426, 64, '2025-04-27 20:19:03', 'confirmado', 1010000.00, '2025-04-27 20:19:03', '2026-06-17 17:19:03', 'Micaela Gutiérrez', 'Calle 8', '717', 'La Plata - Gonnet', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (427, 31, '2025-01-21 18:19:03', 'confirmado', 855000.00, '2025-01-21 18:19:03', '2026-06-17 17:19:03', 'Agustina Martínez', 'Calle 122', '2222', 'La Plata - Villa Elvira', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (428, 33, '2023-10-17 08:19:03', 'confirmado', 1215000.00, '2023-10-17 08:19:03', '2026-06-17 17:19:03', 'Facundo Ruiz', 'Calle 51', '1344', 'La Plata - Tolosa', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (429, 27, '2024-12-11 07:19:03', 'confirmado', 660000.00, '2024-12-11 07:19:03', '2026-06-17 17:19:03', 'Natalia Moreno', 'Calle 137', '431', 'La Plata - Melchor Romero', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (430, 13, '2026-03-12 06:19:03', 'confirmado', 1540000.00, '2026-03-12 06:19:03', '2026-06-17 17:19:04', 'Gonzalo Sánchez', 'Calle Diagonal 74', '2808', 'La Plata - Berisso', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (431, 45, '2023-09-01 09:19:04', 'confirmado', 860000.00, '2023-09-01 09:19:04', '2026-06-17 17:19:04', 'Julieta Castro', 'Calle 122', '695', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (432, 52, '2024-09-08 18:19:04', 'confirmado', 1300000.00, '2024-09-08 18:19:04', '2026-06-17 17:19:04', 'Leandro Ortiz', 'Calle 10', '975', 'La Plata - Ensenada', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (433, 24, '2026-04-19 08:19:04', 'confirmado', 410000.00, '2026-04-19 08:19:04', '2026-06-17 17:19:04', 'Sebastián Herrera', 'Calle 44', '599', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (434, 37, '2023-06-19 13:19:04', 'confirmado', 480000.00, '2023-06-19 13:19:04', '2026-06-17 17:19:04', 'Leandro Ortiz', 'Calle 11', '273', 'La Plata - Ensenada', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (435, 13, '2023-08-13 11:19:04', 'confirmado', 570000.00, '2023-08-13 11:19:04', '2026-06-17 17:19:04', 'Facundo Ruiz', 'Calle 2', '2309', 'La Plata - Ensenada', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (436, 93, '2025-05-10 13:19:04', 'confirmado', 350000.00, '2025-05-10 13:19:04', '2026-06-17 17:19:04', 'Martín Fernández', 'Calle 4', '1329', 'La Plata - Ringuelet', 'Buenos Aires', '1923', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (437, 8, '2024-10-17 11:19:04', 'confirmado', 250000.00, '2024-10-17 11:19:04', '2026-06-17 17:19:04', 'Tomás Álvarez', 'Calle 38', '2704', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (438, 98, '2025-02-28 19:19:04', 'confirmado', 915000.00, '2025-02-28 19:19:04', '2026-06-17 17:19:04', 'Agustina Martínez', 'Calle Avenida 66', '1572', 'La Plata - City Bell', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (439, 61, '2024-07-07 02:19:04', 'confirmado', 1210000.00, '2024-07-07 02:19:04', '2026-06-17 17:19:04', 'Leandro Ortiz', 'Calle 2', '1757', 'La Plata - Melchor Romero', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (440, 17, '2023-12-17 05:19:04', 'confirmado', 940000.00, '2023-12-17 05:19:04', '2026-06-17 17:19:04', 'Gonzalo Sánchez', 'Calle 6', '2287', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (441, 91, '2025-05-31 13:19:04', 'confirmado', 930000.00, '2025-05-31 13:19:04', '2026-06-17 17:19:04', 'Diego Jiménez', 'Calle 8', '377', 'La Plata - City Bell', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (442, 13, '2025-05-02 14:19:04', 'confirmado', 970000.00, '2025-05-02 14:19:04', '2026-06-17 17:19:04', 'Facundo Ruiz', 'Calle 3', '2248', 'La Plata - Ringuelet', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (443, 68, '2024-06-21 19:19:04', 'confirmado', 290000.00, '2024-06-21 19:19:04', '2026-06-17 17:19:04', 'Diego Jiménez', 'Calle Avenida 13', '1928', 'La Plata - City Bell', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (444, 76, '2026-05-25 08:19:04', 'confirmado', 860000.00, '2026-05-25 08:19:04', '2026-06-17 17:19:04', 'Facundo Ruiz', 'Calle Diagonal 80', '1537', 'La Plata - Tolosa', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (445, 51, '2024-03-10 02:19:04', 'confirmado', 570000.00, '2024-03-10 02:19:04', '2026-06-17 17:19:04', 'Lucía Acosta', 'Calle 4', '2454', 'La Plata - Villa Elisa', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (446, 92, '2024-11-03 22:19:04', 'confirmado', 1410000.00, '2024-11-03 22:19:04', '2026-06-17 17:19:04', 'Paula Vargas', 'Calle 14', '1429', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (447, 63, '2024-05-30 11:19:04', 'confirmado', 1410000.00, '2024-05-30 11:19:04', '2026-06-17 17:19:04', 'Martín Fernández', 'Calle 13', '2219', 'La Plata - Villa Elvira', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (448, 81, '2025-05-20 23:19:04', 'confirmado', 1770000.00, '2025-05-20 23:19:04', '2026-06-17 17:19:04', 'Valentina Rodríguez', 'Calle 12', '2955', 'La Plata - Melchor Romero', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (449, 36, '2024-05-10 03:19:04', 'confirmado', 350000.00, '2024-05-10 03:19:04', '2026-06-17 17:19:04', 'Nicolás Pérez', 'Calle 8', '2615', 'La Plata - Berisso', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (450, 76, '2025-09-23 22:19:04', 'confirmado', 1320000.00, '2025-09-23 22:19:04', '2026-06-17 17:19:04', 'Natalia Moreno', 'Calle 66', '1280', 'La Plata - Villa Elvira', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (451, 82, '2024-12-14 17:19:04', 'confirmado', 480000.00, '2024-12-14 17:19:04', '2026-06-17 17:19:04', 'Micaela Gutiérrez', 'Calle Diagonal 79', '791', 'La Plata - City Bell', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (452, 8, '2023-12-16 00:19:04', 'confirmado', 820000.00, '2023-12-16 00:19:04', '2026-06-17 17:19:04', 'Florencia Díaz', 'Calle 5', '2490', 'La Plata - Tolosa', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (453, 50, '2025-10-05 10:19:04', 'confirmado', 480000.00, '2025-10-05 10:19:04', '2026-06-17 17:19:04', 'Leandro Ortiz', 'Calle Diagonal 74', '305', 'La Plata - Villa Elvira', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (454, 33, '2025-06-24 13:19:04', 'confirmado', 585000.00, '2025-06-24 13:19:04', '2026-06-17 17:19:04', 'Diego Jiménez', 'Calle 12', '1200', 'La Plata - Los Hornos', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (455, 31, '2024-12-01 10:19:04', 'confirmado', 880000.00, '2024-12-01 10:19:04', '2026-06-17 17:19:04', 'Leandro Ortiz', 'Calle 4', '234', 'La Plata - Melchor Romero', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (456, 12, '2023-06-20 17:19:04', 'confirmado', 870000.00, '2023-06-20 17:19:04', '2026-06-17 17:19:04', 'Gonzalo Sánchez', 'Calle 32', '104', 'La Plata - Abasto', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (457, 83, '2025-11-12 07:19:04', 'confirmado', 500000.00, '2025-11-12 07:19:04', '2026-06-17 17:19:04', 'Martín Fernández', 'Calle 51', '2749', 'La Plata - Ensenada', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (458, 15, '2024-04-18 03:19:04', 'confirmado', 1350000.00, '2024-04-18 03:19:04', '2026-06-17 17:19:04', 'Gonzalo Sánchez', 'Calle Diagonal 73', '226', 'La Plata - Melchor Romero', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (459, 65, '2025-09-16 18:19:04', 'confirmado', 1060000.00, '2025-09-16 18:19:04', '2026-06-17 17:19:04', 'Tomás Álvarez', 'Calle 8', '2831', 'La Plata - Ensenada', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (460, 15, '2023-12-29 11:19:04', 'confirmado', 2125000.00, '2023-12-29 11:19:04', '2026-06-17 17:19:04', 'Facundo Ruiz', 'Calle 10', '304', 'La Plata - Villa Elisa', 'Buenos Aires', '1906', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (461, 58, '2024-01-15 14:19:04', 'confirmado', 1820000.00, '2024-01-15 14:19:04', '2026-06-17 17:19:04', 'Gonzalo Sánchez', 'Calle Diagonal 74', '373', 'La Plata - Villa Elvira', 'Buenos Aires', '1905', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (462, 83, '2025-11-13 15:19:04', 'confirmado', 690000.00, '2025-11-13 15:19:04', '2026-06-17 17:19:04', 'Julieta Castro', 'Calle 14', '2101', 'La Plata - Ringuelet', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (463, 81, '2023-08-13 16:19:04', 'confirmado', 1155000.00, '2023-08-13 16:19:04', '2026-06-17 17:19:04', 'Natalia Moreno', 'Calle 90', '2520', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (464, 52, '2025-08-01 11:19:04', 'confirmado', 1870000.00, '2025-08-01 11:19:04', '2026-06-17 17:19:04', 'Lucía Acosta', 'Calle 81', '757', 'La Plata - Villa Elvira', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (465, 7, '2025-07-13 18:19:04', 'confirmado', 380000.00, '2025-07-13 18:19:04', '2026-06-17 17:19:04', 'Tomás Álvarez', 'Calle 12', '525', 'La Plata - City Bell', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (466, 56, '2024-09-08 11:19:04', 'confirmado', 1465000.00, '2024-09-08 11:19:04', '2026-06-17 17:19:04', 'Diego Jiménez', 'Calle 84', '2045', 'La Plata - Los Hornos', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (467, 38, '2026-02-12 14:19:04', 'confirmado', 1910000.00, '2026-02-12 14:19:04', '2026-06-17 17:19:04', 'Camila López', 'Calle 8', '281', 'La Plata - Los Hornos', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (468, 4, '2024-01-23 15:19:04', 'confirmado', 910000.00, '2024-01-23 15:19:04', '2026-06-17 17:19:04', 'Facundo Ruiz', 'Calle 14', '1800', 'La Plata - Abasto', 'Buenos Aires', '1902', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (469, 42, '2025-09-07 07:19:04', 'confirmado', 1310000.00, '2025-09-07 07:19:04', '2026-06-17 17:19:04', 'Facundo Ruiz', 'Calle Avenida 44', '2384', 'La Plata - Villa Elisa', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (470, 42, '2026-05-25 13:19:04', 'confirmado', 900000.00, '2026-05-25 13:19:04', '2026-06-17 17:19:04', 'Federico García', 'Calle 2', '776', 'La Plata - Berisso', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (471, 27, '2024-05-10 02:19:04', 'confirmado', 1080000.00, '2024-05-10 02:19:04', '2026-06-17 17:19:04', 'Florencia Díaz', 'Calle Diagonal 80', '1708', 'La Plata - Villa Elvira', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (472, 70, '2025-04-26 08:19:04', 'confirmado', 180000.00, '2025-04-26 08:19:04', '2026-06-17 17:19:04', 'Micaela Gutiérrez', 'Calle 44', '519', 'La Plata - City Bell', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (473, 70, '2023-07-31 04:19:04', 'confirmado', 1135000.00, '2023-07-31 04:19:04', '2026-06-17 17:19:04', 'Sebastián Herrera', 'Calle 32', '2169', 'La Plata - Los Hornos', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (474, 8, '2025-04-01 04:19:04', 'confirmado', 465000.00, '2025-04-01 04:19:04', '2026-06-17 17:19:04', 'Lucía Acosta', 'Calle 90', '1530', 'La Plata - Ensenada', 'Buenos Aires', '1987', 'tarjeta', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (475, 37, '2025-08-01 16:19:04', 'confirmado', 195000.00, '2025-08-01 16:19:04', '2026-06-17 17:19:04', 'Paula Vargas', 'Calle 63', '645', 'La Plata - Los Hornos', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (476, 57, '2023-07-02 22:19:04', 'confirmado', 615000.00, '2023-07-02 22:19:04', '2026-06-17 17:19:04', 'Julieta Castro', 'Calle 90', '1898', 'La Plata - City Bell', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (477, 81, '2025-10-27 18:19:04', 'confirmado', 1405000.00, '2025-10-27 18:19:04', '2026-06-17 17:19:04', 'Matías Torres', 'Calle 60', '1242', 'La Plata - Melchor Romero', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (478, 16, '2025-06-02 11:19:04', 'confirmado', 1160000.00, '2025-06-02 11:19:04', '2026-06-17 17:19:04', 'Natalia Moreno', 'Calle 2', '1246', 'La Plata - Ensenada', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (479, 63, '2025-10-07 15:19:04', 'confirmado', 570000.00, '2025-10-07 15:19:04', '2026-06-17 17:19:04', 'Natalia Moreno', 'Calle 8', '1376', 'La Plata - Tolosa', 'Buenos Aires', '1904', 'transferencia', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (480, 3, '2024-04-04 01:19:04', 'confirmado', 1240000.00, '2024-04-04 01:19:04', '2026-06-17 17:19:04', 'Sebastián Herrera', 'Calle 90', '2435', 'La Plata - Abasto', 'Buenos Aires', '1906', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (481, 54, '2024-07-07 18:19:04', 'confirmado', 350000.00, '2024-07-07 18:19:04', '2026-06-17 17:19:04', 'Facundo Ruiz', 'Calle 9', '344', 'La Plata - Tolosa', 'Buenos Aires', '1987', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (482, 22, '2024-01-19 22:19:04', 'confirmado', 240000.00, '2024-01-19 22:19:04', '2026-06-17 17:19:04', 'Leandro Ortiz', 'Calle 72', '1056', 'La Plata - Centro', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (483, 68, '2025-02-02 11:19:04', 'confirmado', 1415000.00, '2025-02-02 11:19:04', '2026-06-17 17:19:04', 'Matías Torres', 'Calle 81', '1087', 'La Plata - Centro', 'Buenos Aires', '1923', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (484, 60, '2025-08-17 17:19:04', 'confirmado', 630000.00, '2025-08-17 17:19:04', '2026-06-17 17:19:04', 'Facundo Ruiz', 'Calle 38', '2721', 'La Plata - Centro', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (485, 86, '2026-03-28 15:19:04', 'confirmado', 1060000.00, '2026-03-28 15:19:04', '2026-06-17 17:19:04', 'Julieta Castro', 'Calle 51', '1935', 'La Plata - Ángel Etcheverry', 'Buenos Aires', '1923', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (486, 32, '2023-12-24 23:19:04', 'confirmado', 1540000.00, '2023-12-24 23:19:04', '2026-06-17 17:19:04', 'Natalia Moreno', 'Calle 10', '2923', 'La Plata - Ensenada', 'Buenos Aires', '1905', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (487, 17, '2023-10-20 21:19:04', 'confirmado', 700000.00, '2023-10-20 21:19:04', '2026-06-17 17:19:04', 'Natalia Moreno', 'Calle 51', '2916', 'La Plata - Berisso', 'Buenos Aires', '1900', 'mercadopago', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (488, 55, '2025-02-23 08:19:04', 'confirmado', 890000.00, '2025-02-23 08:19:04', '2026-06-17 17:19:04', 'Lucía Acosta', 'Calle 9', '1027', 'La Plata - City Bell', 'Buenos Aires', '1987', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (489, 77, '2026-06-13 21:19:04', 'confirmado', 720000.00, '2026-06-13 21:19:04', '2026-06-17 17:19:04', 'Federico García', 'Calle 116', '1860', 'La Plata - Berisso', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (490, 67, '2025-07-27 08:19:04', 'confirmado', 1415000.00, '2025-07-27 08:19:04', '2026-06-17 17:19:04', 'Diego Jiménez', 'Calle 76', '1653', 'La Plata - Ensenada', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (491, 61, '2026-03-15 02:19:04', 'confirmado', 1300000.00, '2026-03-15 02:19:04', '2026-06-17 17:19:04', 'Facundo Ruiz', 'Calle 81', '1217', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 0.00);
INSERT INTO public.ventas_cabecera VALUES (492, 20, '2023-06-22 21:19:04', 'confirmado', 780000.00, '2023-06-22 21:19:04', '2026-06-17 17:19:04', 'Tomás Álvarez', 'Calle 76', '167', 'La Plata - Villa Elisa', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (493, 60, '2026-04-19 09:19:04', 'confirmado', 615000.00, '2026-04-19 09:19:04', '2026-06-17 17:19:04', 'Sofía Romero', 'Calle 32', '2065', 'La Plata - Centro', 'Buenos Aires', '1904', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (494, 23, '2024-05-14 22:19:04', 'confirmado', 690000.00, '2024-05-14 22:19:04', '2026-06-17 17:19:04', 'Julieta Castro', 'Calle 51', '1385', 'La Plata - Altos de San Lorenzo', 'Buenos Aires', '1906', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (495, 47, '2025-04-23 16:19:04', 'confirmado', 1650000.00, '2025-04-23 16:19:04', '2026-06-17 17:19:04', 'Tomás Álvarez', 'Calle 137', '1350', 'La Plata - Berisso', 'Buenos Aires', '1904', 'tarjeta', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (496, 41, '2025-07-18 06:19:04', 'confirmado', 300000.00, '2025-07-18 06:19:04', '2026-06-17 17:19:04', 'Tomás Álvarez', 'Calle Avenida 7', '2544', 'La Plata - Villa Elvira', 'Buenos Aires', '1905', 'mercadopago', 'aprobado', NULL, 3200.00);
INSERT INTO public.ventas_cabecera VALUES (497, 82, '2024-04-24 10:19:04', 'confirmado', 890000.00, '2024-04-24 10:19:04', '2026-06-17 17:19:04', 'Gonzalo Sánchez', 'Calle Avenida 44', '1647', 'La Plata - Berisso', 'Buenos Aires', '1902', 'transferencia', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (498, 71, '2024-09-28 22:19:04', 'confirmado', 1920000.00, '2024-09-28 22:19:04', '2026-06-17 17:19:04', 'Facundo Ruiz', 'Calle 66', '1635', 'La Plata - Los Hornos', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (499, 75, '2025-01-02 23:19:04', 'confirmado', 1400000.00, '2025-01-02 23:19:04', '2026-06-17 17:19:04', 'Valentina Rodríguez', 'Calle 137', '151', 'La Plata - Gonnet', 'Buenos Aires', '1902', 'mercadopago', 'aprobado', NULL, 1800.00);
INSERT INTO public.ventas_cabecera VALUES (500, 56, '2023-11-22 14:19:04', 'confirmado', 1000000.00, '2023-11-22 14:19:04', '2026-06-17 17:19:04', 'Camila López', 'Calle 90', '1263', 'La Plata - Gonnet', 'Buenos Aires', '1900', 'transferencia', 'aprobado', NULL, 2500.00);
INSERT INTO public.ventas_cabecera VALUES (501, 50, '2024-01-16 06:19:04', 'confirmado', 910000.00, '2024-01-16 06:19:04', '2026-06-17 17:19:04', 'Federico García', 'Calle 122', '2728', 'La Plata - City Bell', 'Buenos Aires', '1900', 'tarjeta', 'aprobado', NULL, 1800.00);


--
-- TOC entry 5182 (class 0 OID 30512)
-- Dependencies: 235
-- Data for Name: ventas_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ventas_detalle VALUES (1, 1, 17, 1, 350000.00, 350000.00, '2026-06-17 17:19:00', '2026-06-17 17:19:00');
INSERT INTO public.ventas_detalle VALUES (2, 1, 3, 1, 180000.00, 180000.00, '2026-06-17 17:19:01', '2026-06-17 17:19:01');
INSERT INTO public.ventas_detalle VALUES (3, 2, 7, 1, 160000.00, 160000.00, '2023-10-23 01:19:01', '2023-10-23 01:19:01');
INSERT INTO public.ventas_detalle VALUES (4, 3, 8, 1, 175000.00, 175000.00, '2025-05-11 10:19:01', '2025-05-11 10:19:01');
INSERT INTO public.ventas_detalle VALUES (5, 4, 17, 2, 350000.00, 700000.00, '2026-03-21 22:19:01', '2026-03-21 22:19:01');
INSERT INTO public.ventas_detalle VALUES (6, 5, 10, 3, 195000.00, 585000.00, '2025-05-14 17:19:01', '2025-05-14 17:19:01');
INSERT INTO public.ventas_detalle VALUES (7, 6, 10, 2, 195000.00, 390000.00, '2025-03-21 02:19:01', '2025-03-21 02:19:01');
INSERT INTO public.ventas_detalle VALUES (8, 6, 12, 1, 205000.00, 205000.00, '2025-03-21 02:19:01', '2025-03-21 02:19:01');
INSERT INTO public.ventas_detalle VALUES (9, 7, 1, 3, 250000.00, 750000.00, '2024-03-08 02:19:01', '2024-03-08 02:19:01');
INSERT INTO public.ventas_detalle VALUES (10, 7, 17, 2, 350000.00, 700000.00, '2024-03-08 02:19:01', '2024-03-08 02:19:01');
INSERT INTO public.ventas_detalle VALUES (11, 7, 18, 1, 240000.00, 240000.00, '2024-03-08 02:19:01', '2024-03-08 02:19:01');
INSERT INTO public.ventas_detalle VALUES (12, 8, 18, 3, 240000.00, 720000.00, '2023-10-23 13:19:01', '2023-10-23 13:19:01');
INSERT INTO public.ventas_detalle VALUES (13, 9, 18, 1, 240000.00, 240000.00, '2023-12-27 02:19:01', '2023-12-27 02:19:01');
INSERT INTO public.ventas_detalle VALUES (14, 10, 5, 1, 190000.00, 190000.00, '2025-12-06 17:19:01', '2025-12-06 17:19:01');
INSERT INTO public.ventas_detalle VALUES (15, 10, 6, 3, 310000.00, 930000.00, '2025-12-06 17:19:01', '2025-12-06 17:19:01');
INSERT INTO public.ventas_detalle VALUES (16, 10, 14, 2, 290000.00, 580000.00, '2025-12-06 17:19:01', '2025-12-06 17:19:01');
INSERT INTO public.ventas_detalle VALUES (17, 11, 3, 2, 180000.00, 360000.00, '2025-12-29 17:19:01', '2025-12-29 17:19:01');
INSERT INTO public.ventas_detalle VALUES (18, 11, 11, 3, 150000.00, 450000.00, '2025-12-29 17:19:01', '2025-12-29 17:19:01');
INSERT INTO public.ventas_detalle VALUES (19, 11, 15, 2, 270000.00, 540000.00, '2025-12-29 17:19:01', '2025-12-29 17:19:01');
INSERT INTO public.ventas_detalle VALUES (20, 12, 5, 1, 190000.00, 190000.00, '2023-12-15 09:19:01', '2023-12-15 09:19:01');
INSERT INTO public.ventas_detalle VALUES (21, 12, 6, 1, 310000.00, 310000.00, '2023-12-15 09:19:01', '2023-12-15 09:19:01');
INSERT INTO public.ventas_detalle VALUES (22, 13, 7, 1, 160000.00, 160000.00, '2025-03-30 14:19:01', '2025-03-30 14:19:01');
INSERT INTO public.ventas_detalle VALUES (23, 14, 1, 2, 250000.00, 500000.00, '2025-03-27 01:19:01', '2025-03-27 01:19:01');
INSERT INTO public.ventas_detalle VALUES (24, 14, 3, 1, 180000.00, 180000.00, '2025-03-27 01:19:01', '2025-03-27 01:19:01');
INSERT INTO public.ventas_detalle VALUES (25, 14, 9, 3, 220000.00, 660000.00, '2025-03-27 01:19:01', '2025-03-27 01:19:01');
INSERT INTO public.ventas_detalle VALUES (26, 15, 3, 1, 180000.00, 180000.00, '2024-04-29 20:19:01', '2024-04-29 20:19:01');
INSERT INTO public.ventas_detalle VALUES (27, 15, 12, 1, 205000.00, 205000.00, '2024-04-29 20:19:01', '2024-04-29 20:19:01');
INSERT INTO public.ventas_detalle VALUES (28, 15, 14, 1, 290000.00, 290000.00, '2024-04-29 20:19:01', '2024-04-29 20:19:01');
INSERT INTO public.ventas_detalle VALUES (29, 16, 7, 1, 160000.00, 160000.00, '2025-04-02 15:19:01', '2025-04-02 15:19:01');
INSERT INTO public.ventas_detalle VALUES (30, 17, 11, 1, 150000.00, 150000.00, '2024-04-12 10:19:01', '2024-04-12 10:19:01');
INSERT INTO public.ventas_detalle VALUES (31, 18, 5, 2, 190000.00, 380000.00, '2025-05-10 01:19:01', '2025-05-10 01:19:01');
INSERT INTO public.ventas_detalle VALUES (32, 18, 11, 1, 150000.00, 150000.00, '2025-05-10 01:19:01', '2025-05-10 01:19:01');
INSERT INTO public.ventas_detalle VALUES (33, 19, 2, 2, 210000.00, 420000.00, '2024-03-01 23:19:01', '2024-03-01 23:19:01');
INSERT INTO public.ventas_detalle VALUES (34, 19, 5, 2, 190000.00, 380000.00, '2024-03-01 23:19:01', '2024-03-01 23:19:01');
INSERT INTO public.ventas_detalle VALUES (35, 19, 8, 2, 175000.00, 350000.00, '2024-03-01 23:19:01', '2024-03-01 23:19:01');
INSERT INTO public.ventas_detalle VALUES (36, 20, 11, 1, 150000.00, 150000.00, '2024-11-28 23:19:01', '2024-11-28 23:19:01');
INSERT INTO public.ventas_detalle VALUES (37, 21, 9, 1, 220000.00, 220000.00, '2025-03-22 20:19:01', '2025-03-22 20:19:01');
INSERT INTO public.ventas_detalle VALUES (38, 21, 10, 2, 195000.00, 390000.00, '2025-03-22 20:19:01', '2025-03-22 20:19:01');
INSERT INTO public.ventas_detalle VALUES (39, 21, 12, 2, 205000.00, 410000.00, '2025-03-22 20:19:01', '2025-03-22 20:19:01');
INSERT INTO public.ventas_detalle VALUES (40, 22, 2, 1, 210000.00, 210000.00, '2024-06-29 12:19:01', '2024-06-29 12:19:01');
INSERT INTO public.ventas_detalle VALUES (41, 22, 15, 3, 270000.00, 810000.00, '2024-06-29 12:19:01', '2024-06-29 12:19:01');
INSERT INTO public.ventas_detalle VALUES (42, 22, 17, 2, 350000.00, 700000.00, '2024-06-29 12:19:01', '2024-06-29 12:19:01');
INSERT INTO public.ventas_detalle VALUES (43, 23, 12, 2, 205000.00, 410000.00, '2023-12-05 14:19:01', '2023-12-05 14:19:01');
INSERT INTO public.ventas_detalle VALUES (44, 23, 18, 3, 240000.00, 720000.00, '2023-12-05 14:19:01', '2023-12-05 14:19:01');
INSERT INTO public.ventas_detalle VALUES (45, 24, 2, 1, 210000.00, 210000.00, '2026-03-03 21:19:01', '2026-03-03 21:19:01');
INSERT INTO public.ventas_detalle VALUES (46, 24, 3, 2, 180000.00, 360000.00, '2026-03-03 21:19:01', '2026-03-03 21:19:01');
INSERT INTO public.ventas_detalle VALUES (47, 24, 10, 3, 195000.00, 585000.00, '2026-03-03 21:19:01', '2026-03-03 21:19:01');
INSERT INTO public.ventas_detalle VALUES (48, 25, 6, 3, 310000.00, 930000.00, '2024-04-13 00:19:01', '2024-04-13 00:19:01');
INSERT INTO public.ventas_detalle VALUES (49, 25, 10, 1, 195000.00, 195000.00, '2024-04-13 00:19:01', '2024-04-13 00:19:01');
INSERT INTO public.ventas_detalle VALUES (50, 25, 18, 3, 240000.00, 720000.00, '2024-04-13 00:19:01', '2024-04-13 00:19:01');
INSERT INTO public.ventas_detalle VALUES (51, 26, 3, 3, 180000.00, 540000.00, '2025-12-02 00:19:01', '2025-12-02 00:19:01');
INSERT INTO public.ventas_detalle VALUES (52, 27, 16, 3, 380000.00, 1140000.00, '2025-01-25 17:19:01', '2025-01-25 17:19:01');
INSERT INTO public.ventas_detalle VALUES (53, 28, 2, 3, 210000.00, 630000.00, '2025-03-22 15:19:01', '2025-03-22 15:19:01');
INSERT INTO public.ventas_detalle VALUES (54, 28, 8, 2, 175000.00, 350000.00, '2025-03-22 15:19:01', '2025-03-22 15:19:01');
INSERT INTO public.ventas_detalle VALUES (55, 28, 18, 3, 240000.00, 720000.00, '2025-03-22 15:19:01', '2025-03-22 15:19:01');
INSERT INTO public.ventas_detalle VALUES (56, 29, 6, 2, 310000.00, 620000.00, '2024-12-30 11:19:01', '2024-12-30 11:19:01');
INSERT INTO public.ventas_detalle VALUES (57, 29, 12, 3, 205000.00, 615000.00, '2024-12-30 11:19:01', '2024-12-30 11:19:01');
INSERT INTO public.ventas_detalle VALUES (58, 30, 7, 3, 160000.00, 480000.00, '2023-07-07 09:19:01', '2023-07-07 09:19:01');
INSERT INTO public.ventas_detalle VALUES (59, 30, 12, 2, 205000.00, 410000.00, '2023-07-07 09:19:01', '2023-07-07 09:19:01');
INSERT INTO public.ventas_detalle VALUES (60, 30, 14, 1, 290000.00, 290000.00, '2023-07-07 09:19:01', '2023-07-07 09:19:01');
INSERT INTO public.ventas_detalle VALUES (61, 31, 1, 2, 250000.00, 500000.00, '2024-08-02 20:19:01', '2024-08-02 20:19:01');
INSERT INTO public.ventas_detalle VALUES (62, 31, 6, 3, 310000.00, 930000.00, '2024-08-02 20:19:01', '2024-08-02 20:19:01');
INSERT INTO public.ventas_detalle VALUES (63, 31, 16, 2, 380000.00, 760000.00, '2024-08-02 20:19:01', '2024-08-02 20:19:01');
INSERT INTO public.ventas_detalle VALUES (64, 32, 12, 2, 205000.00, 410000.00, '2025-07-25 11:19:01', '2025-07-25 11:19:01');
INSERT INTO public.ventas_detalle VALUES (65, 32, 15, 2, 270000.00, 540000.00, '2025-07-25 11:19:01', '2025-07-25 11:19:01');
INSERT INTO public.ventas_detalle VALUES (66, 33, 8, 3, 175000.00, 525000.00, '2024-08-04 08:19:01', '2024-08-04 08:19:01');
INSERT INTO public.ventas_detalle VALUES (67, 33, 9, 2, 220000.00, 440000.00, '2024-08-04 08:19:01', '2024-08-04 08:19:01');
INSERT INTO public.ventas_detalle VALUES (68, 34, 15, 3, 270000.00, 810000.00, '2025-09-25 16:19:01', '2025-09-25 16:19:01');
INSERT INTO public.ventas_detalle VALUES (69, 35, 1, 2, 250000.00, 500000.00, '2024-10-21 05:19:01', '2024-10-21 05:19:01');
INSERT INTO public.ventas_detalle VALUES (70, 35, 11, 2, 150000.00, 300000.00, '2024-10-21 05:19:01', '2024-10-21 05:19:01');
INSERT INTO public.ventas_detalle VALUES (71, 36, 16, 2, 380000.00, 760000.00, '2024-09-24 11:19:01', '2024-09-24 11:19:01');
INSERT INTO public.ventas_detalle VALUES (72, 37, 9, 2, 220000.00, 440000.00, '2024-01-16 10:19:01', '2024-01-16 10:19:01');
INSERT INTO public.ventas_detalle VALUES (73, 37, 11, 2, 150000.00, 300000.00, '2024-01-16 10:19:01', '2024-01-16 10:19:01');
INSERT INTO public.ventas_detalle VALUES (74, 38, 1, 3, 250000.00, 750000.00, '2023-08-10 05:19:01', '2023-08-10 05:19:01');
INSERT INTO public.ventas_detalle VALUES (75, 38, 5, 2, 190000.00, 380000.00, '2023-08-10 05:19:01', '2023-08-10 05:19:01');
INSERT INTO public.ventas_detalle VALUES (76, 38, 16, 1, 380000.00, 380000.00, '2023-08-10 05:19:01', '2023-08-10 05:19:01');
INSERT INTO public.ventas_detalle VALUES (77, 39, 15, 1, 270000.00, 270000.00, '2025-11-18 02:19:01', '2025-11-18 02:19:01');
INSERT INTO public.ventas_detalle VALUES (78, 40, 2, 2, 210000.00, 420000.00, '2026-02-07 18:19:01', '2026-02-07 18:19:01');
INSERT INTO public.ventas_detalle VALUES (79, 41, 1, 2, 250000.00, 500000.00, '2026-01-03 13:19:01', '2026-01-03 13:19:01');
INSERT INTO public.ventas_detalle VALUES (80, 41, 10, 1, 195000.00, 195000.00, '2026-01-03 13:19:01', '2026-01-03 13:19:01');
INSERT INTO public.ventas_detalle VALUES (81, 42, 5, 3, 190000.00, 570000.00, '2026-04-25 05:19:01', '2026-04-25 05:19:01');
INSERT INTO public.ventas_detalle VALUES (82, 43, 3, 2, 180000.00, 360000.00, '2024-12-11 06:19:01', '2024-12-11 06:19:01');
INSERT INTO public.ventas_detalle VALUES (83, 43, 11, 3, 150000.00, 450000.00, '2024-12-11 06:19:01', '2024-12-11 06:19:01');
INSERT INTO public.ventas_detalle VALUES (84, 43, 14, 3, 290000.00, 870000.00, '2024-12-11 06:19:01', '2024-12-11 06:19:01');
INSERT INTO public.ventas_detalle VALUES (85, 44, 1, 2, 250000.00, 500000.00, '2025-04-11 06:19:01', '2025-04-11 06:19:01');
INSERT INTO public.ventas_detalle VALUES (86, 44, 9, 2, 220000.00, 440000.00, '2025-04-11 06:19:01', '2025-04-11 06:19:01');
INSERT INTO public.ventas_detalle VALUES (87, 44, 12, 2, 205000.00, 410000.00, '2025-04-11 06:19:01', '2025-04-11 06:19:01');
INSERT INTO public.ventas_detalle VALUES (88, 45, 10, 3, 195000.00, 585000.00, '2024-04-25 09:19:01', '2024-04-25 09:19:01');
INSERT INTO public.ventas_detalle VALUES (89, 46, 8, 1, 175000.00, 175000.00, '2024-11-19 21:19:01', '2024-11-19 21:19:01');
INSERT INTO public.ventas_detalle VALUES (90, 46, 16, 2, 380000.00, 760000.00, '2024-11-19 21:19:01', '2024-11-19 21:19:01');
INSERT INTO public.ventas_detalle VALUES (91, 47, 10, 2, 195000.00, 390000.00, '2024-10-13 06:19:01', '2024-10-13 06:19:01');
INSERT INTO public.ventas_detalle VALUES (92, 48, 6, 1, 310000.00, 310000.00, '2025-01-20 07:19:01', '2025-01-20 07:19:01');
INSERT INTO public.ventas_detalle VALUES (93, 49, 15, 3, 270000.00, 810000.00, '2023-10-16 01:19:01', '2023-10-16 01:19:01');
INSERT INTO public.ventas_detalle VALUES (94, 50, 6, 3, 310000.00, 930000.00, '2026-05-24 10:19:01', '2026-05-24 10:19:01');
INSERT INTO public.ventas_detalle VALUES (95, 50, 9, 3, 220000.00, 660000.00, '2026-05-24 10:19:01', '2026-05-24 10:19:01');
INSERT INTO public.ventas_detalle VALUES (96, 51, 7, 2, 160000.00, 320000.00, '2025-12-19 21:19:01', '2025-12-19 21:19:01');
INSERT INTO public.ventas_detalle VALUES (97, 51, 18, 3, 240000.00, 720000.00, '2025-12-19 21:19:01', '2025-12-19 21:19:01');
INSERT INTO public.ventas_detalle VALUES (98, 52, 3, 1, 180000.00, 180000.00, '2025-08-15 06:19:01', '2025-08-15 06:19:01');
INSERT INTO public.ventas_detalle VALUES (99, 53, 3, 1, 180000.00, 180000.00, '2026-04-20 19:19:01', '2026-04-20 19:19:01');
INSERT INTO public.ventas_detalle VALUES (100, 53, 9, 2, 220000.00, 440000.00, '2026-04-20 19:19:01', '2026-04-20 19:19:01');
INSERT INTO public.ventas_detalle VALUES (101, 54, 1, 1, 250000.00, 250000.00, '2024-10-15 01:19:01', '2024-10-15 01:19:01');
INSERT INTO public.ventas_detalle VALUES (102, 55, 14, 1, 290000.00, 290000.00, '2024-05-22 23:19:01', '2024-05-22 23:19:01');
INSERT INTO public.ventas_detalle VALUES (103, 56, 8, 1, 175000.00, 175000.00, '2023-07-18 13:19:01', '2023-07-18 13:19:01');
INSERT INTO public.ventas_detalle VALUES (104, 56, 9, 2, 220000.00, 440000.00, '2023-07-18 13:19:01', '2023-07-18 13:19:01');
INSERT INTO public.ventas_detalle VALUES (105, 57, 7, 2, 160000.00, 320000.00, '2023-11-13 19:19:01', '2023-11-13 19:19:01');
INSERT INTO public.ventas_detalle VALUES (106, 57, 18, 2, 240000.00, 480000.00, '2023-11-13 19:19:01', '2023-11-13 19:19:01');
INSERT INTO public.ventas_detalle VALUES (107, 58, 5, 1, 190000.00, 190000.00, '2025-02-06 04:19:01', '2025-02-06 04:19:01');
INSERT INTO public.ventas_detalle VALUES (108, 58, 10, 2, 195000.00, 390000.00, '2025-02-06 04:19:01', '2025-02-06 04:19:01');
INSERT INTO public.ventas_detalle VALUES (109, 59, 7, 2, 160000.00, 320000.00, '2024-01-16 11:19:01', '2024-01-16 11:19:01');
INSERT INTO public.ventas_detalle VALUES (110, 60, 14, 1, 290000.00, 290000.00, '2026-01-05 04:19:01', '2026-01-05 04:19:01');
INSERT INTO public.ventas_detalle VALUES (111, 61, 1, 1, 250000.00, 250000.00, '2026-03-05 13:19:01', '2026-03-05 13:19:01');
INSERT INTO public.ventas_detalle VALUES (112, 61, 2, 3, 210000.00, 630000.00, '2026-03-05 13:19:01', '2026-03-05 13:19:01');
INSERT INTO public.ventas_detalle VALUES (113, 62, 3, 1, 180000.00, 180000.00, '2023-11-04 19:19:01', '2023-11-04 19:19:01');
INSERT INTO public.ventas_detalle VALUES (114, 62, 16, 3, 380000.00, 1140000.00, '2023-11-04 19:19:01', '2023-11-04 19:19:01');
INSERT INTO public.ventas_detalle VALUES (115, 62, 17, 2, 350000.00, 700000.00, '2023-11-04 19:19:01', '2023-11-04 19:19:01');
INSERT INTO public.ventas_detalle VALUES (116, 63, 7, 2, 160000.00, 320000.00, '2023-10-21 22:19:01', '2023-10-21 22:19:01');
INSERT INTO public.ventas_detalle VALUES (117, 63, 8, 3, 175000.00, 525000.00, '2023-10-21 22:19:01', '2023-10-21 22:19:01');
INSERT INTO public.ventas_detalle VALUES (118, 64, 8, 2, 175000.00, 350000.00, '2026-02-04 15:19:01', '2026-02-04 15:19:01');
INSERT INTO public.ventas_detalle VALUES (119, 64, 12, 3, 205000.00, 615000.00, '2026-02-04 15:19:01', '2026-02-04 15:19:01');
INSERT INTO public.ventas_detalle VALUES (120, 64, 17, 1, 350000.00, 350000.00, '2026-02-04 15:19:01', '2026-02-04 15:19:01');
INSERT INTO public.ventas_detalle VALUES (121, 65, 17, 3, 350000.00, 1050000.00, '2025-05-02 01:19:01', '2025-05-02 01:19:01');
INSERT INTO public.ventas_detalle VALUES (122, 65, 18, 2, 240000.00, 480000.00, '2025-05-02 01:19:01', '2025-05-02 01:19:01');
INSERT INTO public.ventas_detalle VALUES (123, 66, 1, 1, 250000.00, 250000.00, '2024-09-06 05:19:01', '2024-09-06 05:19:01');
INSERT INTO public.ventas_detalle VALUES (124, 66, 2, 2, 210000.00, 420000.00, '2024-09-06 05:19:01', '2024-09-06 05:19:01');
INSERT INTO public.ventas_detalle VALUES (125, 66, 7, 2, 160000.00, 320000.00, '2024-09-06 05:19:01', '2024-09-06 05:19:01');
INSERT INTO public.ventas_detalle VALUES (126, 67, 6, 1, 310000.00, 310000.00, '2025-08-19 07:19:01', '2025-08-19 07:19:01');
INSERT INTO public.ventas_detalle VALUES (127, 68, 1, 2, 250000.00, 500000.00, '2026-01-30 01:19:01', '2026-01-30 01:19:01');
INSERT INTO public.ventas_detalle VALUES (128, 68, 10, 3, 195000.00, 585000.00, '2026-01-30 01:19:01', '2026-01-30 01:19:01');
INSERT INTO public.ventas_detalle VALUES (129, 68, 15, 1, 270000.00, 270000.00, '2026-01-30 01:19:01', '2026-01-30 01:19:01');
INSERT INTO public.ventas_detalle VALUES (130, 69, 6, 3, 310000.00, 930000.00, '2025-12-08 16:19:01', '2025-12-08 16:19:01');
INSERT INTO public.ventas_detalle VALUES (131, 70, 1, 2, 250000.00, 500000.00, '2023-09-15 13:19:01', '2023-09-15 13:19:01');
INSERT INTO public.ventas_detalle VALUES (132, 70, 2, 3, 210000.00, 630000.00, '2023-09-15 13:19:01', '2023-09-15 13:19:01');
INSERT INTO public.ventas_detalle VALUES (133, 70, 16, 3, 380000.00, 1140000.00, '2023-09-15 13:19:01', '2023-09-15 13:19:01');
INSERT INTO public.ventas_detalle VALUES (134, 71, 15, 3, 270000.00, 810000.00, '2025-08-07 16:19:01', '2025-08-07 16:19:01');
INSERT INTO public.ventas_detalle VALUES (135, 72, 3, 2, 180000.00, 360000.00, '2024-11-10 04:19:01', '2024-11-10 04:19:01');
INSERT INTO public.ventas_detalle VALUES (136, 72, 9, 3, 220000.00, 660000.00, '2024-11-10 04:19:01', '2024-11-10 04:19:01');
INSERT INTO public.ventas_detalle VALUES (137, 73, 12, 1, 205000.00, 205000.00, '2024-02-25 19:19:01', '2024-02-25 19:19:01');
INSERT INTO public.ventas_detalle VALUES (138, 74, 16, 1, 380000.00, 380000.00, '2024-02-11 02:19:01', '2024-02-11 02:19:01');
INSERT INTO public.ventas_detalle VALUES (139, 74, 18, 2, 240000.00, 480000.00, '2024-02-11 02:19:01', '2024-02-11 02:19:01');
INSERT INTO public.ventas_detalle VALUES (140, 75, 3, 1, 180000.00, 180000.00, '2025-07-10 09:19:01', '2025-07-10 09:19:01');
INSERT INTO public.ventas_detalle VALUES (141, 75, 5, 2, 190000.00, 380000.00, '2025-07-10 09:19:01', '2025-07-10 09:19:01');
INSERT INTO public.ventas_detalle VALUES (142, 76, 15, 2, 270000.00, 540000.00, '2025-11-17 07:19:01', '2025-11-17 07:19:01');
INSERT INTO public.ventas_detalle VALUES (143, 76, 16, 1, 380000.00, 380000.00, '2025-11-17 07:19:01', '2025-11-17 07:19:01');
INSERT INTO public.ventas_detalle VALUES (144, 77, 3, 2, 180000.00, 360000.00, '2025-09-03 17:19:01', '2025-09-03 17:19:01');
INSERT INTO public.ventas_detalle VALUES (145, 77, 14, 2, 290000.00, 580000.00, '2025-09-03 17:19:01', '2025-09-03 17:19:01');
INSERT INTO public.ventas_detalle VALUES (146, 77, 16, 1, 380000.00, 380000.00, '2025-09-03 17:19:01', '2025-09-03 17:19:01');
INSERT INTO public.ventas_detalle VALUES (147, 78, 14, 1, 290000.00, 290000.00, '2026-04-09 12:19:01', '2026-04-09 12:19:01');
INSERT INTO public.ventas_detalle VALUES (148, 78, 16, 3, 380000.00, 1140000.00, '2026-04-09 12:19:01', '2026-04-09 12:19:01');
INSERT INTO public.ventas_detalle VALUES (149, 78, 18, 1, 240000.00, 240000.00, '2026-04-09 12:19:01', '2026-04-09 12:19:01');
INSERT INTO public.ventas_detalle VALUES (150, 79, 3, 3, 180000.00, 540000.00, '2025-03-18 19:19:01', '2025-03-18 19:19:01');
INSERT INTO public.ventas_detalle VALUES (151, 80, 1, 1, 250000.00, 250000.00, '2025-11-14 22:19:01', '2025-11-14 22:19:01');
INSERT INTO public.ventas_detalle VALUES (152, 80, 5, 2, 190000.00, 380000.00, '2025-11-14 22:19:01', '2025-11-14 22:19:01');
INSERT INTO public.ventas_detalle VALUES (153, 81, 12, 3, 205000.00, 615000.00, '2024-10-22 08:19:01', '2024-10-22 08:19:01');
INSERT INTO public.ventas_detalle VALUES (154, 82, 3, 1, 180000.00, 180000.00, '2025-01-25 18:19:01', '2025-01-25 18:19:01');
INSERT INTO public.ventas_detalle VALUES (155, 82, 7, 1, 160000.00, 160000.00, '2025-01-25 18:19:01', '2025-01-25 18:19:01');
INSERT INTO public.ventas_detalle VALUES (156, 82, 9, 2, 220000.00, 440000.00, '2025-01-25 18:19:01', '2025-01-25 18:19:01');
INSERT INTO public.ventas_detalle VALUES (157, 83, 12, 3, 205000.00, 615000.00, '2024-02-08 05:19:01', '2024-02-08 05:19:01');
INSERT INTO public.ventas_detalle VALUES (158, 84, 6, 3, 310000.00, 930000.00, '2024-10-19 21:19:01', '2024-10-19 21:19:01');
INSERT INTO public.ventas_detalle VALUES (159, 84, 15, 2, 270000.00, 540000.00, '2024-10-19 21:19:01', '2024-10-19 21:19:01');
INSERT INTO public.ventas_detalle VALUES (160, 84, 18, 1, 240000.00, 240000.00, '2024-10-19 21:19:01', '2024-10-19 21:19:01');
INSERT INTO public.ventas_detalle VALUES (161, 85, 17, 3, 350000.00, 1050000.00, '2025-09-29 19:19:01', '2025-09-29 19:19:01');
INSERT INTO public.ventas_detalle VALUES (162, 86, 5, 2, 190000.00, 380000.00, '2023-11-06 09:19:01', '2023-11-06 09:19:01');
INSERT INTO public.ventas_detalle VALUES (163, 86, 12, 3, 205000.00, 615000.00, '2023-11-06 09:19:01', '2023-11-06 09:19:01');
INSERT INTO public.ventas_detalle VALUES (164, 86, 14, 1, 290000.00, 290000.00, '2023-11-06 09:19:01', '2023-11-06 09:19:01');
INSERT INTO public.ventas_detalle VALUES (165, 87, 5, 3, 190000.00, 570000.00, '2025-07-02 04:19:01', '2025-07-02 04:19:01');
INSERT INTO public.ventas_detalle VALUES (166, 87, 15, 1, 270000.00, 270000.00, '2025-07-02 04:19:01', '2025-07-02 04:19:01');
INSERT INTO public.ventas_detalle VALUES (167, 88, 5, 2, 190000.00, 380000.00, '2024-11-07 02:19:01', '2024-11-07 02:19:01');
INSERT INTO public.ventas_detalle VALUES (168, 88, 10, 3, 195000.00, 585000.00, '2024-11-07 02:19:01', '2024-11-07 02:19:01');
INSERT INTO public.ventas_detalle VALUES (169, 89, 3, 2, 180000.00, 360000.00, '2026-01-25 03:19:01', '2026-01-25 03:19:01');
INSERT INTO public.ventas_detalle VALUES (170, 89, 6, 2, 310000.00, 620000.00, '2026-01-25 03:19:01', '2026-01-25 03:19:01');
INSERT INTO public.ventas_detalle VALUES (171, 89, 7, 3, 160000.00, 480000.00, '2026-01-25 03:19:01', '2026-01-25 03:19:01');
INSERT INTO public.ventas_detalle VALUES (172, 90, 16, 1, 380000.00, 380000.00, '2024-10-07 22:19:01', '2024-10-07 22:19:01');
INSERT INTO public.ventas_detalle VALUES (173, 90, 17, 1, 350000.00, 350000.00, '2024-10-07 22:19:01', '2024-10-07 22:19:01');
INSERT INTO public.ventas_detalle VALUES (174, 91, 2, 2, 210000.00, 420000.00, '2025-09-21 14:19:01', '2025-09-21 14:19:01');
INSERT INTO public.ventas_detalle VALUES (175, 92, 6, 1, 310000.00, 310000.00, '2025-06-22 05:19:01', '2025-06-22 05:19:01');
INSERT INTO public.ventas_detalle VALUES (176, 93, 10, 2, 195000.00, 390000.00, '2026-02-26 10:19:01', '2026-02-26 10:19:01');
INSERT INTO public.ventas_detalle VALUES (177, 93, 14, 3, 290000.00, 870000.00, '2026-02-26 10:19:01', '2026-02-26 10:19:01');
INSERT INTO public.ventas_detalle VALUES (178, 93, 16, 3, 380000.00, 1140000.00, '2026-02-26 10:19:01', '2026-02-26 10:19:01');
INSERT INTO public.ventas_detalle VALUES (179, 94, 8, 1, 175000.00, 175000.00, '2024-10-23 11:19:01', '2024-10-23 11:19:01');
INSERT INTO public.ventas_detalle VALUES (180, 95, 1, 1, 250000.00, 250000.00, '2024-10-30 03:19:01', '2024-10-30 03:19:01');
INSERT INTO public.ventas_detalle VALUES (181, 95, 7, 2, 160000.00, 320000.00, '2024-10-30 03:19:01', '2024-10-30 03:19:01');
INSERT INTO public.ventas_detalle VALUES (182, 95, 14, 3, 290000.00, 870000.00, '2024-10-30 03:19:01', '2024-10-30 03:19:01');
INSERT INTO public.ventas_detalle VALUES (183, 96, 8, 3, 175000.00, 525000.00, '2025-07-20 01:19:01', '2025-07-20 01:19:01');
INSERT INTO public.ventas_detalle VALUES (184, 96, 9, 1, 220000.00, 220000.00, '2025-07-20 01:19:01', '2025-07-20 01:19:01');
INSERT INTO public.ventas_detalle VALUES (185, 97, 2, 2, 210000.00, 420000.00, '2025-10-25 11:19:01', '2025-10-25 11:19:01');
INSERT INTO public.ventas_detalle VALUES (186, 97, 11, 3, 150000.00, 450000.00, '2025-10-25 11:19:01', '2025-10-25 11:19:01');
INSERT INTO public.ventas_detalle VALUES (187, 98, 1, 2, 250000.00, 500000.00, '2023-09-13 06:19:01', '2023-09-13 06:19:01');
INSERT INTO public.ventas_detalle VALUES (188, 98, 11, 3, 150000.00, 450000.00, '2023-09-13 06:19:01', '2023-09-13 06:19:01');
INSERT INTO public.ventas_detalle VALUES (189, 98, 16, 2, 380000.00, 760000.00, '2023-09-13 06:19:01', '2023-09-13 06:19:01');
INSERT INTO public.ventas_detalle VALUES (190, 99, 10, 3, 195000.00, 585000.00, '2025-11-09 20:19:01', '2025-11-09 20:19:01');
INSERT INTO public.ventas_detalle VALUES (191, 99, 15, 1, 270000.00, 270000.00, '2025-11-09 20:19:01', '2025-11-09 20:19:01');
INSERT INTO public.ventas_detalle VALUES (192, 100, 14, 3, 290000.00, 870000.00, '2023-09-28 11:19:01', '2023-09-28 11:19:01');
INSERT INTO public.ventas_detalle VALUES (193, 100, 17, 3, 350000.00, 1050000.00, '2023-09-28 11:19:01', '2023-09-28 11:19:01');
INSERT INTO public.ventas_detalle VALUES (194, 101, 3, 2, 180000.00, 360000.00, '2024-10-13 12:19:01', '2024-10-13 12:19:01');
INSERT INTO public.ventas_detalle VALUES (195, 101, 10, 3, 195000.00, 585000.00, '2024-10-13 12:19:01', '2024-10-13 12:19:01');
INSERT INTO public.ventas_detalle VALUES (196, 102, 3, 2, 180000.00, 360000.00, '2023-12-30 05:19:01', '2023-12-30 05:19:01');
INSERT INTO public.ventas_detalle VALUES (197, 102, 11, 2, 150000.00, 300000.00, '2023-12-30 05:19:01', '2023-12-30 05:19:01');
INSERT INTO public.ventas_detalle VALUES (198, 102, 17, 2, 350000.00, 700000.00, '2023-12-30 05:19:01', '2023-12-30 05:19:01');
INSERT INTO public.ventas_detalle VALUES (199, 103, 17, 1, 350000.00, 350000.00, '2023-11-16 02:19:01', '2023-11-16 02:19:01');
INSERT INTO public.ventas_detalle VALUES (200, 104, 16, 2, 380000.00, 760000.00, '2025-06-07 09:19:01', '2025-06-07 09:19:01');
INSERT INTO public.ventas_detalle VALUES (201, 105, 15, 1, 270000.00, 270000.00, '2025-03-15 07:19:01', '2025-03-15 07:19:01');
INSERT INTO public.ventas_detalle VALUES (202, 105, 16, 3, 380000.00, 1140000.00, '2025-03-15 07:19:01', '2025-03-15 07:19:01');
INSERT INTO public.ventas_detalle VALUES (203, 106, 6, 3, 310000.00, 930000.00, '2023-11-30 08:19:01', '2023-11-30 08:19:01');
INSERT INTO public.ventas_detalle VALUES (204, 106, 7, 2, 160000.00, 320000.00, '2023-11-30 08:19:01', '2023-11-30 08:19:01');
INSERT INTO public.ventas_detalle VALUES (205, 106, 8, 3, 175000.00, 525000.00, '2023-11-30 08:19:01', '2023-11-30 08:19:01');
INSERT INTO public.ventas_detalle VALUES (206, 107, 1, 1, 250000.00, 250000.00, '2026-05-22 03:19:01', '2026-05-22 03:19:01');
INSERT INTO public.ventas_detalle VALUES (207, 107, 16, 1, 380000.00, 380000.00, '2026-05-22 03:19:01', '2026-05-22 03:19:01');
INSERT INTO public.ventas_detalle VALUES (208, 107, 18, 1, 240000.00, 240000.00, '2026-05-22 03:19:01', '2026-05-22 03:19:01');
INSERT INTO public.ventas_detalle VALUES (209, 108, 2, 3, 210000.00, 630000.00, '2023-07-26 05:19:01', '2023-07-26 05:19:01');
INSERT INTO public.ventas_detalle VALUES (210, 108, 3, 1, 180000.00, 180000.00, '2023-07-26 05:19:01', '2023-07-26 05:19:01');
INSERT INTO public.ventas_detalle VALUES (211, 108, 8, 2, 175000.00, 350000.00, '2023-07-26 05:19:01', '2023-07-26 05:19:01');
INSERT INTO public.ventas_detalle VALUES (212, 109, 10, 3, 195000.00, 585000.00, '2023-12-11 22:19:01', '2023-12-11 22:19:01');
INSERT INTO public.ventas_detalle VALUES (213, 110, 6, 3, 310000.00, 930000.00, '2023-06-28 02:19:01', '2023-06-28 02:19:01');
INSERT INTO public.ventas_detalle VALUES (214, 111, 16, 1, 380000.00, 380000.00, '2024-03-05 07:19:01', '2024-03-05 07:19:01');
INSERT INTO public.ventas_detalle VALUES (215, 111, 18, 3, 240000.00, 720000.00, '2024-03-05 07:19:01', '2024-03-05 07:19:01');
INSERT INTO public.ventas_detalle VALUES (216, 112, 3, 1, 180000.00, 180000.00, '2026-01-11 01:19:01', '2026-01-11 01:19:01');
INSERT INTO public.ventas_detalle VALUES (217, 112, 5, 3, 190000.00, 570000.00, '2026-01-11 01:19:01', '2026-01-11 01:19:01');
INSERT INTO public.ventas_detalle VALUES (218, 112, 16, 1, 380000.00, 380000.00, '2026-01-11 01:19:01', '2026-01-11 01:19:01');
INSERT INTO public.ventas_detalle VALUES (219, 113, 2, 1, 210000.00, 210000.00, '2024-04-29 23:19:01', '2024-04-29 23:19:01');
INSERT INTO public.ventas_detalle VALUES (220, 113, 8, 1, 175000.00, 175000.00, '2024-04-29 23:19:01', '2024-04-29 23:19:01');
INSERT INTO public.ventas_detalle VALUES (221, 113, 15, 1, 270000.00, 270000.00, '2024-04-29 23:19:01', '2024-04-29 23:19:01');
INSERT INTO public.ventas_detalle VALUES (222, 114, 7, 1, 160000.00, 160000.00, '2023-09-25 23:19:01', '2023-09-25 23:19:01');
INSERT INTO public.ventas_detalle VALUES (223, 114, 9, 3, 220000.00, 660000.00, '2023-09-25 23:19:01', '2023-09-25 23:19:01');
INSERT INTO public.ventas_detalle VALUES (224, 114, 18, 3, 240000.00, 720000.00, '2023-09-25 23:19:01', '2023-09-25 23:19:01');
INSERT INTO public.ventas_detalle VALUES (225, 115, 15, 1, 270000.00, 270000.00, '2024-01-26 14:19:01', '2024-01-26 14:19:01');
INSERT INTO public.ventas_detalle VALUES (226, 115, 18, 2, 240000.00, 480000.00, '2024-01-26 14:19:01', '2024-01-26 14:19:01');
INSERT INTO public.ventas_detalle VALUES (227, 116, 5, 3, 190000.00, 570000.00, '2025-05-24 09:19:01', '2025-05-24 09:19:01');
INSERT INTO public.ventas_detalle VALUES (228, 116, 6, 3, 310000.00, 930000.00, '2025-05-24 09:19:01', '2025-05-24 09:19:01');
INSERT INTO public.ventas_detalle VALUES (229, 117, 11, 3, 150000.00, 450000.00, '2024-07-04 23:19:01', '2024-07-04 23:19:01');
INSERT INTO public.ventas_detalle VALUES (230, 117, 15, 2, 270000.00, 540000.00, '2024-07-04 23:19:01', '2024-07-04 23:19:01');
INSERT INTO public.ventas_detalle VALUES (231, 117, 16, 3, 380000.00, 1140000.00, '2024-07-04 23:19:01', '2024-07-04 23:19:01');
INSERT INTO public.ventas_detalle VALUES (232, 118, 11, 2, 150000.00, 300000.00, '2025-03-02 05:19:01', '2025-03-02 05:19:01');
INSERT INTO public.ventas_detalle VALUES (233, 118, 15, 2, 270000.00, 540000.00, '2025-03-02 05:19:01', '2025-03-02 05:19:01');
INSERT INTO public.ventas_detalle VALUES (234, 119, 3, 2, 180000.00, 360000.00, '2023-10-05 23:19:01', '2023-10-05 23:19:01');
INSERT INTO public.ventas_detalle VALUES (235, 119, 6, 1, 310000.00, 310000.00, '2023-10-05 23:19:01', '2023-10-05 23:19:01');
INSERT INTO public.ventas_detalle VALUES (236, 119, 18, 1, 240000.00, 240000.00, '2023-10-05 23:19:01', '2023-10-05 23:19:01');
INSERT INTO public.ventas_detalle VALUES (237, 120, 2, 1, 210000.00, 210000.00, '2025-03-04 01:19:01', '2025-03-04 01:19:01');
INSERT INTO public.ventas_detalle VALUES (238, 120, 8, 2, 175000.00, 350000.00, '2025-03-04 01:19:01', '2025-03-04 01:19:01');
INSERT INTO public.ventas_detalle VALUES (239, 121, 2, 2, 210000.00, 420000.00, '2024-03-01 06:19:01', '2024-03-01 06:19:01');
INSERT INTO public.ventas_detalle VALUES (240, 121, 7, 3, 160000.00, 480000.00, '2024-03-01 06:19:01', '2024-03-01 06:19:01');
INSERT INTO public.ventas_detalle VALUES (241, 121, 9, 3, 220000.00, 660000.00, '2024-03-01 06:19:01', '2024-03-01 06:19:01');
INSERT INTO public.ventas_detalle VALUES (242, 122, 6, 3, 310000.00, 930000.00, '2023-10-28 23:19:01', '2023-10-28 23:19:01');
INSERT INTO public.ventas_detalle VALUES (243, 123, 6, 2, 310000.00, 620000.00, '2025-12-14 23:19:01', '2025-12-14 23:19:01');
INSERT INTO public.ventas_detalle VALUES (244, 123, 10, 3, 195000.00, 585000.00, '2025-12-14 23:19:01', '2025-12-14 23:19:01');
INSERT INTO public.ventas_detalle VALUES (245, 124, 8, 3, 175000.00, 525000.00, '2024-04-20 15:19:01', '2024-04-20 15:19:01');
INSERT INTO public.ventas_detalle VALUES (246, 124, 11, 3, 150000.00, 450000.00, '2024-04-20 15:19:01', '2024-04-20 15:19:01');
INSERT INTO public.ventas_detalle VALUES (247, 124, 16, 3, 380000.00, 1140000.00, '2024-04-20 15:19:01', '2024-04-20 15:19:01');
INSERT INTO public.ventas_detalle VALUES (248, 125, 2, 3, 210000.00, 630000.00, '2025-08-19 22:19:01', '2025-08-19 22:19:01');
INSERT INTO public.ventas_detalle VALUES (249, 125, 15, 1, 270000.00, 270000.00, '2025-08-19 22:19:01', '2025-08-19 22:19:01');
INSERT INTO public.ventas_detalle VALUES (250, 126, 7, 1, 160000.00, 160000.00, '2024-07-19 21:19:01', '2024-07-19 21:19:01');
INSERT INTO public.ventas_detalle VALUES (251, 126, 8, 1, 175000.00, 175000.00, '2024-07-19 21:19:01', '2024-07-19 21:19:01');
INSERT INTO public.ventas_detalle VALUES (252, 127, 8, 2, 175000.00, 350000.00, '2026-03-04 17:19:01', '2026-03-04 17:19:01');
INSERT INTO public.ventas_detalle VALUES (253, 128, 3, 3, 180000.00, 540000.00, '2025-10-09 17:19:01', '2025-10-09 17:19:01');
INSERT INTO public.ventas_detalle VALUES (254, 129, 7, 3, 160000.00, 480000.00, '2024-11-19 02:19:01', '2024-11-19 02:19:01');
INSERT INTO public.ventas_detalle VALUES (255, 129, 14, 2, 290000.00, 580000.00, '2024-11-19 02:19:01', '2024-11-19 02:19:01');
INSERT INTO public.ventas_detalle VALUES (256, 129, 18, 1, 240000.00, 240000.00, '2024-11-19 02:19:01', '2024-11-19 02:19:01');
INSERT INTO public.ventas_detalle VALUES (257, 130, 3, 1, 180000.00, 180000.00, '2024-09-26 07:19:01', '2024-09-26 07:19:01');
INSERT INTO public.ventas_detalle VALUES (258, 130, 12, 1, 205000.00, 205000.00, '2024-09-26 07:19:01', '2024-09-26 07:19:01');
INSERT INTO public.ventas_detalle VALUES (259, 131, 14, 3, 290000.00, 870000.00, '2023-11-16 02:19:01', '2023-11-16 02:19:01');
INSERT INTO public.ventas_detalle VALUES (260, 132, 7, 1, 160000.00, 160000.00, '2024-09-02 03:19:01', '2024-09-02 03:19:01');
INSERT INTO public.ventas_detalle VALUES (261, 132, 10, 2, 195000.00, 390000.00, '2024-09-02 03:19:01', '2024-09-02 03:19:01');
INSERT INTO public.ventas_detalle VALUES (262, 133, 3, 2, 180000.00, 360000.00, '2025-11-17 02:19:01', '2025-11-17 02:19:01');
INSERT INTO public.ventas_detalle VALUES (263, 133, 14, 3, 290000.00, 870000.00, '2025-11-17 02:19:01', '2025-11-17 02:19:01');
INSERT INTO public.ventas_detalle VALUES (264, 134, 15, 1, 270000.00, 270000.00, '2023-12-01 15:19:01', '2023-12-01 15:19:01');
INSERT INTO public.ventas_detalle VALUES (265, 135, 3, 1, 180000.00, 180000.00, '2025-08-08 02:19:01', '2025-08-08 02:19:01');
INSERT INTO public.ventas_detalle VALUES (266, 135, 17, 3, 350000.00, 1050000.00, '2025-08-08 02:19:01', '2025-08-08 02:19:01');
INSERT INTO public.ventas_detalle VALUES (267, 135, 18, 3, 240000.00, 720000.00, '2025-08-08 02:19:01', '2025-08-08 02:19:01');
INSERT INTO public.ventas_detalle VALUES (268, 136, 17, 3, 350000.00, 1050000.00, '2023-09-19 23:19:01', '2023-09-19 23:19:01');
INSERT INTO public.ventas_detalle VALUES (269, 137, 3, 3, 180000.00, 540000.00, '2026-06-10 11:19:01', '2026-06-10 11:19:01');
INSERT INTO public.ventas_detalle VALUES (270, 138, 2, 1, 210000.00, 210000.00, '2025-09-23 22:19:01', '2025-09-23 22:19:01');
INSERT INTO public.ventas_detalle VALUES (271, 138, 11, 1, 150000.00, 150000.00, '2025-09-23 22:19:01', '2025-09-23 22:19:01');
INSERT INTO public.ventas_detalle VALUES (272, 138, 15, 2, 270000.00, 540000.00, '2025-09-23 22:19:01', '2025-09-23 22:19:01');
INSERT INTO public.ventas_detalle VALUES (273, 139, 17, 2, 350000.00, 700000.00, '2024-01-19 15:19:01', '2024-01-19 15:19:01');
INSERT INTO public.ventas_detalle VALUES (274, 140, 2, 3, 210000.00, 630000.00, '2025-01-12 05:19:01', '2025-01-12 05:19:01');
INSERT INTO public.ventas_detalle VALUES (275, 141, 16, 2, 380000.00, 760000.00, '2023-08-25 13:19:01', '2023-08-25 13:19:01');
INSERT INTO public.ventas_detalle VALUES (276, 141, 17, 3, 350000.00, 1050000.00, '2023-08-25 13:19:01', '2023-08-25 13:19:01');
INSERT INTO public.ventas_detalle VALUES (277, 142, 16, 1, 380000.00, 380000.00, '2025-08-05 21:19:01', '2025-08-05 21:19:01');
INSERT INTO public.ventas_detalle VALUES (278, 143, 14, 3, 290000.00, 870000.00, '2023-07-24 11:19:01', '2023-07-24 11:19:01');
INSERT INTO public.ventas_detalle VALUES (279, 144, 7, 2, 160000.00, 320000.00, '2023-12-27 00:19:01', '2023-12-27 00:19:01');
INSERT INTO public.ventas_detalle VALUES (280, 144, 10, 3, 195000.00, 585000.00, '2023-12-27 00:19:01', '2023-12-27 00:19:01');
INSERT INTO public.ventas_detalle VALUES (281, 144, 15, 1, 270000.00, 270000.00, '2023-12-27 00:19:01', '2023-12-27 00:19:01');
INSERT INTO public.ventas_detalle VALUES (282, 145, 2, 1, 210000.00, 210000.00, '2024-02-13 06:19:01', '2024-02-13 06:19:01');
INSERT INTO public.ventas_detalle VALUES (283, 145, 12, 2, 205000.00, 410000.00, '2024-02-13 06:19:01', '2024-02-13 06:19:01');
INSERT INTO public.ventas_detalle VALUES (284, 145, 16, 2, 380000.00, 760000.00, '2024-02-13 06:19:01', '2024-02-13 06:19:01');
INSERT INTO public.ventas_detalle VALUES (285, 146, 3, 1, 180000.00, 180000.00, '2024-05-23 05:19:01', '2024-05-23 05:19:01');
INSERT INTO public.ventas_detalle VALUES (286, 146, 12, 3, 205000.00, 615000.00, '2024-05-23 05:19:01', '2024-05-23 05:19:01');
INSERT INTO public.ventas_detalle VALUES (287, 147, 9, 3, 220000.00, 660000.00, '2025-03-25 10:19:01', '2025-03-25 10:19:01');
INSERT INTO public.ventas_detalle VALUES (288, 147, 10, 1, 195000.00, 195000.00, '2025-03-25 10:19:01', '2025-03-25 10:19:01');
INSERT INTO public.ventas_detalle VALUES (289, 148, 16, 2, 380000.00, 760000.00, '2025-06-05 04:19:01', '2025-06-05 04:19:01');
INSERT INTO public.ventas_detalle VALUES (290, 149, 6, 3, 310000.00, 930000.00, '2026-05-04 07:19:01', '2026-05-04 07:19:01');
INSERT INTO public.ventas_detalle VALUES (291, 149, 15, 2, 270000.00, 540000.00, '2026-05-04 07:19:01', '2026-05-04 07:19:01');
INSERT INTO public.ventas_detalle VALUES (292, 150, 12, 2, 205000.00, 410000.00, '2024-07-13 20:19:01', '2024-07-13 20:19:01');
INSERT INTO public.ventas_detalle VALUES (293, 150, 15, 3, 270000.00, 810000.00, '2024-07-13 20:19:01', '2024-07-13 20:19:01');
INSERT INTO public.ventas_detalle VALUES (294, 150, 18, 1, 240000.00, 240000.00, '2024-07-13 20:19:01', '2024-07-13 20:19:01');
INSERT INTO public.ventas_detalle VALUES (295, 151, 14, 3, 290000.00, 870000.00, '2024-04-19 16:19:01', '2024-04-19 16:19:01');
INSERT INTO public.ventas_detalle VALUES (296, 152, 12, 2, 205000.00, 410000.00, '2026-04-27 21:19:01', '2026-04-27 21:19:01');
INSERT INTO public.ventas_detalle VALUES (297, 152, 14, 2, 290000.00, 580000.00, '2026-04-27 21:19:01', '2026-04-27 21:19:01');
INSERT INTO public.ventas_detalle VALUES (298, 153, 15, 3, 270000.00, 810000.00, '2025-10-13 18:19:01', '2025-10-13 18:19:01');
INSERT INTO public.ventas_detalle VALUES (299, 153, 18, 2, 240000.00, 480000.00, '2025-10-13 18:19:01', '2025-10-13 18:19:01');
INSERT INTO public.ventas_detalle VALUES (300, 154, 8, 3, 175000.00, 525000.00, '2024-09-29 05:19:01', '2024-09-29 05:19:01');
INSERT INTO public.ventas_detalle VALUES (301, 154, 15, 2, 270000.00, 540000.00, '2024-09-29 05:19:01', '2024-09-29 05:19:01');
INSERT INTO public.ventas_detalle VALUES (302, 154, 17, 2, 350000.00, 700000.00, '2024-09-29 05:19:01', '2024-09-29 05:19:01');
INSERT INTO public.ventas_detalle VALUES (303, 155, 3, 1, 180000.00, 180000.00, '2025-11-12 11:19:01', '2025-11-12 11:19:01');
INSERT INTO public.ventas_detalle VALUES (304, 155, 11, 3, 150000.00, 450000.00, '2025-11-12 11:19:01', '2025-11-12 11:19:01');
INSERT INTO public.ventas_detalle VALUES (305, 155, 18, 3, 240000.00, 720000.00, '2025-11-12 11:19:01', '2025-11-12 11:19:01');
INSERT INTO public.ventas_detalle VALUES (306, 156, 1, 2, 250000.00, 500000.00, '2026-05-17 02:19:01', '2026-05-17 02:19:01');
INSERT INTO public.ventas_detalle VALUES (307, 156, 8, 3, 175000.00, 525000.00, '2026-05-17 02:19:01', '2026-05-17 02:19:01');
INSERT INTO public.ventas_detalle VALUES (308, 157, 3, 1, 180000.00, 180000.00, '2024-08-19 19:19:01', '2024-08-19 19:19:01');
INSERT INTO public.ventas_detalle VALUES (309, 158, 8, 1, 175000.00, 175000.00, '2024-08-17 11:19:01', '2024-08-17 11:19:01');
INSERT INTO public.ventas_detalle VALUES (310, 158, 16, 2, 380000.00, 760000.00, '2024-08-17 11:19:01', '2024-08-17 11:19:01');
INSERT INTO public.ventas_detalle VALUES (311, 159, 11, 3, 150000.00, 450000.00, '2025-10-08 18:19:01', '2025-10-08 18:19:01');
INSERT INTO public.ventas_detalle VALUES (312, 159, 14, 1, 290000.00, 290000.00, '2025-10-08 18:19:01', '2025-10-08 18:19:01');
INSERT INTO public.ventas_detalle VALUES (313, 160, 9, 3, 220000.00, 660000.00, '2025-10-05 16:19:01', '2025-10-05 16:19:01');
INSERT INTO public.ventas_detalle VALUES (314, 160, 15, 2, 270000.00, 540000.00, '2025-10-05 16:19:01', '2025-10-05 16:19:01');
INSERT INTO public.ventas_detalle VALUES (315, 161, 18, 1, 240000.00, 240000.00, '2026-04-04 11:19:01', '2026-04-04 11:19:01');
INSERT INTO public.ventas_detalle VALUES (316, 162, 7, 3, 160000.00, 480000.00, '2026-06-02 15:19:01', '2026-06-02 15:19:01');
INSERT INTO public.ventas_detalle VALUES (317, 162, 14, 2, 290000.00, 580000.00, '2026-06-02 15:19:01', '2026-06-02 15:19:01');
INSERT INTO public.ventas_detalle VALUES (318, 162, 15, 2, 270000.00, 540000.00, '2026-06-02 15:19:01', '2026-06-02 15:19:01');
INSERT INTO public.ventas_detalle VALUES (319, 163, 11, 1, 150000.00, 150000.00, '2024-02-22 12:19:01', '2024-02-22 12:19:01');
INSERT INTO public.ventas_detalle VALUES (320, 164, 3, 3, 180000.00, 540000.00, '2026-01-25 20:19:01', '2026-01-25 20:19:01');
INSERT INTO public.ventas_detalle VALUES (321, 164, 15, 1, 270000.00, 270000.00, '2026-01-25 20:19:01', '2026-01-25 20:19:01');
INSERT INTO public.ventas_detalle VALUES (322, 164, 16, 2, 380000.00, 760000.00, '2026-01-25 20:19:01', '2026-01-25 20:19:01');
INSERT INTO public.ventas_detalle VALUES (323, 165, 15, 1, 270000.00, 270000.00, '2023-07-14 06:19:01', '2023-07-14 06:19:01');
INSERT INTO public.ventas_detalle VALUES (324, 165, 17, 1, 350000.00, 350000.00, '2023-07-14 06:19:01', '2023-07-14 06:19:01');
INSERT INTO public.ventas_detalle VALUES (325, 166, 14, 3, 290000.00, 870000.00, '2024-08-04 04:19:01', '2024-08-04 04:19:01');
INSERT INTO public.ventas_detalle VALUES (326, 166, 18, 2, 240000.00, 480000.00, '2024-08-04 04:19:01', '2024-08-04 04:19:01');
INSERT INTO public.ventas_detalle VALUES (327, 167, 12, 1, 205000.00, 205000.00, '2025-02-14 09:19:01', '2025-02-14 09:19:01');
INSERT INTO public.ventas_detalle VALUES (328, 167, 18, 1, 240000.00, 240000.00, '2025-02-14 09:19:01', '2025-02-14 09:19:01');
INSERT INTO public.ventas_detalle VALUES (329, 168, 14, 3, 290000.00, 870000.00, '2025-03-03 06:19:01', '2025-03-03 06:19:01');
INSERT INTO public.ventas_detalle VALUES (330, 169, 3, 2, 180000.00, 360000.00, '2024-06-11 06:19:01', '2024-06-11 06:19:01');
INSERT INTO public.ventas_detalle VALUES (331, 169, 10, 3, 195000.00, 585000.00, '2024-06-11 06:19:01', '2024-06-11 06:19:01');
INSERT INTO public.ventas_detalle VALUES (332, 169, 16, 2, 380000.00, 760000.00, '2024-06-11 06:19:01', '2024-06-11 06:19:01');
INSERT INTO public.ventas_detalle VALUES (333, 170, 2, 2, 210000.00, 420000.00, '2024-12-31 14:19:01', '2024-12-31 14:19:01');
INSERT INTO public.ventas_detalle VALUES (334, 170, 18, 2, 240000.00, 480000.00, '2024-12-31 14:19:01', '2024-12-31 14:19:01');
INSERT INTO public.ventas_detalle VALUES (335, 171, 1, 3, 250000.00, 750000.00, '2026-01-14 19:19:01', '2026-01-14 19:19:01');
INSERT INTO public.ventas_detalle VALUES (336, 171, 5, 2, 190000.00, 380000.00, '2026-01-14 19:19:01', '2026-01-14 19:19:01');
INSERT INTO public.ventas_detalle VALUES (337, 171, 7, 3, 160000.00, 480000.00, '2026-01-14 19:19:01', '2026-01-14 19:19:01');
INSERT INTO public.ventas_detalle VALUES (338, 172, 12, 3, 205000.00, 615000.00, '2026-01-04 20:19:01', '2026-01-04 20:19:01');
INSERT INTO public.ventas_detalle VALUES (339, 172, 18, 1, 240000.00, 240000.00, '2026-01-04 20:19:01', '2026-01-04 20:19:01');
INSERT INTO public.ventas_detalle VALUES (340, 173, 9, 2, 220000.00, 440000.00, '2025-05-15 16:19:01', '2025-05-15 16:19:01');
INSERT INTO public.ventas_detalle VALUES (341, 173, 14, 1, 290000.00, 290000.00, '2025-05-15 16:19:01', '2025-05-15 16:19:01');
INSERT INTO public.ventas_detalle VALUES (342, 174, 8, 2, 175000.00, 350000.00, '2025-06-14 17:19:01', '2025-06-14 17:19:01');
INSERT INTO public.ventas_detalle VALUES (343, 174, 10, 1, 195000.00, 195000.00, '2025-06-14 17:19:01', '2025-06-14 17:19:01');
INSERT INTO public.ventas_detalle VALUES (344, 174, 18, 3, 240000.00, 720000.00, '2025-06-14 17:19:01', '2025-06-14 17:19:01');
INSERT INTO public.ventas_detalle VALUES (345, 175, 5, 3, 190000.00, 570000.00, '2025-06-28 15:19:01', '2025-06-28 15:19:01');
INSERT INTO public.ventas_detalle VALUES (346, 175, 7, 1, 160000.00, 160000.00, '2025-06-28 15:19:01', '2025-06-28 15:19:01');
INSERT INTO public.ventas_detalle VALUES (347, 175, 14, 1, 290000.00, 290000.00, '2025-06-28 15:19:01', '2025-06-28 15:19:01');
INSERT INTO public.ventas_detalle VALUES (348, 176, 18, 1, 240000.00, 240000.00, '2025-03-03 08:19:01', '2025-03-03 08:19:01');
INSERT INTO public.ventas_detalle VALUES (349, 177, 16, 1, 380000.00, 380000.00, '2025-12-26 20:19:01', '2025-12-26 20:19:01');
INSERT INTO public.ventas_detalle VALUES (350, 177, 18, 2, 240000.00, 480000.00, '2025-12-26 20:19:01', '2025-12-26 20:19:01');
INSERT INTO public.ventas_detalle VALUES (351, 178, 8, 2, 175000.00, 350000.00, '2026-06-09 05:19:01', '2026-06-09 05:19:01');
INSERT INTO public.ventas_detalle VALUES (352, 178, 15, 3, 270000.00, 810000.00, '2026-06-09 05:19:01', '2026-06-09 05:19:01');
INSERT INTO public.ventas_detalle VALUES (353, 179, 3, 3, 180000.00, 540000.00, '2024-09-12 05:19:01', '2024-09-12 05:19:01');
INSERT INTO public.ventas_detalle VALUES (354, 180, 2, 2, 210000.00, 420000.00, '2026-05-31 14:19:01', '2026-05-31 14:19:01');
INSERT INTO public.ventas_detalle VALUES (355, 181, 7, 3, 160000.00, 480000.00, '2024-10-12 03:19:01', '2024-10-12 03:19:01');
INSERT INTO public.ventas_detalle VALUES (356, 181, 14, 2, 290000.00, 580000.00, '2024-10-12 03:19:01', '2024-10-12 03:19:01');
INSERT INTO public.ventas_detalle VALUES (357, 182, 7, 1, 160000.00, 160000.00, '2025-05-22 14:19:01', '2025-05-22 14:19:01');
INSERT INTO public.ventas_detalle VALUES (358, 183, 10, 2, 195000.00, 390000.00, '2024-05-23 16:19:01', '2024-05-23 16:19:01');
INSERT INTO public.ventas_detalle VALUES (359, 183, 11, 2, 150000.00, 300000.00, '2024-05-23 16:19:01', '2024-05-23 16:19:01');
INSERT INTO public.ventas_detalle VALUES (360, 183, 15, 2, 270000.00, 540000.00, '2024-05-23 16:19:01', '2024-05-23 16:19:01');
INSERT INTO public.ventas_detalle VALUES (361, 184, 3, 3, 180000.00, 540000.00, '2024-09-01 22:19:01', '2024-09-01 22:19:01');
INSERT INTO public.ventas_detalle VALUES (362, 185, 3, 2, 180000.00, 360000.00, '2024-08-05 16:19:01', '2024-08-05 16:19:01');
INSERT INTO public.ventas_detalle VALUES (363, 185, 8, 2, 175000.00, 350000.00, '2024-08-05 16:19:01', '2024-08-05 16:19:01');
INSERT INTO public.ventas_detalle VALUES (364, 185, 18, 1, 240000.00, 240000.00, '2024-08-05 16:19:01', '2024-08-05 16:19:01');
INSERT INTO public.ventas_detalle VALUES (365, 186, 1, 2, 250000.00, 500000.00, '2026-01-26 04:19:01', '2026-01-26 04:19:01');
INSERT INTO public.ventas_detalle VALUES (366, 186, 10, 1, 195000.00, 195000.00, '2026-01-26 04:19:01', '2026-01-26 04:19:01');
INSERT INTO public.ventas_detalle VALUES (367, 187, 15, 3, 270000.00, 810000.00, '2024-04-09 12:19:01', '2024-04-09 12:19:01');
INSERT INTO public.ventas_detalle VALUES (368, 187, 18, 1, 240000.00, 240000.00, '2024-04-09 12:19:01', '2024-04-09 12:19:01');
INSERT INTO public.ventas_detalle VALUES (369, 188, 11, 1, 150000.00, 150000.00, '2023-09-17 01:19:01', '2023-09-17 01:19:01');
INSERT INTO public.ventas_detalle VALUES (370, 188, 15, 3, 270000.00, 810000.00, '2023-09-17 01:19:01', '2023-09-17 01:19:01');
INSERT INTO public.ventas_detalle VALUES (371, 188, 17, 3, 350000.00, 1050000.00, '2023-09-17 01:19:01', '2023-09-17 01:19:01');
INSERT INTO public.ventas_detalle VALUES (372, 189, 1, 2, 250000.00, 500000.00, '2024-12-26 02:19:01', '2024-12-26 02:19:01');
INSERT INTO public.ventas_detalle VALUES (373, 189, 3, 1, 180000.00, 180000.00, '2024-12-26 02:19:01', '2024-12-26 02:19:01');
INSERT INTO public.ventas_detalle VALUES (374, 190, 11, 1, 150000.00, 150000.00, '2024-03-28 20:19:01', '2024-03-28 20:19:01');
INSERT INTO public.ventas_detalle VALUES (375, 190, 15, 3, 270000.00, 810000.00, '2024-03-28 20:19:01', '2024-03-28 20:19:01');
INSERT INTO public.ventas_detalle VALUES (376, 190, 17, 3, 350000.00, 1050000.00, '2024-03-28 20:19:01', '2024-03-28 20:19:01');
INSERT INTO public.ventas_detalle VALUES (377, 191, 5, 3, 190000.00, 570000.00, '2025-03-19 12:19:01', '2025-03-19 12:19:01');
INSERT INTO public.ventas_detalle VALUES (378, 191, 8, 2, 175000.00, 350000.00, '2025-03-19 12:19:01', '2025-03-19 12:19:01');
INSERT INTO public.ventas_detalle VALUES (379, 192, 9, 3, 220000.00, 660000.00, '2025-06-17 06:19:01', '2025-06-17 06:19:01');
INSERT INTO public.ventas_detalle VALUES (380, 192, 10, 3, 195000.00, 585000.00, '2025-06-17 06:19:01', '2025-06-17 06:19:01');
INSERT INTO public.ventas_detalle VALUES (381, 192, 17, 3, 350000.00, 1050000.00, '2025-06-17 06:19:01', '2025-06-17 06:19:01');
INSERT INTO public.ventas_detalle VALUES (382, 193, 2, 2, 210000.00, 420000.00, '2025-08-27 17:19:01', '2025-08-27 17:19:01');
INSERT INTO public.ventas_detalle VALUES (383, 193, 3, 2, 180000.00, 360000.00, '2025-08-27 17:19:01', '2025-08-27 17:19:01');
INSERT INTO public.ventas_detalle VALUES (384, 193, 11, 1, 150000.00, 150000.00, '2025-08-27 17:19:01', '2025-08-27 17:19:01');
INSERT INTO public.ventas_detalle VALUES (385, 194, 2, 1, 210000.00, 210000.00, '2024-01-11 00:19:01', '2024-01-11 00:19:01');
INSERT INTO public.ventas_detalle VALUES (386, 195, 3, 2, 180000.00, 360000.00, '2026-04-05 19:19:01', '2026-04-05 19:19:01');
INSERT INTO public.ventas_detalle VALUES (387, 195, 15, 2, 270000.00, 540000.00, '2026-04-05 19:19:01', '2026-04-05 19:19:01');
INSERT INTO public.ventas_detalle VALUES (388, 196, 6, 1, 310000.00, 310000.00, '2024-04-07 18:19:01', '2024-04-07 18:19:01');
INSERT INTO public.ventas_detalle VALUES (389, 196, 8, 3, 175000.00, 525000.00, '2024-04-07 18:19:01', '2024-04-07 18:19:01');
INSERT INTO public.ventas_detalle VALUES (390, 196, 15, 2, 270000.00, 540000.00, '2024-04-07 18:19:01', '2024-04-07 18:19:01');
INSERT INTO public.ventas_detalle VALUES (391, 197, 1, 1, 250000.00, 250000.00, '2023-07-01 14:19:01', '2023-07-01 14:19:01');
INSERT INTO public.ventas_detalle VALUES (392, 197, 8, 2, 175000.00, 350000.00, '2023-07-01 14:19:01', '2023-07-01 14:19:01');
INSERT INTO public.ventas_detalle VALUES (393, 197, 18, 1, 240000.00, 240000.00, '2023-07-01 14:19:01', '2023-07-01 14:19:01');
INSERT INTO public.ventas_detalle VALUES (394, 198, 3, 1, 180000.00, 180000.00, '2024-08-17 04:19:01', '2024-08-17 04:19:01');
INSERT INTO public.ventas_detalle VALUES (395, 199, 7, 3, 160000.00, 480000.00, '2025-06-06 12:19:01', '2025-06-06 12:19:01');
INSERT INTO public.ventas_detalle VALUES (396, 199, 11, 1, 150000.00, 150000.00, '2025-06-06 12:19:01', '2025-06-06 12:19:01');
INSERT INTO public.ventas_detalle VALUES (397, 199, 17, 3, 350000.00, 1050000.00, '2025-06-06 12:19:01', '2025-06-06 12:19:01');
INSERT INTO public.ventas_detalle VALUES (398, 200, 5, 3, 190000.00, 570000.00, '2025-09-26 19:19:01', '2025-09-26 19:19:01');
INSERT INTO public.ventas_detalle VALUES (399, 200, 12, 2, 205000.00, 410000.00, '2025-09-26 19:19:01', '2025-09-26 19:19:01');
INSERT INTO public.ventas_detalle VALUES (400, 201, 2, 2, 210000.00, 420000.00, '2026-06-13 20:19:01', '2026-06-13 20:19:01');
INSERT INTO public.ventas_detalle VALUES (401, 201, 3, 1, 180000.00, 180000.00, '2026-06-13 20:19:01', '2026-06-13 20:19:01');
INSERT INTO public.ventas_detalle VALUES (402, 201, 12, 2, 205000.00, 410000.00, '2026-06-13 20:19:01', '2026-06-13 20:19:01');
INSERT INTO public.ventas_detalle VALUES (403, 202, 6, 3, 310000.00, 930000.00, '2025-08-13 07:19:01', '2025-08-13 07:19:01');
INSERT INTO public.ventas_detalle VALUES (404, 202, 7, 3, 160000.00, 480000.00, '2025-08-13 07:19:01', '2025-08-13 07:19:01');
INSERT INTO public.ventas_detalle VALUES (405, 202, 18, 1, 240000.00, 240000.00, '2025-08-13 07:19:01', '2025-08-13 07:19:01');
INSERT INTO public.ventas_detalle VALUES (406, 203, 15, 3, 270000.00, 810000.00, '2025-08-12 15:19:01', '2025-08-12 15:19:01');
INSERT INTO public.ventas_detalle VALUES (407, 204, 2, 1, 210000.00, 210000.00, '2025-04-02 02:19:01', '2025-04-02 02:19:01');
INSERT INTO public.ventas_detalle VALUES (408, 204, 10, 3, 195000.00, 585000.00, '2025-04-02 02:19:01', '2025-04-02 02:19:01');
INSERT INTO public.ventas_detalle VALUES (409, 205, 8, 2, 175000.00, 350000.00, '2024-08-08 21:19:01', '2024-08-08 21:19:01');
INSERT INTO public.ventas_detalle VALUES (410, 205, 15, 3, 270000.00, 810000.00, '2024-08-08 21:19:01', '2024-08-08 21:19:01');
INSERT INTO public.ventas_detalle VALUES (411, 206, 7, 2, 160000.00, 320000.00, '2026-06-06 01:19:01', '2026-06-06 01:19:01');
INSERT INTO public.ventas_detalle VALUES (412, 206, 14, 1, 290000.00, 290000.00, '2026-06-06 01:19:01', '2026-06-06 01:19:01');
INSERT INTO public.ventas_detalle VALUES (413, 206, 15, 3, 270000.00, 810000.00, '2026-06-06 01:19:01', '2026-06-06 01:19:01');
INSERT INTO public.ventas_detalle VALUES (414, 207, 5, 3, 190000.00, 570000.00, '2024-02-27 14:19:01', '2024-02-27 14:19:01');
INSERT INTO public.ventas_detalle VALUES (415, 207, 6, 1, 310000.00, 310000.00, '2024-02-27 14:19:01', '2024-02-27 14:19:01');
INSERT INTO public.ventas_detalle VALUES (416, 207, 10, 3, 195000.00, 585000.00, '2024-02-27 14:19:01', '2024-02-27 14:19:01');
INSERT INTO public.ventas_detalle VALUES (417, 208, 9, 2, 220000.00, 440000.00, '2023-11-27 20:19:01', '2023-11-27 20:19:01');
INSERT INTO public.ventas_detalle VALUES (418, 208, 10, 3, 195000.00, 585000.00, '2023-11-27 20:19:01', '2023-11-27 20:19:01');
INSERT INTO public.ventas_detalle VALUES (419, 208, 17, 1, 350000.00, 350000.00, '2023-11-27 20:19:01', '2023-11-27 20:19:01');
INSERT INTO public.ventas_detalle VALUES (420, 209, 11, 3, 150000.00, 450000.00, '2023-07-12 19:19:01', '2023-07-12 19:19:01');
INSERT INTO public.ventas_detalle VALUES (421, 209, 16, 2, 380000.00, 760000.00, '2023-07-12 19:19:01', '2023-07-12 19:19:01');
INSERT INTO public.ventas_detalle VALUES (422, 209, 17, 2, 350000.00, 700000.00, '2023-07-12 19:19:01', '2023-07-12 19:19:01');
INSERT INTO public.ventas_detalle VALUES (423, 210, 7, 3, 160000.00, 480000.00, '2024-01-15 08:19:01', '2024-01-15 08:19:01');
INSERT INTO public.ventas_detalle VALUES (424, 211, 3, 3, 180000.00, 540000.00, '2025-10-17 02:19:01', '2025-10-17 02:19:01');
INSERT INTO public.ventas_detalle VALUES (425, 212, 2, 1, 210000.00, 210000.00, '2025-03-17 00:19:01', '2025-03-17 00:19:01');
INSERT INTO public.ventas_detalle VALUES (426, 212, 8, 1, 175000.00, 175000.00, '2025-03-17 00:19:01', '2025-03-17 00:19:01');
INSERT INTO public.ventas_detalle VALUES (427, 212, 15, 2, 270000.00, 540000.00, '2025-03-17 00:19:01', '2025-03-17 00:19:01');
INSERT INTO public.ventas_detalle VALUES (428, 213, 3, 1, 180000.00, 180000.00, '2025-03-18 04:19:01', '2025-03-18 04:19:01');
INSERT INTO public.ventas_detalle VALUES (429, 213, 7, 2, 160000.00, 320000.00, '2025-03-18 04:19:01', '2025-03-18 04:19:01');
INSERT INTO public.ventas_detalle VALUES (430, 214, 1, 3, 250000.00, 750000.00, '2025-09-16 07:19:01', '2025-09-16 07:19:01');
INSERT INTO public.ventas_detalle VALUES (431, 214, 2, 2, 210000.00, 420000.00, '2025-09-16 07:19:01', '2025-09-16 07:19:01');
INSERT INTO public.ventas_detalle VALUES (432, 214, 3, 3, 180000.00, 540000.00, '2025-09-16 07:19:01', '2025-09-16 07:19:01');
INSERT INTO public.ventas_detalle VALUES (433, 215, 2, 2, 210000.00, 420000.00, '2023-07-13 03:19:01', '2023-07-13 03:19:01');
INSERT INTO public.ventas_detalle VALUES (434, 216, 14, 1, 290000.00, 290000.00, '2024-10-31 15:19:02', '2024-10-31 15:19:02');
INSERT INTO public.ventas_detalle VALUES (435, 216, 15, 1, 270000.00, 270000.00, '2024-10-31 15:19:02', '2024-10-31 15:19:02');
INSERT INTO public.ventas_detalle VALUES (436, 217, 8, 2, 175000.00, 350000.00, '2024-10-15 01:19:02', '2024-10-15 01:19:02');
INSERT INTO public.ventas_detalle VALUES (437, 217, 10, 3, 195000.00, 585000.00, '2024-10-15 01:19:02', '2024-10-15 01:19:02');
INSERT INTO public.ventas_detalle VALUES (438, 217, 16, 2, 380000.00, 760000.00, '2024-10-15 01:19:02', '2024-10-15 01:19:02');
INSERT INTO public.ventas_detalle VALUES (439, 218, 2, 2, 210000.00, 420000.00, '2025-02-22 20:19:02', '2025-02-22 20:19:02');
INSERT INTO public.ventas_detalle VALUES (440, 218, 10, 1, 195000.00, 195000.00, '2025-02-22 20:19:02', '2025-02-22 20:19:02');
INSERT INTO public.ventas_detalle VALUES (441, 218, 15, 3, 270000.00, 810000.00, '2025-02-22 20:19:02', '2025-02-22 20:19:02');
INSERT INTO public.ventas_detalle VALUES (442, 219, 7, 1, 160000.00, 160000.00, '2023-09-01 08:19:02', '2023-09-01 08:19:02');
INSERT INTO public.ventas_detalle VALUES (443, 220, 17, 1, 350000.00, 350000.00, '2026-04-25 05:19:02', '2026-04-25 05:19:02');
INSERT INTO public.ventas_detalle VALUES (444, 221, 7, 2, 160000.00, 320000.00, '2024-07-26 14:19:02', '2024-07-26 14:19:02');
INSERT INTO public.ventas_detalle VALUES (445, 221, 10, 1, 195000.00, 195000.00, '2024-07-26 14:19:02', '2024-07-26 14:19:02');
INSERT INTO public.ventas_detalle VALUES (446, 222, 2, 2, 210000.00, 420000.00, '2023-09-09 04:19:02', '2023-09-09 04:19:02');
INSERT INTO public.ventas_detalle VALUES (447, 222, 16, 3, 380000.00, 1140000.00, '2023-09-09 04:19:02', '2023-09-09 04:19:02');
INSERT INTO public.ventas_detalle VALUES (448, 223, 3, 1, 180000.00, 180000.00, '2025-11-05 07:19:02', '2025-11-05 07:19:02');
INSERT INTO public.ventas_detalle VALUES (449, 223, 15, 1, 270000.00, 270000.00, '2025-11-05 07:19:02', '2025-11-05 07:19:02');
INSERT INTO public.ventas_detalle VALUES (450, 224, 6, 1, 310000.00, 310000.00, '2024-06-06 04:19:02', '2024-06-06 04:19:02');
INSERT INTO public.ventas_detalle VALUES (451, 225, 3, 1, 180000.00, 180000.00, '2025-12-13 07:19:02', '2025-12-13 07:19:02');
INSERT INTO public.ventas_detalle VALUES (452, 225, 6, 2, 310000.00, 620000.00, '2025-12-13 07:19:02', '2025-12-13 07:19:02');
INSERT INTO public.ventas_detalle VALUES (453, 225, 12, 2, 205000.00, 410000.00, '2025-12-13 07:19:02', '2025-12-13 07:19:02');
INSERT INTO public.ventas_detalle VALUES (454, 226, 15, 1, 270000.00, 270000.00, '2023-10-10 08:19:02', '2023-10-10 08:19:02');
INSERT INTO public.ventas_detalle VALUES (455, 227, 9, 3, 220000.00, 660000.00, '2024-12-18 17:19:02', '2024-12-18 17:19:02');
INSERT INTO public.ventas_detalle VALUES (456, 227, 16, 1, 380000.00, 380000.00, '2024-12-18 17:19:02', '2024-12-18 17:19:02');
INSERT INTO public.ventas_detalle VALUES (457, 228, 1, 3, 250000.00, 750000.00, '2025-12-25 15:19:02', '2025-12-25 15:19:02');
INSERT INTO public.ventas_detalle VALUES (458, 228, 2, 3, 210000.00, 630000.00, '2025-12-25 15:19:02', '2025-12-25 15:19:02');
INSERT INTO public.ventas_detalle VALUES (459, 229, 2, 2, 210000.00, 420000.00, '2024-09-28 16:19:02', '2024-09-28 16:19:02');
INSERT INTO public.ventas_detalle VALUES (460, 230, 2, 2, 210000.00, 420000.00, '2025-07-06 21:19:02', '2025-07-06 21:19:02');
INSERT INTO public.ventas_detalle VALUES (461, 230, 11, 2, 150000.00, 300000.00, '2025-07-06 21:19:02', '2025-07-06 21:19:02');
INSERT INTO public.ventas_detalle VALUES (462, 231, 8, 1, 175000.00, 175000.00, '2025-05-08 21:19:02', '2025-05-08 21:19:02');
INSERT INTO public.ventas_detalle VALUES (463, 232, 7, 1, 160000.00, 160000.00, '2025-02-05 13:19:02', '2025-02-05 13:19:02');
INSERT INTO public.ventas_detalle VALUES (464, 233, 3, 2, 180000.00, 360000.00, '2025-10-10 14:19:02', '2025-10-10 14:19:02');
INSERT INTO public.ventas_detalle VALUES (465, 233, 9, 3, 220000.00, 660000.00, '2025-10-10 14:19:02', '2025-10-10 14:19:02');
INSERT INTO public.ventas_detalle VALUES (466, 234, 2, 1, 210000.00, 210000.00, '2025-11-13 14:19:02', '2025-11-13 14:19:02');
INSERT INTO public.ventas_detalle VALUES (467, 234, 8, 2, 175000.00, 350000.00, '2025-11-13 14:19:02', '2025-11-13 14:19:02');
INSERT INTO public.ventas_detalle VALUES (468, 234, 18, 2, 240000.00, 480000.00, '2025-11-13 14:19:02', '2025-11-13 14:19:02');
INSERT INTO public.ventas_detalle VALUES (469, 235, 3, 3, 180000.00, 540000.00, '2025-12-29 04:19:02', '2025-12-29 04:19:02');
INSERT INTO public.ventas_detalle VALUES (470, 235, 12, 1, 205000.00, 205000.00, '2025-12-29 04:19:02', '2025-12-29 04:19:02');
INSERT INTO public.ventas_detalle VALUES (471, 235, 17, 1, 350000.00, 350000.00, '2025-12-29 04:19:02', '2025-12-29 04:19:02');
INSERT INTO public.ventas_detalle VALUES (472, 236, 5, 2, 190000.00, 380000.00, '2023-11-27 00:19:02', '2023-11-27 00:19:02');
INSERT INTO public.ventas_detalle VALUES (473, 236, 6, 1, 310000.00, 310000.00, '2023-11-27 00:19:02', '2023-11-27 00:19:02');
INSERT INTO public.ventas_detalle VALUES (474, 237, 18, 3, 240000.00, 720000.00, '2023-10-24 18:19:02', '2023-10-24 18:19:02');
INSERT INTO public.ventas_detalle VALUES (475, 238, 1, 2, 250000.00, 500000.00, '2023-08-01 12:19:02', '2023-08-01 12:19:02');
INSERT INTO public.ventas_detalle VALUES (476, 238, 12, 2, 205000.00, 410000.00, '2023-08-01 12:19:02', '2023-08-01 12:19:02');
INSERT INTO public.ventas_detalle VALUES (477, 239, 1, 2, 250000.00, 500000.00, '2025-08-15 16:19:02', '2025-08-15 16:19:02');
INSERT INTO public.ventas_detalle VALUES (478, 239, 3, 1, 180000.00, 180000.00, '2025-08-15 16:19:02', '2025-08-15 16:19:02');
INSERT INTO public.ventas_detalle VALUES (479, 239, 17, 3, 350000.00, 1050000.00, '2025-08-15 16:19:02', '2025-08-15 16:19:02');
INSERT INTO public.ventas_detalle VALUES (480, 240, 8, 3, 175000.00, 525000.00, '2024-12-21 04:19:02', '2024-12-21 04:19:02');
INSERT INTO public.ventas_detalle VALUES (481, 240, 15, 1, 270000.00, 270000.00, '2024-12-21 04:19:02', '2024-12-21 04:19:02');
INSERT INTO public.ventas_detalle VALUES (482, 240, 18, 1, 240000.00, 240000.00, '2024-12-21 04:19:02', '2024-12-21 04:19:02');
INSERT INTO public.ventas_detalle VALUES (483, 241, 10, 1, 195000.00, 195000.00, '2023-07-07 09:19:02', '2023-07-07 09:19:02');
INSERT INTO public.ventas_detalle VALUES (484, 241, 12, 3, 205000.00, 615000.00, '2023-07-07 09:19:02', '2023-07-07 09:19:02');
INSERT INTO public.ventas_detalle VALUES (485, 241, 15, 3, 270000.00, 810000.00, '2023-07-07 09:19:02', '2023-07-07 09:19:02');
INSERT INTO public.ventas_detalle VALUES (486, 242, 6, 3, 310000.00, 930000.00, '2026-02-27 14:19:02', '2026-02-27 14:19:02');
INSERT INTO public.ventas_detalle VALUES (487, 242, 8, 2, 175000.00, 350000.00, '2026-02-27 14:19:02', '2026-02-27 14:19:02');
INSERT INTO public.ventas_detalle VALUES (488, 243, 8, 3, 175000.00, 525000.00, '2025-01-11 12:19:02', '2025-01-11 12:19:02');
INSERT INTO public.ventas_detalle VALUES (489, 243, 11, 1, 150000.00, 150000.00, '2025-01-11 12:19:02', '2025-01-11 12:19:02');
INSERT INTO public.ventas_detalle VALUES (490, 243, 18, 2, 240000.00, 480000.00, '2025-01-11 12:19:02', '2025-01-11 12:19:02');
INSERT INTO public.ventas_detalle VALUES (491, 244, 1, 2, 250000.00, 500000.00, '2026-01-17 03:19:02', '2026-01-17 03:19:02');
INSERT INTO public.ventas_detalle VALUES (492, 244, 6, 1, 310000.00, 310000.00, '2026-01-17 03:19:02', '2026-01-17 03:19:02');
INSERT INTO public.ventas_detalle VALUES (493, 244, 18, 1, 240000.00, 240000.00, '2026-01-17 03:19:02', '2026-01-17 03:19:02');
INSERT INTO public.ventas_detalle VALUES (494, 245, 12, 2, 205000.00, 410000.00, '2023-10-04 09:19:02', '2023-10-04 09:19:02');
INSERT INTO public.ventas_detalle VALUES (495, 246, 2, 3, 210000.00, 630000.00, '2024-11-04 03:19:02', '2024-11-04 03:19:02');
INSERT INTO public.ventas_detalle VALUES (496, 246, 18, 2, 240000.00, 480000.00, '2024-11-04 03:19:02', '2024-11-04 03:19:02');
INSERT INTO public.ventas_detalle VALUES (497, 247, 9, 3, 220000.00, 660000.00, '2024-05-27 05:19:02', '2024-05-27 05:19:02');
INSERT INTO public.ventas_detalle VALUES (498, 247, 11, 1, 150000.00, 150000.00, '2024-05-27 05:19:02', '2024-05-27 05:19:02');
INSERT INTO public.ventas_detalle VALUES (499, 248, 1, 3, 250000.00, 750000.00, '2025-02-08 22:19:02', '2025-02-08 22:19:02');
INSERT INTO public.ventas_detalle VALUES (500, 248, 8, 2, 175000.00, 350000.00, '2025-02-08 22:19:02', '2025-02-08 22:19:02');
INSERT INTO public.ventas_detalle VALUES (501, 249, 12, 3, 205000.00, 615000.00, '2024-11-27 19:19:02', '2024-11-27 19:19:02');
INSERT INTO public.ventas_detalle VALUES (502, 250, 5, 3, 190000.00, 570000.00, '2026-06-03 06:19:02', '2026-06-03 06:19:02');
INSERT INTO public.ventas_detalle VALUES (503, 250, 6, 3, 310000.00, 930000.00, '2026-06-03 06:19:02', '2026-06-03 06:19:02');
INSERT INTO public.ventas_detalle VALUES (504, 250, 17, 1, 350000.00, 350000.00, '2026-06-03 06:19:02', '2026-06-03 06:19:02');
INSERT INTO public.ventas_detalle VALUES (505, 251, 3, 3, 180000.00, 540000.00, '2025-08-04 02:19:02', '2025-08-04 02:19:02');
INSERT INTO public.ventas_detalle VALUES (506, 251, 9, 3, 220000.00, 660000.00, '2025-08-04 02:19:02', '2025-08-04 02:19:02');
INSERT INTO public.ventas_detalle VALUES (507, 251, 16, 3, 380000.00, 1140000.00, '2025-08-04 02:19:02', '2025-08-04 02:19:02');
INSERT INTO public.ventas_detalle VALUES (508, 252, 3, 1, 180000.00, 180000.00, '2025-06-08 05:19:02', '2025-06-08 05:19:02');
INSERT INTO public.ventas_detalle VALUES (509, 252, 18, 1, 240000.00, 240000.00, '2025-06-08 05:19:02', '2025-06-08 05:19:02');
INSERT INTO public.ventas_detalle VALUES (510, 253, 2, 2, 210000.00, 420000.00, '2024-02-16 16:19:02', '2024-02-16 16:19:02');
INSERT INTO public.ventas_detalle VALUES (511, 253, 6, 1, 310000.00, 310000.00, '2024-02-16 16:19:02', '2024-02-16 16:19:02');
INSERT INTO public.ventas_detalle VALUES (512, 253, 15, 3, 270000.00, 810000.00, '2024-02-16 16:19:02', '2024-02-16 16:19:02');
INSERT INTO public.ventas_detalle VALUES (513, 254, 7, 3, 160000.00, 480000.00, '2024-12-13 04:19:02', '2024-12-13 04:19:02');
INSERT INTO public.ventas_detalle VALUES (514, 254, 15, 1, 270000.00, 270000.00, '2024-12-13 04:19:02', '2024-12-13 04:19:02');
INSERT INTO public.ventas_detalle VALUES (515, 254, 16, 1, 380000.00, 380000.00, '2024-12-13 04:19:02', '2024-12-13 04:19:02');
INSERT INTO public.ventas_detalle VALUES (516, 255, 2, 1, 210000.00, 210000.00, '2024-05-02 15:19:02', '2024-05-02 15:19:02');
INSERT INTO public.ventas_detalle VALUES (517, 255, 10, 3, 195000.00, 585000.00, '2024-05-02 15:19:02', '2024-05-02 15:19:02');
INSERT INTO public.ventas_detalle VALUES (518, 255, 15, 3, 270000.00, 810000.00, '2024-05-02 15:19:02', '2024-05-02 15:19:02');
INSERT INTO public.ventas_detalle VALUES (519, 256, 12, 3, 205000.00, 615000.00, '2023-11-12 15:19:02', '2023-11-12 15:19:02');
INSERT INTO public.ventas_detalle VALUES (520, 257, 1, 3, 250000.00, 750000.00, '2025-06-14 23:19:02', '2025-06-14 23:19:02');
INSERT INTO public.ventas_detalle VALUES (521, 257, 6, 3, 310000.00, 930000.00, '2025-06-14 23:19:02', '2025-06-14 23:19:02');
INSERT INTO public.ventas_detalle VALUES (522, 257, 11, 3, 150000.00, 450000.00, '2025-06-14 23:19:02', '2025-06-14 23:19:02');
INSERT INTO public.ventas_detalle VALUES (523, 258, 1, 2, 250000.00, 500000.00, '2024-04-19 03:19:02', '2024-04-19 03:19:02');
INSERT INTO public.ventas_detalle VALUES (524, 258, 5, 1, 190000.00, 190000.00, '2024-04-19 03:19:02', '2024-04-19 03:19:02');
INSERT INTO public.ventas_detalle VALUES (525, 258, 8, 3, 175000.00, 525000.00, '2024-04-19 03:19:02', '2024-04-19 03:19:02');
INSERT INTO public.ventas_detalle VALUES (526, 259, 8, 2, 175000.00, 350000.00, '2025-10-22 06:19:02', '2025-10-22 06:19:02');
INSERT INTO public.ventas_detalle VALUES (527, 259, 9, 2, 220000.00, 440000.00, '2025-10-22 06:19:02', '2025-10-22 06:19:02');
INSERT INTO public.ventas_detalle VALUES (528, 259, 15, 3, 270000.00, 810000.00, '2025-10-22 06:19:02', '2025-10-22 06:19:02');
INSERT INTO public.ventas_detalle VALUES (529, 260, 2, 2, 210000.00, 420000.00, '2026-05-02 10:19:02', '2026-05-02 10:19:02');
INSERT INTO public.ventas_detalle VALUES (530, 260, 5, 3, 190000.00, 570000.00, '2026-05-02 10:19:02', '2026-05-02 10:19:02');
INSERT INTO public.ventas_detalle VALUES (531, 260, 18, 2, 240000.00, 480000.00, '2026-05-02 10:19:02', '2026-05-02 10:19:02');
INSERT INTO public.ventas_detalle VALUES (532, 261, 5, 1, 190000.00, 190000.00, '2025-01-11 21:19:02', '2025-01-11 21:19:02');
INSERT INTO public.ventas_detalle VALUES (533, 261, 10, 1, 195000.00, 195000.00, '2025-01-11 21:19:02', '2025-01-11 21:19:02');
INSERT INTO public.ventas_detalle VALUES (534, 261, 14, 3, 290000.00, 870000.00, '2025-01-11 21:19:02', '2025-01-11 21:19:02');
INSERT INTO public.ventas_detalle VALUES (535, 262, 5, 1, 190000.00, 190000.00, '2025-04-29 14:19:02', '2025-04-29 14:19:02');
INSERT INTO public.ventas_detalle VALUES (536, 262, 10, 1, 195000.00, 195000.00, '2025-04-29 14:19:02', '2025-04-29 14:19:02');
INSERT INTO public.ventas_detalle VALUES (537, 262, 17, 1, 350000.00, 350000.00, '2025-04-29 14:19:02', '2025-04-29 14:19:02');
INSERT INTO public.ventas_detalle VALUES (538, 263, 1, 2, 250000.00, 500000.00, '2024-12-10 18:19:02', '2024-12-10 18:19:02');
INSERT INTO public.ventas_detalle VALUES (539, 263, 10, 1, 195000.00, 195000.00, '2024-12-10 18:19:02', '2024-12-10 18:19:02');
INSERT INTO public.ventas_detalle VALUES (540, 264, 1, 2, 250000.00, 500000.00, '2023-10-07 00:19:02', '2023-10-07 00:19:02');
INSERT INTO public.ventas_detalle VALUES (541, 265, 17, 3, 350000.00, 1050000.00, '2024-09-19 22:19:02', '2024-09-19 22:19:02');
INSERT INTO public.ventas_detalle VALUES (542, 266, 3, 1, 180000.00, 180000.00, '2023-11-08 15:19:02', '2023-11-08 15:19:02');
INSERT INTO public.ventas_detalle VALUES (543, 266, 6, 1, 310000.00, 310000.00, '2023-11-08 15:19:02', '2023-11-08 15:19:02');
INSERT INTO public.ventas_detalle VALUES (544, 266, 7, 1, 160000.00, 160000.00, '2023-11-08 15:19:02', '2023-11-08 15:19:02');
INSERT INTO public.ventas_detalle VALUES (545, 267, 5, 1, 190000.00, 190000.00, '2025-08-25 03:19:02', '2025-08-25 03:19:02');
INSERT INTO public.ventas_detalle VALUES (546, 267, 17, 2, 350000.00, 700000.00, '2025-08-25 03:19:02', '2025-08-25 03:19:02');
INSERT INTO public.ventas_detalle VALUES (547, 268, 6, 1, 310000.00, 310000.00, '2024-10-23 06:19:02', '2024-10-23 06:19:02');
INSERT INTO public.ventas_detalle VALUES (548, 268, 9, 3, 220000.00, 660000.00, '2024-10-23 06:19:02', '2024-10-23 06:19:02');
INSERT INTO public.ventas_detalle VALUES (549, 268, 16, 3, 380000.00, 1140000.00, '2024-10-23 06:19:02', '2024-10-23 06:19:02');
INSERT INTO public.ventas_detalle VALUES (550, 269, 6, 1, 310000.00, 310000.00, '2024-04-24 13:19:02', '2024-04-24 13:19:02');
INSERT INTO public.ventas_detalle VALUES (551, 269, 17, 2, 350000.00, 700000.00, '2024-04-24 13:19:02', '2024-04-24 13:19:02');
INSERT INTO public.ventas_detalle VALUES (552, 270, 14, 1, 290000.00, 290000.00, '2024-05-10 20:19:02', '2024-05-10 20:19:02');
INSERT INTO public.ventas_detalle VALUES (553, 270, 16, 2, 380000.00, 760000.00, '2024-05-10 20:19:02', '2024-05-10 20:19:02');
INSERT INTO public.ventas_detalle VALUES (554, 270, 18, 2, 240000.00, 480000.00, '2024-05-10 20:19:02', '2024-05-10 20:19:02');
INSERT INTO public.ventas_detalle VALUES (555, 271, 1, 2, 250000.00, 500000.00, '2025-12-21 04:19:02', '2025-12-21 04:19:02');
INSERT INTO public.ventas_detalle VALUES (556, 271, 3, 1, 180000.00, 180000.00, '2025-12-21 04:19:02', '2025-12-21 04:19:02');
INSERT INTO public.ventas_detalle VALUES (557, 271, 15, 2, 270000.00, 540000.00, '2025-12-21 04:19:02', '2025-12-21 04:19:02');
INSERT INTO public.ventas_detalle VALUES (558, 272, 3, 2, 180000.00, 360000.00, '2024-11-01 04:19:02', '2024-11-01 04:19:02');
INSERT INTO public.ventas_detalle VALUES (559, 272, 5, 2, 190000.00, 380000.00, '2024-11-01 04:19:02', '2024-11-01 04:19:02');
INSERT INTO public.ventas_detalle VALUES (560, 272, 9, 3, 220000.00, 660000.00, '2024-11-01 04:19:02', '2024-11-01 04:19:02');
INSERT INTO public.ventas_detalle VALUES (561, 273, 3, 1, 180000.00, 180000.00, '2024-11-11 03:19:02', '2024-11-11 03:19:02');
INSERT INTO public.ventas_detalle VALUES (562, 273, 11, 3, 150000.00, 450000.00, '2024-11-11 03:19:02', '2024-11-11 03:19:02');
INSERT INTO public.ventas_detalle VALUES (563, 274, 10, 3, 195000.00, 585000.00, '2025-07-20 19:19:02', '2025-07-20 19:19:02');
INSERT INTO public.ventas_detalle VALUES (564, 275, 18, 1, 240000.00, 240000.00, '2026-03-03 16:19:02', '2026-03-03 16:19:02');
INSERT INTO public.ventas_detalle VALUES (565, 276, 6, 3, 310000.00, 930000.00, '2025-09-22 18:19:02', '2025-09-22 18:19:02');
INSERT INTO public.ventas_detalle VALUES (566, 276, 8, 3, 175000.00, 525000.00, '2025-09-22 18:19:02', '2025-09-22 18:19:02');
INSERT INTO public.ventas_detalle VALUES (567, 276, 11, 3, 150000.00, 450000.00, '2025-09-22 18:19:02', '2025-09-22 18:19:02');
INSERT INTO public.ventas_detalle VALUES (568, 277, 11, 2, 150000.00, 300000.00, '2026-01-16 11:19:02', '2026-01-16 11:19:02');
INSERT INTO public.ventas_detalle VALUES (569, 277, 12, 3, 205000.00, 615000.00, '2026-01-16 11:19:02', '2026-01-16 11:19:02');
INSERT INTO public.ventas_detalle VALUES (570, 277, 16, 1, 380000.00, 380000.00, '2026-01-16 11:19:02', '2026-01-16 11:19:02');
INSERT INTO public.ventas_detalle VALUES (571, 278, 7, 3, 160000.00, 480000.00, '2025-09-08 06:19:02', '2025-09-08 06:19:02');
INSERT INTO public.ventas_detalle VALUES (572, 278, 10, 1, 195000.00, 195000.00, '2025-09-08 06:19:02', '2025-09-08 06:19:02');
INSERT INTO public.ventas_detalle VALUES (573, 278, 16, 3, 380000.00, 1140000.00, '2025-09-08 06:19:02', '2025-09-08 06:19:02');
INSERT INTO public.ventas_detalle VALUES (574, 279, 1, 3, 250000.00, 750000.00, '2024-09-26 04:19:02', '2024-09-26 04:19:02');
INSERT INTO public.ventas_detalle VALUES (575, 279, 7, 1, 160000.00, 160000.00, '2024-09-26 04:19:02', '2024-09-26 04:19:02');
INSERT INTO public.ventas_detalle VALUES (576, 279, 9, 3, 220000.00, 660000.00, '2024-09-26 04:19:02', '2024-09-26 04:19:02');
INSERT INTO public.ventas_detalle VALUES (577, 280, 8, 1, 175000.00, 175000.00, '2023-07-22 13:19:02', '2023-07-22 13:19:02');
INSERT INTO public.ventas_detalle VALUES (578, 280, 14, 1, 290000.00, 290000.00, '2023-07-22 13:19:02', '2023-07-22 13:19:02');
INSERT INTO public.ventas_detalle VALUES (579, 281, 16, 3, 380000.00, 1140000.00, '2024-03-07 00:19:02', '2024-03-07 00:19:02');
INSERT INTO public.ventas_detalle VALUES (580, 282, 2, 3, 210000.00, 630000.00, '2024-06-02 00:19:02', '2024-06-02 00:19:02');
INSERT INTO public.ventas_detalle VALUES (581, 282, 6, 3, 310000.00, 930000.00, '2024-06-02 00:19:02', '2024-06-02 00:19:02');
INSERT INTO public.ventas_detalle VALUES (582, 282, 17, 3, 350000.00, 1050000.00, '2024-06-02 00:19:02', '2024-06-02 00:19:02');
INSERT INTO public.ventas_detalle VALUES (583, 283, 8, 2, 175000.00, 350000.00, '2024-01-05 10:19:02', '2024-01-05 10:19:02');
INSERT INTO public.ventas_detalle VALUES (584, 283, 18, 3, 240000.00, 720000.00, '2024-01-05 10:19:02', '2024-01-05 10:19:02');
INSERT INTO public.ventas_detalle VALUES (585, 284, 6, 3, 310000.00, 930000.00, '2025-01-05 05:19:02', '2025-01-05 05:19:02');
INSERT INTO public.ventas_detalle VALUES (586, 284, 11, 1, 150000.00, 150000.00, '2025-01-05 05:19:02', '2025-01-05 05:19:02');
INSERT INTO public.ventas_detalle VALUES (587, 285, 2, 1, 210000.00, 210000.00, '2026-02-10 13:19:02', '2026-02-10 13:19:02');
INSERT INTO public.ventas_detalle VALUES (588, 285, 11, 2, 150000.00, 300000.00, '2026-02-10 13:19:02', '2026-02-10 13:19:02');
INSERT INTO public.ventas_detalle VALUES (589, 285, 15, 1, 270000.00, 270000.00, '2026-02-10 13:19:02', '2026-02-10 13:19:02');
INSERT INTO public.ventas_detalle VALUES (590, 286, 5, 2, 190000.00, 380000.00, '2024-09-18 02:19:02', '2024-09-18 02:19:02');
INSERT INTO public.ventas_detalle VALUES (591, 286, 15, 2, 270000.00, 540000.00, '2024-09-18 02:19:02', '2024-09-18 02:19:02');
INSERT INTO public.ventas_detalle VALUES (592, 287, 1, 2, 250000.00, 500000.00, '2023-12-27 23:19:02', '2023-12-27 23:19:02');
INSERT INTO public.ventas_detalle VALUES (593, 287, 2, 3, 210000.00, 630000.00, '2023-12-27 23:19:02', '2023-12-27 23:19:02');
INSERT INTO public.ventas_detalle VALUES (594, 287, 18, 3, 240000.00, 720000.00, '2023-12-27 23:19:02', '2023-12-27 23:19:02');
INSERT INTO public.ventas_detalle VALUES (595, 288, 2, 2, 210000.00, 420000.00, '2026-03-11 01:19:02', '2026-03-11 01:19:02');
INSERT INTO public.ventas_detalle VALUES (596, 289, 10, 3, 195000.00, 585000.00, '2025-05-11 23:19:02', '2025-05-11 23:19:02');
INSERT INTO public.ventas_detalle VALUES (597, 290, 10, 2, 195000.00, 390000.00, '2026-03-27 08:19:02', '2026-03-27 08:19:02');
INSERT INTO public.ventas_detalle VALUES (598, 290, 14, 3, 290000.00, 870000.00, '2026-03-27 08:19:02', '2026-03-27 08:19:02');
INSERT INTO public.ventas_detalle VALUES (599, 290, 18, 2, 240000.00, 480000.00, '2026-03-27 08:19:02', '2026-03-27 08:19:02');
INSERT INTO public.ventas_detalle VALUES (600, 291, 2, 1, 210000.00, 210000.00, '2024-04-01 16:19:02', '2024-04-01 16:19:02');
INSERT INTO public.ventas_detalle VALUES (601, 291, 5, 3, 190000.00, 570000.00, '2024-04-01 16:19:02', '2024-04-01 16:19:02');
INSERT INTO public.ventas_detalle VALUES (602, 291, 14, 2, 290000.00, 580000.00, '2024-04-01 16:19:02', '2024-04-01 16:19:02');
INSERT INTO public.ventas_detalle VALUES (603, 292, 14, 2, 290000.00, 580000.00, '2025-09-10 18:19:02', '2025-09-10 18:19:02');
INSERT INTO public.ventas_detalle VALUES (604, 293, 1, 1, 250000.00, 250000.00, '2026-06-11 03:19:02', '2026-06-11 03:19:02');
INSERT INTO public.ventas_detalle VALUES (605, 293, 5, 1, 190000.00, 190000.00, '2026-06-11 03:19:02', '2026-06-11 03:19:02');
INSERT INTO public.ventas_detalle VALUES (606, 293, 15, 2, 270000.00, 540000.00, '2026-06-11 03:19:02', '2026-06-11 03:19:02');
INSERT INTO public.ventas_detalle VALUES (607, 294, 2, 3, 210000.00, 630000.00, '2026-02-21 18:19:02', '2026-02-21 18:19:02');
INSERT INTO public.ventas_detalle VALUES (608, 294, 6, 2, 310000.00, 620000.00, '2026-02-21 18:19:02', '2026-02-21 18:19:02');
INSERT INTO public.ventas_detalle VALUES (609, 294, 15, 1, 270000.00, 270000.00, '2026-02-21 18:19:02', '2026-02-21 18:19:02');
INSERT INTO public.ventas_detalle VALUES (610, 295, 1, 3, 250000.00, 750000.00, '2025-09-07 13:19:02', '2025-09-07 13:19:02');
INSERT INTO public.ventas_detalle VALUES (611, 295, 9, 3, 220000.00, 660000.00, '2025-09-07 13:19:02', '2025-09-07 13:19:02');
INSERT INTO public.ventas_detalle VALUES (612, 295, 16, 3, 380000.00, 1140000.00, '2025-09-07 13:19:02', '2025-09-07 13:19:02');
INSERT INTO public.ventas_detalle VALUES (613, 296, 17, 1, 350000.00, 350000.00, '2023-06-23 21:19:02', '2023-06-23 21:19:02');
INSERT INTO public.ventas_detalle VALUES (614, 297, 14, 1, 290000.00, 290000.00, '2023-10-04 15:19:02', '2023-10-04 15:19:02');
INSERT INTO public.ventas_detalle VALUES (615, 298, 6, 1, 310000.00, 310000.00, '2025-07-08 10:19:02', '2025-07-08 10:19:02');
INSERT INTO public.ventas_detalle VALUES (616, 299, 1, 3, 250000.00, 750000.00, '2026-01-12 00:19:02', '2026-01-12 00:19:02');
INSERT INTO public.ventas_detalle VALUES (617, 300, 7, 2, 160000.00, 320000.00, '2025-08-09 14:19:02', '2025-08-09 14:19:02');
INSERT INTO public.ventas_detalle VALUES (618, 300, 16, 1, 380000.00, 380000.00, '2025-08-09 14:19:02', '2025-08-09 14:19:02');
INSERT INTO public.ventas_detalle VALUES (619, 301, 16, 2, 380000.00, 760000.00, '2025-03-13 02:19:02', '2025-03-13 02:19:02');
INSERT INTO public.ventas_detalle VALUES (620, 302, 14, 3, 290000.00, 870000.00, '2025-07-24 21:19:02', '2025-07-24 21:19:02');
INSERT INTO public.ventas_detalle VALUES (621, 303, 10, 1, 195000.00, 195000.00, '2023-11-19 09:19:02', '2023-11-19 09:19:02');
INSERT INTO public.ventas_detalle VALUES (622, 304, 7, 1, 160000.00, 160000.00, '2024-10-09 20:19:02', '2024-10-09 20:19:02');
INSERT INTO public.ventas_detalle VALUES (623, 305, 11, 2, 150000.00, 300000.00, '2024-01-14 13:19:02', '2024-01-14 13:19:02');
INSERT INTO public.ventas_detalle VALUES (624, 306, 17, 2, 350000.00, 700000.00, '2026-02-20 22:19:02', '2026-02-20 22:19:02');
INSERT INTO public.ventas_detalle VALUES (625, 306, 18, 1, 240000.00, 240000.00, '2026-02-20 22:19:02', '2026-02-20 22:19:02');
INSERT INTO public.ventas_detalle VALUES (626, 307, 8, 1, 175000.00, 175000.00, '2023-12-05 06:19:02', '2023-12-05 06:19:02');
INSERT INTO public.ventas_detalle VALUES (627, 307, 17, 1, 350000.00, 350000.00, '2023-12-05 06:19:02', '2023-12-05 06:19:02');
INSERT INTO public.ventas_detalle VALUES (628, 308, 2, 3, 210000.00, 630000.00, '2024-05-02 18:19:02', '2024-05-02 18:19:02');
INSERT INTO public.ventas_detalle VALUES (629, 308, 9, 2, 220000.00, 440000.00, '2024-05-02 18:19:02', '2024-05-02 18:19:02');
INSERT INTO public.ventas_detalle VALUES (630, 308, 12, 1, 205000.00, 205000.00, '2024-05-02 18:19:02', '2024-05-02 18:19:02');
INSERT INTO public.ventas_detalle VALUES (631, 309, 3, 1, 180000.00, 180000.00, '2024-02-23 19:19:02', '2024-02-23 19:19:02');
INSERT INTO public.ventas_detalle VALUES (632, 309, 14, 1, 290000.00, 290000.00, '2024-02-23 19:19:02', '2024-02-23 19:19:02');
INSERT INTO public.ventas_detalle VALUES (633, 310, 9, 3, 220000.00, 660000.00, '2023-09-01 02:19:02', '2023-09-01 02:19:02');
INSERT INTO public.ventas_detalle VALUES (634, 310, 10, 3, 195000.00, 585000.00, '2023-09-01 02:19:02', '2023-09-01 02:19:02');
INSERT INTO public.ventas_detalle VALUES (635, 310, 14, 3, 290000.00, 870000.00, '2023-09-01 02:19:02', '2023-09-01 02:19:02');
INSERT INTO public.ventas_detalle VALUES (636, 311, 8, 2, 175000.00, 350000.00, '2025-02-01 12:19:02', '2025-02-01 12:19:02');
INSERT INTO public.ventas_detalle VALUES (637, 312, 9, 2, 220000.00, 440000.00, '2025-08-31 02:19:02', '2025-08-31 02:19:02');
INSERT INTO public.ventas_detalle VALUES (638, 312, 10, 2, 195000.00, 390000.00, '2025-08-31 02:19:02', '2025-08-31 02:19:02');
INSERT INTO public.ventas_detalle VALUES (639, 312, 17, 1, 350000.00, 350000.00, '2025-08-31 02:19:02', '2025-08-31 02:19:02');
INSERT INTO public.ventas_detalle VALUES (640, 313, 5, 2, 190000.00, 380000.00, '2025-12-05 14:19:02', '2025-12-05 14:19:02');
INSERT INTO public.ventas_detalle VALUES (641, 313, 6, 3, 310000.00, 930000.00, '2025-12-05 14:19:02', '2025-12-05 14:19:02');
INSERT INTO public.ventas_detalle VALUES (642, 313, 15, 1, 270000.00, 270000.00, '2025-12-05 14:19:02', '2025-12-05 14:19:02');
INSERT INTO public.ventas_detalle VALUES (643, 314, 6, 3, 310000.00, 930000.00, '2025-01-26 09:19:02', '2025-01-26 09:19:02');
INSERT INTO public.ventas_detalle VALUES (644, 314, 10, 1, 195000.00, 195000.00, '2025-01-26 09:19:02', '2025-01-26 09:19:02');
INSERT INTO public.ventas_detalle VALUES (645, 315, 3, 1, 180000.00, 180000.00, '2024-03-29 09:19:02', '2024-03-29 09:19:02');
INSERT INTO public.ventas_detalle VALUES (646, 315, 8, 2, 175000.00, 350000.00, '2024-03-29 09:19:02', '2024-03-29 09:19:02');
INSERT INTO public.ventas_detalle VALUES (647, 315, 9, 3, 220000.00, 660000.00, '2024-03-29 09:19:02', '2024-03-29 09:19:02');
INSERT INTO public.ventas_detalle VALUES (648, 316, 3, 1, 180000.00, 180000.00, '2025-09-28 22:19:02', '2025-09-28 22:19:02');
INSERT INTO public.ventas_detalle VALUES (649, 316, 7, 2, 160000.00, 320000.00, '2025-09-28 22:19:02', '2025-09-28 22:19:02');
INSERT INTO public.ventas_detalle VALUES (650, 317, 11, 3, 150000.00, 450000.00, '2023-12-02 13:19:02', '2023-12-02 13:19:02');
INSERT INTO public.ventas_detalle VALUES (651, 317, 12, 3, 205000.00, 615000.00, '2023-12-02 13:19:02', '2023-12-02 13:19:02');
INSERT INTO public.ventas_detalle VALUES (652, 317, 17, 2, 350000.00, 700000.00, '2023-12-02 13:19:02', '2023-12-02 13:19:02');
INSERT INTO public.ventas_detalle VALUES (653, 318, 7, 1, 160000.00, 160000.00, '2024-11-26 03:19:02', '2024-11-26 03:19:02');
INSERT INTO public.ventas_detalle VALUES (654, 318, 15, 2, 270000.00, 540000.00, '2024-11-26 03:19:02', '2024-11-26 03:19:02');
INSERT INTO public.ventas_detalle VALUES (655, 318, 18, 3, 240000.00, 720000.00, '2024-11-26 03:19:02', '2024-11-26 03:19:02');
INSERT INTO public.ventas_detalle VALUES (656, 319, 10, 1, 195000.00, 195000.00, '2024-06-05 19:19:02', '2024-06-05 19:19:02');
INSERT INTO public.ventas_detalle VALUES (657, 319, 16, 2, 380000.00, 760000.00, '2024-06-05 19:19:02', '2024-06-05 19:19:02');
INSERT INTO public.ventas_detalle VALUES (658, 320, 5, 3, 190000.00, 570000.00, '2024-06-09 07:19:02', '2024-06-09 07:19:02');
INSERT INTO public.ventas_detalle VALUES (659, 320, 7, 1, 160000.00, 160000.00, '2024-06-09 07:19:02', '2024-06-09 07:19:02');
INSERT INTO public.ventas_detalle VALUES (660, 320, 16, 1, 380000.00, 380000.00, '2024-06-09 07:19:02', '2024-06-09 07:19:02');
INSERT INTO public.ventas_detalle VALUES (661, 321, 3, 1, 180000.00, 180000.00, '2025-07-20 11:19:02', '2025-07-20 11:19:02');
INSERT INTO public.ventas_detalle VALUES (662, 321, 6, 3, 310000.00, 930000.00, '2025-07-20 11:19:02', '2025-07-20 11:19:02');
INSERT INTO public.ventas_detalle VALUES (663, 321, 11, 1, 150000.00, 150000.00, '2025-07-20 11:19:02', '2025-07-20 11:19:02');
INSERT INTO public.ventas_detalle VALUES (664, 322, 7, 3, 160000.00, 480000.00, '2024-01-15 11:19:02', '2024-01-15 11:19:02');
INSERT INTO public.ventas_detalle VALUES (665, 322, 16, 1, 380000.00, 380000.00, '2024-01-15 11:19:02', '2024-01-15 11:19:02');
INSERT INTO public.ventas_detalle VALUES (666, 323, 1, 3, 250000.00, 750000.00, '2025-06-22 18:19:02', '2025-06-22 18:19:02');
INSERT INTO public.ventas_detalle VALUES (667, 323, 7, 2, 160000.00, 320000.00, '2025-06-22 18:19:02', '2025-06-22 18:19:02');
INSERT INTO public.ventas_detalle VALUES (668, 323, 9, 1, 220000.00, 220000.00, '2025-06-22 18:19:02', '2025-06-22 18:19:02');
INSERT INTO public.ventas_detalle VALUES (669, 324, 1, 2, 250000.00, 500000.00, '2024-06-02 01:19:02', '2024-06-02 01:19:02');
INSERT INTO public.ventas_detalle VALUES (670, 324, 3, 3, 180000.00, 540000.00, '2024-06-02 01:19:02', '2024-06-02 01:19:02');
INSERT INTO public.ventas_detalle VALUES (671, 324, 5, 2, 190000.00, 380000.00, '2024-06-02 01:19:02', '2024-06-02 01:19:02');
INSERT INTO public.ventas_detalle VALUES (672, 325, 9, 1, 220000.00, 220000.00, '2023-08-20 06:19:02', '2023-08-20 06:19:02');
INSERT INTO public.ventas_detalle VALUES (673, 325, 15, 3, 270000.00, 810000.00, '2023-08-20 06:19:02', '2023-08-20 06:19:02');
INSERT INTO public.ventas_detalle VALUES (674, 326, 5, 1, 190000.00, 190000.00, '2024-03-26 23:19:02', '2024-03-26 23:19:02');
INSERT INTO public.ventas_detalle VALUES (675, 327, 5, 3, 190000.00, 570000.00, '2024-11-13 22:19:02', '2024-11-13 22:19:02');
INSERT INTO public.ventas_detalle VALUES (676, 327, 8, 3, 175000.00, 525000.00, '2024-11-13 22:19:02', '2024-11-13 22:19:02');
INSERT INTO public.ventas_detalle VALUES (677, 328, 6, 1, 310000.00, 310000.00, '2025-08-27 17:19:02', '2025-08-27 17:19:02');
INSERT INTO public.ventas_detalle VALUES (678, 328, 15, 3, 270000.00, 810000.00, '2025-08-27 17:19:02', '2025-08-27 17:19:02');
INSERT INTO public.ventas_detalle VALUES (679, 328, 17, 2, 350000.00, 700000.00, '2025-08-27 17:19:02', '2025-08-27 17:19:02');
INSERT INTO public.ventas_detalle VALUES (680, 329, 6, 1, 310000.00, 310000.00, '2023-11-28 20:19:02', '2023-11-28 20:19:02');
INSERT INTO public.ventas_detalle VALUES (681, 329, 18, 1, 240000.00, 240000.00, '2023-11-28 20:19:02', '2023-11-28 20:19:02');
INSERT INTO public.ventas_detalle VALUES (682, 330, 16, 1, 380000.00, 380000.00, '2024-01-08 19:19:02', '2024-01-08 19:19:02');
INSERT INTO public.ventas_detalle VALUES (683, 331, 5, 2, 190000.00, 380000.00, '2025-11-19 09:19:02', '2025-11-19 09:19:02');
INSERT INTO public.ventas_detalle VALUES (684, 331, 8, 3, 175000.00, 525000.00, '2025-11-19 09:19:02', '2025-11-19 09:19:02');
INSERT INTO public.ventas_detalle VALUES (685, 332, 6, 2, 310000.00, 620000.00, '2024-12-08 21:19:02', '2024-12-08 21:19:02');
INSERT INTO public.ventas_detalle VALUES (686, 332, 12, 3, 205000.00, 615000.00, '2024-12-08 21:19:02', '2024-12-08 21:19:02');
INSERT INTO public.ventas_detalle VALUES (687, 333, 3, 3, 180000.00, 540000.00, '2024-01-08 04:19:02', '2024-01-08 04:19:02');
INSERT INTO public.ventas_detalle VALUES (688, 333, 8, 3, 175000.00, 525000.00, '2024-01-08 04:19:02', '2024-01-08 04:19:02');
INSERT INTO public.ventas_detalle VALUES (689, 333, 11, 3, 150000.00, 450000.00, '2024-01-08 04:19:02', '2024-01-08 04:19:02');
INSERT INTO public.ventas_detalle VALUES (690, 334, 14, 3, 290000.00, 870000.00, '2023-09-19 14:19:02', '2023-09-19 14:19:02');
INSERT INTO public.ventas_detalle VALUES (691, 334, 16, 2, 380000.00, 760000.00, '2023-09-19 14:19:02', '2023-09-19 14:19:02');
INSERT INTO public.ventas_detalle VALUES (692, 334, 18, 2, 240000.00, 480000.00, '2023-09-19 14:19:02', '2023-09-19 14:19:02');
INSERT INTO public.ventas_detalle VALUES (693, 335, 7, 1, 160000.00, 160000.00, '2024-09-02 02:19:02', '2024-09-02 02:19:02');
INSERT INTO public.ventas_detalle VALUES (694, 335, 15, 2, 270000.00, 540000.00, '2024-09-02 02:19:02', '2024-09-02 02:19:02');
INSERT INTO public.ventas_detalle VALUES (695, 335, 17, 3, 350000.00, 1050000.00, '2024-09-02 02:19:02', '2024-09-02 02:19:02');
INSERT INTO public.ventas_detalle VALUES (696, 336, 2, 3, 210000.00, 630000.00, '2025-09-04 01:19:03', '2025-09-04 01:19:03');
INSERT INTO public.ventas_detalle VALUES (697, 336, 11, 3, 150000.00, 450000.00, '2025-09-04 01:19:03', '2025-09-04 01:19:03');
INSERT INTO public.ventas_detalle VALUES (698, 336, 12, 1, 205000.00, 205000.00, '2025-09-04 01:19:03', '2025-09-04 01:19:03');
INSERT INTO public.ventas_detalle VALUES (699, 337, 8, 2, 175000.00, 350000.00, '2024-08-26 18:19:03', '2024-08-26 18:19:03');
INSERT INTO public.ventas_detalle VALUES (700, 337, 11, 2, 150000.00, 300000.00, '2024-08-26 18:19:03', '2024-08-26 18:19:03');
INSERT INTO public.ventas_detalle VALUES (701, 337, 16, 3, 380000.00, 1140000.00, '2024-08-26 18:19:03', '2024-08-26 18:19:03');
INSERT INTO public.ventas_detalle VALUES (702, 338, 7, 2, 160000.00, 320000.00, '2025-03-02 14:19:03', '2025-03-02 14:19:03');
INSERT INTO public.ventas_detalle VALUES (703, 338, 12, 2, 205000.00, 410000.00, '2025-03-02 14:19:03', '2025-03-02 14:19:03');
INSERT INTO public.ventas_detalle VALUES (704, 339, 5, 2, 190000.00, 380000.00, '2025-02-04 03:19:03', '2025-02-04 03:19:03');
INSERT INTO public.ventas_detalle VALUES (705, 339, 10, 3, 195000.00, 585000.00, '2025-02-04 03:19:03', '2025-02-04 03:19:03');
INSERT INTO public.ventas_detalle VALUES (706, 340, 3, 1, 180000.00, 180000.00, '2025-06-15 00:19:03', '2025-06-15 00:19:03');
INSERT INTO public.ventas_detalle VALUES (707, 340, 5, 1, 190000.00, 190000.00, '2025-06-15 00:19:03', '2025-06-15 00:19:03');
INSERT INTO public.ventas_detalle VALUES (708, 341, 8, 2, 175000.00, 350000.00, '2024-06-30 18:19:03', '2024-06-30 18:19:03');
INSERT INTO public.ventas_detalle VALUES (709, 341, 11, 3, 150000.00, 450000.00, '2024-06-30 18:19:03', '2024-06-30 18:19:03');
INSERT INTO public.ventas_detalle VALUES (710, 342, 10, 2, 195000.00, 390000.00, '2026-03-27 21:19:03', '2026-03-27 21:19:03');
INSERT INTO public.ventas_detalle VALUES (711, 342, 12, 2, 205000.00, 410000.00, '2026-03-27 21:19:03', '2026-03-27 21:19:03');
INSERT INTO public.ventas_detalle VALUES (712, 342, 14, 2, 290000.00, 580000.00, '2026-03-27 21:19:03', '2026-03-27 21:19:03');
INSERT INTO public.ventas_detalle VALUES (713, 343, 7, 3, 160000.00, 480000.00, '2024-06-28 07:19:03', '2024-06-28 07:19:03');
INSERT INTO public.ventas_detalle VALUES (714, 344, 2, 3, 210000.00, 630000.00, '2025-08-13 03:19:03', '2025-08-13 03:19:03');
INSERT INTO public.ventas_detalle VALUES (715, 344, 6, 3, 310000.00, 930000.00, '2025-08-13 03:19:03', '2025-08-13 03:19:03');
INSERT INTO public.ventas_detalle VALUES (716, 344, 14, 3, 290000.00, 870000.00, '2025-08-13 03:19:03', '2025-08-13 03:19:03');
INSERT INTO public.ventas_detalle VALUES (717, 345, 3, 2, 180000.00, 360000.00, '2025-10-29 05:19:03', '2025-10-29 05:19:03');
INSERT INTO public.ventas_detalle VALUES (718, 345, 8, 1, 175000.00, 175000.00, '2025-10-29 05:19:03', '2025-10-29 05:19:03');
INSERT INTO public.ventas_detalle VALUES (719, 345, 12, 3, 205000.00, 615000.00, '2025-10-29 05:19:03', '2025-10-29 05:19:03');
INSERT INTO public.ventas_detalle VALUES (720, 346, 16, 2, 380000.00, 760000.00, '2026-04-01 08:19:03', '2026-04-01 08:19:03');
INSERT INTO public.ventas_detalle VALUES (721, 347, 1, 2, 250000.00, 500000.00, '2025-10-06 11:19:03', '2025-10-06 11:19:03');
INSERT INTO public.ventas_detalle VALUES (722, 347, 5, 2, 190000.00, 380000.00, '2025-10-06 11:19:03', '2025-10-06 11:19:03');
INSERT INTO public.ventas_detalle VALUES (723, 347, 6, 3, 310000.00, 930000.00, '2025-10-06 11:19:03', '2025-10-06 11:19:03');
INSERT INTO public.ventas_detalle VALUES (724, 348, 15, 3, 270000.00, 810000.00, '2024-06-25 02:19:03', '2024-06-25 02:19:03');
INSERT INTO public.ventas_detalle VALUES (725, 348, 17, 2, 350000.00, 700000.00, '2024-06-25 02:19:03', '2024-06-25 02:19:03');
INSERT INTO public.ventas_detalle VALUES (726, 349, 6, 1, 310000.00, 310000.00, '2025-09-01 18:19:03', '2025-09-01 18:19:03');
INSERT INTO public.ventas_detalle VALUES (727, 349, 16, 1, 380000.00, 380000.00, '2025-09-01 18:19:03', '2025-09-01 18:19:03');
INSERT INTO public.ventas_detalle VALUES (728, 350, 2, 3, 210000.00, 630000.00, '2026-04-19 23:19:03', '2026-04-19 23:19:03');
INSERT INTO public.ventas_detalle VALUES (729, 351, 2, 3, 210000.00, 630000.00, '2023-09-21 23:19:03', '2023-09-21 23:19:03');
INSERT INTO public.ventas_detalle VALUES (730, 351, 17, 2, 350000.00, 700000.00, '2023-09-21 23:19:03', '2023-09-21 23:19:03');
INSERT INTO public.ventas_detalle VALUES (731, 351, 18, 3, 240000.00, 720000.00, '2023-09-21 23:19:03', '2023-09-21 23:19:03');
INSERT INTO public.ventas_detalle VALUES (732, 352, 1, 2, 250000.00, 500000.00, '2025-06-23 10:19:03', '2025-06-23 10:19:03');
INSERT INTO public.ventas_detalle VALUES (733, 352, 9, 1, 220000.00, 220000.00, '2025-06-23 10:19:03', '2025-06-23 10:19:03');
INSERT INTO public.ventas_detalle VALUES (734, 353, 5, 1, 190000.00, 190000.00, '2025-03-12 18:19:03', '2025-03-12 18:19:03');
INSERT INTO public.ventas_detalle VALUES (735, 353, 14, 2, 290000.00, 580000.00, '2025-03-12 18:19:03', '2025-03-12 18:19:03');
INSERT INTO public.ventas_detalle VALUES (736, 353, 17, 1, 350000.00, 350000.00, '2025-03-12 18:19:03', '2025-03-12 18:19:03');
INSERT INTO public.ventas_detalle VALUES (737, 354, 2, 2, 210000.00, 420000.00, '2024-08-22 11:19:03', '2024-08-22 11:19:03');
INSERT INTO public.ventas_detalle VALUES (738, 354, 16, 1, 380000.00, 380000.00, '2024-08-22 11:19:03', '2024-08-22 11:19:03');
INSERT INTO public.ventas_detalle VALUES (739, 355, 2, 3, 210000.00, 630000.00, '2025-02-18 13:19:03', '2025-02-18 13:19:03');
INSERT INTO public.ventas_detalle VALUES (740, 356, 11, 2, 150000.00, 300000.00, '2023-09-05 21:19:03', '2023-09-05 21:19:03');
INSERT INTO public.ventas_detalle VALUES (741, 356, 15, 2, 270000.00, 540000.00, '2023-09-05 21:19:03', '2023-09-05 21:19:03');
INSERT INTO public.ventas_detalle VALUES (742, 356, 18, 2, 240000.00, 480000.00, '2023-09-05 21:19:03', '2023-09-05 21:19:03');
INSERT INTO public.ventas_detalle VALUES (743, 357, 11, 3, 150000.00, 450000.00, '2023-12-25 20:19:03', '2023-12-25 20:19:03');
INSERT INTO public.ventas_detalle VALUES (744, 358, 12, 2, 205000.00, 410000.00, '2023-06-27 15:19:03', '2023-06-27 15:19:03');
INSERT INTO public.ventas_detalle VALUES (745, 358, 18, 1, 240000.00, 240000.00, '2023-06-27 15:19:03', '2023-06-27 15:19:03');
INSERT INTO public.ventas_detalle VALUES (746, 359, 3, 2, 180000.00, 360000.00, '2025-01-01 16:19:03', '2025-01-01 16:19:03');
INSERT INTO public.ventas_detalle VALUES (747, 359, 9, 3, 220000.00, 660000.00, '2025-01-01 16:19:03', '2025-01-01 16:19:03');
INSERT INTO public.ventas_detalle VALUES (748, 360, 15, 1, 270000.00, 270000.00, '2024-06-17 07:19:03', '2024-06-17 07:19:03');
INSERT INTO public.ventas_detalle VALUES (749, 360, 16, 3, 380000.00, 1140000.00, '2024-06-17 07:19:03', '2024-06-17 07:19:03');
INSERT INTO public.ventas_detalle VALUES (750, 360, 17, 2, 350000.00, 700000.00, '2024-06-17 07:19:03', '2024-06-17 07:19:03');
INSERT INTO public.ventas_detalle VALUES (751, 361, 9, 3, 220000.00, 660000.00, '2024-05-23 09:19:03', '2024-05-23 09:19:03');
INSERT INTO public.ventas_detalle VALUES (752, 361, 11, 2, 150000.00, 300000.00, '2024-05-23 09:19:03', '2024-05-23 09:19:03');
INSERT INTO public.ventas_detalle VALUES (753, 361, 18, 2, 240000.00, 480000.00, '2024-05-23 09:19:03', '2024-05-23 09:19:03');
INSERT INTO public.ventas_detalle VALUES (754, 362, 3, 2, 180000.00, 360000.00, '2026-03-23 08:19:03', '2026-03-23 08:19:03');
INSERT INTO public.ventas_detalle VALUES (755, 363, 9, 3, 220000.00, 660000.00, '2025-02-18 20:19:03', '2025-02-18 20:19:03');
INSERT INTO public.ventas_detalle VALUES (756, 363, 14, 3, 290000.00, 870000.00, '2025-02-18 20:19:03', '2025-02-18 20:19:03');
INSERT INTO public.ventas_detalle VALUES (757, 363, 15, 1, 270000.00, 270000.00, '2025-02-18 20:19:03', '2025-02-18 20:19:03');
INSERT INTO public.ventas_detalle VALUES (758, 364, 1, 2, 250000.00, 500000.00, '2025-12-18 21:19:03', '2025-12-18 21:19:03');
INSERT INTO public.ventas_detalle VALUES (759, 364, 3, 1, 180000.00, 180000.00, '2025-12-18 21:19:03', '2025-12-18 21:19:03');
INSERT INTO public.ventas_detalle VALUES (760, 364, 5, 2, 190000.00, 380000.00, '2025-12-18 21:19:03', '2025-12-18 21:19:03');
INSERT INTO public.ventas_detalle VALUES (761, 365, 5, 2, 190000.00, 380000.00, '2024-05-29 07:19:03', '2024-05-29 07:19:03');
INSERT INTO public.ventas_detalle VALUES (762, 365, 7, 1, 160000.00, 160000.00, '2024-05-29 07:19:03', '2024-05-29 07:19:03');
INSERT INTO public.ventas_detalle VALUES (763, 366, 2, 3, 210000.00, 630000.00, '2023-10-01 15:19:03', '2023-10-01 15:19:03');
INSERT INTO public.ventas_detalle VALUES (764, 366, 11, 1, 150000.00, 150000.00, '2023-10-01 15:19:03', '2023-10-01 15:19:03');
INSERT INTO public.ventas_detalle VALUES (765, 366, 12, 1, 205000.00, 205000.00, '2023-10-01 15:19:03', '2023-10-01 15:19:03');
INSERT INTO public.ventas_detalle VALUES (766, 367, 9, 3, 220000.00, 660000.00, '2023-10-29 11:19:03', '2023-10-29 11:19:03');
INSERT INTO public.ventas_detalle VALUES (767, 367, 10, 3, 195000.00, 585000.00, '2023-10-29 11:19:03', '2023-10-29 11:19:03');
INSERT INTO public.ventas_detalle VALUES (768, 367, 17, 1, 350000.00, 350000.00, '2023-10-29 11:19:03', '2023-10-29 11:19:03');
INSERT INTO public.ventas_detalle VALUES (769, 368, 3, 1, 180000.00, 180000.00, '2026-02-19 19:19:03', '2026-02-19 19:19:03');
INSERT INTO public.ventas_detalle VALUES (770, 368, 12, 2, 205000.00, 410000.00, '2026-02-19 19:19:03', '2026-02-19 19:19:03');
INSERT INTO public.ventas_detalle VALUES (771, 369, 1, 1, 250000.00, 250000.00, '2023-10-18 17:19:03', '2023-10-18 17:19:03');
INSERT INTO public.ventas_detalle VALUES (772, 369, 8, 2, 175000.00, 350000.00, '2023-10-18 17:19:03', '2023-10-18 17:19:03');
INSERT INTO public.ventas_detalle VALUES (773, 369, 17, 1, 350000.00, 350000.00, '2023-10-18 17:19:03', '2023-10-18 17:19:03');
INSERT INTO public.ventas_detalle VALUES (774, 370, 1, 1, 250000.00, 250000.00, '2025-04-08 01:19:03', '2025-04-08 01:19:03');
INSERT INTO public.ventas_detalle VALUES (775, 370, 7, 1, 160000.00, 160000.00, '2025-04-08 01:19:03', '2025-04-08 01:19:03');
INSERT INTO public.ventas_detalle VALUES (776, 371, 8, 1, 175000.00, 175000.00, '2024-02-06 12:19:03', '2024-02-06 12:19:03');
INSERT INTO public.ventas_detalle VALUES (777, 371, 9, 1, 220000.00, 220000.00, '2024-02-06 12:19:03', '2024-02-06 12:19:03');
INSERT INTO public.ventas_detalle VALUES (778, 371, 12, 1, 205000.00, 205000.00, '2024-02-06 12:19:03', '2024-02-06 12:19:03');
INSERT INTO public.ventas_detalle VALUES (779, 372, 1, 3, 250000.00, 750000.00, '2024-04-29 03:19:03', '2024-04-29 03:19:03');
INSERT INTO public.ventas_detalle VALUES (780, 372, 9, 2, 220000.00, 440000.00, '2024-04-29 03:19:03', '2024-04-29 03:19:03');
INSERT INTO public.ventas_detalle VALUES (781, 372, 15, 3, 270000.00, 810000.00, '2024-04-29 03:19:03', '2024-04-29 03:19:03');
INSERT INTO public.ventas_detalle VALUES (782, 373, 12, 3, 205000.00, 615000.00, '2025-07-17 18:19:03', '2025-07-17 18:19:03');
INSERT INTO public.ventas_detalle VALUES (783, 374, 3, 3, 180000.00, 540000.00, '2026-02-26 04:19:03', '2026-02-26 04:19:03');
INSERT INTO public.ventas_detalle VALUES (784, 374, 15, 3, 270000.00, 810000.00, '2026-02-26 04:19:03', '2026-02-26 04:19:03');
INSERT INTO public.ventas_detalle VALUES (785, 375, 2, 1, 210000.00, 210000.00, '2025-09-07 23:19:03', '2025-09-07 23:19:03');
INSERT INTO public.ventas_detalle VALUES (786, 375, 9, 3, 220000.00, 660000.00, '2025-09-07 23:19:03', '2025-09-07 23:19:03');
INSERT INTO public.ventas_detalle VALUES (787, 375, 16, 3, 380000.00, 1140000.00, '2025-09-07 23:19:03', '2025-09-07 23:19:03');
INSERT INTO public.ventas_detalle VALUES (788, 376, 8, 2, 175000.00, 350000.00, '2023-11-23 15:19:03', '2023-11-23 15:19:03');
INSERT INTO public.ventas_detalle VALUES (789, 376, 9, 3, 220000.00, 660000.00, '2023-11-23 15:19:03', '2023-11-23 15:19:03');
INSERT INTO public.ventas_detalle VALUES (790, 376, 12, 2, 205000.00, 410000.00, '2023-11-23 15:19:03', '2023-11-23 15:19:03');
INSERT INTO public.ventas_detalle VALUES (791, 377, 2, 1, 210000.00, 210000.00, '2025-04-15 13:19:03', '2025-04-15 13:19:03');
INSERT INTO public.ventas_detalle VALUES (792, 378, 9, 2, 220000.00, 440000.00, '2025-12-25 21:19:03', '2025-12-25 21:19:03');
INSERT INTO public.ventas_detalle VALUES (793, 378, 11, 3, 150000.00, 450000.00, '2025-12-25 21:19:03', '2025-12-25 21:19:03');
INSERT INTO public.ventas_detalle VALUES (794, 378, 17, 3, 350000.00, 1050000.00, '2025-12-25 21:19:03', '2025-12-25 21:19:03');
INSERT INTO public.ventas_detalle VALUES (795, 379, 12, 1, 205000.00, 205000.00, '2024-11-20 22:19:03', '2024-11-20 22:19:03');
INSERT INTO public.ventas_detalle VALUES (796, 379, 17, 2, 350000.00, 700000.00, '2024-11-20 22:19:03', '2024-11-20 22:19:03');
INSERT INTO public.ventas_detalle VALUES (797, 380, 6, 1, 310000.00, 310000.00, '2024-06-24 06:19:03', '2024-06-24 06:19:03');
INSERT INTO public.ventas_detalle VALUES (798, 381, 1, 3, 250000.00, 750000.00, '2025-04-05 08:19:03', '2025-04-05 08:19:03');
INSERT INTO public.ventas_detalle VALUES (799, 381, 6, 3, 310000.00, 930000.00, '2025-04-05 08:19:03', '2025-04-05 08:19:03');
INSERT INTO public.ventas_detalle VALUES (800, 381, 18, 2, 240000.00, 480000.00, '2025-04-05 08:19:03', '2025-04-05 08:19:03');
INSERT INTO public.ventas_detalle VALUES (801, 382, 2, 3, 210000.00, 630000.00, '2023-12-26 23:19:03', '2023-12-26 23:19:03');
INSERT INTO public.ventas_detalle VALUES (802, 382, 5, 3, 190000.00, 570000.00, '2023-12-26 23:19:03', '2023-12-26 23:19:03');
INSERT INTO public.ventas_detalle VALUES (803, 382, 10, 1, 195000.00, 195000.00, '2023-12-26 23:19:03', '2023-12-26 23:19:03');
INSERT INTO public.ventas_detalle VALUES (804, 383, 6, 3, 310000.00, 930000.00, '2025-12-07 12:19:03', '2025-12-07 12:19:03');
INSERT INTO public.ventas_detalle VALUES (805, 384, 9, 3, 220000.00, 660000.00, '2025-09-28 00:19:03', '2025-09-28 00:19:03');
INSERT INTO public.ventas_detalle VALUES (806, 385, 8, 2, 175000.00, 350000.00, '2025-02-16 13:19:03', '2025-02-16 13:19:03');
INSERT INTO public.ventas_detalle VALUES (807, 385, 16, 3, 380000.00, 1140000.00, '2025-02-16 13:19:03', '2025-02-16 13:19:03');
INSERT INTO public.ventas_detalle VALUES (808, 386, 1, 2, 250000.00, 500000.00, '2024-06-08 21:19:03', '2024-06-08 21:19:03');
INSERT INTO public.ventas_detalle VALUES (809, 386, 16, 1, 380000.00, 380000.00, '2024-06-08 21:19:03', '2024-06-08 21:19:03');
INSERT INTO public.ventas_detalle VALUES (810, 387, 2, 1, 210000.00, 210000.00, '2023-11-23 21:19:03', '2023-11-23 21:19:03');
INSERT INTO public.ventas_detalle VALUES (811, 387, 16, 1, 380000.00, 380000.00, '2023-11-23 21:19:03', '2023-11-23 21:19:03');
INSERT INTO public.ventas_detalle VALUES (812, 388, 1, 2, 250000.00, 500000.00, '2023-12-25 09:19:03', '2023-12-25 09:19:03');
INSERT INTO public.ventas_detalle VALUES (813, 389, 8, 2, 175000.00, 350000.00, '2026-03-30 03:19:03', '2026-03-30 03:19:03');
INSERT INTO public.ventas_detalle VALUES (814, 389, 9, 3, 220000.00, 660000.00, '2026-03-30 03:19:03', '2026-03-30 03:19:03');
INSERT INTO public.ventas_detalle VALUES (815, 390, 2, 2, 210000.00, 420000.00, '2023-11-09 18:19:03', '2023-11-09 18:19:03');
INSERT INTO public.ventas_detalle VALUES (816, 390, 6, 2, 310000.00, 620000.00, '2023-11-09 18:19:03', '2023-11-09 18:19:03');
INSERT INTO public.ventas_detalle VALUES (817, 390, 12, 3, 205000.00, 615000.00, '2023-11-09 18:19:03', '2023-11-09 18:19:03');
INSERT INTO public.ventas_detalle VALUES (818, 391, 8, 2, 175000.00, 350000.00, '2025-03-05 15:19:03', '2025-03-05 15:19:03');
INSERT INTO public.ventas_detalle VALUES (819, 391, 9, 2, 220000.00, 440000.00, '2025-03-05 15:19:03', '2025-03-05 15:19:03');
INSERT INTO public.ventas_detalle VALUES (820, 392, 7, 2, 160000.00, 320000.00, '2026-01-07 07:19:03', '2026-01-07 07:19:03');
INSERT INTO public.ventas_detalle VALUES (821, 393, 2, 2, 210000.00, 420000.00, '2024-12-25 05:19:03', '2024-12-25 05:19:03');
INSERT INTO public.ventas_detalle VALUES (822, 393, 15, 1, 270000.00, 270000.00, '2024-12-25 05:19:03', '2024-12-25 05:19:03');
INSERT INTO public.ventas_detalle VALUES (823, 393, 17, 1, 350000.00, 350000.00, '2024-12-25 05:19:03', '2024-12-25 05:19:03');
INSERT INTO public.ventas_detalle VALUES (824, 394, 5, 1, 190000.00, 190000.00, '2024-02-23 23:19:03', '2024-02-23 23:19:03');
INSERT INTO public.ventas_detalle VALUES (825, 394, 10, 2, 195000.00, 390000.00, '2024-02-23 23:19:03', '2024-02-23 23:19:03');
INSERT INTO public.ventas_detalle VALUES (826, 395, 2, 1, 210000.00, 210000.00, '2024-04-23 06:19:03', '2024-04-23 06:19:03');
INSERT INTO public.ventas_detalle VALUES (827, 395, 8, 3, 175000.00, 525000.00, '2024-04-23 06:19:03', '2024-04-23 06:19:03');
INSERT INTO public.ventas_detalle VALUES (828, 396, 16, 2, 380000.00, 760000.00, '2025-03-04 04:19:03', '2025-03-04 04:19:03');
INSERT INTO public.ventas_detalle VALUES (829, 397, 9, 3, 220000.00, 660000.00, '2023-10-01 11:19:03', '2023-10-01 11:19:03');
INSERT INTO public.ventas_detalle VALUES (830, 398, 10, 2, 195000.00, 390000.00, '2024-01-29 05:19:03', '2024-01-29 05:19:03');
INSERT INTO public.ventas_detalle VALUES (831, 398, 15, 3, 270000.00, 810000.00, '2024-01-29 05:19:03', '2024-01-29 05:19:03');
INSERT INTO public.ventas_detalle VALUES (832, 399, 7, 1, 160000.00, 160000.00, '2026-04-24 11:19:03', '2026-04-24 11:19:03');
INSERT INTO public.ventas_detalle VALUES (833, 399, 10, 2, 195000.00, 390000.00, '2026-04-24 11:19:03', '2026-04-24 11:19:03');
INSERT INTO public.ventas_detalle VALUES (834, 400, 6, 3, 310000.00, 930000.00, '2025-11-14 15:19:03', '2025-11-14 15:19:03');
INSERT INTO public.ventas_detalle VALUES (835, 400, 8, 1, 175000.00, 175000.00, '2025-11-14 15:19:03', '2025-11-14 15:19:03');
INSERT INTO public.ventas_detalle VALUES (836, 401, 7, 3, 160000.00, 480000.00, '2025-06-15 09:19:03', '2025-06-15 09:19:03');
INSERT INTO public.ventas_detalle VALUES (837, 401, 8, 3, 175000.00, 525000.00, '2025-06-15 09:19:03', '2025-06-15 09:19:03');
INSERT INTO public.ventas_detalle VALUES (838, 401, 17, 1, 350000.00, 350000.00, '2025-06-15 09:19:03', '2025-06-15 09:19:03');
INSERT INTO public.ventas_detalle VALUES (839, 402, 1, 1, 250000.00, 250000.00, '2026-02-24 19:19:03', '2026-02-24 19:19:03');
INSERT INTO public.ventas_detalle VALUES (840, 402, 9, 3, 220000.00, 660000.00, '2026-02-24 19:19:03', '2026-02-24 19:19:03');
INSERT INTO public.ventas_detalle VALUES (841, 402, 10, 2, 195000.00, 390000.00, '2026-02-24 19:19:03', '2026-02-24 19:19:03');
INSERT INTO public.ventas_detalle VALUES (842, 403, 3, 3, 180000.00, 540000.00, '2023-12-18 15:19:03', '2023-12-18 15:19:03');
INSERT INTO public.ventas_detalle VALUES (843, 403, 6, 2, 310000.00, 620000.00, '2023-12-18 15:19:03', '2023-12-18 15:19:03');
INSERT INTO public.ventas_detalle VALUES (844, 403, 11, 2, 150000.00, 300000.00, '2023-12-18 15:19:03', '2023-12-18 15:19:03');
INSERT INTO public.ventas_detalle VALUES (845, 404, 1, 3, 250000.00, 750000.00, '2023-08-07 04:19:03', '2023-08-07 04:19:03');
INSERT INTO public.ventas_detalle VALUES (846, 404, 3, 1, 180000.00, 180000.00, '2023-08-07 04:19:03', '2023-08-07 04:19:03');
INSERT INTO public.ventas_detalle VALUES (847, 404, 7, 1, 160000.00, 160000.00, '2023-08-07 04:19:03', '2023-08-07 04:19:03');
INSERT INTO public.ventas_detalle VALUES (848, 405, 3, 1, 180000.00, 180000.00, '2024-11-21 23:19:03', '2024-11-21 23:19:03');
INSERT INTO public.ventas_detalle VALUES (849, 405, 11, 1, 150000.00, 150000.00, '2024-11-21 23:19:03', '2024-11-21 23:19:03');
INSERT INTO public.ventas_detalle VALUES (850, 405, 12, 1, 205000.00, 205000.00, '2024-11-21 23:19:03', '2024-11-21 23:19:03');
INSERT INTO public.ventas_detalle VALUES (851, 406, 16, 2, 380000.00, 760000.00, '2025-04-08 14:19:03', '2025-04-08 14:19:03');
INSERT INTO public.ventas_detalle VALUES (852, 406, 18, 1, 240000.00, 240000.00, '2025-04-08 14:19:03', '2025-04-08 14:19:03');
INSERT INTO public.ventas_detalle VALUES (853, 407, 6, 2, 310000.00, 620000.00, '2024-04-17 08:19:03', '2024-04-17 08:19:03');
INSERT INTO public.ventas_detalle VALUES (854, 408, 10, 3, 195000.00, 585000.00, '2024-10-28 03:19:03', '2024-10-28 03:19:03');
INSERT INTO public.ventas_detalle VALUES (855, 408, 15, 2, 270000.00, 540000.00, '2024-10-28 03:19:03', '2024-10-28 03:19:03');
INSERT INTO public.ventas_detalle VALUES (856, 408, 18, 1, 240000.00, 240000.00, '2024-10-28 03:19:03', '2024-10-28 03:19:03');
INSERT INTO public.ventas_detalle VALUES (857, 409, 14, 3, 290000.00, 870000.00, '2025-08-18 07:19:03', '2025-08-18 07:19:03');
INSERT INTO public.ventas_detalle VALUES (858, 409, 18, 2, 240000.00, 480000.00, '2025-08-18 07:19:03', '2025-08-18 07:19:03');
INSERT INTO public.ventas_detalle VALUES (859, 410, 7, 3, 160000.00, 480000.00, '2024-12-28 20:19:03', '2024-12-28 20:19:03');
INSERT INTO public.ventas_detalle VALUES (860, 410, 16, 1, 380000.00, 380000.00, '2024-12-28 20:19:03', '2024-12-28 20:19:03');
INSERT INTO public.ventas_detalle VALUES (861, 411, 5, 1, 190000.00, 190000.00, '2025-04-26 20:19:03', '2025-04-26 20:19:03');
INSERT INTO public.ventas_detalle VALUES (862, 411, 12, 1, 205000.00, 205000.00, '2025-04-26 20:19:03', '2025-04-26 20:19:03');
INSERT INTO public.ventas_detalle VALUES (863, 412, 7, 2, 160000.00, 320000.00, '2024-09-08 13:19:03', '2024-09-08 13:19:03');
INSERT INTO public.ventas_detalle VALUES (864, 413, 5, 1, 190000.00, 190000.00, '2025-03-30 12:19:03', '2025-03-30 12:19:03');
INSERT INTO public.ventas_detalle VALUES (865, 413, 6, 1, 310000.00, 310000.00, '2025-03-30 12:19:03', '2025-03-30 12:19:03');
INSERT INTO public.ventas_detalle VALUES (866, 413, 7, 3, 160000.00, 480000.00, '2025-03-30 12:19:03', '2025-03-30 12:19:03');
INSERT INTO public.ventas_detalle VALUES (867, 414, 7, 2, 160000.00, 320000.00, '2025-09-02 20:19:03', '2025-09-02 20:19:03');
INSERT INTO public.ventas_detalle VALUES (868, 414, 8, 2, 175000.00, 350000.00, '2025-09-02 20:19:03', '2025-09-02 20:19:03');
INSERT INTO public.ventas_detalle VALUES (869, 414, 10, 1, 195000.00, 195000.00, '2025-09-02 20:19:03', '2025-09-02 20:19:03');
INSERT INTO public.ventas_detalle VALUES (870, 415, 2, 2, 210000.00, 420000.00, '2023-10-17 17:19:03', '2023-10-17 17:19:03');
INSERT INTO public.ventas_detalle VALUES (871, 415, 17, 1, 350000.00, 350000.00, '2023-10-17 17:19:03', '2023-10-17 17:19:03');
INSERT INTO public.ventas_detalle VALUES (872, 416, 7, 3, 160000.00, 480000.00, '2024-08-02 03:19:03', '2024-08-02 03:19:03');
INSERT INTO public.ventas_detalle VALUES (873, 416, 8, 1, 175000.00, 175000.00, '2024-08-02 03:19:03', '2024-08-02 03:19:03');
INSERT INTO public.ventas_detalle VALUES (874, 416, 18, 1, 240000.00, 240000.00, '2024-08-02 03:19:03', '2024-08-02 03:19:03');
INSERT INTO public.ventas_detalle VALUES (875, 417, 11, 2, 150000.00, 300000.00, '2025-04-26 13:19:03', '2025-04-26 13:19:03');
INSERT INTO public.ventas_detalle VALUES (876, 418, 1, 3, 250000.00, 750000.00, '2024-08-12 12:19:03', '2024-08-12 12:19:03');
INSERT INTO public.ventas_detalle VALUES (877, 418, 3, 2, 180000.00, 360000.00, '2024-08-12 12:19:03', '2024-08-12 12:19:03');
INSERT INTO public.ventas_detalle VALUES (878, 418, 17, 2, 350000.00, 700000.00, '2024-08-12 12:19:03', '2024-08-12 12:19:03');
INSERT INTO public.ventas_detalle VALUES (879, 419, 6, 3, 310000.00, 930000.00, '2026-04-21 00:19:03', '2026-04-21 00:19:03');
INSERT INTO public.ventas_detalle VALUES (880, 419, 10, 1, 195000.00, 195000.00, '2026-04-21 00:19:03', '2026-04-21 00:19:03');
INSERT INTO public.ventas_detalle VALUES (881, 420, 18, 3, 240000.00, 720000.00, '2023-08-06 08:19:03', '2023-08-06 08:19:03');
INSERT INTO public.ventas_detalle VALUES (882, 421, 7, 2, 160000.00, 320000.00, '2024-05-15 09:19:03', '2024-05-15 09:19:03');
INSERT INTO public.ventas_detalle VALUES (883, 421, 8, 1, 175000.00, 175000.00, '2024-05-15 09:19:03', '2024-05-15 09:19:03');
INSERT INTO public.ventas_detalle VALUES (884, 421, 12, 1, 205000.00, 205000.00, '2024-05-15 09:19:03', '2024-05-15 09:19:03');
INSERT INTO public.ventas_detalle VALUES (885, 422, 1, 1, 250000.00, 250000.00, '2024-07-11 01:19:03', '2024-07-11 01:19:03');
INSERT INTO public.ventas_detalle VALUES (886, 422, 15, 1, 270000.00, 270000.00, '2024-07-11 01:19:03', '2024-07-11 01:19:03');
INSERT INTO public.ventas_detalle VALUES (887, 422, 17, 1, 350000.00, 350000.00, '2024-07-11 01:19:03', '2024-07-11 01:19:03');
INSERT INTO public.ventas_detalle VALUES (888, 423, 1, 3, 250000.00, 750000.00, '2023-09-09 01:19:03', '2023-09-09 01:19:03');
INSERT INTO public.ventas_detalle VALUES (889, 423, 11, 3, 150000.00, 450000.00, '2023-09-09 01:19:03', '2023-09-09 01:19:03');
INSERT INTO public.ventas_detalle VALUES (890, 423, 18, 3, 240000.00, 720000.00, '2023-09-09 01:19:03', '2023-09-09 01:19:03');
INSERT INTO public.ventas_detalle VALUES (891, 424, 14, 2, 290000.00, 580000.00, '2026-01-15 23:19:03', '2026-01-15 23:19:03');
INSERT INTO public.ventas_detalle VALUES (892, 424, 15, 1, 270000.00, 270000.00, '2026-01-15 23:19:03', '2026-01-15 23:19:03');
INSERT INTO public.ventas_detalle VALUES (893, 424, 18, 3, 240000.00, 720000.00, '2026-01-15 23:19:03', '2026-01-15 23:19:03');
INSERT INTO public.ventas_detalle VALUES (894, 425, 15, 2, 270000.00, 540000.00, '2024-08-15 19:19:03', '2024-08-15 19:19:03');
INSERT INTO public.ventas_detalle VALUES (895, 426, 1, 1, 250000.00, 250000.00, '2025-04-27 20:19:03', '2025-04-27 20:19:03');
INSERT INTO public.ventas_detalle VALUES (896, 426, 9, 1, 220000.00, 220000.00, '2025-04-27 20:19:03', '2025-04-27 20:19:03');
INSERT INTO public.ventas_detalle VALUES (897, 426, 15, 2, 270000.00, 540000.00, '2025-04-27 20:19:03', '2025-04-27 20:19:03');
INSERT INTO public.ventas_detalle VALUES (898, 427, 1, 2, 250000.00, 500000.00, '2025-01-21 18:19:03', '2025-01-21 18:19:03');
INSERT INTO public.ventas_detalle VALUES (899, 427, 3, 1, 180000.00, 180000.00, '2025-01-21 18:19:03', '2025-01-21 18:19:03');
INSERT INTO public.ventas_detalle VALUES (900, 427, 8, 1, 175000.00, 175000.00, '2025-01-21 18:19:03', '2025-01-21 18:19:03');
INSERT INTO public.ventas_detalle VALUES (901, 428, 7, 3, 160000.00, 480000.00, '2023-10-17 08:19:03', '2023-10-17 08:19:03');
INSERT INTO public.ventas_detalle VALUES (902, 428, 10, 1, 195000.00, 195000.00, '2023-10-17 08:19:03', '2023-10-17 08:19:03');
INSERT INTO public.ventas_detalle VALUES (903, 428, 15, 2, 270000.00, 540000.00, '2023-10-17 08:19:03', '2023-10-17 08:19:03');
INSERT INTO public.ventas_detalle VALUES (904, 429, 9, 3, 220000.00, 660000.00, '2024-12-11 07:19:03', '2024-12-11 07:19:03');
INSERT INTO public.ventas_detalle VALUES (905, 430, 11, 2, 150000.00, 300000.00, '2026-03-12 06:19:03', '2026-03-12 06:19:03');
INSERT INTO public.ventas_detalle VALUES (906, 430, 16, 2, 380000.00, 760000.00, '2026-03-12 06:19:03', '2026-03-12 06:19:03');
INSERT INTO public.ventas_detalle VALUES (907, 430, 18, 2, 240000.00, 480000.00, '2026-03-12 06:19:03', '2026-03-12 06:19:03');
INSERT INTO public.ventas_detalle VALUES (908, 431, 7, 1, 160000.00, 160000.00, '2023-09-01 09:19:04', '2023-09-01 09:19:04');
INSERT INTO public.ventas_detalle VALUES (909, 431, 17, 2, 350000.00, 700000.00, '2023-09-01 09:19:04', '2023-09-01 09:19:04');
INSERT INTO public.ventas_detalle VALUES (910, 432, 2, 2, 210000.00, 420000.00, '2024-09-08 18:19:04', '2024-09-08 18:19:04');
INSERT INTO public.ventas_detalle VALUES (911, 432, 5, 3, 190000.00, 570000.00, '2024-09-08 18:19:04', '2024-09-08 18:19:04');
INSERT INTO public.ventas_detalle VALUES (912, 432, 6, 1, 310000.00, 310000.00, '2024-09-08 18:19:04', '2024-09-08 18:19:04');
INSERT INTO public.ventas_detalle VALUES (913, 433, 12, 2, 205000.00, 410000.00, '2026-04-19 08:19:04', '2026-04-19 08:19:04');
INSERT INTO public.ventas_detalle VALUES (914, 434, 7, 3, 160000.00, 480000.00, '2023-06-19 13:19:04', '2023-06-19 13:19:04');
INSERT INTO public.ventas_detalle VALUES (915, 435, 5, 3, 190000.00, 570000.00, '2023-08-13 11:19:04', '2023-08-13 11:19:04');
INSERT INTO public.ventas_detalle VALUES (916, 436, 8, 2, 175000.00, 350000.00, '2025-05-10 13:19:04', '2025-05-10 13:19:04');
INSERT INTO public.ventas_detalle VALUES (917, 437, 1, 1, 250000.00, 250000.00, '2024-10-17 11:19:04', '2024-10-17 11:19:04');
INSERT INTO public.ventas_detalle VALUES (918, 438, 10, 1, 195000.00, 195000.00, '2025-02-28 19:19:04', '2025-02-28 19:19:04');
INSERT INTO public.ventas_detalle VALUES (919, 438, 18, 3, 240000.00, 720000.00, '2025-02-28 19:19:04', '2025-02-28 19:19:04');
INSERT INTO public.ventas_detalle VALUES (920, 439, 5, 1, 190000.00, 190000.00, '2024-07-07 02:19:04', '2024-07-07 02:19:04');
INSERT INTO public.ventas_detalle VALUES (921, 439, 9, 2, 220000.00, 440000.00, '2024-07-07 02:19:04', '2024-07-07 02:19:04');
INSERT INTO public.ventas_detalle VALUES (922, 439, 14, 2, 290000.00, 580000.00, '2024-07-07 02:19:04', '2024-07-07 02:19:04');
INSERT INTO public.ventas_detalle VALUES (923, 440, 1, 3, 250000.00, 750000.00, '2023-12-17 05:19:04', '2023-12-17 05:19:04');
INSERT INTO public.ventas_detalle VALUES (924, 440, 5, 1, 190000.00, 190000.00, '2023-12-17 05:19:04', '2023-12-17 05:19:04');
INSERT INTO public.ventas_detalle VALUES (925, 441, 6, 3, 310000.00, 930000.00, '2025-05-31 13:19:04', '2025-05-31 13:19:04');
INSERT INTO public.ventas_detalle VALUES (926, 442, 2, 2, 210000.00, 420000.00, '2025-05-02 14:19:04', '2025-05-02 14:19:04');
INSERT INTO public.ventas_detalle VALUES (927, 442, 3, 2, 180000.00, 360000.00, '2025-05-02 14:19:04', '2025-05-02 14:19:04');
INSERT INTO public.ventas_detalle VALUES (928, 442, 5, 1, 190000.00, 190000.00, '2025-05-02 14:19:04', '2025-05-02 14:19:04');
INSERT INTO public.ventas_detalle VALUES (929, 443, 14, 1, 290000.00, 290000.00, '2024-06-21 19:19:04', '2024-06-21 19:19:04');
INSERT INTO public.ventas_detalle VALUES (930, 444, 11, 3, 150000.00, 450000.00, '2026-05-25 08:19:04', '2026-05-25 08:19:04');
INSERT INTO public.ventas_detalle VALUES (931, 444, 12, 2, 205000.00, 410000.00, '2026-05-25 08:19:04', '2026-05-25 08:19:04');
INSERT INTO public.ventas_detalle VALUES (932, 445, 5, 3, 190000.00, 570000.00, '2024-03-10 02:19:04', '2024-03-10 02:19:04');
INSERT INTO public.ventas_detalle VALUES (933, 446, 6, 3, 310000.00, 930000.00, '2024-11-03 22:19:04', '2024-11-03 22:19:04');
INSERT INTO public.ventas_detalle VALUES (934, 446, 7, 3, 160000.00, 480000.00, '2024-11-03 22:19:04', '2024-11-03 22:19:04');
INSERT INTO public.ventas_detalle VALUES (935, 447, 14, 3, 290000.00, 870000.00, '2024-05-30 11:19:04', '2024-05-30 11:19:04');
INSERT INTO public.ventas_detalle VALUES (936, 447, 15, 2, 270000.00, 540000.00, '2024-05-30 11:19:04', '2024-05-30 11:19:04');
INSERT INTO public.ventas_detalle VALUES (937, 448, 14, 2, 290000.00, 580000.00, '2025-05-20 23:19:04', '2025-05-20 23:19:04');
INSERT INTO public.ventas_detalle VALUES (938, 448, 15, 3, 270000.00, 810000.00, '2025-05-20 23:19:04', '2025-05-20 23:19:04');
INSERT INTO public.ventas_detalle VALUES (939, 448, 16, 1, 380000.00, 380000.00, '2025-05-20 23:19:04', '2025-05-20 23:19:04');
INSERT INTO public.ventas_detalle VALUES (940, 449, 8, 2, 175000.00, 350000.00, '2024-05-10 03:19:04', '2024-05-10 03:19:04');
INSERT INTO public.ventas_detalle VALUES (941, 450, 6, 2, 310000.00, 620000.00, '2025-09-23 22:19:04', '2025-09-23 22:19:04');
INSERT INTO public.ventas_detalle VALUES (942, 450, 17, 2, 350000.00, 700000.00, '2025-09-23 22:19:04', '2025-09-23 22:19:04');
INSERT INTO public.ventas_detalle VALUES (943, 451, 7, 3, 160000.00, 480000.00, '2024-12-14 17:19:04', '2024-12-14 17:19:04');
INSERT INTO public.ventas_detalle VALUES (944, 452, 3, 1, 180000.00, 180000.00, '2023-12-16 00:19:04', '2023-12-16 00:19:04');
INSERT INTO public.ventas_detalle VALUES (945, 452, 14, 1, 290000.00, 290000.00, '2023-12-16 00:19:04', '2023-12-16 00:19:04');
INSERT INTO public.ventas_detalle VALUES (946, 452, 17, 1, 350000.00, 350000.00, '2023-12-16 00:19:04', '2023-12-16 00:19:04');
INSERT INTO public.ventas_detalle VALUES (947, 453, 7, 3, 160000.00, 480000.00, '2025-10-05 10:19:04', '2025-10-05 10:19:04');
INSERT INTO public.ventas_detalle VALUES (948, 454, 10, 3, 195000.00, 585000.00, '2025-06-24 13:19:04', '2025-06-24 13:19:04');
INSERT INTO public.ventas_detalle VALUES (949, 455, 11, 2, 150000.00, 300000.00, '2024-12-01 10:19:04', '2024-12-01 10:19:04');
INSERT INTO public.ventas_detalle VALUES (950, 455, 14, 2, 290000.00, 580000.00, '2024-12-01 10:19:04', '2024-12-01 10:19:04');
INSERT INTO public.ventas_detalle VALUES (951, 456, 14, 3, 290000.00, 870000.00, '2023-06-20 17:19:04', '2023-06-20 17:19:04');
INSERT INTO public.ventas_detalle VALUES (952, 457, 8, 2, 175000.00, 350000.00, '2025-11-12 07:19:04', '2025-11-12 07:19:04');
INSERT INTO public.ventas_detalle VALUES (953, 457, 11, 1, 150000.00, 150000.00, '2025-11-12 07:19:04', '2025-11-12 07:19:04');
INSERT INTO public.ventas_detalle VALUES (954, 458, 3, 3, 180000.00, 540000.00, '2024-04-18 03:19:04', '2024-04-18 03:19:04');
INSERT INTO public.ventas_detalle VALUES (955, 458, 15, 3, 270000.00, 810000.00, '2024-04-18 03:19:04', '2024-04-18 03:19:04');
INSERT INTO public.ventas_detalle VALUES (956, 459, 6, 2, 310000.00, 620000.00, '2025-09-16 18:19:04', '2025-09-16 18:19:04');
INSERT INTO public.ventas_detalle VALUES (957, 459, 9, 2, 220000.00, 440000.00, '2025-09-16 18:19:04', '2025-09-16 18:19:04');
INSERT INTO public.ventas_detalle VALUES (958, 460, 1, 3, 250000.00, 750000.00, '2023-12-29 11:19:04', '2023-12-29 11:19:04');
INSERT INTO public.ventas_detalle VALUES (959, 460, 12, 3, 205000.00, 615000.00, '2023-12-29 11:19:04', '2023-12-29 11:19:04');
INSERT INTO public.ventas_detalle VALUES (960, 460, 16, 2, 380000.00, 760000.00, '2023-12-29 11:19:04', '2023-12-29 11:19:04');
INSERT INTO public.ventas_detalle VALUES (961, 461, 1, 2, 250000.00, 500000.00, '2024-01-15 14:19:04', '2024-01-15 14:19:04');
INSERT INTO public.ventas_detalle VALUES (962, 461, 6, 2, 310000.00, 620000.00, '2024-01-15 14:19:04', '2024-01-15 14:19:04');
INSERT INTO public.ventas_detalle VALUES (963, 461, 17, 2, 350000.00, 700000.00, '2024-01-15 14:19:04', '2024-01-15 14:19:04');
INSERT INTO public.ventas_detalle VALUES (964, 462, 11, 3, 150000.00, 450000.00, '2025-11-13 15:19:04', '2025-11-13 15:19:04');
INSERT INTO public.ventas_detalle VALUES (965, 462, 18, 1, 240000.00, 240000.00, '2025-11-13 15:19:04', '2025-11-13 15:19:04');
INSERT INTO public.ventas_detalle VALUES (966, 463, 5, 1, 190000.00, 190000.00, '2023-08-13 16:19:04', '2023-08-13 16:19:04');
INSERT INTO public.ventas_detalle VALUES (967, 463, 12, 3, 205000.00, 615000.00, '2023-08-13 16:19:04', '2023-08-13 16:19:04');
INSERT INTO public.ventas_detalle VALUES (968, 463, 17, 1, 350000.00, 350000.00, '2023-08-13 16:19:04', '2023-08-13 16:19:04');
INSERT INTO public.ventas_detalle VALUES (969, 464, 3, 3, 180000.00, 540000.00, '2025-08-01 11:19:04', '2025-08-01 11:19:04');
INSERT INTO public.ventas_detalle VALUES (970, 464, 5, 3, 190000.00, 570000.00, '2025-08-01 11:19:04', '2025-08-01 11:19:04');
INSERT INTO public.ventas_detalle VALUES (971, 464, 16, 2, 380000.00, 760000.00, '2025-08-01 11:19:04', '2025-08-01 11:19:04');
INSERT INTO public.ventas_detalle VALUES (972, 465, 5, 2, 190000.00, 380000.00, '2025-07-13 18:19:04', '2025-07-13 18:19:04');
INSERT INTO public.ventas_detalle VALUES (973, 466, 3, 2, 180000.00, 360000.00, '2024-09-08 11:19:04', '2024-09-08 11:19:04');
INSERT INTO public.ventas_detalle VALUES (974, 466, 8, 3, 175000.00, 525000.00, '2024-09-08 11:19:04', '2024-09-08 11:19:04');
INSERT INTO public.ventas_detalle VALUES (975, 466, 14, 2, 290000.00, 580000.00, '2024-09-08 11:19:04', '2024-09-08 11:19:04');
INSERT INTO public.ventas_detalle VALUES (976, 467, 2, 3, 210000.00, 630000.00, '2026-02-12 14:19:04', '2026-02-12 14:19:04');
INSERT INTO public.ventas_detalle VALUES (977, 467, 6, 2, 310000.00, 620000.00, '2026-02-12 14:19:04', '2026-02-12 14:19:04');
INSERT INTO public.ventas_detalle VALUES (978, 467, 9, 3, 220000.00, 660000.00, '2026-02-12 14:19:04', '2026-02-12 14:19:04');
INSERT INTO public.ventas_detalle VALUES (979, 468, 1, 2, 250000.00, 500000.00, '2024-01-23 15:19:04', '2024-01-23 15:19:04');
INSERT INTO public.ventas_detalle VALUES (980, 468, 12, 2, 205000.00, 410000.00, '2024-01-23 15:19:04', '2024-01-23 15:19:04');
INSERT INTO public.ventas_detalle VALUES (981, 469, 6, 3, 310000.00, 930000.00, '2025-09-07 07:19:04', '2025-09-07 07:19:04');
INSERT INTO public.ventas_detalle VALUES (982, 469, 7, 1, 160000.00, 160000.00, '2025-09-07 07:19:04', '2025-09-07 07:19:04');
INSERT INTO public.ventas_detalle VALUES (983, 469, 9, 1, 220000.00, 220000.00, '2025-09-07 07:19:04', '2025-09-07 07:19:04');
INSERT INTO public.ventas_detalle VALUES (984, 470, 2, 2, 210000.00, 420000.00, '2026-05-25 13:19:04', '2026-05-25 13:19:04');
INSERT INTO public.ventas_detalle VALUES (985, 470, 7, 3, 160000.00, 480000.00, '2026-05-25 13:19:04', '2026-05-25 13:19:04');
INSERT INTO public.ventas_detalle VALUES (986, 471, 5, 2, 190000.00, 380000.00, '2024-05-10 02:19:04', '2024-05-10 02:19:04');
INSERT INTO public.ventas_detalle VALUES (987, 471, 17, 2, 350000.00, 700000.00, '2024-05-10 02:19:04', '2024-05-10 02:19:04');
INSERT INTO public.ventas_detalle VALUES (988, 472, 3, 1, 180000.00, 180000.00, '2025-04-26 08:19:04', '2025-04-26 08:19:04');
INSERT INTO public.ventas_detalle VALUES (989, 473, 7, 3, 160000.00, 480000.00, '2023-07-31 04:19:04', '2023-07-31 04:19:04');
INSERT INTO public.ventas_detalle VALUES (990, 473, 11, 3, 150000.00, 450000.00, '2023-07-31 04:19:04', '2023-07-31 04:19:04');
INSERT INTO public.ventas_detalle VALUES (991, 473, 12, 1, 205000.00, 205000.00, '2023-07-31 04:19:04', '2023-07-31 04:19:04');
INSERT INTO public.ventas_detalle VALUES (992, 474, 10, 1, 195000.00, 195000.00, '2025-04-01 04:19:04', '2025-04-01 04:19:04');
INSERT INTO public.ventas_detalle VALUES (993, 474, 15, 1, 270000.00, 270000.00, '2025-04-01 04:19:04', '2025-04-01 04:19:04');
INSERT INTO public.ventas_detalle VALUES (994, 475, 10, 1, 195000.00, 195000.00, '2025-08-01 16:19:04', '2025-08-01 16:19:04');
INSERT INTO public.ventas_detalle VALUES (995, 476, 12, 3, 205000.00, 615000.00, '2023-07-02 22:19:04', '2023-07-02 22:19:04');
INSERT INTO public.ventas_detalle VALUES (996, 477, 7, 3, 160000.00, 480000.00, '2025-10-27 18:19:04', '2025-10-27 18:19:04');
INSERT INTO public.ventas_detalle VALUES (997, 477, 12, 1, 205000.00, 205000.00, '2025-10-27 18:19:04', '2025-10-27 18:19:04');
INSERT INTO public.ventas_detalle VALUES (998, 477, 18, 3, 240000.00, 720000.00, '2025-10-27 18:19:04', '2025-10-27 18:19:04');
INSERT INTO public.ventas_detalle VALUES (999, 478, 1, 3, 250000.00, 750000.00, '2025-06-02 11:19:04', '2025-06-02 11:19:04');
INSERT INTO public.ventas_detalle VALUES (1000, 478, 12, 2, 205000.00, 410000.00, '2025-06-02 11:19:04', '2025-06-02 11:19:04');
INSERT INTO public.ventas_detalle VALUES (1001, 479, 5, 3, 190000.00, 570000.00, '2025-10-07 15:19:04', '2025-10-07 15:19:04');
INSERT INTO public.ventas_detalle VALUES (1002, 480, 15, 2, 270000.00, 540000.00, '2024-04-04 01:19:04', '2024-04-04 01:19:04');
INSERT INTO public.ventas_detalle VALUES (1003, 480, 17, 2, 350000.00, 700000.00, '2024-04-04 01:19:04', '2024-04-04 01:19:04');
INSERT INTO public.ventas_detalle VALUES (1004, 481, 8, 2, 175000.00, 350000.00, '2024-07-07 18:19:04', '2024-07-07 18:19:04');
INSERT INTO public.ventas_detalle VALUES (1005, 482, 18, 1, 240000.00, 240000.00, '2024-01-19 22:19:04', '2024-01-19 22:19:04');
INSERT INTO public.ventas_detalle VALUES (1006, 483, 1, 1, 250000.00, 250000.00, '2025-02-02 11:19:04', '2025-02-02 11:19:04');
INSERT INTO public.ventas_detalle VALUES (1007, 483, 10, 3, 195000.00, 585000.00, '2025-02-02 11:19:04', '2025-02-02 11:19:04');
INSERT INTO public.ventas_detalle VALUES (1008, 483, 14, 2, 290000.00, 580000.00, '2025-02-02 11:19:04', '2025-02-02 11:19:04');
INSERT INTO public.ventas_detalle VALUES (1009, 484, 2, 3, 210000.00, 630000.00, '2025-08-17 17:19:04', '2025-08-17 17:19:04');
INSERT INTO public.ventas_detalle VALUES (1010, 485, 11, 2, 150000.00, 300000.00, '2026-03-28 15:19:04', '2026-03-28 15:19:04');
INSERT INTO public.ventas_detalle VALUES (1011, 485, 16, 2, 380000.00, 760000.00, '2026-03-28 15:19:04', '2026-03-28 15:19:04');
INSERT INTO public.ventas_detalle VALUES (1012, 486, 6, 3, 310000.00, 930000.00, '2023-12-24 23:19:04', '2023-12-24 23:19:04');
INSERT INTO public.ventas_detalle VALUES (1013, 486, 7, 1, 160000.00, 160000.00, '2023-12-24 23:19:04', '2023-12-24 23:19:04');
INSERT INTO public.ventas_detalle VALUES (1014, 486, 11, 3, 150000.00, 450000.00, '2023-12-24 23:19:04', '2023-12-24 23:19:04');
INSERT INTO public.ventas_detalle VALUES (1015, 487, 17, 2, 350000.00, 700000.00, '2023-10-20 21:19:04', '2023-10-20 21:19:04');
INSERT INTO public.ventas_detalle VALUES (1016, 488, 5, 1, 190000.00, 190000.00, '2025-02-23 08:19:04', '2025-02-23 08:19:04');
INSERT INTO public.ventas_detalle VALUES (1017, 488, 12, 2, 205000.00, 410000.00, '2025-02-23 08:19:04', '2025-02-23 08:19:04');
INSERT INTO public.ventas_detalle VALUES (1018, 488, 14, 1, 290000.00, 290000.00, '2025-02-23 08:19:04', '2025-02-23 08:19:04');
INSERT INTO public.ventas_detalle VALUES (1019, 489, 18, 3, 240000.00, 720000.00, '2026-06-13 21:19:04', '2026-06-13 21:19:04');
INSERT INTO public.ventas_detalle VALUES (1020, 490, 5, 1, 190000.00, 190000.00, '2025-07-27 08:19:04', '2025-07-27 08:19:04');
INSERT INTO public.ventas_detalle VALUES (1021, 490, 8, 1, 175000.00, 175000.00, '2025-07-27 08:19:04', '2025-07-27 08:19:04');
INSERT INTO public.ventas_detalle VALUES (1022, 490, 17, 3, 350000.00, 1050000.00, '2025-07-27 08:19:04', '2025-07-27 08:19:04');
INSERT INTO public.ventas_detalle VALUES (1023, 491, 7, 1, 160000.00, 160000.00, '2026-03-15 02:19:04', '2026-03-15 02:19:04');
INSERT INTO public.ventas_detalle VALUES (1024, 491, 16, 3, 380000.00, 1140000.00, '2026-03-15 02:19:04', '2026-03-15 02:19:04');
INSERT INTO public.ventas_detalle VALUES (1025, 492, 2, 1, 210000.00, 210000.00, '2023-06-22 21:19:04', '2023-06-22 21:19:04');
INSERT INTO public.ventas_detalle VALUES (1026, 492, 5, 3, 190000.00, 570000.00, '2023-06-22 21:19:04', '2023-06-22 21:19:04');
INSERT INTO public.ventas_detalle VALUES (1027, 493, 12, 3, 205000.00, 615000.00, '2026-04-19 09:19:04', '2026-04-19 09:19:04');
INSERT INTO public.ventas_detalle VALUES (1028, 494, 7, 2, 160000.00, 320000.00, '2024-05-14 22:19:04', '2024-05-14 22:19:04');
INSERT INTO public.ventas_detalle VALUES (1029, 494, 8, 1, 175000.00, 175000.00, '2024-05-14 22:19:04', '2024-05-14 22:19:04');
INSERT INTO public.ventas_detalle VALUES (1030, 494, 10, 1, 195000.00, 195000.00, '2024-05-14 22:19:04', '2024-05-14 22:19:04');
INSERT INTO public.ventas_detalle VALUES (1031, 495, 8, 2, 175000.00, 350000.00, '2025-04-23 16:19:04', '2025-04-23 16:19:04');
INSERT INTO public.ventas_detalle VALUES (1032, 495, 15, 2, 270000.00, 540000.00, '2025-04-23 16:19:04', '2025-04-23 16:19:04');
INSERT INTO public.ventas_detalle VALUES (1033, 495, 16, 2, 380000.00, 760000.00, '2025-04-23 16:19:04', '2025-04-23 16:19:04');
INSERT INTO public.ventas_detalle VALUES (1034, 496, 11, 2, 150000.00, 300000.00, '2025-07-18 06:19:04', '2025-07-18 06:19:04');
INSERT INTO public.ventas_detalle VALUES (1035, 497, 2, 1, 210000.00, 210000.00, '2024-04-24 10:19:04', '2024-04-24 10:19:04');
INSERT INTO public.ventas_detalle VALUES (1036, 497, 5, 2, 190000.00, 380000.00, '2024-04-24 10:19:04', '2024-04-24 10:19:04');
INSERT INTO public.ventas_detalle VALUES (1037, 497, 11, 2, 150000.00, 300000.00, '2024-04-24 10:19:04', '2024-04-24 10:19:04');
INSERT INTO public.ventas_detalle VALUES (1038, 498, 5, 3, 190000.00, 570000.00, '2024-09-28 22:19:04', '2024-09-28 22:19:04');
INSERT INTO public.ventas_detalle VALUES (1039, 498, 11, 2, 150000.00, 300000.00, '2024-09-28 22:19:04', '2024-09-28 22:19:04');
INSERT INTO public.ventas_detalle VALUES (1040, 498, 17, 3, 350000.00, 1050000.00, '2024-09-28 22:19:04', '2024-09-28 22:19:04');
INSERT INTO public.ventas_detalle VALUES (1041, 499, 6, 2, 310000.00, 620000.00, '2025-01-02 23:19:04', '2025-01-02 23:19:04');
INSERT INTO public.ventas_detalle VALUES (1042, 499, 15, 2, 270000.00, 540000.00, '2025-01-02 23:19:04', '2025-01-02 23:19:04');
INSERT INTO public.ventas_detalle VALUES (1043, 499, 18, 1, 240000.00, 240000.00, '2025-01-02 23:19:04', '2025-01-02 23:19:04');
INSERT INTO public.ventas_detalle VALUES (1044, 500, 5, 2, 190000.00, 380000.00, '2023-11-22 14:19:04', '2023-11-22 14:19:04');
INSERT INTO public.ventas_detalle VALUES (1045, 500, 6, 2, 310000.00, 620000.00, '2023-11-22 14:19:04', '2023-11-22 14:19:04');
INSERT INTO public.ventas_detalle VALUES (1046, 501, 11, 1, 150000.00, 150000.00, '2024-01-16 06:19:04', '2024-01-16 06:19:04');
INSERT INTO public.ventas_detalle VALUES (1047, 501, 12, 2, 205000.00, 410000.00, '2024-01-16 06:19:04', '2024-01-16 06:19:04');
INSERT INTO public.ventas_detalle VALUES (1048, 501, 17, 1, 350000.00, 350000.00, '2024-01-16 06:19:04', '2024-01-16 06:19:04');


--
-- TOC entry 5216 (class 0 OID 0)
-- Dependencies: 221
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 3, true);


--
-- TOC entry 5217 (class 0 OID 0)
-- Dependencies: 223
-- Name: contactos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contactos_id_seq', 50, true);


--
-- TOC entry 5218 (class 0 OID 0)
-- Dependencies: 240
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 5219 (class 0 OID 0)
-- Dependencies: 237
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 5220 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 258, true);


--
-- TOC entry 5221 (class 0 OID 0)
-- Dependencies: 244
-- Name: producto_imagenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_imagenes_id_seq', 36, true);


--
-- TOC entry 5222 (class 0 OID 0)
-- Dependencies: 225
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 18, true);


--
-- TOC entry 5223 (class 0 OID 0)
-- Dependencies: 227
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- TOC entry 5224 (class 0 OID 0)
-- Dependencies: 246
-- Name: user_direcciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_direcciones_id_seq', 1, false);


--
-- TOC entry 5225 (class 0 OID 0)
-- Dependencies: 248
-- Name: user_tarjetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_tarjetas_id_seq', 71, true);


--
-- TOC entry 5226 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 101, true);


--
-- TOC entry 5227 (class 0 OID 0)
-- Dependencies: 232
-- Name: ventas_cabecera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_cabecera_id_seq', 501, true);


--
-- TOC entry 5228 (class 0 OID 0)
-- Dependencies: 234
-- Name: ventas_detalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_detalle_id_seq', 1048, true);


--
-- TOC entry 5003 (class 2606 OID 30611)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 5001 (class 2606 OID 30601)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 4964 (class 2606 OID 30407)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 4966 (class 2606 OID 30409)
-- Name: categorias categorias_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_slug_unique UNIQUE (slug);


--
-- TOC entry 4968 (class 2606 OID 30424)
-- Name: contactos contactos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_pkey PRIMARY KEY (id);


--
-- TOC entry 4997 (class 2606 OID 30589)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4999 (class 2606 OID 30591)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4995 (class 2606 OID 30572)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 4992 (class 2606 OID 30557)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4962 (class 2606 OID 26726)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4990 (class 2606 OID 30542)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 5005 (class 2606 OID 30626)
-- Name: producto_imagenes producto_imagenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_imagenes
    ADD CONSTRAINT producto_imagenes_pkey PRIMARY KEY (id);


--
-- TOC entry 4970 (class 2606 OID 30442)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 4972 (class 2606 OID 30449)
-- Name: productos productos_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_slug_unique UNIQUE (slug);


--
-- TOC entry 4974 (class 2606 OID 30460)
-- Name: roles roles_nombre_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_nombre_unique UNIQUE (nombre);


--
-- TOC entry 4976 (class 2606 OID 30458)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4983 (class 2606 OID 30490)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 5007 (class 2606 OID 30653)
-- Name: user_direcciones user_direcciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_direcciones
    ADD CONSTRAINT user_direcciones_pkey PRIMARY KEY (id);


--
-- TOC entry 5009 (class 2606 OID 30680)
-- Name: user_tarjetas user_tarjetas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tarjetas
    ADD CONSTRAINT user_tarjetas_pkey PRIMARY KEY (id);


--
-- TOC entry 4978 (class 2606 OID 30480)
-- Name: usuarios usuarios_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_unique UNIQUE (email);


--
-- TOC entry 4980 (class 2606 OID 30473)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4986 (class 2606 OID 30505)
-- Name: ventas_cabecera ventas_cabecera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_cabecera
    ADD CONSTRAINT ventas_cabecera_pkey PRIMARY KEY (id);


--
-- TOC entry 4988 (class 2606 OID 30523)
-- Name: ventas_detalle ventas_detalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT ventas_detalle_pkey PRIMARY KEY (id);


--
-- TOC entry 4993 (class 1259 OID 30558)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 4981 (class 1259 OID 30492)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 4984 (class 1259 OID 30491)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 5016 (class 2606 OID 30627)
-- Name: producto_imagenes producto_imagenes_producto_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_imagenes
    ADD CONSTRAINT producto_imagenes_producto_id_foreign FOREIGN KEY (producto_id) REFERENCES public.productos(id) ON DELETE CASCADE;


--
-- TOC entry 5010 (class 2606 OID 30443)
-- Name: productos productos_categoria_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_categoria_id_foreign FOREIGN KEY (categoria_id) REFERENCES public.categorias(id) ON DELETE CASCADE;


--
-- TOC entry 5017 (class 2606 OID 30654)
-- Name: user_direcciones user_direcciones_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_direcciones
    ADD CONSTRAINT user_direcciones_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


--
-- TOC entry 5018 (class 2606 OID 30681)
-- Name: user_tarjetas user_tarjetas_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tarjetas
    ADD CONSTRAINT user_tarjetas_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


--
-- TOC entry 5011 (class 2606 OID 30474)
-- Name: usuarios usuarios_rol_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_rol_id_foreign FOREIGN KEY (rol_id) REFERENCES public.roles(id) ON DELETE SET NULL;


--
-- TOC entry 5012 (class 2606 OID 30659)
-- Name: ventas_cabecera ventas_cabecera_user_direccion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_cabecera
    ADD CONSTRAINT ventas_cabecera_user_direccion_id_foreign FOREIGN KEY (user_direccion_id) REFERENCES public.user_direcciones(id) ON DELETE SET NULL;


--
-- TOC entry 5013 (class 2606 OID 30506)
-- Name: ventas_cabecera ventas_cabecera_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_cabecera
    ADD CONSTRAINT ventas_cabecera_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


--
-- TOC entry 5014 (class 2606 OID 30529)
-- Name: ventas_detalle ventas_detalle_producto_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT ventas_detalle_producto_id_foreign FOREIGN KEY (producto_id) REFERENCES public.productos(id) ON DELETE RESTRICT;


--
-- TOC entry 5015 (class 2606 OID 30524)
-- Name: ventas_detalle ventas_detalle_venta_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_detalle
    ADD CONSTRAINT ventas_detalle_venta_id_foreign FOREIGN KEY (venta_id) REFERENCES public.ventas_cabecera(id) ON DELETE CASCADE;


-- Completed on 2026-06-17 14:24:38

--
-- PostgreSQL database dump complete
--

\unrestrict MrCTzpiCohpoX8YeTfHQhyTEI92UCNkLeg7SQRgslWbqEayNzkpNQmiFo6GdnKt

