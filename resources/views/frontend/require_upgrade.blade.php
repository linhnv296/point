@extends('master')
<link href="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js" rel="stylesheet">
<link href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js" rel="stylesheet">
@section('content')
    <section class="">
        <div class="container">
            <h2 class="text-center">Trở thành Đại sứ kết nối - THANH GIANG </h2>
            <p class="text-center">Để trở thành đại sứ kết nối bạn cần yêu cầu đăng ký thành làm đại sứ kết nối</p>
            <form class="form-inline" method="POST" enctype="multipart/form-data" action="{{ route('upgrade.required') }}">
                @csrf
                <div class="form-group mx-sm-3 mb-2">
                    <input type="hidden" class="form-control" name="user_id" value="{{ $user->id }}">
                </div>
                <button type="submit" class="btn btn-primary mb-2 m-auto">Tại đây</button>
            </form>
        </div>
    </section>
@endsection
