<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('usuarios', function (Blueprint $table) {
            if (!Schema::hasColumn('usuarios', 'numero_tarjeta')) {
                $table->string('numero_tarjeta')->nullable()->after('rol_id');
                $table->string('titular_tarjeta')->nullable()->after('numero_tarjeta');
                $table->string('vencimiento_tarjeta')->nullable()->after('titular_tarjeta');
                $table->string('cvv_tarjeta')->nullable()->after('vencimiento_tarjeta');
            }

            if (!Schema::hasColumn('usuarios', 'ubicacion')) {
                $table->string('ubicacion')->nullable()->after('cvv_tarjeta');
            }
        });
    }

    public function down(): void
    {
        Schema::table('usuarios', function (Blueprint $table) {
            $table->dropColumn(['numero_tarjeta', 'titular_tarjeta', 'vencimiento_tarjeta', 'cvv_tarjeta', 'ubicacion']);
        });
    }
};
