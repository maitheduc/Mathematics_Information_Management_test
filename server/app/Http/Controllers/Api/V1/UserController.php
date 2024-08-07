<?php

namespace App\Http\Controllers\Api\V1;

use App\Filters\V1\UserFilter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreUserRequest;
use App\Response\Exception\NotFoundException;
use App\Response\OkResponse;
use App\User;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = new UserFilter();

        $filterItems = $filter->transform($request);

        $data = User::where($filterItems);

        $data = $data->orderBy($request->query('sort', 'id'), $request->query('order', 'desc'))->paginate($request->query('limit', 10))->appends($request->query());

        $response = new OkResponse("Lấy danh sách tài khoản người dùng thành công.", $data->items());

        return $response->pagination($data)->send();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreUserRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUserRequest $request)
    {

        $data = $request->all();
        $data['password'] = bcrypt($data['password']);
        $data['permission'] = $data['permission'] ?? 'SinhVien';

        $added = User::create($data);

        if (!$added) {
            return (new NotFoundException('Lỗi khi thêm tài khoản.'))->sendError();
        }

        $response = new OkResponse("Thêm tài khoản thành công.", $added->toArray());

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
        $data = User::where('id', '=', $id)->first();

        if (!$data) {
            return (new NotFoundException('Không tìm thấy tài khoản người dùng theo id ' . $id))->sendError();
        }

        $response = new OkResponse("Lấy tài khoản người dùng thành công", $data);

        return $response->send();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  StoreUserRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreUserRequest $request, $id)
    {
        $data = $request->all();

        if (isset($data['password'])) {
            unset($data['password']);
        }

        $updated = User::where('id', '=', $id)->update($data);

        if (!$updated) {
            return (new NotFoundException('Lỗi khi cập nhật tài khoản người dùng.'))->sendError();
        }

        $response = new OkResponse("Cập nhật tài khoản người dùng thành công.", $updated);

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
        $deleted = User::where('id', '=', $id)->delete();

        if (!$deleted) {
            return (new NotFoundException('Không tìm thấy tài khoản người dùng!'))->sendError();
        }

        $response = new OkResponse("Xóa tài khoản người dùng thành công", $deleted);

        return $response->send();
    }
}
