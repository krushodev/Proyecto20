# Vittorio — Plataforma E-commerce de Relojes

> Aplicación web de comercio electrónico especializada en la venta de relojes, desarrollada con Laravel 13. Incluye catálogo de productos, carrito de compras, proceso de checkout con integración a Mercado Pago, gestión de tarjetas de crédito guardadas, panel de administración y gestión de pedidos con generación de facturas en PDF.

---

## Tabla de Contenidos

1. [Descripción General](#descripción-general)
2. [Funcionalidades Principales](#funcionalidades-principales)
3. [Tecnologías Utilizadas](#tecnologías-utilizadas)
4. [Requisitos Previos](#requisitos-previos)
5. [Instalación](#instalación)
6. [Configuración del Entorno](#configuración-del-entorno)
7. [Base de Datos](#base-de-datos)
8. [Ejecución Local](#ejecución-local)
9. [Ejecución con Laravel Herd](#ejecución-con-laravel-herd)
10. [Comandos Útiles](#comandos-útiles)
11. [Estructura de Carpetas](#estructura-de-carpetas)
12. [Flujo de Autenticación y Roles](#flujo-de-autenticación-y-roles)
13. [Gestión de Tarjetas de Crédito](#gestión-de-tarjetas-de-crédito)
14. [Integración con Mercado Pago](#integración-con-mercado-pago)
15. [Testing de Pagos (Sandbox)](#testing-de-pagos-sandbox)
16. [Pruebas Automatizadas](#pruebas-automatizadas)
17. [Consideraciones de Despliegue](#consideraciones-de-despliegue)
18. [Solución de Problemas Frecuentes](#solución-de-problemas-frecuentes)
19. [Buenas Prácticas para Nuevos Desarrolladores](#buenas-prácticas-para-nuevos-desarrolladores)

---

## Descripción General

**Vittorio** es una plataforma de e-commerce para la venta de relojes, construida como una aplicación MVC tradicional con Laravel 13. El proyecto integra un flujo de compra completo desde el catálogo hasta el pago, con panel de administración para la gestión de productos, usuarios, ventas y mensajes de contacto.

El diseño sigue un sistema de doble paleta visual: un modo oscuro de marketing (negro, tipografía de display) y un modo claro transaccional (crema-menta, verdes pasteles).

---

## Funcionalidades Principales

### Para el cliente
- Catálogo de relojes con filtros por categoría, precio y características
- Página de detalle de producto con imágenes múltiples (estudio y lifestyle)
- Carrito de compras con sesión persistente
- Checkout en múltiples pasos: envío → costo de envío → pago
- Pago con Mercado Pago (sandbox y producción)
- **Gestión de tarjetas de crédito/débito**: agregar múltiples tarjetas al perfil con UI visual animada, detección automática de franquicia (Visa, Mastercard, Amex, Cabal, Naranja X, etc.) y selección rápida en el checkout
- Historial de compras con descarga de facturas en PDF
- Gestión de perfil y direcciones de envío guardadas
- Formulario de contacto con notificación por email al administrador
- Registro, login y recuperación de contraseña
- Toggle de visibilidad en todos los campos de contraseña

### Para el administrador
- Dashboard con métricas generales
- CRUD completo de productos, categorías e imágenes
- Gestión de usuarios y roles
- Visualización y seguimiento de ventas/pedidos
- Gestión de mensajes de contacto (marcar como leído)
- Perfil de administrador editable

---

## Tecnologías Utilizadas

| Capa | Tecnología | Versión |
|------|-----------|---------|
| Backend | Laravel | ^13.0 |
| PHP | PHP | ^8.3 |
| Frontend | Blade + Bootstrap | 5.3.3 |
| Build | Vite | ^8.0.0 |
| Íconos | Lucide | ^0.468.0 |
| HTTP client JS | Axios | latest |
| PDF | barryvdh/laravel-dompdf | latest |
| Pagos | mercadopago/dx-php | latest |
| Testing | Pest PHP | ^4.4 |
| Linting | Laravel Pint | ^1.27 |
| Base de datos | PostgreSQL | 18 |

---

## Requisitos Previos

Antes de instalar el proyecto, asegurate de tener:

- **PHP 8.3 o superior** con las extensiones: `pdo`, `pdo_sqlite` (dev), `pdo_mysql` (prod), `mbstring`, `openssl`, `tokenizer`, `xml`, `ctype`, `json`, `bcmath`, `fileinfo`, `gd`
- **Composer 2.x**
- **Node.js 20+** y **npm 10+**
- **Git**
- **PostgreSQL 18+**
- **Laravel Herd**

> **Verificación rápida:**
> ```bash
> php -v        # debe mostrar 8.3+
> composer -V   # debe mostrar 2.x
> node -v       # debe mostrar 20+
> npm -v        # debe mostrar 10+
> ```

---

## Instalación

### Opción A — Setup automático (recomendado)

El proyecto incluye un script de setup que realiza todos los pasos de instalación en un solo comando:

```bash
git clone <url-del-repositorio> Vittorio
cd Vittorio
composer run setup
```

Este comando ejecuta internamente:
1. `composer install` — instala dependencias PHP
2. Copia `.env.example` a `.env`
3. `php artisan key:generate` — genera la clave de aplicación
4. `php artisan migrate` — ejecuta las migraciones
5. `npm install` — instala dependencias JS
6. `npm run build` — compila los assets

### Opción B — Instalación manual paso a paso

```bash
# 1. Clonar el repositorio
git clone <url-del-repositorio> Vittorio
cd Vittorio

# 2. Instalar dependencias PHP
composer install

# 3. Crear el archivo de entorno
cp .env.example .env

# 4. Generar la clave de aplicación
php artisan key:generate

# 5. Instalar dependencias JavaScript
npm install

# 6. Compilar los assets
npm run build
```

Luego continuar con la sección de [Base de Datos](#base-de-datos) antes de ejecutar el proyecto.

---

## Configuración del Entorno

Editá el archivo `.env` con los valores correspondientes a tu entorno. Las variables críticas son:

### Variables de aplicación

```env
APP_NAME="Vittorio"
APP_ENV=local            # local | production
APP_DEBUG=true           # false en producción
APP_URL=http://localhost:8000
APP_LOCALE=es
APP_FALLBACK_LOCALE=es
```

### Variables de base de datos

**SQLite (desarrollo por defecto):**
```env
DB_CONNECTION=sqlite
# No se requieren más variables; el archivo se crea en database/database.sqlite
```

**MySQL (producción):**
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=Vittorio
DB_USERNAME=tu_usuario
DB_PASSWORD=tu_contraseña
```

### Variables de correo

```env
MAIL_MAILER=smtp
MAIL_HOST=sandbox.smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=tu_usuario_mailtrap
MAIL_PASSWORD=tu_password_mailtrap
MAIL_FROM_ADDRESS="no-reply@Vittorio.com"
MAIL_FROM_NAME="Vittorio"
ADMIN_MAIL=admin@Vittorio.com   # recibe notificaciones de contacto
```

> Para desarrollo se recomienda usar [Mailtrap](https://mailtrap.io) como SMTP sandbox. Creá una cuenta gratuita y copiá las credenciales de tu bandeja de prueba.

### Variables de Mercado Pago

```env
MP_ACCESS_TOKEN=TEST-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
MP_PUBLIC_KEY=TEST-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

> Obtené tus tokens en [mercadopago.com.ar/developers](https://www.mercadopago.com.ar/developers) → Tus aplicaciones → Credenciales de prueba.

### Variables opcionales

```env
# AWS S3 (solo si se usa almacenamiento en la nube)
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
```

---

## Base de Datos

### Crear el archivo SQLite (desarrollo)

```bash
# Crear el archivo de base de datos SQLite
touch database/database.sqlite    # Linux/macOS
# En Windows PowerShell:
New-Item database/database.sqlite -ItemType File
```

### Ejecutar migraciones

```bash
php artisan migrate
```

### Ejecutar seeders

El proyecto incluye seeders con datos de demostración:

```bash
# Ejecutar todos los seeders (roles, admin, usuarios demo, catálogo completo, ventas demo)
php artisan db:seed

# Seeders individuales
php artisan db:seed --class=RolesSeeder         # Crea los roles del sistema
php artisan db:seed --class=SuperAdminSeeder    # Crea el usuario administrador
php artisan db:seed --class=UsuariosSeeder      # Crea usuarios de demostración
php artisan db:seed --class=CatalogoSeeder      # Carga el catálogo completo de relojes
php artisan db:seed --class=VentasDemoSeeder    # Carga ventas de ejemplo
php artisan db:seed --class=ContactosDemoSeeder # Carga mensajes de contacto de ejemplo
```

> **Advertencia:** `CatalogoSeeder` es un archivo extenso (~18.000 líneas) que carga el catálogo completo. La ejecución puede tardar varios minutos.

### Reiniciar la base de datos (fresh + seed)

```bash
php artisan migrate:fresh --seed
```

### Credenciales del administrador por defecto

Luego de ejecutar `SuperAdminSeeder`, el usuario administrador es:

> **Nota:** Las credenciales del superadmin no están hardcodeadas en este README por seguridad. Consultá directamente el archivo `database/seeders/SuperAdminSeeder.php` o pedíselas al líder del proyecto.

### Usuarios de demostración (clientes)

`UsuariosSeeder` crea 3 clientes de demo con tarjetas preconfiguradas y 47 clientes aleatorios:

| Email | Contraseña | Tarjetas precargadas |
|-------|-----------|----------------------|
| `cliente1@demo.com` | `123456789` | Visa ···4242, Mastercard ···5521 |
| `cliente2@demo.com` | `123456789` | Amex ···0005 |
| `cliente3@demo.com` | `123456789` | Naranja X ···6234 |

Los 47 clientes aleatorios se generan con probabilidades: 50% sin tarjeta, 30% con una tarjeta, 20% con dos tarjetas.

> Los seeders son idempotentes: ejecutar `db:seed` varias veces no duplica datos.

---

## Ejecución Local

### Servidor de desarrollo (todo en uno)

```bash
composer run dev
```

Este comando lanza en paralelo:
- **Servidor Laravel** en `http://localhost:8000`
- **Listener de colas** (procesamiento de jobs en background)
- **Servidor Vite** con Hot Module Replacement para assets

### Comandos individuales (si se prefiere control manual)

```bash
# Terminal 1: servidor web
php artisan serve

# Terminal 2: worker de colas (necesario para emails y jobs)
php artisan queue:listen

# Terminal 3: compilación de assets en modo watch
npm run dev
```

---

## Ejecución con Laravel Herd

[Laravel Herd](https://herd.laravel.com/) provee un entorno PHP/Nginx preconfigurado sin necesidad de levantar un servidor manualmente.

### Configuración con Herd

1. Abrí Herd y agregá la carpeta del proyecto como sitio (Sites → Add)
2. El sitio quedará disponible en `http://Vittorio.test` (usando el nombre de la carpeta)
3. Configurá `APP_URL=http://Vittorio.test` en tu `.env`
4. **No es necesario ejecutar `php artisan serve`** — Herd maneja el servidor web

### Assets y colas con Herd

Aunque Herd sirve la app automáticamente, los assets y las colas siguen necesitando comandos manuales:

```bash
# Compilar assets en modo watch (terminal aparte)
npm run dev

# Worker de colas (terminal aparte, necesario para emails)
php artisan queue:listen
```

> **Nota:** Herd no gestiona el worker de colas ni Vite. Debés ejecutarlos manualmente o configurar un proceso supervisor.

### Base de datos con Herd

Herd incluye soporte para **DBngin** para gestionar MySQL/PostgreSQL. Si lo usás, actualizá las variables `DB_*` en `.env` con las credenciales que te provea DBngin.

---

## Comandos Útiles

### Artisan

```bash
# Listar todas las rutas disponibles
php artisan route:list

# Limpiar todos los caches de la aplicación
php artisan optimize:clear

# Generar caché de rutas y configuración (producción)
php artisan optimize

# Abrir la consola interactiva de Laravel
php artisan tinker

# Ver los logs en tiempo real
php artisan pail

# Ejecutar jobs pendientes de la cola manualmente
php artisan queue:work --once

# Crear un nuevo seeder
php artisan make:seeder NombreSeeder

# Crear un nuevo modelo con migración, factory y seeder
php artisan make:model NombreModelo -mfs
```

### Composer

```bash
# Setup completo desde cero
composer run setup

# Iniciar entorno de desarrollo
composer run dev

# Ejecutar la suite de tests
composer run test

# Corregir estilo de código automáticamente
./vendor/bin/pint
```

### NPM / Vite

```bash
# Modo desarrollo con HMR
npm run dev

# Build de producción
npm run build
```

---

## Estructura de Carpetas

```
Proyecto20/
├── app/
│   ├── Http/
│   │   ├── Controllers/        # Controladores (14 archivos)
│   │   ├── Middleware/         # CheckRol — control de acceso por rol
│   │   └── Requests/           # Form Requests de validación (12 archivos)
│   ├── Mail/                   # Clases Mailable (ContactoRecibidoMail, FacturaCompraMail)
│   ├── Models/                 # Modelos Eloquent (10 modelos)
│   ├── Notifications/          # ResetPasswordNotification
│   ├── Providers/              # Service Providers de Laravel
│   └── Services/               # Capa de servicios con lógica de negocio (9 servicios)
│
├── bootstrap/                  # Bootstrapping de la aplicación
├── config/                     # Archivos de configuración (app, auth, db, mail, etc.)
│
├── database/
│   ├── factories/              # Factories para testing
│   ├── migrations/             # Migraciones de base de datos
│   └── seeders/                # Seeders con datos iniciales y de demo
│
├── lang/                       # Archivos de traducción (internacionalización)
│
├── public/                     # Raíz web pública
│   ├── css/                    # CSS compilado
│   ├── images/                 # Imágenes estáticas
│   └── index.php               # Entry point de la aplicación
│
├── resources/
│   ├── css/                    # Hojas de estilo fuente
│   ├── js/                     # JavaScript fuente (app.js, bootstrap.js)
│   └── views/                  # Templates Blade
│       ├── backend/            # Vistas del panel de administración
│       ├── checkout/           # Vistas del proceso de compra
│       ├── emails/             # Templates de email
│       ├── facturas/           # Template de factura PDF
│       ├── layout/             # Layouts maestros
│       ├── paginas/            # Páginas públicas del sitio
│       └── partes/             # Componentes reutilizables (navbar, footer, etc.)
│
├── routes/
│   └── web.php                 # Definición de todas las rutas HTTP
│
├── storage/                    # Archivos generados (logs, cache, uploads)
├── tests/                      # Suite de tests (Unit y Feature con Pest)
│
├── .env.example                # Plantilla de variables de entorno
├── composer.json               # Dependencias PHP y scripts
├── package.json                # Dependencias JS
├── vite.config.js              # Configuración de Vite
```

### Capa de Servicios (`app/Services/`)

El proyecto implementa una **arquitectura en capas** donde los controladores delegan la lógica de negocio a servicios dedicados:

| Servicio | Responsabilidad |
|---------|----------------|
| `AuthService` | Login, registro, logout |
| `CarritoService` | Agregar/quitar productos, confirmar pedido, generar PDF |
| `CategoriaService` | Listado de categorías con filtros |
| `CheckoutService` | Cálculo de envío, procesamiento de pago |
| `ContactoService` | Envío de formulario de contacto con email |
| `ProductoService` | Consultas y filtros de productos |
| `RolService` | Gestión de roles |
| `UsuarioService` | Gestión de usuarios |
| `VentaService` | Consulta y seguimiento de ventas |

---

## Flujo de Autenticación y Roles

### Sistema de autenticación

El proyecto implementa autenticación **propia** (sin Laravel Breeze/Jetstream). El proceso es:

1. El usuario se registra (`/registro`) → se crea con rol `cliente`
2. Hace login (`/login`) → se inicia sesión y se guarda el usuario en `auth()->guard('web')`
3. El middleware `CheckRol` evalúa el rol antes de acceder a rutas protegidas

### Roles del sistema

| Rol | Acceso |
|-----|--------|
| `admin` | Panel `/admin/*`, gestión completa |
| `cliente` | Rutas autenticadas: carrito, checkout, perfil, mis compras |

### Middleware de control de acceso

```php
// Solo administradores
Route::middleware(['auth', 'check.rol:admin'])->group(...);

// Solo NO administradores (clientes)
Route::middleware(['auth', 'check.rol:!admin'])->group(...);

// Solo invitados (no autenticados)
Route::middleware('guest')->group(...);
```

### Flujo de recuperación de contraseña

1. `GET /forgot-password` → formulario de email
2. `POST /forgot-password` → envía email con token (via `ResetPasswordNotification`)
3. `GET /reset-password/{token}` → formulario de nueva contraseña
4. `POST /reset-password` → actualiza contraseña y redirige al login

> **Requiere queue listener activo** para el envío del email de recuperación.

---

## Gestión de Tarjetas de Crédito

### Descripción

Los clientes pueden guardar múltiples tarjetas de crédito/débito en su perfil (`/perfil`) y seleccionarlas directamente en el paso de pago del checkout. El número completo de tarjeta **nunca se almacena** — solo los últimos 4 dígitos, el titular y la fecha de vencimiento.

### Tabla `user_tarjetas`

| Columna | Tipo | Descripción |
|---------|------|-------------|
| `id` | bigint PK | |
| `user_id` | FK → `usuarios` | Cascade delete |
| `ultimos_cuatro` | char(4) | Últimos 4 dígitos |
| `titular` | varchar(100) | Nombre en la tarjeta |
| `mes_exp` | char(2) | Mes de vencimiento (01–12) |
| `anio_exp` | char(2) | Año de vencimiento (dos dígitos) |
| `tipo` | varchar(20) | Franquicia: `visa`, `mastercard`, `amex`, `cabal`, `naranja`, etc. |

### Rutas

```
POST   /perfil/tarjetas              perfil.tarjetas.guardar   (auth, !admin)
DELETE /perfil/tarjetas/{tarjeta}    perfil.tarjetas.eliminar  (auth, !admin)
```

### Detección de franquicia

La franquicia se detecta en tiempo real vía JavaScript mientras el usuario escribe el número de tarjeta, usando regexes sobre los primeros dígitos (BIN):

| Franquicia | Prefijo |
|-----------|---------|
| Visa | `4` |
| Mastercard | `51–55`, `2221–2720` |
| Amex | `34`, `37` |
| Naranja X | `589562` |
| Cabal | `604201–604229`, `589657` |
| Argencard | `501105` |

El partial `resources/views/partes/card-brand-svg.blade.php` renderiza el SVG de la franquicia en las tarjetas visuales del perfil y el checkout.

### Modelo `UserTarjeta`

```php
// Relación inversa
public function usuario(): BelongsTo  // → App\Models\Usuario

// Accessor conveniente
$tarjeta->vencimiento  // devuelve "MM/AA"
```

La relación directa en `Usuario`:

```php
public function tarjetas(): HasMany  // ordenadas por más reciente
```

---

## Integración con Mercado Pago

El proyecto usa el SDK oficial `mercadopago/dx-php` para procesar pagos.

### Flujo de pago

1. El usuario completa el checkout (dirección + costo de envío)
2. En `/checkout/pago` se presenta el formulario con el SDK de Mercado Pago
3. `CheckoutService` procesa el pago contra la API de Mercado Pago
4. Si el pago es aprobado, se crea la venta y se envía la factura por email
5. El usuario es redirigido a `/checkout/confirmacion`

### Variables requeridas

```env
MP_ACCESS_TOKEN=TEST-...  # o PROD-... en producción
MP_PUBLIC_KEY=TEST-...    # o clave de producción
```

> **Importante:** El helper con las tarjetas de prueba aparece directamente en la vista `/checkout/pago` cuando `APP_ENV=local`.

---

## Testing de Pagos (Sandbox)

Para probar el flujo completo de pago con Mercado Pago en entorno local, usá las siguientes credenciales del Sandbox oficial.

### Usuario de prueba

| Campo | Valor |
|-------|-------|
| Email/User | `TESTUSER509545247134908191` |
| Contraseña | `wPnWdankvc` |
| DNI | `3473858966` |

### Tarjetas de prueba

| Red | Número | CVV | Vencimiento |
|----|--------|-----|-------------|
| Mastercard | `5031 7557 3453 0604` | `123` | `11/30` |
| Visa | `4509 9535 6623 3704` | `123` | `11/30` |

> Estas credenciales son de sandbox y no generan cargos reales.

---

## Pruebas Automatizadas

El proyecto usa **Pest PHP** como framework de testing.

```bash
# Ejecutar todos los tests
composer run test

# Alternativa directa
./vendor/bin/pest

# Ejecutar solo tests de una carpeta
./vendor/bin/pest tests/Feature

# Ejecutar con cobertura (requiere Xdebug o PCOV)
./vendor/bin/pest --coverage
```

La base de datos de testing usa **SQLite en memoria** (configurado en `phpunit.xml`), por lo que los tests no afectan la base de datos de desarrollo.

---

## Consideraciones de Despliegue

### Variables de entorno críticas para producción

```env
APP_ENV=production
APP_DEBUG=false
APP_URL=https://tu-dominio.com

# Base de datos MySQL (reemplazar SQLite)
DB_CONNECTION=mysql
DB_HOST=...
DB_DATABASE=...
DB_USERNAME=...
DB_PASSWORD=...

# Mercado Pago (credenciales de producción, sin prefijo TEST-)
MP_ACCESS_TOKEN=APP_USR-...
MP_PUBLIC_KEY=APP_USR-...

# Mail en producción (reemplazar Mailtrap)
MAIL_MAILER=smtp
MAIL_HOST=...
```

### Comandos de despliegue

```bash
# Instalar dependencias sin dev
composer install --no-dev --optimize-autoloader

# Compilar assets de producción
npm run build

# Ejecutar migraciones
php artisan migrate --force

# Optimizar la aplicación
php artisan optimize

# Configurar permisos de storage (Linux/macOS)
chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache
```

### Queue worker en producción

En producción, el queue worker debe ejecutarse como un proceso supervisado. Ejemplo con **Supervisor** (Linux):

```ini
[program:Vittorio-worker]
command=php /var/www/Vittorio/artisan queue:work --sleep=3 --tries=3
autostart=true
autorestart=true
user=www-data
```

> **Nota:** Sin queue worker activo, los emails (recuperación de contraseña, facturas) no se enviarán.

### Almacenamiento de archivos

Actualmente el proyecto usa el sistema de archivos local. Si se requiere almacenamiento en la nube, configurar las variables `AWS_*` y cambiar `FILESYSTEM_DISK=s3` en el `.env`.

---

## Solución de Problemas Frecuentes

### La aplicación muestra "No application encryption key has been specified"

```bash
php artisan key:generate
```

### Los assets CSS/JS no se cargan

```bash
# Verificar que Vite haya compilado los assets
npm run build

# En desarrollo, asegurarse de que el servidor Vite esté corriendo
npm run dev
```

### Los emails no se envían

1. Verificar que el queue worker esté corriendo: `php artisan queue:listen`
2. Verificar las credenciales SMTP en `.env`
3. Revisar los logs: `php artisan pail` o `storage/logs/laravel.log`
4. Verificar que los jobs no estén fallando: `php artisan queue:failed`

### Error de permisos en `storage/` o `bootstrap/cache/`

```bash
# Linux/macOS
chmod -R 775 storage bootstrap/cache

# Windows (PowerShell como administrador)
icacls storage /grant "IIS_IUSRS:(OI)(CI)F"
```

### Las migraciones fallan con SQLite

```bash
# Verificar que el archivo existe
ls database/database.sqlite

# Si no existe, crearlo
touch database/database.sqlite          # Linux/macOS
New-Item database/database.sqlite       # Windows PowerShell
```

### El pago con Mercado Pago falla

1. Verificar que `MP_ACCESS_TOKEN` y `MP_PUBLIC_KEY` estén configurados en `.env`
2. En desarrollo, asegurarse de usar tokens con prefijo `TEST-`
3. Revisar los logs de Laravel para el mensaje de error de la API
4. Verificar que `APP_URL` sea accesible desde internet (Mercado Pago necesita hacer callbacks)

### Errores de "Class not found" tras actualizar código

```bash
php artisan optimize:clear
composer dump-autoload
```

---

## Buenas Prácticas para Nuevos Desarrolladores

### Antes de empezar

1. Leer este README completo y el archivo `DESIGN.md` para entender el sistema visual
2. Ejecutar `composer run setup` y verificar que la app corra sin errores
3. Familiarizarse con la **capa de servicios**: la lógica de negocio no va en los controladores
4. Revisar los Form Requests en `app/Http/Requests/` — toda validación va ahí

### Convenciones del proyecto

- **Idioma del código:** español (nombres de modelos, rutas, variables de negocio están en español)
- **Controladores delgados:** deben llamar a servicios, no contener lógica de negocio directa
- **Validación:** usar Form Requests, nunca validar manualmente en el controlador
- **Transacciones:** operaciones de carrito y checkout usan `DB::transaction()` — respetarlo en nuevas operaciones críticas
- **Estilo de código:** seguir PSR-12, usar `./vendor/bin/pint` antes de hacer commit

### Flujo de trabajo recomendado

```bash
# Antes de empezar a trabajar
git pull origin main
composer install
npm install

# Durante el desarrollo
composer run dev        # levanta servidor + queue + vite

# Antes de hacer commit
./vendor/bin/pint       # corrige estilo automáticamente
composer run test       # verifica que no hay regresiones
```

### Agregar nuevas funcionalidades

1. Crear la migración: `php artisan make:migration create_tabla_table`
2. Crear el modelo: `php artisan make:model NombreModelo`
3. Crear el Form Request de validación: `php artisan make:request NombreRequest`
4. Crear el servicio en `app/Services/`
5. Crear o actualizar el controlador en `app/Http/Controllers/`
6. Registrar las rutas en `routes/web.php`
7. Crear las vistas Blade en `resources/views/`
8. Escribir tests en `tests/Feature/`

### Sobre la base de datos

- **No modificar migraciones existentes** — siempre crear una nueva migración para cambios
- Usar `php artisan migrate:fresh --seed` solo en desarrollo, nunca en producción
- Las relaciones entre modelos están definidas en los archivos `app/Models/` — revisarlos antes de hacer queries manuales

### Factories y seeders

El proyecto usa factories con **estados** para componer datos de prueba de forma expresiva:

```php
// Crear un usuario cliente con 2 tarjetas guardadas
Usuario::factory()->cliente()->conTarjeta(2)->create();

// Crear tarjetas de una franquicia específica
UserTarjeta::factory()->visa()->create(['user_id' => $usuario->id]);
UserTarjeta::factory()->mastercard()->create(['user_id' => $usuario->id]);
UserTarjeta::factory()->amex()->create(['user_id' => $usuario->id]);
```

El estado `conTarjeta(int $cantidad)` en `UsuarioFactory` usa `afterCreating()` para encadenar la creación de `UserTarjeta` tras crear el usuario, manteniendo los seeders limpios y los tests expresivos.

Los seeders usan `firstOrCreate` + verificaciones de conteo para ser **idempotentes** — se pueden re-ejecutar sin duplicar datos.


*Desarrollado con [Laravel](https://laravel.com) v13 — PHP 8.3+*
