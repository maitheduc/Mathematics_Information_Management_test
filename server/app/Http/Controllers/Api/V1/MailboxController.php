<?php

namespace App\Http\Controllers\Api\V1;

use App\Filters\V1\MailboxFilter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreMailboxRequest;
use App\Model\HopThu;
use App\Response\Exception\NotFoundException;
use App\Response\OkResponse;

class MailboxController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = new MailboxFilter();

        $filterItems = $filter->transform($request);

        $data = HopThu::where($filterItems)->orderBy($request->query('sort', 'id'), $request->query('order', 'desc'));

        $data = $data->paginate($request->query('limit', 10))->appends($request->query());

        $response = new OkResponse("Lấy danh sách hộp thư thành công.", $data->items());

        return $response->pagination($data)->send();
    }

    public function getCount()
    {
        $countAll = HopThu::where('dadoc', '=', 0)->count();
        $countAnonymous = HopThu::where('dadoc', '=', 0)->where('andanh', '=', 1)->count();
        $countNormal = HopThu::where('dadoc', '=', 0)->where('andanh', '=', 0)->count();

        $response = [
            'countAll' => $countAll,
            'countAnonymous' => $countAnonymous,
            'countNormal' => $countNormal
        ];

        return (new OkResponse("Lấy danh sách hộp thư thành công.", $response))->send();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreMailboxRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreMailboxRequest $request)
    {
        $added = HopThu::create($request->all());

        if (!$added) {
            return (new NotFoundException('Lỗi khi thêm hộp thư.'))->sendError();
        }

        $response = new OkResponse("Thêm hộp thư thành công.", $added->toArray());

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
        $data = HopThu::where('id', '=', $id)->first();

        if (!$data) {
            return (new NotFoundException('Không tìm hộp thư theo id ' . $id))->sendError();
        }

        $response = new OkResponse('Lấy hộp thư theo id ' . $id . 'Thành  công', $data);

        return $response->send();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  StoreMailboxRequest $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreMailboxRequest $request, $id)
    {
        $updated = HopThu::where('id', '=', $id)->update($request->all());

        if (!$updated) {
            return (new NotFoundException('Lỗi khi cập nhật hộp thư.'))->sendError();
        }

        $response = new OkResponse("Cập nhật hộp thư thành công.", $updated);

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
        $deleted = HopThu::where('id', '=', $id)->delete();

        if (!$deleted) {
            return (new NotFoundException('Không tìm thấy hộp thư để xóa!'))->sendError();
        }

        $response = new OkResponse("Xóa hộp thư thành công", $deleted);

        return $response->send();
    }
}
