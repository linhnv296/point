@extends('master')
<link href="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js" rel="stylesheet">
<link href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js" rel="stylesheet">
@section('content')
    <section class="">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mx-auto">
                    <form action="{{ route('auth.transfer') }}"
                          method="POST" enctype="multipart/form-data">
                        @csrf
                        <h2>Nhập số điện thoại bạn muốn tặng point</h2>
                        <h4 class="text-center bg-warning">{{ $success }}</h4>
                        <div class="form-group">
                            <label for="phone">Bạn cần nhập chính xác số điện thoại nhận</label>
                            <input type="text" class="form-control" id="phone" placeholder="+840909090909"
                                   name="phone" value="{{$phone}}">
                            @if($errPhone)
                                <small class="form-text text-danger">{{ $errPhone }}</small>
                            @endif
                        </div>
                        <div class="form-group">
                            <label for="point">Bạn cần nhập số điểm < {{auth()->user()->point}}</label>
                            <input type="number" class="form-control" id="point" placeholder="100" name="point" value="{{$point}}">
                            @if($errPoint)
                                <small class="form-text text-danger">{{ $errPoint }}</small>
                            @endif
                        </div>
                        <div class="panel-footer text-center">
                            @section('submit-buttons')
                                <button type="submit"
                                        class="btn btn-primary save">Tặng point
                                </button>
                            @stop
                            @yield('submit-buttons')
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

@endsection
@section('javascript')

@stop
