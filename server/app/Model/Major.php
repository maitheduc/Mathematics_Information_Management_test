<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Major extends Model
{
    protected $table = 'majors';

    protected $fillable = ['name', 'department_id', 'subjects'];

    public function department()
    {
        return $this->belongsTo('App\Model\Department', 'department_id', 'id');
    }
}
