<?php

namespace App\Http\Controllers;

use App\Models\CollaboratorsUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;

class ListUserController extends VoyagerBaseController
{
    public function showPage()
    {
        $user = Auth::user();
        $point = $user->point;
        $arrayLevel = [
            0 => "Chưa xác thực",
            1 => 'Đã xác thực',
            2 => 'Tài khoản du học',
            3 => 'Tài khoản XKLD',
            4 => 'Cộng tác viên'];
        $listCollaborators = CollaboratorsUser::query()->where('user_id', $user->id)->get();
        return view('list-user', compact('point', 'listCollaborators', 'arrayLevel'));
    }

}
