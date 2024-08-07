<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnTableLoaiTins extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('loai_tins', function (Blueprint $table) {
            $table->integer('parent_id')->default(null)->nullable(true);
            $table->integer('level')->default(1)->nullable(true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('loai_tins', function (Blueprint $table) {
            $table->dropColumn('parent_id');
            $table->dropColumn('level');
        });
    }
}
