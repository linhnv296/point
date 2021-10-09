<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use App\Models\UserCoupon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;

class CouponController extends VoyagerBaseController
{
    //

    public function showPage()
    {
        $listCoupon = Coupon::query()
            ->whereDate('day_start', '<=', date("Y-m-d"))
            ->whereDate('day_finish', '>=', date("Y-m-d"))->get();
        $arrayUserCoupons = [];
        if (Auth::user()) {
            $arrayUserCoupons = UserCoupon::query()->where('user_id', Auth::user()->id)->pluck('coupon_id')->toArray();
        }
        return view('list-coupon', compact('listCoupon', 'arrayUserCoupons'));
    }

    public function myCoupon()
    {
        if (Auth::user()){
            $arrayUserCoupons = UserCoupon::query()->where('user_id', Auth::user()->id)->pluck('coupon_id')->toArray();
            $listCoupon = Coupon::query()->whereIn('id', $arrayUserCoupons)->get();
            return view('my-coupon', compact('listCoupon'));
        }
        else {
            return redirect()->back();
        }
    }

    public function chooseCoupon(Request $request)
    {
        $data = $request->all();
        $hasError = false;
        $message = 'Đổi thành công';
        $user = Auth::user();
        $coupon = Coupon::find($data['coupon']);
        if (!$coupon) {
            $hasError = true;
            $message = 'coupon không tồn tại';
        }
        if ($user->point < $coupon->point) {
            $hasError = true;
            $message = 'Bạn không đủ point';
        }
        if ($hasError) {
            return redirect()->back()->withErrors(['message' => $message . " để đổi : " . $coupon->name]);
        }
        $userCoupon = UserCoupon::create([
            'user_id' => $user->id,
            'coupon_id' => $coupon->id,
        ]);
        if ($userCoupon) {
            $user->point -= $coupon->point;
            $user->save();
        }
        return redirect()->back()->withErrors(['message' => $message]);
    }
}
