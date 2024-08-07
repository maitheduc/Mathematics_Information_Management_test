<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreAboutRequest;
use App\Model\TrangChu;
use App\Response\Exception\NotFoundException;
use App\Response\OkResponse;

class AboutController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = TrangChu::first();

        $response = new OkResponse('Get successfully.', $data);

        return $response->send();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreAboutRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreAboutRequest $request)
    {
        $added = TrangChu::create($request->all());

        if (!$added) {
            return (new NotFoundException('Lỗi khi thêm.'))->sendError();
        }

        $response = new OkResponse("Thêm thành công.", $added->toArray());

        return $response->send();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = TrangChu::where('id', '=', $id)->first();

        $response = new OkResponse('Get successfully.', $data);

        return $response->send();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  StoreAboutRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreAboutRequest $request, $id)
    {
        $updated = TrangChu::where('id', '=', $id)->update($request->all());

        if (!$updated) {
            return (new NotFoundException('Lỗi khi cập nhật.'))->sendError();
        }

        $response = new OkResponse("Cập nhật thành công.", $updated);

        return $response->send();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $deleted = TrangChu::where('id', '=', $id)->delete();

        if (!$deleted) {
            return (new NotFoundException('Không tìm thấy!'))->sendError();
        }

        $response = new OkResponse("Xóa thành công", $deleted);

        return $response->send();
    }
}
