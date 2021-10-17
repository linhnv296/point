@extends('master')
<link href="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js" rel="stylesheet">
<link href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js" rel="stylesheet">
@section('content')
    <section class="">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mx-auto text-center">
                    <h3 class="text-left">Thêm tài khoản</h3>
                    <form class="form-inline" method="POST" enctype="multipart/form-data" action="{{ route('collaborators.store') }}">
                        @csrf
                        <div class="form-group mx-sm-3 mb-2">
                            <input type="text" class="form-control" id="user_course" name="user_course" value="{{ old("user_course") }}">
                        </div>
                        <button type="submit" class="btn btn-primary mb-2">Thêm tài khoản</button>
                    </form>
                    @if($errors->any())
                        <p class="text-left bg-warning">{{$errors->first()}}</p>
                    @endif
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
