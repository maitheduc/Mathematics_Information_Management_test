<?php

namespace App\Http\Middleware;

use Closure;


class LogApiRequests
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // Log request details to console
        info('API Request:', [
            'method' => $request->method(),
            'url' => $request->url(),
            'body' => $request->all(),
        ]);

        $response = $next($request);

        // Log response details to console (optional)
        info('API Response:', [
            'status' => $response->status(),
            'content' => $response->getContent(),
        ]);

        return $response;
    }
}
