<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrganizationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('organizations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('email');
            $table->string('mobile_no');
            $table->string('alt_mobile_no')->nullable();
            $table->mediumText('address_line1')->nullable();
            $table->mediumText('address_line2')->nullable();
            $table->mediumText('logo_url')->nullable();
            $table->bigInteger('location_id')->unsigned()->nullable();
            $table->string('pincode')->nullable();
            $table->enum('status', [1,2])->default(1);
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
        Schema::dropIfExists('organizations');
    }
}
