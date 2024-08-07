<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class StoreMajorRequest extends FormRequest
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
        if ($this->isMethod('POST')) {
            return [
                'name' => 'sometimes|required|string|max:255|min:3',
                'department_id' => 'sometimes|required|integer',
                'subjects' => 'sometimes|required|string',
            ];
        }

        return [
            'name' => 'required|string|max:255|min:3',
            'department_id' => 'required|integer',
            'subjects' => 'required|string',
        ];
    }

    public function messages()
    {
        return [
            'name.min' => 'Tên ít nhất 3 kí tự',
            'name.max' => 'Tên nhiều nhất 255 kí tự',
            'required' => ':attribute là trường bắt buộc',

        ];
    }
}
