<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrganizationNotificationLog extends Model
{
	use SoftDeletes;
    protected $table="organization_notification_logs";
    protected $dates = ['deleted_at'];

    public function organization()
    {
       return $this->belongsTo('App\Organization');
    }

    public function member()
    {
       return $this->belongsTo('App\Members');
    }
}
