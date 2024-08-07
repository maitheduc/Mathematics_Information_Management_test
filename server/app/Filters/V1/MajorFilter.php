<?php

namespace App\Filters\V1;

use App\Filters\ApiFilter;

class MajorFilter extends ApiFilter
{
    protected $safeParams = [
        'name'  => ['like', 'eq'],
        'department_id' => ['eq'],
    ];

    protected $columnMap = [
        'name' => 'name',
        'department_id' => 'department_id'
    ];

    protected $operatorMap = [
        'like' => 'LIKE',
        'eq' => '='
    ];
}
