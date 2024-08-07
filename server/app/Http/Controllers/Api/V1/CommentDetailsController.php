<?php

namespace App\Http\Controllers\Api\V1;

use App\Filters\V1\CommentDetailsFilter;
use App\Model\ChiTietBinhLuan;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreCommentDetailsRequest;
use App\Response\Exception\NotFoundException;
use App\Response\OkResponse;

class CommentDetailsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = new CommentDetailsFilter();

        $filterItems = $filter->transform($request);

        $includeUser = $request->query('include_user', 'false');
        $includeComment = $request->query('include_comment', 'false');

        $data = ChiTietBinhLuan::where($filterItems);

        if ($includeUser == 'true') {
            $data->with('user');
        }

        if ($includeComment == 'true') {
            $data->with('binhluan');
        }

        $data = $data->orderBy($request->query('sort', 'id'), $request->query('order', 'desc'))->paginate($request->query('limit', 10))->appends($request->query());

        $response = new OkResponse("Lấy danh sách bình luận thành công.", $data->items());

        return $response->pagination($data)->send();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreCommentDetailsRequest $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCommentDetailsRequest $request)
    {
        $added = ChiTietBinhLuan::create($request->all());

        if (!$added) {
            return (new NotFoundException('Lỗi khi thêm bình luận.'))->sendError();
        }

        $response = new OkResponse("Thêm bình luận thành công.", $added->toArray());

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
        $data = ChiTietBinhLuan::where('id', '=', $id);

        $includeUser = request()->query('include_user', 'false');
        $includeComment = request()->query('include_comment', 'false');

        if ($includeUser == 'true') {
            $data->with('user');
        }

        if ($includeComment == 'true') {
            $data->with('binhluan');
        }

        $data = $data->first();

        if (!$data) {
            return (new NotFoundException('Không tìm thấy bình luận theo id ' . $id))->sendError();
        }

        $response = new OkResponse("Lấy bình luận thành công", $data);

        return $response->send();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  StoreCommentDetailsRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreCommentDetailsRequest $request, $id)
    {
        $updated = ChiTietBinhLuan::where('id', '=', $id)->update($request->all());

        if (!$updated) {
            return (new NotFoundException('Lỗi khi cập nhật bình luận.'))->sendError();
        }

        $response = new OkResponse("Cập nhật bình luận thành công.", $updated);

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
        $deleted = ChiTietBinhLuan::where('id', '=', $id)->delete();

        if (!$deleted) {
            return (new NotFoundException('Không tìm thấy bình luận!'))->sendError();
        }

        $response = new OkResponse("Xóa bình luận thành công", $deleted);

        return $response->send();
    }
}
