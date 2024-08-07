<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class StorePersonnelRequest extends FormRequest
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
                'first_name' => 'sometimes|required|string|max:191',
                'last_name' => 'sometimes|required|string|max:191',
                'email' => 'sometimes|required|string|email|max:191|unique:personnel,NULL,' . $this->personnel . ',id',
                'phone' => 'sometimes|required|string|max:191|unique:personnel,NULL,' . $this->personnel . ',id',
                
                'address' => 'sometimes|string|max:191',
                'image' => 'sometimes|string|max:191',
                'description' => 'sometimes|string',
                'avatar' => 'sometimes|string|max:191',
                'base_salary' => 'sometimes|required|numeric',
                'academic_level' => 'sometimes|string|max:191',
                'degrees' => 'sometimes|required|string|max:191',
                'position' => 'sometimes|string|max:191',
                'gender' => 'sometimes|required|string|in:male,female',
                'department_id' => 'sometimes|required|integer',
            ];
        }

        return [
            'first_name' => 'required|string|max:191',
            'last_name' => 'required|string|max:191',
            'email' => 'required|string|email|max:191|unique:personnel',
            'phone' => 'required|string|max:191|unique:personnel',
            
            'address' => 'sometimes|string|max:191',
            'image' => 'sometimes|string|max:191',
            'description' => 'sometimes|string',
            'avatar' => 'required|string|max:191',
            'base_salary' => 'required|numeric',
            'academic_level' => 'sometimes|string|max:191',
            'degrees' => 'required|string|max:191',
            'position' => 'required|string|max:191',
            'gender' => 'required|string|in:male,female',
            'department_id' => 'required|integer',
        ];
    }

    public function messages()
    {
        return [
            'required' => ':attribute là trường bắt buộc!',
            'string' => ':attribute phải là chuỗi!',
            'max' => ':attribute nhiều nhất hơn :min kí tự!',
            'date' => ':attribute phải là ngày!',
            'in' => ':attribute phải là :in!',
            'integer' => ':attribute phải là số!',
            'unique' => ':attribute đã tồn tại!',
            'email' => ':attribute không hợp lệ!',
            'numeric' => ':attribute phải là số!',
        ];
    }
}
