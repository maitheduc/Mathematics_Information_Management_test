<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Personnel extends Model
{
    protected $table = 'personnel';

    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'phone',
        'dob',
        'address',
        'description',
        'avatar',
        'base_salary',
        'academic_level',
        'degrees',
        'position',
        'gender',
        'department_id',
    ];

    public $timestamps = true;

    public function department()
    {
        return $this->belongsTo('App\Model\Department', 'department_id', 'id');
    }
}
