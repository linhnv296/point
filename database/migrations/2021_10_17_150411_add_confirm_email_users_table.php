<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddConfirmEmailUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dateTime('verify_email_at')->default(now());
            $table->string('key_verify')->nullable();
            $table->tinyInteger('active_ctv')->nullable()->default(0);
            $table->string('cmnd')->nullable();
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
            $table->dropColumn('verify_email_at');
            $table->dropColumn('key_verify');
            $table->dropColumn('active_ctv');
            $table->dropColumn('cmnd');
        });
    }
}
