<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Members extends Model
{
	use SoftDeletes;
    protected $table="members";
    protected $dates = ['deleted_at'];

    protected $fillable = [
        'organization_id', 'name', 'identity_no', 'designation_class', 'department_division', 'mobile_no',
    ];

    public function memberLogs()
    {
       $this->hasMany('App\MemberLog');
    }

    public function notificationLogs()
    {
       $this->hasMany('App\OrganizationNotificationLogs');
    }

    public function organization()
    {
       $this->belongsTo('App\Organization', 'foreign_key','organization_id');
    }
}
