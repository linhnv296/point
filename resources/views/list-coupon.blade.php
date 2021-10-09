@extends('master')
<link href="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js" rel="stylesheet">
<link href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js" rel="stylesheet">
@section('content')
    <section class="">
        <div class="container">
            <div class="row">
                <div class="col-md-9 mx-auto">
                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                        <tr>
                            <th>Tên</th>
                            <th>Mô tả</th>
                            <th>Point</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($listCoupon as $value)
                        <tr>
                            <td>{{$value->name}}</td>
                            <td>{{$value->description}}</td>
                            <td>{{$value->point}}</td>
                            <td>
                                <form class="form-inline" method="POST" enctype="multipart/form-data" action="{{ route('coupon.choose') }}">
                                    @csrf
                                        <input class="form-control" value="{{$value->id}}" id="coupon" name="coupon" hidden>
                                    <button type="submit" class="btn btn-primary mb-2">Đổi</button>
                                </form>
                            </td>
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
