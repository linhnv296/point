<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('phone')->nullable();
            $table->tinyInteger('sex')->nullable();
            $table->string('date_of_birth')->nullable();
            $table->string('facebook')->nullable();
            $table->string('province')->nullable();
            $table->string('education')->nullable();
            $table->string('job')->nullable();
            $table->string('target')->nullable();
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('phone');
            $table->dropColumn('sex');
            $table->dropColumn('date_of_birth');
            $table->dropColumn('facebook');
            $table->dropColumn('province');
            $table->dropColumn('education');
            $table->dropColumn('job');
            $table->dropColumn('target');
        });
    }
}
