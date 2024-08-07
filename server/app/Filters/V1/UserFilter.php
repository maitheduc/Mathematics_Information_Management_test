<?php

namespace App\Filters\V1;

use App\Filters\ApiFilter;

class UserFilter extends ApiFilter
{
    protected $safeParams = [
        'name'  => ['like',  'eq'],
        'email'  => ['like', 'eq'],
    ];

    protected $columnMap = [
        'name' => 'name',
        'email' => 'email',
    ];

    protected $operatorMap = [
        'eq' => '=',
        'like' => 'LIKE'
    ];
}
