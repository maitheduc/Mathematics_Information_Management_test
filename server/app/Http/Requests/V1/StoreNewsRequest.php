<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class StoreNewsRequest extends FormRequest
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
        if ($this->method() == 'POST') {
            return [
                'tieude' => 'required|string|unique:tin_tucs',
                'mota' => 'required|string',
                'hinhdaidien' => 'required|string',
                'noidung' => 'required|string',
                'noibat' => 'sometimes|boolean',
                'luotxem' => 'sometimes|integer',
                'id_loaitin' => 'required|integer',
                'id_user' => 'required|integer',
                'is_hidden_cmt' => 'sometimes|boolean',
            ];
        } else {
            return [
                'tieude' => 'sometimes|string',
                'mota' => 'sometimes|string',
                'hinhdaidien' => 'sometimes|string',
                'noidung' => 'sometimes|string',
                'noibat' => 'sometimes|boolean',
                'luotxem' => 'sometimes|integer',
                'id_loaitin' => 'sometimes|integer',
                'id_user' => 'sometimes|integer',
            ];
        }
    }

    public function messages()
    {
        return [
            'required' => ':attribute không được bỏ trống',
            'string' => ':attribute phải là chuỗi',
            'integer' => ':attribute phải là số',
            'unique' => ':attribute đã tồn tại'
        ];
    }

    protected function prepareForValidation()
    {
        if ($this->method() == 'POST') {
            $this->merge([
                'noibat' => $this->noibat ?? 0,
                'luotxem' => $this->luotxem ?? 0
            ]);
        } else {
            if ($this->noibat) {
                $this->merge(['noibat' => $this->noibat]);
            }

            if ($this->luotxem) {
                $this->merge(['luotxem' => $this->luotxem]);
            }
        }
    }
}
