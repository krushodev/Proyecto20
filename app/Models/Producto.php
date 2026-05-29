<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Producto extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'categoria_id',
        'nombre',
        'slug',
        'descripcion',
        'precio',
        'imagen_lifestyle',
        'imagen_studio',
        'caja',
        'movimiento',
        'cristal',
        'resistencia',
        'correa',
        'stock',
        'activo',
    ];

    protected $casts = [
        'precio'  => 'decimal:2',
        'stock'   => 'integer',
        'activo'  => 'boolean',
    ];

    public function categoria(): BelongsTo
    {
        return $this->belongsTo(Categoria::class);
    }
}
