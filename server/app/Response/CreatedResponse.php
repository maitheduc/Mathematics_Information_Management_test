<?php

namespace App\Response;

class CreatedResponse extends BaseResponse
{
    public function __construct(string $message = "Created", array $metadata = [], ?array $options = null, ?array $headers = [])
    {
        parent::__construct(201, $message, $metadata, $options, $headers);
    }
}
