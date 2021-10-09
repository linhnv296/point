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
            position: relative;
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

        .list-coupons .item .wrap form {
            position: absolute;
            bottom: 5px;
            right: 5px;
            margin-bottom: 0px;
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
                                {{ $value->point }} điểm
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0, 0, 0); /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
        }

        .show {
            display: block;
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
    </style>
    <div id="myModal" class="modal {{ $errors->any() ? "show":"" }}">
        <!-- Modal content -->
        <div class="modal-content">
            <span class="close" id="close"">&times;</span>
            @if ($errors->any())
                @foreach ($errors->all() as $error)
                    <div>{{$error}}</div>
                @endforeach
            @endif
        </div>

    </div>


@endsection
@section('javascript')
    <script>
        $(document).ready(function () {
            window.onclick = function (event) {
                var modal = document.getElementById("myModal");
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
            document.getElementById("myModal").onclick = closeModal

            function closeModal() {
                var modal = document.getElementById("myModal");
                modal.style.display = "none";
            }


            // Get the button that opens the modal
            $('#example').DataTable({
                searching: false,
                info: false,
                lengthChange: false
            })
        });
    </script>
@stop
