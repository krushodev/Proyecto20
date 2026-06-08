<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('ventas_cabecera', function (Blueprint $table) {
            $table->string('nombre_destinatario', 150)->nullable()->after('total');
            $table->string('calle', 200)->nullable()->after('nombre_destinatario');
            $table->string('numero', 20)->nullable()->after('calle');
            $table->string('ciudad', 100)->nullable()->after('numero');
            $table->string('provincia', 100)->nullable()->after('ciudad');
            $table->string('codigo_postal', 20)->nullable()->after('provincia');
            $table->string('metodo_pago', 30)->nullable()->after('codigo_postal');
        });
    }

    public function down(): void
    {
        Schema::table('ventas_cabecera', function (Blueprint $table) {
            $table->dropColumn([
                'nombre_destinatario',
                'calle',
                'numero',
                'ciudad',
                'provincia',
                'codigo_postal',
                'metodo_pago',
            ]);
        });
    }
};
