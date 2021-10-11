@extends('master')
@section('content')
    <section class="bg pt-2 pb-4">
        <div class="container">
            <div class="row">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <style>
                        .carousel-inner {
                            max-height: 350px;
                        }

                        .bg-yellow {
                            background-color: #fcef2d;
                        }

                        .course .course-wrap > div {

                        }

                        .course .course-wrap .title h3 {
                            text-align: center;
                            font-size: 18px;
                            line-height: 40px;
                            background: linear-gradient(180deg, #1e3c72, #2a5298);
                            color: #ffffff;
                        }

                        .course .course-wrap .image {
                            border: 3px solid rgb(170, 235, 255);
                            padding: 3px;
                        }

                        .course-invite .course-wrap .image-small {
                            height: 140px;
                            overflow: hidden;
                            border-radius: 20px;
                        }
                        .course-invite .course-wrap .image-small img {
                            height: 100%;
                        }
                        .course-invite .course-wrap .image {
                            border-radius: 20px;
                            overflow: hidden;
                        }
                    </style>
                    <ol class="carousel-indicators">
                        @foreach($listCoupon as $i => $item)
                            <li data-target="#carouselExampleIndicators" data-slide-to="{{ $i }}"
                                class="{{ $i == 0 ? "active": "" }}"></li>
                        @endforeach
                    </ol>
                    <div class="carousel-inner">

                        @foreach($listCoupon as $i => $item)
                            <div class="carousel-item {{ $i == 0 ? "active": "" }}">
                                <a href="">
                                    <img class="d-block w-100" src="{{Voyager::image( $item->image )}}"
                                         alt="{{$item->name}}">
                                </a>
                            </div>
                        @endforeach
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </section>
    @if(!auth()->user())
        <section class="bg-gradient pt-3 pb-3">
            <div class="container">
                <div class="row mt-3">
                    <div class="col-md-8 mx-auto text-center">
                        <h1>What is Lorem Ipsum?</h1>
                        <p class="lead mb-5">Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                            Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                            unknown printer took a galley of type and scrambled it to make a type specimen book..</p>
                        <a href="{{route("auth.register")}}" class="btn btn-success svg-icon">
                            <em class="mr-2" data-feather="github"></em>
                            Register
                        </a>
                    </div>
                </div>
            </div>
        </section>
    @endif
    <!--Features Section-->
    {{--    <section class="py-6">--}}
    {{--        <div class="container">--}}
    {{--            <div class="row">--}}
    {{--                <div class="col-md-8 mx-auto">--}}
    {{--                    <h2 class="text-center text-md-left">Lorem Ipsum is simply dummy <span class="text-success">Point.CRM</span>--}}
    {{--                    </h2>--}}
    {{--                    <div class="row feature-grid">--}}
    {{--                        <div class="col-sm-6">--}}
    {{--                            <div class="media">--}}
    {{--                                <div class="icon-box">--}}
    {{--                                    <div class="icon-box-inner">--}}
    {{--                                        <span data-feather="check-circle" width="28" height="28"></span>--}}
    {{--                                    </div>--}}
    {{--                                </div>--}}
    {{--                                <div class="media-body">--}}
    {{--                                    Dead Simple--}}
    {{--                                </div>--}}
    {{--                            </div>--}}
    {{--                        </div>--}}
    {{--                        <div class="col-sm-6">--}}
    {{--                            <div class="media">--}}
    {{--                                <div class="icon-box">--}}
    {{--                                    <div class="icon-box-inner">--}}
    {{--                                        <span data-feather="command" width="28" height="28"></span>--}}
    {{--                                    </div>--}}
    {{--                                </div>--}}
    {{--                                <div class="media-body">--}}
    {{--                                    Highly Intuitive--}}
    {{--                                </div>--}}
    {{--                            </div>--}}
    {{--                        </div>--}}
    {{--                        <div class="col-sm-6">--}}
    {{--                            <div class="media">--}}
    {{--                                <div class="icon-box">--}}
    {{--                                    <div class="icon-box-inner">--}}
    {{--                                        <span data-feather="feather" width="28" height="28"></span>--}}
    {{--                                    </div>--}}
    {{--                                </div>--}}
    {{--                                <div class="media-body">--}}
    {{--                                    Light as a Feather--}}
    {{--                                </div>--}}
    {{--                            </div>--}}
    {{--                        </div>--}}
    {{--                        <div class="col-sm-6">--}}
    {{--                            <div class="media">--}}
    {{--                                <div class="icon-box">--}}
    {{--                                    <div class="icon-box-inner">--}}
    {{--                                        <span data-feather="zap" width="28" height="28"></span>--}}
    {{--                                    </div>--}}
    {{--                                </div>--}}
    {{--                                <div class="media-body">--}}
    {{--                                    Blazing Fast--}}
    {{--                                </div>--}}
    {{--                            </div>--}}
    {{--                        </div>--}}
    {{--                        <div class="col-sm-6">--}}
    {{--                            <div class="media">--}}
    {{--                                <div class="icon-box">--}}
    {{--                                    <div class="icon-box-inner">--}}
    {{--                                        <span data-feather="git-pull-request" width="28" height="28"></span>--}}
    {{--                                    </div>--}}
    {{--                                </div>--}}
    {{--                                <div class="media-body">--}}
    {{--                                    Extensible--}}
    {{--                                </div>--}}
    {{--                            </div>--}}
    {{--                        </div>--}}
    {{--                        <div class="col-sm-6">--}}
    {{--                            <div class="media">--}}
    {{--                                <div class="icon-box">--}}
    {{--                                    <div class="icon-box-inner">--}}
    {{--                                        <span data-feather="droplet" width="28" height="28"></span>--}}
    {{--                                    </div>--}}
    {{--                                </div>--}}
    {{--                                <div class="media-body">--}}
    {{--                                    Easy Styling--}}
    {{--                                </div>--}}
    {{--                            </div>--}}
    {{--                        </div>--}}
    {{--                    </div>--}}
    {{--                </div>--}}
    {{--            </div>--}}
    {{--        </div>--}}
    {{--    </section>--}}

    <!--Used By Section-->
    @if($pageIntro)
        <div class="col-md-12 course pt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        @if($pageIntro["khoa-hoc"])
                            {!! ($pageIntro["khoa-hoc"]) !!}
                        @endif
                    </div>
                    <div class="col-md-4 course-wrap">
                        <div class="col-md-12 pt-2">
                            <div class="image">
                                <img class="w-100" src="{{url('/images/hoc-spa-online.jpg')}}" alt="">
                            </div>
                            <div class="title">
                                <h3>KHÓA HỌC TIẾNG NHẬT ONLINE</h3>
                            </div>
                        </div>
                        <div class="col-md-12 pt-2">
                            <div class="image">
                                <img class="w-100" src="{{url('/images/shutterstock.jpg')}}" alt="">
                            </div>
                            <div class="title">
                                <h3>KHÓA HỌC TIẾNG HÀN ONLINE</h3>
                            </div>
                        </div>
                        <div class="col-md-12 pt-2">
                            <div class="image">
                                <img class="w-100"
                                     src="{{url('/images/two-mechanical-engineers-working-together.jpg')}}" alt="">
                            </div>
                            <div class="title">
                                <h3>KHÓA HỌC NGHỀ KNDD ONLINE</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 course-invite pt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 course-wrap">
                        <div class="col-md-12 pt-2 pb-5">
                            <div class="image">
                                <img class="w-100" src="{{url('/images/hoc-thac-sy-tai-duc.jpg')}}" alt="">
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6 pt-2">
                                    <div class="image image-small">
                                        <img class="" src="{{url('/images/dsc4.jpg')}}" alt="">
                                    </div>
                                </div>
                                <div class="col-md-6 pt-2">
                                    <div class="image image-small">
                                        <img class=""
                                             src="{{url('/images/ffhfg.jpg')}}"
                                             alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        @if($pageIntro["chuong-trinh-gioi-thieu"])
                            {!! ($pageIntro["chuong-trinh-gioi-thieu"]) !!}
                        @endif
                    </div>
                </div>
            </div>
        </div>
    @endif
    <section class="pb-6">
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <h2 class="text-center text-md-left">Mạng xã hội</h2>
                    <p class="lead text-muted">Kết nối với Point CRM qua mạng xã hội.</p>
                    <div class="mt-5 d-flex flex-row justify-content-md-between flex-wrap press-icons">
                        <img src="https://logo.clearbit.com/google.com?size=60" alt="Google"/>
                        <img src="https://logo.clearbit.com/twitter.com?size=60" alt="Twitter"/>
                        <img src="https://logo.clearbit.com/vuejs.org?size=60" alt="Veu.js"/>
                        <img src="https://logo.clearbit.com/stripe.com?size=60" alt="Stripe"/>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.3/feather.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.15.0/prism.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.15.0/plugins/line-numbers/prism-line-numbers.min.js"></script>
    <script src="../../public/js/scripts.js"></script>
@endsection
