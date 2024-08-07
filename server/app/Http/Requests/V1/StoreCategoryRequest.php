<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class StoreCategoryRequest extends FormRequest
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
                'tentheloai' => 'sometimes|required|string',
                'uutien' => 'sometimes|required|numeric',
                'hienthi' => 'sometimes|required|boolean',
                'key' => 'sometimes|string'
            ];
        }

        return [
            'tentheloai' => 'required|string',
            'uutien' => 'required|numeric',
            'hienthi' => 'required|boolean',
            'key' => 'sometimes|string'
        ];
    }
}
