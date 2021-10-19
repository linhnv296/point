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
                        .press-icons img {
                            max-width: 125px;
                            width: auto;
                            height: auto;
                            max-height: 100px;
                        }
                        .carousel img, .carousel-inner{
                            width: 100%;
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

        <div class="container">
            <div class="row">
                {!! setting('site.slide') !!}
            </div>
        </div>
    @if(!auth()->user())
        <section class="bg-gradient pt-3 pb-3">
            <div class="container">
                <div class="row mt-3">
                    <div class="col-md-8 mx-auto text-center">
                        <h1>Đăng ký thành viên</h1>
                        <p class="lead mb-5">
                            @if(isset($pageIntro["page-register"]) && $pageIntro["page-register"])
                                {!! ($pageIntro["page-register"]) !!}
                            @endif
                        </p>
                        <a href="{{route("auth.register")}}" class="btn btn-success svg-icon">
                            <em class="mr-2" data-feather="github"></em>
                            Đăng ký
                        </a>
                    </div>
                </div>
            </div>
        </section>
    @endif
    <!--Features Section-->

    <!--Used By Section-->
    @if($pageIntro)
        <div class="col-md-12 course pt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        @if(isset($pageIntro["khoa-hoc"]) && $pageIntro["khoa-hoc"])
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
                        @if(isset($pageIntro["chuong-trinh-gioi-thieu"]) && $pageIntro["chuong-trinh-gioi-thieu"])
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
                        <a href="{{setting('site.fb')}}">
                            <img src="{{url('/images/fb.png')}}" alt="facebook"/>
                        </a>
                        <a href="{{setting('site.tw')}}">
                            <img src="{{url('/images/tw.png')}}" alt="Twitter"/>
                        </a>
                        <a href="{{setting('site.youtube')}}">
                            <img src="{{url('/images/youtube.png')}}" alt="Youtube"/>
                        </a>
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
