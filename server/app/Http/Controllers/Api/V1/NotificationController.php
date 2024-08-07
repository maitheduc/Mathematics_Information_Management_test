<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreNotificationRequest;
use App\Model\ThongBao;
use App\Response\Exception\NotFoundException;
use App\Response\OkResponse;

class NotificationController extends Controller
{
    public function  show()
    {
        $data = ThongBao::all()->first();

        return (new OkResponse(
            'Get notification successfully',
            $data
        ))->send();
    }

    public function  update(StoreNotificationRequest $request, $id)
    {
        $updated = ThongBao::where('id', '=', $id)->update($request->all());

        // if (!$updated) {
        //     return (new NotFoundException('Lỗi khi cập nhật thông báo.'))->sendError();
        // }

        $response = new OkResponse("Cập nhật thông báo thành công.", $updated);

        return $response->send();
    }

    public function  store(StoreNotificationRequest $request)
    {
        $added = ThongBao::create($request->all());

        if (!$added) {
            return (new NotFoundException('Lỗi khi thêm thông báo.'))->sendError();
        }

        $response = new OkResponse("Thêm thông báo thành công.", $added->toArray());

        return $response->send();
    }
}
