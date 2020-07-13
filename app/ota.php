<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ota extends Model
{
    use SoftDeletes;
    protected $table="ota";
    protected $dates = ['deleted_at'];
}
