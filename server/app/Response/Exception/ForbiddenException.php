<?php

namespace App\Response\Exception;

use App\Response\Exception\BaseException;

class ForbiddenException extends BaseException
{
    public function __construct($message = "Forbidden", $statusCode = 403, ?array $headers = [])
    {
        parent::__construct($message, $statusCode, $headers);
    }
}
