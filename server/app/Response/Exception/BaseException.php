<?php

namespace App\Response\Exception;

class BaseException
{
    public int $statusCode;
    public string $message;
    public array $headers = [];

    public function __construct($message = "", int $statusCode = 400, ?array $headers = [])
    {
        $this->statusCode = $statusCode;
        $this->message = $message;
        $this->headers = $headers;
    }

    public function sendError()
    {
        return response()->json([
            'message' => $this->message,
            'status' => $this->statusCode
        ], $this->statusCode);
    }
}
