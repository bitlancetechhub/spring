<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Subscriptions extends Model
{
	use SoftDeletes;
    protected $table="subscriptions";
    protected $dates = ['deleted_at'];
    protected $fillable = [
        'name', 'validity_days', 'subscription_price',
    ];
}
