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

                <nav class="navbar navbar-expand-lg navbar-light">
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="/">Trang chủ |<span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href={{ route('coupon.list') }}>Danh sách coupons |</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/about">Giới thiệu |</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/contact">Liên hệ |</a>
                            </li>
                            @if(auth()->user())
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route("coupon.list") }}">Đã đổi |</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route("list.user") }}">Danh sách Tài khoản</a>
                                </li>
                            @endif
                        </ul>
                        {{--                            <form class="form-inline my-2 my-lg-0">--}}
                        {{--                                <input class="form-control mr-sm-2" type="search" placeholder="Search"--}}
                        {{--                                       aria-label="Search">--}}
                        {{--                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--}}
                        {{--                            </form>--}}
                    </div>
                </nav>
            </div>
        </div>
    </div>
</section>
