@extends('voyager::master')

@section('page_title', 'Nâng cấp tài khoản')
@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">Nâng cấp tài khoản</h1>
    </div>
@stop
<style>
    .detail-upgrade span {
        width: 150px;
        display: inline-block;
    }
</style>
@section('content')
    <div class="page-content browse container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <div class="row detail-upgrade">
                            <div class="col-md-12"><span>Tài khoản: </span> {{ $user->name }}</div>
                            <div class="col-md-12"><span>Họ tên: </span> {{ $user->fullname }}</div>
                            <div class="col-md-12"><span>Số điện thoại: </span> {{ $user->phone }}</div>
                            <div class="col-md-12"><span>Email: </span> {{ $user->email }}</div>
                            <div class="col-md-12"><span>Địa chỉ: </span> {{ $user->province }}</div>
                            <div class="col-md-12"><span>Ngày sinh: </span> {{ $user->date_of_birth }}</div>
                            <div class="col-md-12"><span>CMND/CCCD: </span> {{ $user->cmnd }}</div>
                            <div class="col-md-12"><span>Giới tính: </span> {{ $user->sex ==1 ? "Nam":"Nữ" }}</div>
                        </div>
                        <form role="form"
                              class="form-edit-add"
                              action=""
                              method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="panel-body">
                                <input type="text" hidden value="{{$user->id}}" name="userId">
                            </div>
                            <div class="panel-footer text-center">
                                @section('submit-buttons')
                                    <button type="submit"
                                            class="btn btn-primary save">Nâng cấp tài khoản cho cộng tác viên</button>
                                @stop
                                @yield('submit-buttons')
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop
