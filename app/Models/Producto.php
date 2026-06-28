<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Facades\Storage;

class Producto extends Model
{
    use HasFactory, SoftDeletes;

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

    public function scopeActivo(Builder $query): Builder
    {
        return $query->where('activo', true);
    }

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
        $url = $this->relationLoaded('imagenes')
            ? $this->imagenes->where('tipo', 'lifestyle')->first()?->url
            : $this->imagenes()->where('tipo', 'lifestyle')->value('url');

        return $this->resolverUrlImagen($url);
    }

    public function getImagenStudioAttribute(): ?string
    {
        $url = $this->relationLoaded('imagenes')
            ? $this->imagenes->where('tipo', 'studio')->first()?->url
            : $this->imagenes()->where('tipo', 'studio')->value('url');

        return $this->resolverUrlImagen($url);
    }

    private function resolverUrlImagen(?string $url): ?string
    {
        if ($url === null) {
            return null;
        }

        return str_starts_with($url, 'http') ? $url : Storage::disk('public')->url($url);
    }
}
