<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
//    public function authorize()
//    {
//        return true;
//    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|max:255',
            'email' => 'required|email|unique:users|max:255',
            'password' => 'required|min:8',
            'phone' => 'required|number|regex:/^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/',
            'sex' => 'required',
            'date_of_birth' => 'required',
            'province' => 'required',
            'education' => 'required',
            'target' => 'required',
            're-password' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => "Họ Tên không được để trống",
            'email.required' => "Email không được để trống",
            'email.unique' => "Email đã tồn tại",
            'email.email' => "Email không đúng chuẩn",
            'phone.required' => "Số điện thoại không được để trống",
            'phone.number' => "Số điện thoại phải là số",
            'phone.regex' => "Vui lòng nhập đúng số điện thoại",
            'sex.required' => "Giới tính không được để trống",
            'date_of_birth.required' => "Ngày sinh không được để trống",
            'province.required' => "Địa chỉ không được để trống",
            'education.required' => "Trình độ học vấn không được để trống",
            'target.required' => "Mục tiêu không được để trống",
            'password.required' => "Mật khẩu không được để trống",
            'password.min' => "Mật khẩu không được ít hơn 8 ký tự",
            're-password.required' => "Nhập lại mật khẩu không được để trống",
            're-password.same' => "Nhập lại mật khẩu phải trùng với mật khẩu",
        ];
    }
}
