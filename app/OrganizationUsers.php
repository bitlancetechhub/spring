<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrganizationUsers extends Model
{
	use SoftDeletes;
    protected $table="organization_users";
    protected $dates = ['deleted_at'];

    protected $hidden = [
        'password',
    ];

    public function organizationUserLoginHistory()
    {
       $this->hasMany('App/OrganizationUserLoginHistory');
    }

    public function hdevice()
    {
       return $this->belongsTo('App\Hdevice');
    }
}
