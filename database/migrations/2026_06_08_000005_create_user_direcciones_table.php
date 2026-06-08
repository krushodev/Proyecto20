<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('user_direcciones', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('usuarios')->cascadeOnDelete();
            $table->string('alias', 60)->default('Casa');
            $table->string('calle', 200);
            $table->string('numero', 20);
            $table->string('ciudad', 100);
            $table->string('provincia', 100);
            $table->string('cp', 20);
            $table->string('observaciones', 300)->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('user_direcciones');
    }
};
