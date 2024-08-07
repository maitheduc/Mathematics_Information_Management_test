<?php

namespace App\Filters\V1;

use App\Filters\ApiFilter;

class NewsTypesFilter extends ApiFilter
{
    protected $safeParams = [
        'name' => ['eq', 'like'],
        'category_id' => ['eq'],
        'parent_id' => ['eq'],
        'level' => ['eq']
    ];

    protected $columnMap = [
        'name' => 'tenloaitin',
        'category_id' => 'id_theloai',
        'parent_id' => 'parent_id',
        'level' => 'level'
    ];

    protected $operatorMap = [
        'eq' => '=',
        'lt' => '<',
        'lte' => '<=',
        'gt' => '>',
        'gte' => '>=',
        'like' => 'LIKE',
    ];
}
