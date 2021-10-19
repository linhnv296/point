@extends('voyager::master')

@section('page_title', 'Nâng cấp tài khoản')
@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">Nâng cấp tài khoản</h1>
    </div>
@stop
@section('content')
    <div class="page-content browse container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table id="dataTable" class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Tài khoản</th>
                                    <th>Họ và tên</th>
                                    <th>Số điện thoại</th>
                                    <th>Email</th>
                                    <th>Mã giới thiệu</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($users as $user)
                                <tr>
                                    <td>{{ $user->name }}</td>
                                    <td>{{ $user->fullname }}</td>
                                    <td>{{ $user->phone }}</td>
                                    <td>{{ $user->email }}</td>
                                    <td>{{ $user->invite }}</td>
                                    <td>
                                        <a href="{{ route('auth.upgrade.detail', ['id' => $user->id]) }}" class="btn btn-primary">Nâng cấp</a>
                                    </td>
                                </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop
