<?php

namespace App\Filters\V1;

use App\Filters\ApiFilter;

class MailboxFilter extends ApiFilter
{
    protected $safeParams = [
        'hoten' => ['eq', 'like'],
        'email' => ['eq', 'like'],
        'dienthoai' => ['like', 'eq'],
        'noidung' => ['like'],
        'andanh' => ['eq'],
        'daxem' => ['eq'],
        'dadoc' => ['eq'],
    ];

    protected $columnMap = [
        'hoten' => 'hoten',
        'email' => 'email',
        'dienthoai' => 'dienthoai',
        'noidung' => 'noidung',
        'andanh' => 'andanh',
        'daxem' => 'daxem',
        'dadoc' => 'dadoc',
    ];

    protected $operatorMap = [
        'eq' => '=',
        'like' => 'LIKE',
    ];
}
