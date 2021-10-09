@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <form role="form"
                          class="form-edit-add"
                          action="{{route('collaborators.update-ctv')}}"
                          method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="exampleFormControlInput1">Cộng tác viên</label>
                                <input type="email" class="form-control" disabled value="{{ $user[0]->name }}">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlInput1">Tài khoản khóa học</label>
                                <input type="email" class="form-control" disabled
                                       value="{{ $dataTypeContent->user_course }}">
                            </div>
                            <input type="text" hidden value="{{$dataTypeContent->id}}" name="collaborators">
                            <input type="text" hidden value="{{$dataTypeContent->type}}" name="type">
                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Hình thức - Khu vực</label>
                                <select class="form-control" id="exampleFormControlSelect1" name="point">
                                    @foreach($points as $point)
                                        <option value="{{ $point->point }}">{{ $point->type }}
                                            - {{$point->region}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="panel-footer">
                            @section('submit-buttons')
                                <button type="submit"
                                        class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                            @stop
                            @yield('submit-buttons')
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- End Delete File Modal -->
@stop

@section('javascript')
    <script>
    </script>
@stop
