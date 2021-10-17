<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ChangePassRequest extends FormRequest
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
            'password' => 'required|min:6|max:50',
            'password_confirm' => 'required|min:6|max:50|same:password',
        ];
    }

    public function messages()
    {
        return [
            'password.required' => __('Mật khẩu không được để trống'),
            'password.min' => __('Mật khẩu tối thiểu 6 ký tự'),
            'password_confirm.min' => __('Mật khẩu nhập lại tối thiểu 6 ký tự'),
            'password_confirm.required' => __('Mật khẩu nhập lại không được để trống'),
            'password_confirm.same' => __('Mật khẩu nhập lại không giống Mật khẩu'),
            ];
    }
}
