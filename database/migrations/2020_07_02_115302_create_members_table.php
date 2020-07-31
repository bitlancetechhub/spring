<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMembersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('members', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('organization_id')->unsigned();
            $table->string('name');
            $table->string('identity_no')->nullable();
            $table->string('designation_class')->nullable();
            $table->string('department_division')->nullable();
            $table->string('mobile_no')->nullable();
            $table->string('alt_mobile_no')->nullable();
            $table->mediumText('video_url')->nullable();
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
        Schema::dropIfExists('members');
    }
}
