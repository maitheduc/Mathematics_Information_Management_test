<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class StoreChangePasswordRequest extends FormRequest
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
        return [
            'email' => 'required|string|email',
            'token' => 'required|string',
            'password' => 'required|string|min:2|max:255',
        ];
    }

    public function messages()
    {
        return [
            'required' => ':attribute không được bỏ trống',
            'string' => ':attribute phải là chuỗi',
            'min' => ':attribute ít nhất :min kí tự',
            'max' => ':attribute nhỏ nhất :max kí tự',
            'email' => ':attribute phải là email',
        ];
    }
}
