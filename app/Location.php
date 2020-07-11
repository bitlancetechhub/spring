<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Location extends Model
{
    use SoftDeletes;
    protected $table="location";
    protected $dates = ['deleted_at'];

    public function organization()
    {
        return $this->belongsTo('App\Organization', 'foreign_key','organization_id');
    }
}
