@extends('master')
<link href="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js" rel="stylesheet">
<link href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js" rel="stylesheet">
@section('content')
    <section class="bg-gradient pt-5 pb-6">
        <div class="container">
            <div class="row mt-6">
                <div class="col-md-8 mx-auto text-center">
                    <form class="form-inline" method="POST" enctype="multipart/form-data" action="{{ route('collaborators.store') }}">
                        @csrf
                        <div class="form-group mb-2">
                            <label for="staticEmail2" class="sr-only">user</label>
                        </div>
                        <div class="form-group mx-sm-3 mb-2">
                            <label for="user_course" class="sr-only">Password</label>
                            <input type="text" class="form-control" id="user_course" name="user_course">
                        </div>
                        <button type="submit" class="btn btn-primary mb-2">Confirm identity</button>
                    </form>
                </div>
            </div>
            <div>
                <p>Point: {{$point}}</p>
            </div>
            <div class="row mt-8">
                <div class="col-md-9 mx-auto">
                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                        <tr>
                            <th>User khóa học</th>
                            <th>Level</th>
                            <th>Is collaborator</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($listCollaborators as $value)
                        <tr>
                            <td>{{$value->user_course}}</td>
                            <td>{{$arrayLevel[$value->level]}}</td>
                            <td>{{$value->is_collaborator}}</td>
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
