@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_title', 'Xác thực tài khoản'))

@section('page_header')
    <style>
        .breadcrumb{
            display: none;
        }
    </style>
    <h1 class="page-title">
        Xác thực tài khoản
    </h1>
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <form role="form"
                          class="form-edit-add"
                          action="{{route('collaborators.storeVerify', ['id' => $collaboratorsUser->id])}}"
                          method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="exampleFormControlInput1">Cộng tác viên</label>
                                <input type="email" class="form-control" disabled value="{{ $user->name }}">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlInput1">Tài khoản khóa học</label>
                                <input type="email" class="form-control" disabled
                                       value="{{ $collaboratorsUser->user_course }}">
                            </div>
                            <input type="text" hidden value="{{$collaboratorsUser->id}}" name="collaborators">
                        </div>
                        <div class="panel-footer">
                            @section('submit-buttons')
                                <button type="submit"
                                        class="btn btn-primary save">Xác thực tài khoản cho cộng tác viên</button>
                            @stop
                            @yield('submit-buttons')
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@stop

@section('javascript')
    <script>
    </script>
@stop
