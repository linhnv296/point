@extends('master')
<link href="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js" rel="stylesheet">
<link href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js" rel="stylesheet">
@section('content')
    <section class="">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mx-auto">
                    <h3 class="text-left">Thêm tài khoản</h3>
                    <form method="post" action="{{ route('collaborators.store') }}" autocomplete="off">
                        @csrf
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
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="facebook">Link Facebook <span class="requied padding-5">*</span></label>
                                <input type="text" class="form-control" name="facebook" id="facebook" value="{{ old('facebook')}}" placeholder="fb.com/tai-khoan-cua-ban">
                                @error('facebook')
                                <small class="form-text text-danger">{{ $message }}</small>
                                @enderror
                            </div>
                            <div class="form-row col-md-6">
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
                                <input type="number" class="form-control" id="phone" name="phone" value="{{ old('phone')}}" placeholder="+840960000000">
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
                        <button type="submit" class="btn btn-primary">Thêm tài khoản</button>
                    </form>

                </div>
            </div>
            <div>
                <p>Số điểm: {{$point}}</p>
                <p>Số tài khoản đã thêm: {{count($listCollaborators)}}</p>
            </div>
            <div class="row">
                <div class="col-md-12 mx-auto">
                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                        <tr>
                            <th>User khóa học</th>
                            <th>Loại tài khoản</th>
                            <th>Cộng tác viên</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($listCollaborators as $value)
                        <tr>
                            <td>{{$value->user_course}}</td>
                            <td>{{$arrayLevel[$value->level]}}</td>
                            <td>{{$value->is_collaborator == 1 ? "Cộng tác viên" : "Chưa đăng ký"}}</td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>


@endsection
@section('javascript')
    <script>
        $(document).ready(function () {
            $('#example').DataTable({
                searching: false,
                info: false,
                lengthChange: false
            })
        });
    </script>
@stop
