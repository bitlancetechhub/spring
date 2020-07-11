<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeviceLogsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('device_logs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('hdevice_id')->unsigned();
            $table->enum('front_camera_status', [0,1])->default(0);
            $table->enum('thermal_camera_status', [0,1])->default(0);
            $table->enum('sanitization_status', [0,1])->default(0);
            $table->enum('sanitization_check_in', [0,1])->default(0);
            $table->enum('student_check_in', [0,1])->default(0);
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
        Schema::dropIfExists('device_logs');
    }
}
