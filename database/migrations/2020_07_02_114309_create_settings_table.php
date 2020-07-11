<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('settings', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->longtext('privacy_policy')->nullable();
            $table->longtext('terms_condition')->nullable();
            $table->string('sender_id')->nullable();
            $table->string('sms_username')->nullable();
            $table->string('sms_password')->nullable();
            $table->string('sms_gateway_link')->nullable();
            $table->string('email_id')->nullable();
            $table->string('password')->nullable();
            $table->string('port')->nullable();
            $table->string('host')->nullable(); 
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('settings');
    }
}
