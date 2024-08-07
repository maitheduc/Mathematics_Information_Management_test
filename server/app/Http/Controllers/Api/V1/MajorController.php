<?php

namespace App\Http\Controllers\Api\V1;

use App\Filters\V1\MajorFilter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreMajorRequest;
use App\Model\Major;
use App\Response\Exception\NotFoundException;
use App\Response\OkResponse;

class MajorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = new MajorFilter();

        $filterItems = $filter->transform($request);

        $includeDepartment = $request->query('include_department', 'false');
        $includeFaculty = $request->query('include_faculty', 'false');

        $data = Major::where($filterItems);

        if ($includeDepartment == 'true') {
            $data->with('department');
        }

        if ($includeFaculty == 'true') {
            $data->with('department.faculty');
        }

        $data = $data->orderBy($request->query('sort', 'id'), $request->query('order', 'desc'))->paginate($request->query('limit', 10))->appends($request->query());

        $response = new OkResponse("Lấy danh sách chuyên ngành thành công.", $data->items());

        return $response->pagination($data)->send();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreMajorRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreMajorRequest $request)
    {
        $added = Major::create($request->all());

        if (!$added) {
            return (new NotFoundException('Lỗi khi thêm chuyên ngành.'))->sendError();
        }

        $response = new OkResponse("Thêm chuyên ngành thành công.", $added->toArray());

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

        $data = Major::where('id', '=', $id);

        $includeDepartment = request()->query('include_department', 'false');
        $includeFaculty = request()->query('include_faculty', 'false');


        if ($includeDepartment == 'true') {
            $data->with('department');
        }

        if ($includeFaculty == 'true') {
            $data->with('department.faculty');
        }

        $data = $data->first();

        if (!$data) {
            return (new NotFoundException('Không tìm thấy chuyên ngành theo id ' . $id))->sendError();
        }

        $response = new OkResponse("Lấy chuyên ngành thành công", $data);

        return $response->send();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  StoreMajorRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreMajorRequest $request, $id)
    {
        $updated = Major::where('id', '=', $id)->update($request->all());

        if (!$updated) {
            return (new NotFoundException('Lỗi khi cập nhật chuyên ngành.'))->sendError();
        }

        $response = new OkResponse("Cập nhật chuyên ngành thành công.", $updated);

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
        $deleted = Major::where('id', '=', $id)->delete();

        if (!$deleted) {
            return (new NotFoundException('Không tìm thấy chuyên ngành!'))->sendError();
        }

        $response = new OkResponse("Xóa chuyên ngành thành công", $deleted);

        return $response->send();
    }
}
