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
            'email' => 'email|min:6|max:50',
            'name' => 'required',
            'password' => 'required|min:6',
            'password_confirm' => 'required|min:6|max:50',
            'date_of_birth' => 'required|min:6|max:50',
            'phone' => 'required|min:10|max:10',
            'province' => 'required|max:250',
        ];
    }

    public function messages()
    {
        return [
            'email.email' => __('Phải là định dạng email'),
            'email.required' => __('Email không được để trống'),
            'name.required' => __('Tài khoản không được để trống'),
            'password.required' => __('Password không được để trống'),
            'password.min' => __('Mật khẩu tối thiểu 6 ký tự'),
            'password_confirm.min' => __('Mật khẩu nhập lại tối thiểu 6 ký tự'),
            'password_confirm.required' => __('Mật khẩu nhập lại không được để trống'),
            'date_of_birth.required' => __('Ngày sinh không được để trống'),
            'phone.required' => __('Số điện thoại không được để trống'),
            'province.required' => __('Địa chỉ không được để trống'),
            ];
    }
}
