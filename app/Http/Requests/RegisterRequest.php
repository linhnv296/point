<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
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
            'password' => 'required|min:6|max:50',
            'password_confirm' => 'required|min:6|max:50',
            'date_of_birth' => 'required',
            'phone' => 'required|min:10',
            'province' => 'required|max:250',
            'facebook' => 'required',
            'job' => 'required',
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
            'password.required' => __('Password không được để trống'),
            'password.min' => __('Mật khẩu tối thiểu 6 ký tự'),
            'password_confirm.min' => __('Mật khẩu nhập lại tối thiểu 6 ký tự'),
            'password_confirm.required' => __('Mật khẩu nhập lại không được để trống'),
            'password_confirm.same' => __('Mật khẩu nhập lại không giống Mật khẩu'),
            'date_of_birth.required' => __('Ngày sinh không được để trống'),
            'phone.required' => __('Số điện thoại không được để trống'),
            'facebook.required' => __('Facebook không được để trống'),
            'job.required' => __('Nghề nghiệp không được để trống'),
            ];
    }
}
