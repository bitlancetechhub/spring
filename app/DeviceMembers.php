<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DeviceMembers extends Model
{
    protected $table="device_members";
    protected $dates = ['deleted_at'];

    public function member()
    {
       return $this->belongsTo('App\Members');
    }
    
    public function device()
    {
       return $this->belongsTo('App\Hdevice');
    }

}
