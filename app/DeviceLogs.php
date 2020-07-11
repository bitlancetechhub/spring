<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DeviceLogs extends Model
{
	use SoftDeletes;
    protected $table="device_logs";
    protected $dates = ['deleted_at'];
}
