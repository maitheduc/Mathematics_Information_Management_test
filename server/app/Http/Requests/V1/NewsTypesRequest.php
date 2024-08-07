<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class NewsTypesRequest extends FormRequest
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
            'tenloaitin' => 'required|string|max:255|min:3',
            'id_theloai' => 'required|numeric',
            'parent_id' => 'sometimes|numeric',
            'level' => 'sometimes|numeric',
            'link' => 'sometimes|string|max:255',
        ];
    }
}
