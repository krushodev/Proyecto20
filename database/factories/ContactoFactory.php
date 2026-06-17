<?php

namespace Database\Factories;

use App\Models\Contacto;
use Illuminate\Database\Eloquent\Factories\Factory;

class ContactoFactory extends Factory
{
    protected $model = Contacto::class;

    private static array $nombres = [
        'Valentina Rodríguez', 'Martín Fernández', 'Lucía Acosta', 'Gonzalo Sánchez',
        'Camila López', 'Federico García', 'Agustina Martínez', 'Nicolás Pérez',
        'Florencia Díaz', 'Tomás Álvarez', 'Sofía Romero', 'Matías Torres',
        'Micaela Gutiérrez', 'Sebastián Herrera', 'Julieta Castro', 'Facundo Ruiz',
        'Natalia Moreno', 'Diego Jiménez', 'Paula Vargas', 'Leandro Ortiz',
        'Celeste Molina', 'Rodrigo Navarro', 'Antonella Ramos', 'Ezequiel Domínguez',
        'Romina Suárez', 'Ignacio Mendoza', 'Melina Ríos', 'Maximiliano Silva',
        'Noelia Blanco', 'Andrés Medina',
    ];

    private static array $dominios = [
        'gmail.com', 'hotmail.com', 'yahoo.com.ar', 'outlook.com', 'live.com.ar',
    ];

    private static array $consultas = [
        [
            'asunto'  => 'Consulta sobre garantía de reloj',
            'mensaje' => 'Buen día, compré un reloj hace unos meses en su local y quería saber cuánto tiempo de garantía tiene y cómo funciona el proceso en caso de que tenga algún problema. Desde ya muchas gracias.',
        ],
        [
            'asunto'  => 'Disponibilidad de stock',
            'mensaje' => 'Hola, quería saber si tienen disponible el reloj Casio G-Shock en color negro. Lo vi en la web pero no estoy seguro si tienen en stock para retirar en el local de La Plata. Aguardo respuesta, gracias.',
        ],
        [
            'asunto'  => 'Cambio de pila de reloj',
            'mensaje' => 'Buenas tardes, quisiera saber si realizan cambio de pilas y cuánto sale aproximadamente. Tengo un reloj Citizen que dejó de funcionar y me dijeron que puede ser la pila. Pueden darme un turno o simplemente llevo el reloj?',
        ],
        [
            'asunto'  => 'Consulta por reparación',
            'mensaje' => 'Hola, me comunico porque tengo un reloj al que se le trabó la corona y ya no puedo ajustar la hora. Quisiera saber si lo pueden revisar y cuánto costaría arreglarlo. Es un reloj de pulsera clásico que heredé de mi abuelo.',
        ],
        [
            'asunto'  => 'Precio de reloj para regalo',
            'mensaje' => 'Buenas, estoy buscando un reloj para regalarle a mi papá por su cumpleaños, algo elegante pero que no sea demasiado caro, entre $50.000 y $100.000 más o menos. ¿Me podrían asesorar sobre qué opciones tienen disponibles?',
        ],
        [
            'asunto'  => 'Envío a interior de la provincia',
            'mensaje' => 'Hola, soy de Mar del Plata y me gustaría saber si hacen envíos a domicilio y con qué empresas trabajan. Vi unos relojes en la página que me interesaron mucho y me gustaría comprar sin tener que viajar.',
        ],
        [
            'asunto'  => 'Consulta sobre relojes de buceo',
            'mensaje' => 'Buen día, soy instructor de buceo y estoy buscando un reloj resistente al agua hasta al menos 200 metros de profundidad. ¿Tienen algún modelo que cumpla con eso? Prefiero marcas reconocidas como Seiko o Casio.',
        ],
        [
            'asunto'  => 'Solicito factura de compra',
            'mensaje' => 'Buenas, compré un reloj en el local el mes pasado y no me dieron la factura. Necesito el comprobante para reclamar la garantía ya que el reloj tuvo un inconveniente. ¿Cómo puedo obtenerla? Gracias.',
        ],
        [
            'asunto'  => 'Consulta sobre relojes automáticos',
            'mensaje' => 'Hola, estoy interesado en adquirir mi primer reloj automático y tengo algunas dudas sobre el mantenimiento. ¿Cada cuánto hay que llevarlo a revisar? ¿Ustedes hacen ese servicio de mantenimiento?',
        ],
        [
            'asunto'  => 'Compra de reloj para dama',
            'mensaje' => 'Buenas tardes, busco un reloj femenino delicado, preferentemente con malla metálica y esfera blanca o plateada. ¿Tienen opciones en ese estilo? ¿Puedo pasar a verlos por el local sin turno previo?',
        ],
        [
            'asunto'  => 'Problema con el cierre de la malla',
            'mensaje' => 'Hola, compré un reloj hace tres semanas y el cierre de la malla metálica ya no engrana bien. ¿Esto tiene cobertura de garantía? Quisiera pasarlo a revisar o cambiarlo si es posible.',
        ],
        [
            'asunto'  => 'Ajuste de malla sin costo',
            'mensaje' => 'Buen día, compré un reloj la semana pasada y la malla me quedó un poco grande. ¿Hacen el ajuste de eslabones en el local y hay algún costo adicional? Desde ya gracias.',
        ],
        [
            'asunto'  => 'Consulta sobre relojes cronógrafo',
            'mensaje' => 'Hola, me interesa un reloj cronógrafo para usar en el trabajo. Trabajo en logística y necesito medir tiempos frecuentemente. ¿Qué modelos tienen disponibles y en qué rango de precios?',
        ],
        [
            'asunto'  => 'Regalo de casamiento',
            'mensaje' => 'Buenas, me caso en dos meses y quiero comprar un par de relojes de casamiento para mí y mi pareja. ¿Hacen descuentos por la compra de dos relojes juntos o tienen alguna promoción especial para eso?',
        ],
        [
            'asunto'  => 'Revisión de reloj antiguo',
            'mensaje' => 'Hola, tengo un reloj de bolsillo antiguo de la marca Longines que perteneció a mi bisabuelo y quisiera saber si lo pueden revisar para ver si funciona o se puede restaurar. ¿Trabajan con relojes de colección o antigüedades?',
        ],
        [
            'asunto'  => 'Consulta por compra mayorista',
            'mensaje' => 'Buen día, soy vendedor ambulante en La Plata y me interesaría saber si hacen precio mayorista para relojes si compro en cantidad. ¿Con qué volumen mínimo aplica y cuál sería el descuento?',
        ],
        [
            'asunto'  => 'Error en el pedido recibido',
            'mensaje' => 'Hola, hice una compra online y recibí un reloj diferente al que pedí. El color es distinto al que aparecía en la foto. ¿Cómo hago para cambiarlo? Adjunto el número de pedido: #2847.',
        ],
        [
            'asunto'  => 'Horario del local',
            'mensaje' => 'Buenas, quería saber cuál es el horario de atención del local y si trabajan los sábados. Me quedaría más cómodo pasar un fin de semana. ¿Dónde están ubicados exactamente en La Plata?',
        ],
        [
            'asunto'  => 'Consulta sobre financiación',
            'mensaje' => 'Hola, quería saber si ofrecen financiación en cuotas con tarjeta de crédito y si hay algún recargo. Estoy interesado en un reloj de $150.000 aproximadamente y me vendría bien pagarlo en cuotas.',
        ],
        [
            'asunto'  => 'Limpieza de reloj',
            'mensaje' => 'Buenas tardes, tengo un reloj de acero que está opacado y me gustaría saber si hacen limpieza o pulido del mismo. ¿Tienen ese servicio y cuánto tiempo demora?',
        ],
    ];

    public function definition(): array
    {
        $nombre  = self::$nombres[array_rand(self::$nombres)];
        $partes  = explode(' ', $nombre);
        $slug    = strtolower(iconv('UTF-8', 'ASCII//TRANSLIT', $partes[0] . '.' . ($partes[1] ?? '')));
        $dominio = self::$dominios[array_rand(self::$dominios)];
        $consulta = self::$consultas[array_rand(self::$consultas)];

        return [
            'nombre'  => $nombre,
            'email'   => $slug . rand(10, 99) . '@' . $dominio,
            'asunto'  => $consulta['asunto'],
            'mensaje' => $consulta['mensaje'],
            'leido'   => false,
        ];
    }

    public function leido(): static
    {
        return $this->state(['leido' => true]);
    }
}
