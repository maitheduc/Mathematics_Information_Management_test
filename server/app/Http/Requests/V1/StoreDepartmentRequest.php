<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class StoreDepartmentRequest extends FormRequest
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
                'name' => 'required|string|max:199|unique:departments,NULL,' . $this->department . ',id',
                'image' => 'sometimes|string|max:199',
                'description' => 'sometimes|string',
                'faculty_id' => 'required|integer',
            ];
        }

        return [
            'name' => 'required|string|max:199|unique:departments',
            'image' => 'sometimes|string|max:199',
            'description' => 'sometimes|string',
            'faculty_id' => 'required|integer',
        ];
    }

    public function messages()
    {
        return [
            'unique' => ':attribute đã tồn tại',
            'required' => ':attribute không được bỏ trống',
            'string' => ':attribute phải là chuỗi',
            'max' => ':attribute ít nhất :max kí tự',
            'integer' => ':attribute phải là số',
        ];
    }
}
