<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class StoreFacultyRequest extends FormRequest
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
                'name' => 'sometimes|required|string|max:199|unique:faculties,NULL,' . $this->faculty,
                'image' => 'sometimes|string|max:199',
                'description' => 'sometimes|string',
            ];
        }

        return [
            'name' => 'required|string|max:199|unique:faculties',
            'image' => 'sometimes|string|max:199',
            'description' => 'sometimes|string',
        ];
    }

    public function messages()
    {
        return [
            'required' => ':attribute không được bỏ trống',
            'string' => ':attribute phải là chuỗi',
            'max' => ':attribute ít nhất :max kí tự',
            'unique' => ':attribute đã tồn tại',
        ];
    }
}
