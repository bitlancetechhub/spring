<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrganizationUserLoginHistory extends Model
{
    protected $table="organization_user_login_history";
    protected $dates = ['deleted_at'];
}
