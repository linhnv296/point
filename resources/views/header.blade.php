<section class="pt-5">
    <div class="container">
        <div class="row">
            <div class="col-12 d-flex flex-row align-items-center justify-content-between">
                <div class="heading-brand">Point CRM</div>
                @if(auth()->user())
                    <a href="{{route("auth.logout")}}" class="btn btn-dark">Logout</a>
                @else
                    <a href="{{route("auth.login")}}" class="btn btn-dark">Login</a>
                @endif
            </div>
            <div class="col-12">
                @if(auth()->user())
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="/">Trang chủ<span class="sr-only">(current)</span></a>
                                </li>
{{--                                <li class="nav-item">--}}
{{--                                    <a class="nav-link" href="#">Link</a>--}}
{{--                                </li>--}}
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Quà tặng
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{{ route('coupon.list') }}">Danh sách Quà tặng</a>
                                        <div class="dropdown-divider"></div>
                                    </div>
                                </li>
                            </ul>
{{--                            <form class="form-inline my-2 my-lg-0">--}}
{{--                                <input class="form-control mr-sm-2" type="search" placeholder="Search"--}}
{{--                                       aria-label="Search">--}}
{{--                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--}}
{{--                            </form>--}}
                        </div>
                    </nav>
                @endif
            </div>
        </div>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="https://p.bigstockphoto.com/rwyznvNQ76U2liDFDH6g_bigstock-Yachts-In-City-Bay-At-Hot-Summ-283784740.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://p.bigstockphoto.com/rwyznvNQ76U2liDFDH6g_bigstock-Yachts-In-City-Bay-At-Hot-Summ-283784740.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="https://p.bigstockphoto.com/rwyznvNQ76U2liDFDH6g_bigstock-Yachts-In-City-Bay-At-Hot-Summ-283784740.jpg" alt="Third slide">
                </div>
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
</section>
