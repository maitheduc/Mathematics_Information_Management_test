<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\TheLoai;
use App\Filters\V1\CategoryFilter;
use App\Http\Requests\V1\ChangeDisplayCategoryRequest;
use App\Http\Requests\V1\SortPriorityCategoryRequest;
use App\Http\Requests\V1\StoreCategoryRequest;
use App\Response\Exception\NotFoundException;
use App\Response\OkResponse;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *  @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = new CategoryFilter();

        $filterItems = $filter->transform($request); // ['column', 'operator', 'value']

        $includeCategory = $request->query('include_category');
        $includeNews = $request->query('include_news');

        $data = TheLoai::where($filterItems);

        if ($includeCategory) {
            $data = $data->with('loaitin');
        }

        if ($includeNews) {
            $data = $data->with('tintuc');
            $data = $data->with('tintuc.binhluan');
        }

        $data = $data->orderBy($request->query('sort', 'id'), $request->query('order', 'desc'));

        if ($request->query('all', 0) == 1) {
            $data = $data->get();

            $result = $data->toArray();

            foreach ($result as $key => $value) {
                if (isset($value->tintuc)) {
                    foreach ($value->tintuc as $index => $news) {
                        if (isset($news->hinhdaidien)) {
                            $result[$key]->tintuc[$index]->hinhdaidien = url("assets/user/images/hinhtintuc/" . $news->hinhdaidien);
                        }
                    }
                }
            }

            $response = new OkResponse("Get all category successfully", $result);

            return $response->send();
        } else {
            $data = $data->paginate($request->query('limit', 10))->appends($request->query());
        }

        $result = $data->items();

        foreach ($result as $key => $value) {
            if (isset($value->tintuc)) {
                foreach ($value->tintuc as $index => $news) {
                    if (isset($news->hinhdaidien)) {
                        $result[$key]->tintuc[$index]->hinhdaidien = url("assets/user/images/hinhtintuc/" . $news->hinhdaidien);
                    }
                }
            }
        }

        $response = new OkResponse("Get all category successfully", $result);

        return $response->pagination($data)->send();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreCategoryRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCategoryRequest $request)
    {
        $added = TheLoai::create($request->all());

        if (!$added) {
            return (new NotFoundException('Lỗi khi thêm thể loại.'))->sendError();
        }

        $response = new OkResponse("Thêm thể loại thành công.", $added->toArray());

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
        $includeCategory = request()->query('include_category');
        $includeNews = request()->query('include_news');
        $data = TheLoai::where('id', '=', $id);

        if ($includeCategory) {
            $data->with('loaitin');
        }

        if ($includeNews) {
            $data->with('tintuc');
        }

        $data = $data->first();

        if (!$data) {
            return (new NotFoundException('Không tìm thể loại theo id ' . $id))->sendError();
        }

        $response = new OkResponse("Get a category successfully", $data);

        return $response->send();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  StoreCategoryRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreCategoryRequest $request, $id)
    {
        $updated = TheLoai::where('id', '=', $id)->update($request->all());

        if (!$updated) {
            return (new NotFoundException('Lỗi khi cập nhật thể loại.'))->sendError();
        }

        $response = new OkResponse("Cập nhật thể loại thành công.", $updated);

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
        $deleted = TheLoai::where('id', '=', $id)->delete();

        if (!$deleted) {
            return (new NotFoundException('Không tìm thấy thể loại!'))->sendError();
        }

        $response = new OkResponse("Xóa thể loại thành công", $deleted);

        return $response->send();
    }

    public function sortPriority(SortPriorityCategoryRequest $request)
    {
        $data = $request->all();

        $foundCategoryCurrent = TheLoai::where('id', '=', $data['currentId'])->first();
        $foundCategoryMoved = TheLoai::where('id', '=', $data['moveId'])->first();

        if (!$foundCategoryCurrent && !$foundCategoryMoved) {
            return (new NotFoundException('Không tìm thấy thể loại để sắp xếp!'))->sendError();
        }

        $priorityMoved = $foundCategoryCurrent->uutien;

        $foundCategoryCurrent->uutien = $foundCategoryMoved->uutien;
        $foundCategoryMoved->uutien = $priorityMoved;

        $foundCategoryCurrent->save();
        $foundCategoryMoved->save();

        $response = new OkResponse("Sắp xếp vị trí ưu tiên thành công.", []);

        return $response->send();
    }

    public function changeDisplay(ChangeDisplayCategoryRequest $request)
    {
        $data = $request->all();

        TheLoai::whereIn('id', $data['hiddenIds'])
            ->update(['hienthi' => 0]);

        TheLoai::whereIn('id', $data['displayIds'])
            ->update(['hienthi' => 1]);

        $response = new OkResponse("Thay đổi hiển thị thành công", []);

        return $response->send();
    }
}
