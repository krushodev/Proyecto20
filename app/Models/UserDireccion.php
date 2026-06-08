<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserDireccion extends Model
{
    protected $table = 'user_direcciones';

    protected $fillable = [
        'user_id',
        'alias',
        'calle',
        'numero',
        'ciudad',
        'provincia',
        'cp',
        'observaciones',
    ];

    public function usuario(): BelongsTo
    {
        return $this->belongsTo(Usuario::class, 'user_id');
    }

    public function getLabelAttribute(): string
    {
        return "{$this->alias} — {$this->calle} {$this->numero}, {$this->ciudad} ({$this->cp})";
    }
}
