<?php

namespace App\Response\Exception;

use App\Response\Exception\BaseException;

class NotFoundException extends BaseException
{
    public function __construct($message = "Not Found", $statusCode = 404, ?array $headers = [])
    {
        parent::__construct($message, $statusCode, $headers);
    }
}
