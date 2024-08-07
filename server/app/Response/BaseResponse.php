<?php

namespace App\Response;

use Illuminate\Contracts\Pagination\LengthAwarePaginator;

class BaseResponse
{
    public string $message;
    public $metadata;
    public $options;
    public array $headers = [];
    public int $statusCode = 200;

    public function __construct(int $statusCode, string $message, $metadata, ?array $options = null, ?array $headers = [])
    {
        $this->statusCode = $statusCode;
        $this->message = $message;
        $this->metadata = $metadata;
        $this->options = $options;
        $this->headers = $headers;
    }

    /**
     * Sets pagination options based on the provided LengthAwarePaginator data.
     *
     * @param LengthAwarePaginator $data The data to paginate
     * @return $this
     */
    public function pagination(LengthAwarePaginator $data)
    {
        $this->options = [
            'total' => $data->total(),
            'per_page' => $data->perPage(),
            'current_page' => $data->currentPage(),
            'total_pages' => $data->lastPage(),
            'has_more' => $data->hasMorePages()
        ];

        return $this;
    }

    /**
     * Send the response as a JSON object with message, metadata, and options.
     *
     * @return \Illuminate\Http\Response
     */
    public function send()
    {
        return response()->json(
            [
                'message' => $this->message,
                'metadata' => $this->metadata,
                'options' => $this->options
            ],
            $this->statusCode,
            $this->headers
        );
    }
}
