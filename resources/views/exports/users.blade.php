<table>
    <thead>
    <tr>
        <th>Cộng tác viên</th>
        <th>Tài khoản khóa học</th>
        <th>Loại tài khoản</th>
        <th>Nâng cấp Cộng tác viên</th>
    </tr>
    </thead>
    <tbody>
    @foreach($users as $user)
        <tr>
            <td>
                {{ $user->userName }}
            </td>
            <td>
                {{ $user->user_course }}
            </td>
            <td>
                @if($user->level == 0)
                    Chưa xác thực
                @elseif ($user->level == 1)
                    Đã xác thực
                @elseif ($user->level == 2)
                    Du học sinh
                @elseif ($user->level == 3)
                    Xuất khẩu lao động
                @endif
            </td>
            <td>
                {{ $user->is_collaborator == 1 ? "Cộng tác viên": ""}}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>
