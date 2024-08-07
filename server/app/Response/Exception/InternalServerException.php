<?php

namespace App\Response\Exception;

use App\Response\Exception\BaseException;

class InternalServerException extends BaseException
{
    public function __construct($message = "Internal Server Error", $statusCode = 500, ?array $headers = [])
    {
        parent::__construct($message, $statusCode, $headers);
    }
}
