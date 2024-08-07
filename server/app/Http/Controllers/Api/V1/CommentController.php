<?php

namespace App\Http\Controllers\Api\V1;

use App\Filters\V1\CommentFilter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreCommentRequest;
use App\Model\BinhLuan;
use App\Response\Exception\NotFoundException;
use App\Response\OkResponse;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = new CommentFilter();

        $filterItems = $filter->transform($request);

        $includeNews = $request->query('include_news', 'false');
        $includeUser = $request->query('include_user', 'false');
        $includeCommentDetails = $request->query('include_comment_detail', 'false');

        $data = BinhLuan::where($filterItems);

        if ($includeNews == 'true') {
            $data->with('tintuc');
        }

        if ($includeUser == 'true') {
            $data->with('user');
        }

        if ($includeCommentDetails == 'true') {
            $data->with('chitietbinhluan');
            $data->with('chitietbinhluan.user');
        }


        if ($request->query('all', 0) == 1) {
            $data = $data->orderBy($request->query('sort', 'id'), $request->query('order', 'desc'))->get();

            $result = $data->toArray();

            return (new OkResponse("Lấy danh sách bình luận thành công.", $result))->send();
        }

        $data = $data->orderBy($request->query('sort', 'id'), $request->query('order', 'desc'))->paginate($request->query('limit', 10))->appends($request->query());

        $response = new OkResponse("Lấy danh sách bình luận thành công.", $data->items());

        return $response->pagination($data)->send();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreCommentRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCommentRequest $request)
    {
        $added = BinhLuan::create($request->all());

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
        $data = BinhLuan::where('id', '=', $id);

        $includeNews = request()->query('include_news', 'false');
        $includeUser = request()->query('include_user', 'false');
        $includeCommentDetails = request()->query('include_comment_detail', 'false');


        if ($includeNews == 'true') {
            $data->with('tintuc');
        }

        if ($includeUser == 'true') {
            $data->with('user');
        }

        if ($includeCommentDetails == 'true') {
            $data->with('chitietbinhluan');
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
     * @param  StoreCommentRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreCommentRequest $request, $id)
    {
        $updated = BinhLuan::where('id', '=', $id)->update($request->all());

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
        $deleted = BinhLuan::where('id', '=', $id)->delete();

        if (!$deleted) {
            return (new NotFoundException('Không tìm thấy bình luận!'))->sendError();
        }

        $response = new OkResponse("Xóa bình luận thành công", $deleted);

        return $response->send();
    }
}
