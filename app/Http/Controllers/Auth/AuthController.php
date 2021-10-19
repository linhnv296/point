<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\ChangePassRequest;
use App\Http\Requests\LoginRequest;
use App\Models\Point;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

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
    public function showChangeForm()
    {
        return view('frontend/auth/change');
    }
    public function changePass(ChangePassRequest $request)
    {
        $msg = "Đổi mật khẩu không thành công do tài mật khẩu cũ không chính xác";
        if(Hash::check($request->input('current_password'), auth()->user()->password)){
            User::find(auth()->user()->id)->update(['password'=> Hash::make($request->input('password'))]);
            $meg = "Đổi mật khẩu thành công";
            return redirect()->route('home.page');
        }
        return redirect()->back()->withErrors(['message' => $msg]);
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

    public function showUpgrade (Request $request){
        $user = Auth::user();
        if ($user->active_ctv >= 1) {
            return redirect('/');
        }
        return view('frontend/require_upgrade', compact('user'));
    }
    public function upgradeRequired (Request $request){
        if ($request->input('user_id') != Auth::user()->id){
            return redirect()->back();
        }
        $user = Auth::user();
        $user->active_ctv = 1;
        $user->save();
        return redirect('/');
    }
    public function upgradeAccount (Request $request){
        $users = User::query()->where('active_ctv', "=", 1)->get();
        return view('vendor/voyager/admin/upgrade/list', compact('users'));
    }
    public function upgradeAccountDetail (Request $request){
        $id = request('id');
        $user = User::query()->where('id', $id)->first();

        return view('vendor/voyager/admin/upgrade/detail',compact('user'));
    }
}
