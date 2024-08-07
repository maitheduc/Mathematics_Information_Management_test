<?php

namespace App\Filters\V1;

use App\Filters\ApiFilter;

class AboutFilter extends ApiFilter
{
    protected $safeParams = [
        'gioithieu'  => ['like'],
    ];

    protected $columnMap = [
        'gioithieu' => 'gioithieu'
    ];

    protected $operatorMap = [
        'like' => 'LIKE',
    ];
}
