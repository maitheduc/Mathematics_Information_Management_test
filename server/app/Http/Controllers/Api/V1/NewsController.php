<?php

namespace App\Http\Controllers\Api\V1;

use App\Filters\V1\NewsFilter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreNewsRequest;
use App\Model\TinTuc;
use App\Response\Exception\NotFoundException;
use App\Response\OkResponse;

class NewsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = new NewsFilter();

        $filterItems = $filter->transform($request);

        $includeNewsTypes = $request->query('include_news_types', 'false');
        $includeUser = $request->query('include_user', 'false');
        $includeComment = $request->query('include_comment', 'false');

        $data = TinTuc::where($filterItems);

        if ($includeNewsTypes == 'true') {
            $data->with('loaitin');
        }

        if ($includeUser == 'true') {
            $data->with('user');
        }

        if ($includeComment == 'true') {
            $data->with('binhluan');
        }

        $data = $data->orderBy($request->query('sort', 'id'), $request->query('order', 'desc'))->paginate($request->query('limit', 10))->appends($request->query());

        $result = $data->items();

        foreach ($result as $key => $value) {
            if (isset($value->hinhdaidien)) {
                $result[$key]->hinhdaidien = url("assets/user/images/hinhtintuc/" . $value->hinhdaidien);
            }
        }

        $response = new OkResponse("Lấy danh sách bài viết thành công.", $data->items());

        return $response->pagination($data)->send();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreNewsRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreNewsRequest $request)
    {
        $added = TinTuc::create($request->all());

        if (!$added) {
            return (new NotFoundException('Lỗi khi thêm bài viết.'))->sendError();
        }

        $response = new OkResponse("Thêm bài viết thành công.", $added->toArray());

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

        $data = TinTuc::where('id', '=', $id);

        $includeNewsTypes = request()->query('include_news_types', 'false');
        $includeUser = request()->query('include_user', 'false');
        $includeComment = request()->query('include_comment', 'false');


        if ($includeNewsTypes == 'true') {
            $data->with('loaitin');
        }

        if ($includeUser == 'true') {
            $data->with('user');
        }

        if ($includeComment == 'true') {
            $data->with('binhluan');
        }

        $data = $data->first();

        if (!$data) {
            return (new NotFoundException('Không tìm thấy bài viết theo id ' . $id))->sendError();
        }

        $response = new OkResponse("Lấy bài viết thành công", $data);

        return $response->send();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreNewsRequest $request, $id)
    {
        $updated = TinTuc::where('id', '=', $id)->update($request->all());

        if (!$updated) {
            return (new NotFoundException('Lỗi khi cập nhật bài viết.'))->sendError();
        }

        $response = new OkResponse("Cập nhật bài viết thành công.", $updated);

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
        $deleted = TinTuc::where('id', '=', $id)->delete();

        if (!$deleted) {
            return (new NotFoundException('Không tìm thấy bài viết!'))->sendError();
        }

        $response = new OkResponse("Xóa bài viết thành công", $deleted);

        return $response->send();
    }
}
