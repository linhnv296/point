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
        $arrayLevel = [1 => 'a', 2 => 'b', 3 => 'c', 4 => 'd'];
        $listCollaborators = CollaboratorsUser::query()->where('user_id', $user->id)->get();
        return view('list-user', compact('point', 'listCollaborators', 'arrayLevel'));
    }

}
