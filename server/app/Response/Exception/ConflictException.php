<?php

namespace App\Response\Exception;

use App\Response\Exception\BaseException;

class ConflictException extends BaseException
{
    public function __construct($message = "Conflict", $statusCode = 409, ?array $headers = [])
    {
        parent::__construct($message, $statusCode, $headers);
    }
}
