@extends('master')
@section('content')
    <div class="container">
        <div class="row">
            <div class="" style="width: 100%">
                <div class="">
                    <h2 class="border-bottom title">{!! $page->title !!}</h2>
                    <div class="" style="color: #dddddd; font-style: italic">
                        {!! $page->excerpt !!}
                    </div>
                    <div class="">
                        {!! $page->body !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
