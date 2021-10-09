<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;

use App\Http\Requests\RegisterRequest;
use App\Http\Requests\UserRequest;
use App\Models\Point;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/login';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }


    /**
     * Create a new user instance after a valid registration.
     *
     * @param array $data
     * @return
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'sex' => $data['sex'],
            'province' => $data['province'],
            'education' => $data['education'],
            'job' => $data['job'] ?? '',
            'course' => $data['course'],
            'date_of_birth' => $data['date_of_birth'],
            'facebook' => $data['facebook'],
            'fullname' => $data['fullname'],
            'password' => Hash::make($data['password']),
        ]);
    }

    protected function addPoint($data, $user)
    {
        $point = setting('admin.point_register');
        $dataUserInvite = User::query()->where("email", $data['email_user'])->get();
        if (!$dataUserInvite) return;
        $user->point = $point;
        $dataUserInvite[0]->point = $dataUserInvite[0]->point + $point;
        $user->save();
        $dataUserInvite[0]->save();
    }

    public function insert(RegisterRequest $request)
    {
//        $data = $request->validated();
        $data = $request->all();
        if (($data)) {
            $user = $this->create($data);
            $this->addPoint($data, $user);
            session()->flash('success', __('login-logout.register-success'));
            return redirect('/login')->with('message', __('login-logout.register-success'));
        } else {
            return redirect()->back()->withInput();
        }
    }
}
