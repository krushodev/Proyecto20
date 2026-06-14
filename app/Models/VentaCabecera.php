<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class VentaCabecera extends Model
{
    use HasFactory;
    protected $table = 'ventas_cabecera';

    protected $fillable = [
        'user_id',
        'user_direccion_id',
        'fecha_venta',
        'estado',
        'total',
        'costo_envio',
        'nombre_destinatario',
        'calle',
        'numero',
        'ciudad',
        'provincia',
        'codigo_postal',
        'metodo_pago',
        'estado_pago',
    ];

    protected $casts = [
        'fecha_venta'  => 'datetime',
        'total'        => 'decimal:2',
        'costo_envio'  => 'decimal:2',
    ];

    public function usuario(): BelongsTo
    {
        return $this->belongsTo(Usuario::class, 'user_id');
    }

    public function direccion(): BelongsTo
    {
        return $this->belongsTo(UserDireccion::class, 'user_direccion_id');
    }

    public function detalles(): HasMany
    {
        return $this->hasMany(VentaDetalle::class, 'venta_id');
    }
}
