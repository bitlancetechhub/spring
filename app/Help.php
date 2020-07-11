<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Help extends Model
{
	use SoftDeletes;
    protected $table="helps";
    protected $dates = ['deleted_at'];

    protected $fillable = [
        'comment', 'organization_id',
    ];

    public function organization()
    {
       $this->belongsTo('App\Organization','organization_id');
    }
}
