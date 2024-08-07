<?php

namespace App\Http\Controllers\Api\V1;

use App\Filters\V1\FacultyFilter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreFacultyRequest;
use App\Model\Faculty;
use App\Response\Exception\NotFoundException;
use App\Response\OkResponse;

class FacultyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = new FacultyFilter();

        $filterItems = $filter->transform($request);

        $includeDepartment = $request->query('include_department', 'false');
        $includePersonnel = $request->query('include_personnel', 'false');

        $data = Faculty::where($filterItems)->where('id', '=', 2);

        if ($includeDepartment == 'true') {
            $data->with('departments');
        }

        if ($includePersonnel == 'true') {
            $data->with('departments.personnel');
        }

        if ($request->query('all', 0) == 1) {
            $data = $data->get();

            $result = $data->toArray();

            return (new OkResponse("Lấy danh sách khoa thành công.", $result))->send();
        }

        $data = $data->orderBy($request->query('sort', 'id'), $request->query('order', 'asc'))->paginate($request->query('limit', 10))->appends($request->query());

        $response = new OkResponse("Lấy danh sách khoa thành công.", $data->items());

        return $response->pagination($data)->send();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreFacultyRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreFacultyRequest $request)
    {
        $added = Faculty::create($request->all());

        if (!$added) {
            return (new NotFoundException('Lỗi khi thêm khoa.'))->sendError();
        }

        $response = new OkResponse("Thêm khoa thành công.", $added->toArray());

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
        $data = Faculty::where('id', '=', $id);

        $includeDepartment = request()->query('include_department', 'false');

        if ($includeDepartment) {
            $data->with('departments');
        }

        $data = $data->first();

        if (!$data) {
            return (new NotFoundException('Không tìm khoa theo id ' . $id))->sendError();
        }

        $response = new OkResponse('Lấy khoa theo id ' . $id . 'Thành  công', $data);

        return $response->send();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  StoreFacultyRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreFacultyRequest $request, $id)
    {
        $updated = Faculty::where('id', '=', $id)->update($request->all());

        if (!$updated) {
            return (new NotFoundException('Lỗi khi cập nhật khoa.'))->sendError();
        }

        $response = new OkResponse("Cập nhật khoa thành công.", $updated);

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
        $deleted = Faculty::where('id', '=', $id)->delete();

        if (!$deleted) {
            return (new NotFoundException('Không tìm thấy khoa để xóa!'))->sendError();
        }

        $response = new OkResponse("Xóa khoa thành công", $deleted);

        return $response->send();
    }
}
