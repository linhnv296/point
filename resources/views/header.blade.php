<section class="pt-5">
    <div class="container">
        <div class="row">
            <div class="col-12 d-flex flex-row align-items-center justify-content-between">
                <div class="heading-brand">Đại sứ kết nối - THANH GIANG</div>
                @if(auth()->user())
                    <div>
                        <a href="{{route("auth.logout")}}" class="btn btn-warning mb-1">Đăng xuất</a>
                        <a href="{{route("auth.change")}}" class="btn btn-primary mb-1">Đổi mật khẩu</a>
                    </div>
                @else
                    <a href="{{route("auth.login")}}" class="btn btn-primary">Đăng nhập</a>
                @endif
            </div>
            @if(auth()->user())
            <div class="col-12">
                Tài khoản của bạn: {{ auth()->user()->name }} - Số point: {{ auth()->user()->point }}
            </div>
            @endif
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
                                <a class="nav-link" href="/">Trang chủ <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href={{ route('coupon.list') }}>Ưu đãi </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/about">Giới thiệu </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/contact">Liên hệ </a>
                            </li>
                            @if(auth()->user())
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route("coupon.my") }}">Đã đổi </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route("list.user") }}">Danh sách</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route("auth.transfer.point") }}">Tặng point</a>
                                </li>
                                @if(auth()->user()->active_ctv < 1)
                                    <li class="nav-item">
                                        <a class="nav-link" href="{{ route("show.upgrade") }}">Nâng cấp</a>
                                    </li>
                                @endif
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
