<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class StoreNotificationRequest extends FormRequest
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
        if ($this->isMethod('PUT')) {
            return [
                'tieude' => 'sometimes|required|string|max:255',
                'noidung' => 'sometimes|required|string',
                'ghichu' => 'sometimes|required|string',
                'ngaybatdau' => 'sometimes|required|date',
                'ngayhethan' => 'sometimes|required|date',
            ];
        }

        return [
            'tieude' => 'required|string|max:255',
            'noidung' => 'required|string',
            'ghichu' => 'required|string',
            'ngaybatdau' => 'required|date',
            'ngayhethan' => 'required|date',
        ];
    }

    public function messages()
    {
        return [
            'required' => ':attribute là trường bắt buộc',
            'string' => ':attribute phải là chuỗi',
            'max' => ':attribute ít nhất :max kí tự',
            'date' => ':attribute phải là ngày',
        ];
    }
}
