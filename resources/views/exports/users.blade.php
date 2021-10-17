<table>
    <thead>
    <tr>
        <th>Cộng tác viên</th>
        <th>Họ và tên</th>
        <th>Tài khoản khóa học</th>
        <th>Email</th>
        <th>Facebook</th>
        <th>Nghề nghiệp</th>
        <th>Giới tính</th>
        <th>Ngày sinh</th>
        <th>Số điện thoại</th>
        <th>Khóa học</th>
        <th>Địa chỉ</th>
        <th>Trình độ</th>
        <th>Mục tiêu nghề nghiệp</th>
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
            <td>{{ $user->fullname}}</td>
            <td>{{ $user->user_course }}</td>
            <td>{{ $user->email}}</td>
            <td>{{ $user->facebook}}</td>
            <td>{{ $user->job}}</td>
            <td>{{ $user->sex == 1 ? "Nam": "Nữ"}}</td>
            <td>{{ $user->date_of_birth}}</td>
            <td>{{ $user->phone}}</td>
            <td>{{ $user->course}}</td>
            <td>{{ $user->province}}</td>
            <td>{{ $user->education}}</td>
            <td>{{ $user->target}}</td>
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
