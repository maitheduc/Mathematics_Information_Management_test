<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddIsHiddenCmtToChiTietBinhLuansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('chi_tiet_binh_luans', function (Blueprint $table) {
            $table->boolean('is_hidden_cmt')->default(0)->nullable(true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('chi_tiet_binh_luans', function (Blueprint $table) {
            $table->dropColumn('is_hidden_cmt');
        });
    }
}
