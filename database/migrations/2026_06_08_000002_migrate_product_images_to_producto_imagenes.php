<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        $productos = DB::table('productos')->select('id', 'imagen_lifestyle', 'imagen_studio')->get();

        foreach ($productos as $producto) {
            if ($producto->imagen_lifestyle) {
                DB::table('producto_imagenes')->insert([
                    'producto_id' => $producto->id,
                    'url'         => $producto->imagen_lifestyle,
                    'tipo'        => 'lifestyle',
                    'orden'       => 0,
                    'created_at'  => now(),
                    'updated_at'  => now(),
                ]);
            }
            if ($producto->imagen_studio) {
                DB::table('producto_imagenes')->insert([
                    'producto_id' => $producto->id,
                    'url'         => $producto->imagen_studio,
                    'tipo'        => 'studio',
                    'orden'       => 1,
                    'created_at'  => now(),
                    'updated_at'  => now(),
                ]);
            }
        }

        Schema::table('productos', function (Blueprint $table) {
            $table->dropColumn(['imagen_lifestyle', 'imagen_studio']);
        });
    }

    public function down(): void
    {
        Schema::table('productos', function (Blueprint $table) {
            $table->text('imagen_lifestyle')->nullable();
            $table->text('imagen_studio')->nullable();
        });

        $imagenes = DB::table('producto_imagenes')->get();
        foreach ($imagenes as $imagen) {
            $column = $imagen->tipo === 'lifestyle' ? 'imagen_lifestyle' : 'imagen_studio';
            DB::table('productos')->where('id', $imagen->producto_id)->update([$column => $imagen->url]);
        }

        DB::table('producto_imagenes')->delete();
    }
};
