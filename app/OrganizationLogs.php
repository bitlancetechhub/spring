<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrganizationLogs extends Model
{
	use SoftDeletes;
    protected $table="organization_logs";
    protected $dates = ['deleted_at'];
}
