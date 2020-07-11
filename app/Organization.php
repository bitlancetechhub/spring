<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Organization extends Model
{
	use SoftDeletes;
    protected $table="organizations";
    protected $dates = ['deleted_at'];

    protected $fillable = [
        'name', 'email', 'mobile_no','address_line1',
    ];

    public function helps()
    {
       return $this->hasMany('App\Help');
    }

    public function hdevices()
    {
       return $this->hasMany('App\Hdevice');
    }

    public function organizationLogs()
    {
       return $this->hasMany('App\OrganizationLogs');
    }

    public function organizationUsers()
    {
       return $this->hasMany('App\OrganizationUsers');
    }

    public function members()
    {
       return $this->hasMany('App\Members');
    }

    public function notificationLogs()
    {
       return $this->hasMany('App\OrganizationNotificationLogs');
    }
}
