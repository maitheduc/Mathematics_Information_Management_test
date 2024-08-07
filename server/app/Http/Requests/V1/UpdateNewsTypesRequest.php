<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class UpdateNewsTypesRequest extends FormRequest
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
                'tenloaitin' => 'required|string|max:255|min:3',
                'id_theloai' => 'required|integer',
            ];
        } else {
            return [
                'tenloaitin' => 'sometimes|required|string|max:255|min:3',
                'id_theloai' => 'sometimes|required|integer',
            ];
        }
    }
}
