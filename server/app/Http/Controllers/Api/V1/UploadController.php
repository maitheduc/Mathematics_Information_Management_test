<?php

namespace App\Http\Controllers\Api\V1;

use App\Response\OkResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UploadController extends Controller
{
    public function upload(Request $request)
    {
        $file = $request->file('file');
        $folder = $request->folder;

        $pathRoot = "assets/{$folder}";

        if ($file->isValid()) {
            $path = $file->move($pathRoot, $file->getClientOriginalName());

            $result = [
                'url' => url($path),
                'name' => $file->getClientOriginalName(),
            ];

            $response = new OkResponse('Upload success', $result);

            return $response->send();
        }
    }

    public function uploadMultiple(Request $request)
    {
        $files = $request->file('files');
        $result = [];
        $pathRoot = "assets/{$request->folder}";

        foreach ($files as $file) {
            $path = $file->move($pathRoot, $file->getClientOriginalName());

            $result[] = [
                'url' => url($path),
                'name' => $file->getClientOriginalName(),
            ];
        }

        $response = new OkResponse('Uploads success', $result);

        return $response->send();
    }
}
