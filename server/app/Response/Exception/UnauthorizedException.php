<?php

namespace App\Response\Exception;

use App\Response\Exception\BaseException;

class UnauthorizedException extends BaseException
{
    public function __construct($message = "Unauthorized", $statusCode = 401, ?array $headers = [])
    {
        parent::__construct($message, $statusCode, $headers);
    }
}
