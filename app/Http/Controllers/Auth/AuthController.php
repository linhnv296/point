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
        if (Hash::check($request->input('current_password'), auth()->user()->password)) {
            User::find(auth()->user()->id)->update(['password' => Hash::make($request->input('password'))]);
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

    public function showUpgrade(Request $request)
    {
        $user = Auth::user();
        if ($user->active_ctv >= 1) {
            return redirect('/');
        }
        return view('frontend/require_upgrade', compact('user'));
    }

    public function upgradeRequired(Request $request)
    {
        if ($request->input('user_id') != Auth::user()->id) {
            return redirect()->back();
        }
        $user = Auth::user();
        $user->active_ctv = 1;
        $user->save();
        return redirect('/');
    }

    public function upgradeAccount(Request $request)
    {
        $users = User::query()->where('active_ctv', "=", 1)->get();
        return view('vendor/voyager/admin/upgrade/list', compact('users'));
    }

    public function upgradeUser(Request $request)
    {
        $user = User::find($request->get('userId'));
        $user->active_ctv = 2;
        $user->save();
        $this->addPoint($user);
        $users = User::query()->where('active_ctv', "=", 1)->get();
        return view('vendor/voyager/admin/upgrade/list', compact('users'));
    }

    public function upgradeAccountDetail(Request $request)
    {
        $id = request('id');
        $user = User::query()->where('id', $id)->first();

        return view('vendor/voyager/admin/upgrade/detail', compact('user'));
    }

    protected function addPoint($user)
    {
        $point = setting('admin.point_register');
        $dataUserInvite = User::query()->where("phone", $user['invite'])->first();
        if (!$dataUserInvite) return;
        $user->point = $point;
        $dataUserInvite->point = $dataUserInvite->point + $point;
        $user->save();
        $dataUserInvite->save();
    }

    public function showTransferPoint(Request $request)
    {
        $errPhone = "";
        $errPoint = "";
        $phone = "";
        $point = "";
        $success = "";
        return view('frontend/transfer', compact("errPhone", "errPoint", "phone", "point", "success"));
    }

    public function transferPoint(Request $request)
    {
        $phone = $request->input('phone');
        $point = (int)$request->input('point');
        $pointTo = User::query()->where('phone', $phone)->first();
        $errPhone = "";
        $errPoint = "";
        $success = "Tặng không thành công";
        if (!$pointTo || $pointTo->phone == Auth::user()->phone) {
            $errPhone = "Số điện thoại không phù hợp";
            return view('frontend/transfer', compact("errPhone", "errPoint","phone", "point", "success"));
        }
        $flag = false;
        if (!is_int($point)) {
            $flag = true;
        }
        if ($point > Auth::user()->point) {
            $flag = true;
        }

        if ($flag) {
            $errPoint = "Số point không hợp lệ";
            return view('frontend/transfer', compact("errPhone", "errPoint", "phone", "point", "success"));
        }
        $errPoint = "";
        $pointFrom = Auth::user();
        $pointTo->point = $pointTo->point + $point;
        $pointFrom->point = $pointFrom->point - $point;

        $pointFrom->save();
        $pointTo->save();
        $success = "Tặng point thành công";
        return view('frontend/transfer', compact("errPhone", "errPoint", "phone", "point", "success"));
    }
}
