<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\BinhLuan;
use App\Model\TinTuc;
use App\Response\OkResponse;
use App\User;

class StatisticsController extends Controller
{
    public function count()
    {
        $userAdminCounter = User::where('permission', '=', 'Admin')->count();
        $userCounter = User::where('permission', '<>', 'Admin')->count();
        $postCounter = TinTuc::count();
        $commentCounter = BinhLuan::count();

        return (new OkResponse(
            'Get count successfully',
            compact(
                'userAdminCounter',
                'userCounter',
                'postCounter',
                'commentCounter'
            )
        ))->send();
    }
}
