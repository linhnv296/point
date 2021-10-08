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
                <form method="POST" enctype="multipart/form-data" action="{{route('auth.login')}}">
                    @csrf
                    <div class="form-group">
                        <label for="exampleInputEmail1">Tài khoản</label>
                        <input type="text" class="form-control" id="exampleInputEmail1"
                               placeholder="Enter user name" name="name"
                               value="{{ old('name')}}">
                        @error('name')
                        <small class="form-text text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Mật khẩu</label>
                        <input type="password" value="{{ old('password')}}"
                               class="form-control" id="exampleInputPassword1"
                               placeholder="Password" name="password"
                        >
                        @error('password')
                        <small class="form-text text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="remember">
                        <label class="form-check-label" for="exampleCheck1">Ghi nhớ đăng nhập</label>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <button type="submit" class="btn btn-primary">Đăng nhập</button>
                        </div>
                        <div class="col-6 text-right">
                            <a href="{{route("auth.register")}}" class="">Đăng ký</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
