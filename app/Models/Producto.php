<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Producto extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'categoria_id',
        'nombre',
        'slug',
        'descripcion',
        'precio',
        'caja',
        'movimiento',
        'cristal',
        'resistencia',
        'correa',
        'stock',
        'activo',
    ];

    protected $casts = [
        'precio' => 'decimal:2',
        'stock'  => 'integer',
        'activo' => 'boolean',
    ];

    public function categoria(): BelongsTo
    {
        return $this->belongsTo(Categoria::class);
    }

    public function imagenes(): HasMany
    {
        return $this->hasMany(ProductoImagen::class)->orderBy('orden');
    }

    public function getImagenLifestyleAttribute(): ?string
    {
        if ($this->relationLoaded('imagenes')) {
            return $this->imagenes->where('tipo', 'lifestyle')->first()?->url;
        }

        return $this->imagenes()->where('tipo', 'lifestyle')->value('url');
    }

    public function getImagenStudioAttribute(): ?string
    {
        if ($this->relationLoaded('imagenes')) {
            return $this->imagenes->where('tipo', 'studio')->first()?->url;
        }

        return $this->imagenes()->where('tipo', 'studio')->value('url');
    }
}
