@extends('layouts.app')

@section('template_title')
    {{ $qualification->name ?? __('Show') . " " . __('Qualification') }}
@endsection

@section('content')
    <section class="content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
                        <div class="float-left">
                            <span class="card-title">{{ __('Show') }} Qualification</span>
                        </div>
                        <div class="float-right">
                            <a class="btn btn-primary btn-sm" href="{{ route('qualifications.index') }}"> {{ __('Back') }}</a>
                        </div>
                    </div>

                    <div class="card-body bg-white">
                        
                        <div class="form-group mb-2 mb20">
                            <strong>Student Id:</strong>
                            {{ $qualification->student_id }}
                        </div>
                        <div class="form-group mb-2 mb20">
                            <strong>Course Id:</strong>
                            {{ $qualification->course_id }}
                        </div>
                        <div class="form-group mb-2 mb20">
                            <strong>Grade:</strong>
                            {{ $qualification->grade }}
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
