@extends('unheader')
@section('content')
    <style>
        .container-fluid .row .login_content {
            min-height: calc(100vh - 180px);
            position: relative;
            background: aliceblue;
            padding-top: 50px;
        }

        .requied {
            color: red;
        }

        .container-fluid .row .login_content form {
            position: relative;
            top: 50%;
            transform: translate(0, -50%);
        }
    </style>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-10 login_content">
                <H2 class="text-center">Đăng ký tài khoản cộng tác viên mới</H2>
                <H2 class="text-center">Mời bạn nhập đầy đủ chính xác thông tin để nhận điểm point</H2>
                <form method="post" action="{{ route('auth.create') }}" autocomplete="off">
                    @csrf
                    <div class="form-row">

                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Tài khoản<span
                                    class="requied padding-5">*</span></label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Tài khoản" value="{{ old('name')}}">
                            @error('name')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group col-md-6">
                            <label for="email">Email <span class="requied padding-5">* điền chính xác thông tin để kích hoạt tài khoản</span></label>
                            <input type="email" class="form-control" name="email" id="email" value="{{ old('email')}}" placeholder="abc@gmail.com">
                            @error('email')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group col-md-6">
                            <label for="password">Mật Khẩu<span class="requied padding-5">*</span></label>
                            <input type="password" class="form-control" id="password" name="password" value="{{ old('password')}}" placeholder="......">
                            @error('password')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group col-md-6">
                            <label for="password_confirm">Nhập Lại Mật Khẩu <span class="requied padding-5">*</span></label>
                            <input type="password" class="form-control" id="password_confirm" name="password_confirm" value="{{ old('password_confirm')}}" placeholder="......">
                            @error('password_confirm')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="facebook">Link Facebook <span class="requied padding-5">*</span></label>
                            <input type="text" class="form-control" name="facebook" id="facebook" value="{{ old('facebook')}}" placeholder="fb.com/tai-khoan-cua-ban">
                            @error('facebook')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group col-md-6">
                            <label for="email_user">Mã giới thiệu <span class="text-danger">(Số điện thoại người giới thiệu)</span></label>
                            <input type="text" class="form-control" id="email_user" name="email_user" value="{{ old('email_user')}}" placeholder="+840960000000">
                            @error('email_user')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Họ Tên <span
                                    class="requied padding-5">*</span></label>
                            <input type="text" class="form-control" id="name" name="fullname" placeholder="Nguyen Van A" value="{{ old('fullname')}}">
                            @error('fullname')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group col-md-6">
                            <label for="sex">Giới Tính <span class="requied padding-5">*</span></label>
                            <select id="sex" name="sex" class="form-control">
                                <option selected value="1">Nam</option>
                                <option value="2">Nữ</option>
                            </select>
                            @error('sex')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3 date">
                            <label for="date_of_birth">Ngày Sinh <span class="requied padding-5">*</span></label>
                            <input class="form-control" id="date_of_birth" name="date_of_birth" value="{{ old('date_of_birth')}}" placeholder="01/01/2001">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                           </span>
                            @error('date_of_birth')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group col-md-3 date">
                            <label for="cmnd">CMND/CCCD <span class="requied padding-5">*</span></label>
                            <input class="form-control" id="cmnd" name="cmnd" value="{{ old('cmnd')}}" placeholder="001091000000">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                           </span>
                            @error('cmnd')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group col-md-6">
                            <label for="phone">Số Điện Thoại <span class="requied padding-5">*</span></label>
                            <input type="text" class="form-control" id="phone" name="phone" value="{{ old('phone')}}" placeholder="+840960000000">
                            @error('phone')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="job">Nghề Nghiệp</label>
                            <input type="text" class="form-control" id="job" name="job" value="{{ old('job')}}" placeholder="Sinh viên">
                            @error('job')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group col-md-6">
                            <label for="course">khóa học <span class="requied padding-5">*</span></label>
                            <select id="course" name="course" class="form-control">
                                @foreach(config('app.register_course') as $value)
                                    <option selected value="{{$value}}">{{$value}}</option>
                                @endforeach
                            </select>
                            @error('course')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="province">Địa Chỉ <span class="requied padding-5">*</span></label>
                            <input type="text" class="form-control" id="province" name="province" value="{{ old('province')}}" placeholder="Mỹ Đình, Hà Nội">
                            @error('province')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group col-md-3 col-sm-6">
                            <label for="education">Trình Độ Học Vấn <span class="requied padding-5">*</span></label>
                            <select id="education" name="education" class="form-control">
                                <option>THCS</option>
                                <option>THPT</option>
                                <option>Cao Đẳng</option>
                                <option>Đại Học</option>
                            </select>
                            @error('education')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group col-md-3 col-sm-6">
                            <label for="education">Mục đích học tập <span class="requied padding-5">*</span></label>
                            <select id="edu_target" name="edu_target" class="form-control">
                                <option>Làm việc trong nước</option>
                                <option>Du học</option>
                                <option>Lao động nước ngoài</option>
                            </select>
                            @error('edu_target')
                            <small class="form-text text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Đăng ký</button>
                    <a href="{{ route('auth.login') }}">Đăng nhập</a>
                </form>
            </div>
        </div>
    </div>
@endsection
@section('javascript')
    <script>
        $(document).ready(function () {
            $('#date_of_birth').datepicker({
                uiLibrary: 'bootstrap4'
            })
        });
    </script>
@stop
