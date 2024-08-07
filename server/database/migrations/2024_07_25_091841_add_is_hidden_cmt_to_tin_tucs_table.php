<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddIsHiddenCmtToTinTucsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tin_tucs', function (Blueprint $table) {
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
        Schema::table('tin_tucs', function (Blueprint $table) {
            $table->dropColumn('is_hidden_cmt');
        });
    }
}
