<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class StoreMailboxRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        if ($this->method == 'POST') {
            return [
                'hoten' => 'sometimes|string|max:255|min:3',
                'email' => 'sometimes|email',
                'dienthoai' => 'sometimes|string|max:10|min:10',
                'noidung' => 'required|string',
                'andanh' => 'required|boolean'
            ];
        } else {
            return [
                'hoten' => 'sometimes|string|max:255|min:3',
                'email' => 'sometimes|email',
                'dienthoai' => 'sometimes|string|max:10|min:10',
                'noidung' => 'sometimes|required|string',
                'andanh' => 'sometimes|required|boolean',
                'daxem' => 'sometimes|required|boolean',
                'dadoc' => 'sometimes|required|boolean',
            ];
        }
    }

    /**
     * 
     * @return array
     * 
     */
    public function messages()
    {
        return [
            'hoten.required' => 'Vui lòng nhập họ tên',
            'hoten.string' => 'Họ tên phải là chuỗi',
            'hoten.max' => 'Họ tên tối đa 255 ký tự',
            'hoten.min' => 'Họ tên tối thiểu 3 ký tự',
            'email.email' => 'Email phải đúng định dạng',
            'dienthoai.string' => 'Điện thoại phải là chuỗi',
            'dienthoai.max' => 'Điện thoại tối đa 10 ký tự',
            'dienthoai.min' => 'Điện thoại tối đa 10 ký tự',
            'noidung.required' => 'Vui lòng nhập nội dung',
            'noidung.string' => 'Nội dung phải là chuỗi',
            'andanh.required' => 'Vui lòng nhập Ẩn danh',
            'andanh.boolean' => 'Ẩn danh phải là 1 hoặc 0',
            'daxem.boolean' => 'Đa xem phải là 1 hoặc 0',
            'dadoc.boolean' => 'Đa đọc phải là 1 hoặc 0',
        ];
    }

    protected function prepareForValidation()
    {
        $this->merge([
            'hoten' => $this->hoten ?? 'Ẩn danh',
            'daxem' => $this->daxem ?? 0,
            'dadoc' => $this->dadoc ?? 0
        ]);
    }
}
