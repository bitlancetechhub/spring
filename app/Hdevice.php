<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Hdevice extends Model
{
	use SoftDeletes;
    protected $table="hdevices";
    protected $dates = ['deleted_at'];

    public function organizationUsers()
    {
       return $this->hasMany('App\OrganizationUsers');
    }

    public function hdeviceLogs()
    {
       return $this->hasMany('App\DeviceLogs');
    }

    public function organization()
    {
       return $this->belongsTo('App\Organization');
    }

    public function organizationuser()
    {
       return $this->belongsTo('App\OrganizationUsers');
    }
}
