<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHdevicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hdevices', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('organization_id')->unsigned();
            $table->mediumText('device_number');
            $table->string('thermal_camera_serial_no')->nullable();
            $table->string('sanitization_device_no')->nullable();
            $table->date('validity_date')->nullable();
            $table->double('subscription_price')->nullable();
            $table->longtext('features')->nullable();
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
        Schema::dropIfExists('hdevices');
    }
}
