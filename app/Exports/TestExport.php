<?php

namespace App\Exports;

use App\Models\User;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromView;


class TestExport implements FromView
{
    public function view(): View
    {
        return view('exports.users', [
            'users' => $users = DB::table('users as u')
                ->join('collaborators_users as c', 'u.id', '=', 'c.user_id')
                ->select('u.name as userName', 'u.point', 'c.user_course', "c.level", 'c.is_collaborator')
                ->get()
        ]);
    }
}
