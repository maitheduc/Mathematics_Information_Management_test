<?php

namespace App\Http\Controllers\Api\V1;

use App\Filters\V1\DepartmentFilter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreDepartmentRequest;
use App\Model\Department;
use App\Response\Exception\NotFoundException;
use App\Response\OkResponse;

class DepartmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = new DepartmentFilter();

        $filterItems = $filter->transform($request);

        $includeFaculty = $request->query('include_faculty', 'false');
        $includePersonnel = $request->query('include_personnel', 'false');
        $includeMajor = $request->query('include_major', 'false');

        $data = Department::where($filterItems);

        if ($includeFaculty == 'true') {
            $data->with('faculty');
        }

        if ($includeMajor == 'true') {
            $data->with('major');
        }

        if ($includePersonnel == 'true') {
            $data->with('personnel');
        }

        if ($request->query('all', 0) == 1) {
            $data = $data->get();

            $result = $data->toArray();

            return (new OkResponse("Lấy danh sách bộ phận thành công.", $result))->send();
        }

        $data = $data->orderBy($request->query('sort', 'id'), $request->query('order', 'asc'))->paginate($request->query('limit', 10))->appends($request->query());

        $response = new OkResponse("Lấy danh sách bộ phận thành công.", $data->items());

        return $response->pagination($data)->send();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreDepartmentRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreDepartmentRequest $request)
    {
        $added = Department::create($request->all());

        if (!$added) {
            return (new NotFoundException('Lỗi khi thêm bộ phận.'))->sendError();
        }

        $response = new OkResponse("Thêm bộ phận thành công.", $added->toArray());

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
        $data = Department::where('id', '=', $id);

        $includeFaculty = request()->query('include_faculty', 'false');
        $includePersonnel = request()->query('include_personnel', 'false');
        $includeMajor = request()->query('include_major', 'false');

        if ($includeFaculty == 'true') {
            $data->with('faculty');
        }

        if ($includeMajor == 'true') {
            $data->with('major');
        }


        if ($includePersonnel == 'true') {
            $data->with('personnel');
        }

        $data = $data->first();

        if (!$data) {
            return (new NotFoundException('Không tìm bộ phận theo id ' . $id))->sendError();
        }

        $response = new OkResponse('Lấy bộ phận theo id ' . $id . 'Thành công', $data);

        return $response->send();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  StoreDepartmentRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreDepartmentRequest $request, $id)
    {
        $updated = Department::where('id', '=', $id)->update($request->all());

        if (!$updated) {
            return (new NotFoundException('Lỗi khi cập nhật bộ phận.'))->sendError();
        }

        $response = new OkResponse("Cập nhật bộ phận thành công.", $updated);

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
        $deleted = Department::where('id', '=', $id)->delete();

        if (!$deleted) {
            return (new NotFoundException('Không tìm thấy bộ phận để xóa!'))->sendError();
        }

        $response = new OkResponse("Xóa bộ phận thành công", $deleted);

        return $response->send();
    }
}
