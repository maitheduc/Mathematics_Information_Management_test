<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class StoreCommentRequest extends FormRequest
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
                'noidung' => 'required|string',
                'id_tintuc' => 'required|numeric',
                'id_user' => 'required|numeric',
            ];
        } else {
            return [
                'noidung' => 'sometimes|required|string',
                'id_tintuc' => 'sometimes|required|numeric',
                'id_user' => 'sometimes|required|numeric',
                'is_hidden_cmt' => 'sometimes|boolean',
            ];
        }
    }

    public function messages()
    {
        return [
            'required' => ':attribute không được bỏ trống',
            'string' => ':attribute phải là chuỗi',
            'numeric' => ':attribute phải là số',
        ];
    }
}
