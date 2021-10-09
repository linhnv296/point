<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use App\Models\UserCoupon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;

class HomeController extends VoyagerBaseController
{
    public function index(Request $request)
    {
        $listCoupon = Coupon::query()
            ->whereDate('day_start', '<=', date("Y-m-d"))
            ->whereDate('day_finish', '>=', date("Y-m-d"))->get();
        return view('welcome', compact( 'listCoupon'));
    }
}
