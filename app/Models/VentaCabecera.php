<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class VentaCabecera extends Model
{
    protected $table = 'ventas_cabecera';

    protected $fillable = [
        'user_id',
        'fecha_venta',
        'estado',
        'total',
    ];

    protected $casts = [
        'fecha_venta' => 'datetime',
        'total'       => 'decimal:2',
    ];

    public function usuario(): BelongsTo
    {
        return $this->belongsTo(Usuario::class, 'user_id');
    }

    public function detalles(): HasMany
    {
        return $this->hasMany(VentaDetalle::class, 'venta_id');
    }
}
