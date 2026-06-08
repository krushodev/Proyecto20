<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('ventas_cabecera', function (Blueprint $table) {
            $table->foreignId('user_direccion_id')
                ->nullable()
                ->after('user_id')
                ->constrained('user_direcciones')
                ->nullOnDelete();

            $table->decimal('costo_envio', 10, 2)->default(0)->after('total');
        });
    }

    public function down(): void
    {
        Schema::table('ventas_cabecera', function (Blueprint $table) {
            $table->dropForeign(['user_direccion_id']);
            $table->dropColumn(['user_direccion_id', 'costo_envio']);
        });
    }
};
