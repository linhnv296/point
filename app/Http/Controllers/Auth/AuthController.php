<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Models\Point;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    use AuthenticatesUsers;
    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */

    public function __construct()
    {
//        $this->middleware('guest');
    }

    public function showLoginForm()
    {
        return view('frontend/auth/login');
    }

    public function login(LoginRequest $request)
    {
        $credentials = $request->validated();

        $remember = $request->remember == $request->has('remember');

        if (Auth::attempt($credentials, $remember)) {
            if (Auth::user()->role_id == 2) {
                return redirect("/")->with('success', 'Logged in successfully');
            } else {
                return redirect()->route('voyager.dashboard');
            }

        } else {
            session()->flash('message_error', 'Invalid credentials');
            return redirect()->back()->withInput();
        }
    }

    public function showRegisterForm()
    {
        $course = Point::all();
        return view('frontend/auth/register', compact('course'));
    }
    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }
}
