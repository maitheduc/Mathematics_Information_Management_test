<?php

namespace App\Response;

class OkResponse extends BaseResponse
{
    public function __construct(string $message = "OK", $metadata, ?array $options = null, ?array $headers = [])
    {
        parent::__construct(200, $message, $metadata, $options, $headers);
    }
}
