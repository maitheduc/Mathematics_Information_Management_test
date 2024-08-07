<?php

namespace App\Filters\V1;

use App\Filters\ApiFilter;

class CommentDetailsFilter extends ApiFilter
{
    protected $safeParams = [
        'noidung'  => ['like', 'eq'],
        'id_user'  => ['eq'],
        'id_binhluan'  => ['eq'],
        'is_hidden_cmt' => ['eq']
    ];

    protected $columnMap = [
        'noidung' => 'noidung',
        'id_user' => 'id_user',
        'id_binhluan' => 'id_binhluan',
        'is_hidden_cmt' => 'is_hidden_cmt'
    ];

    protected $operatorMap = [
        'eq' => '=',
        'like' => 'LIKE',
    ];
}
