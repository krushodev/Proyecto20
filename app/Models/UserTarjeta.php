<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserTarjeta extends Model
{
    use HasFactory;
    protected $table = 'user_tarjetas';

    protected $fillable = [
        'user_id',
        'ultimos_cuatro',
        'titular',
        'mes_exp',
        'anio_exp',
        'tipo',
    ];

    public function usuario(): BelongsTo
    {
        return $this->belongsTo(Usuario::class, 'user_id');
    }

    public function getVencimientoAttribute(): string
    {
        return $this->mes_exp . '/' . $this->anio_exp;
    }
}
