<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrganizationNotificationLog extends Model
{
	use SoftDeletes;
    protected $table="organization_notification_logs";
    protected $dates = ['deleted_at'];
}
