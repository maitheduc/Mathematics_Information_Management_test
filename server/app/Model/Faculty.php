<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Faculty extends Model
{
    protected $table = 'faculties';

    protected $fillable = ['name', 'description', 'image'];

    public $timestamps = true;

    public function departments()
    {
        return $this->hasMany('App\Model\Department', 'faculty_id', 'id');
    }
}
