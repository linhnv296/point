@extends('master')
@section('content')
    <div class="page-content">
        <div class="container-base px-4">
{{--            <h2 class="border-bottom title">{!! $page->title !!}</h2>--}}
            <div>
                {!! $page->excerpt !!}
            </div>
            {!! $page->body !!}
        </div>
    </div>
@endsection
