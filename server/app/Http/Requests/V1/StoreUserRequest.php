<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class StoreUserRequest extends FormRequest
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
        if ($this->method() == 'PUT') {
            return [
                'name' => 'sometimes|string|max:255|unique:users,NULL,' . $this->user . ',id',
                'email' => 'sometimes|string|email|max:255|unique:users,NULL,' . $this->user . ',id',
                'password' => 'sometimes|string|min:2|max:20',
                'permission' => 'sometimes|string',
                'image' => 'sometimes|string',
                'viewname' => 'sometimes|required|string|max:255',
            ];
        }

        return [
            'name' => 'required|string|max:255|unique:users',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:2|max:20',
            'permission' => 'sometimes|string',
            'image' => 'sometimes|string',
            'viewname' => 'required|string|max:255',
        ];
    }

    public function messages()
    {
        return [
            'required' => ':attribute không được bỏ trống',
            'string' => ':attribute phải là chuỗi',
            'integer' => ':attribute phải là số',
            'unique' => ':attribute đã tồn tại',
            'min' => ':attribute ít nhất :min kí tự',
            'max' => ':attribute nhỏ nhất :max kí tự',
            'email' => ':attribute phải là email',
        ];
    }

    protected function prepareForValidation()
    {
        if ($this->method() == 'POST') {
            $this->merge([
                'image' => $this->image ?? 'avatar.jpg',
            ]);
        }
    }
}
