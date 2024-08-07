<?php

namespace App\Filters\V1;

use App\Filters\ApiFilter;

class CommentFilter extends ApiFilter
{
    protected $safeParams = [
        'noidung'  => ['like', 'eq'],
        'id_user'  => ['eq'],
        'id_tintuc'  => ['eq'],
        'is_hidden_cmt' => ['eq'],
    ];

    protected $columnMap = [
        'noidung' => 'noidung',
        'id_user' => 'id_user',
        'id_tintuc' => 'id_tintuc',
        'is_hidden_cmt' => 'is_hidden_cmt',
    ];

    protected $operatorMap = [
        'eq' => '=',
        'like' => 'LIKE',
    ];
}
