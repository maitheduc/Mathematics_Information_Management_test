<?php

namespace App\Filters\V1;

use App\Filters\ApiFilter;

class PersonnelFilter extends ApiFilter
{
    protected $safeParams = [
        'first_name'  => ['like', 'eq', 'orLike'],
        'last_name'  => ['like', 'eq', 'orLike'],
        'email'  => ['eq', 'orLike', 'like'],
        'phone'  => ['eq', 'orLike'],
        'dob'  => ['eq'],
        'address'  => ['eq', 'like'],
        'description'  => ['eq', 'like'],
        'base_salary' => ['eq', 'gte', 'lte', 'lt', 'gt'],
        'academic_level' => ['eq', 'like'],
        'degrees' => ['eq', 'like'],
        'position' => ['eq', 'like'],
        'gender' => ['eq'],
        'department_id' => ['eq']
    ];

    protected $columnMap = [
        'first_name'  => 'first_name',
        'last_name'  => 'last_name',
        'email' => 'email',
        'phone' => 'phone',
        'dob' => 'dob',
        'address' => 'address',
        'description' => 'description',
        'base_salary' => 'base_salary',
        'academic_level' => 'academic_level',
        'degrees' => 'degrees',
        'position' => 'position',
        'gender' => 'gender',
        'department_id' => 'department_id',
    ];

    protected $operatorMap = [
        'like' => 'LIKE',
        'orLike' => 'LIKE',
        'eq' => '=',
        'gte' => '>=',
        'lte' => '<=',
        'lt' => '<',
        'gt' => '>',
    ];
}
