<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
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
            'name' => 'required',
            'password' => 'required|min:1'
        ];
    }

    public function messages()
    {
        return [
            'name.required' => __('login-logout.email-is-required'),
            'password.required' => __('login-logout.password-is-required'),
        ];
    }
}
