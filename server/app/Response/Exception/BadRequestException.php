<?php

namespace App\Response\Exception;

use App\Response\Exception\BaseException;

class BadRequestException extends BaseException
{
    public function __construct($message = "Bad Request", $statusCode = 400, ?array $headers = [])
    {
        parent::__construct($message, $statusCode, $headers);
    }
}
