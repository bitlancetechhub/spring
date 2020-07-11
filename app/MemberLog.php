<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MemberLog extends Model
{
	use SoftDeletes;
    protected $table="member_logs";
    protected $dates = ['deleted_at'];
}
