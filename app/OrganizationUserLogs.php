<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrganizationUserLogs extends Model
{
	use SoftDeletes;
    protected $table="organization_user_logs";
    protected $dates = ['deleted_at'];
}
