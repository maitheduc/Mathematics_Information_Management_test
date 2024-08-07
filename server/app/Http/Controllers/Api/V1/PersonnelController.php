<?php

namespace App\Http\Controllers\Api\V1;

use App\Filters\V1\PersonnelFilter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StorePersonnelRequest;
use App\Model\Personnel;
use App\Response\Exception\NotFoundException;
use App\Response\OkResponse;

class PersonnelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = new PersonnelFilter();

        $filterItems = $filter->transform($request);

        $includeDepartment = $request->query('include_department', 'false');
        $includeFaculty = $request->query('include_faculty', 'false');

        $data = Personnel::where($filterItems);

        if ($includeDepartment == 'true') {
            $data->with('department');
        }

        if ($includeFaculty == 'true') {
            $data->with('department.faculty');
        }

        if ($request->query('all', 0) == 1) {
            $data = $data->get();

            $result = $data->toArray();

            return (new OkResponse("Lấy danh sách nhân sự thành công.", $result))->send();
        }

        $data = $data->orderBy($request->query('sort', 'id'), $request->query('order', 'asc'))->paginate($request->query('limit', 10))->appends($request->query());

        $response = new OkResponse("Lấy danh sách nhân sự thành công.", $data->items());

        return $response->pagination($data)->send();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StorePersonnelRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePersonnelRequest $request)
    {
        $added = Personnel::create($request->all());

        if (!$added) {
            return (new NotFoundException('Lỗi khi thêm nhân sự.'))->sendError();
        }

        $response = new OkResponse("Thêm nhân sự thành công.", $added->toArray());

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
        $data = Personnel::where('id', '=', $id);

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
            return (new NotFoundException('Không tìm nhân sự theo id ' . $id))->sendError();
        }

        $response = new OkResponse('Lấy nhân sự theo id ' . $id . 'Thành công', $data);

        return $response->send();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  StorePersonnelRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StorePersonnelRequest $request, $id)
    {
        $updated = Personnel::where('id', '=', $id)->update($request->all());

        if (!$updated) {
            return (new NotFoundException('Lỗi khi cập nhật nhân sự.'))->sendError();
        }

        $response = new OkResponse("Cập nhật nhân sự thành công.", $updated);

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
        $deleted = Personnel::where('id', '=', $id)->delete();

        if (!$deleted) {
            return (new NotFoundException('Không tìm thấy nhân sự để xóa!'))->sendError();
        }

        $response = new OkResponse("Xóa nhân sự thành công", $deleted);

        return $response->send();
    }
}
