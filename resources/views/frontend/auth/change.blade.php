@extends('unheader')
@section('content')
    <style>
        .container-fluid .row .login_content {
            height: calc(100vh - 180px);
            position: relative;
            background: aliceblue;
        }

        .container-fluid .row .login_content form {
            position: relative;
            top: 50%;
            transform: translate(0, -50%);
        }
    </style>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-10 col-md-8 col-lg-4 login_content">
                <form method="POST" enctype="multipart/form-data" action="{{route('auth.change')}}">
                    @csrf
                    <h2 class="text-center">Đổi mật khẩu</h2>
                    @if($errors->any())
                        <p class="text-left bg-warning">{{$errors->first()}}</p>
                    @endif
                    <div class="form-group">
                        <label for="current_password">Mật khẩu cũ</label>
                        <input type="password" class="form-control" id="current_password"
                               placeholder="Mật khẩu cũ" name="current_password"
                               value="{{ old('current_password')}}">
                        @error('current_password')
                        <small class="form-text text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu mới</label>
                        <input type="password" class="form-control" id="password"
                               placeholder="Mật khẩu mới" name="password"
                               value="{{ old('password')}}">
                        @error('password')
                        <small class="form-text text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="password_confirm">Nhập lại mật khẩu mới</label>
                        <input type="password" class="form-control" id="password_confirm"
                               placeholder="Nhập lại mật khẩu mới" name="password_confirm"
                               value="{{ old('password_confirm')}}">
                        @error('password_confirm')
                        <small class="form-text text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
                        </div>
                        <div class="col-6 text-right">
                            <a href="/" class="">Trang chủ</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
