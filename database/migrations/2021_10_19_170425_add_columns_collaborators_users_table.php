<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsCollaboratorsUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('collaborators_users', function (Blueprint $table) {
            $table->string('email')->nullable();
            $table->string('facebook')->nullable();
            $table->string('fullname')->nullable();
            $table->tinyInteger('sex')->nullable();
            $table->string('date_of_birth')->nullable();
            $table->string('cmnd')->nullable();
            $table->string('phone')->nullable();
            $table->string('job')->nullable();
            $table->string('course')->nullable();
            $table->string('province')->nullable();
            $table->string('education')->nullable();
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
        Schema::table('collaborators_users', function (Blueprint $table) {
            $table->dropColumn('email');
            $table->dropColumn('facebook');
            $table->dropColumn('fullname');
            $table->dropColumn('sex');
            $table->dropColumn('date_of_birth');
            $table->dropColumn('cmnd');
            $table->dropColumn('phone');
            $table->dropColumn('job');
            $table->dropColumn('course');
            $table->dropColumn('province');
            $table->dropColumn('education');
            $table->dropColumn('target');
        });
    }
}
