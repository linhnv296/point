<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AddUserRequest extends FormRequest
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
            'email' => 'email|min:6|max:50|unique:users',
            'name' => 'unique:users|required|regex:/^[a-zA-Z0-9]+$/',
            'date_of_birth' => 'required',
            'phone' => 'required|min:10',
            'province' => 'required|max:250',
            'facebook' => 'required',
            'job' => 'required',
            'cmnd' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'email.email' => __('Phải là định dạng email'),
            'email.required' => __('Email không được để trống'),
            'email.unique' => __('Email đã tồn tại'),
            'name.required' => __('Tài khoản không được để trống'),
            'name.regex' => __('Tài khoản gồm các ký tự 0-9/a-z'),
            'date_of_birth.required' => __('Ngày sinh không được để trống'),
            'phone.required' => __('Số điện thoại không được để trống'),
            'facebook.required' => __('Facebook không được để trống'),
            'job.required' => __('Nghề nghiệp không được để trống'),
            'cmnd.required' => __('CMND/Căn cước công dân không được để trống   '),
        ];
    }
}
