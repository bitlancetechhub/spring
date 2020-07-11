<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MemberPhotos extends Model
{
    use SoftDeletes;
    protected $table="member_photos";
    protected $dates = ['deleted_at'];

    public function member()
    {
       $this->belongsTo('App\Members', 'foreign_key','member_id');
    }
}
