<?php

namespace App\Filters\V1;

use App\Filters\ApiFilter;

class FacultyFilter extends ApiFilter
{
    protected $safeParams = [
        'name'  => ['like', 'eq'],
        'description'  => ['like', 'eq'],
    ];

    protected $columnMap = [
        'name'  => 'name',
        'description'  => 'description',
    ];

    protected $operatorMap = [
        'like' => 'LIKE',
        'eq' => '='
    ];
}
