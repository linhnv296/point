@extends('master')
<link href="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js" rel="stylesheet">
<link href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js" rel="stylesheet">
@section('content')
    <style>
        .list-coupons .item .image img {
            max-width: 100%;
        }
        .list-coupons .item .image {
            height: 150px;
            overflow: hidden;
        }

        .list-coupons .item .wrap {
            background: #FAEBD7;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .list-coupons .item {
            padding: 10px;
            cursor: pointer;
        }
        .list-coupons .item {
            padding: 10px;
        }
        .list-coupons .item .point {
            color: red;
        }
        .list-coupons .item:hover .wrap {
            background: #FFD700;
        }

    </style>
    <section class="">
        <div class="container">
            <div class="row list-coupons">
                @foreach($listCoupon as $value)
                    <div class="col-md-3 item">
                        <div class="wrap">
                            <div class="image">
                                <img src="{{Voyager::image( $value->image )}}" alt="{{ $value->name }}">
                            </div>
                            <div class="name">
                                {{ $value->name }}
                            </div>
                            <div class="point">
                                {{ $value->point }} point
                            </div>
                        </div>
                    </div>
                @endforeach
                {{--                    <table id="example" class="table table-striped table-bordered" style="width:100%">--}}
                {{--                        <thead>--}}
                {{--                        <tr>--}}
                {{--                            <th>Tên</th>--}}
                {{--                            <th>Mô tả</th>--}}
                {{--                            <th>Point</th>--}}
                {{--                            <th>Action</th>--}}
                {{--                        </tr>--}}
                {{--                        </thead>--}}
                {{--                        <tbody>--}}
                {{--                        @foreach($listCoupon as $value)--}}
                {{--                        <tr>--}}
                {{--                            <td>{{$value->name}}</td>--}}
                {{--                            <td>{{$value->description}}</td>--}}
                {{--                            <td>{{$value->point}}</td>--}}
                {{--                            <td>--}}
                {{--                                <form class="form-inline" method="POST" enctype="multipart/form-data" action="{{ route('coupon.choose') }}">--}}
                {{--                                    @csrf--}}
                {{--                                        <input class="form-control" value="{{$value->id}}" id="coupon" name="coupon" hidden>--}}
                {{--                                    <button type="submit" class="btn btn-primary mb-2">Đổi</button>--}}
                {{--                                </form>--}}
                {{--                            </td>--}}
                {{--                        </tr>--}}
                {{--                        @endforeach--}}
                {{--                        </tbody>--}}
                {{--                    </table>--}}
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
