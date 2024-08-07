<?php

namespace App\Filters\V1;

use App\Filters\ApiFilter;

class CategoryFilter extends ApiFilter
{
    protected $safeParams = [
        'name' => ['eq'],
        'priority' => ['eq'],
        'is_active' => ['eq'],
    ];

    protected $columnMap = [
        'name' => 'tentheloai',
        'priority' => 'uutien',
        'is_active' => 'hienthi',
    ];

    protected $operatorMap = [
        'eq' => '=',
        'lt' => '<',
        'lte' => '<=',
        'gt' => '>',
        'gte' => '>=',
    ];
}
