@extends('layouts.web')

@section('content')
<!-- ============================================================== -->
<!-- Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<div class="page-breadcrumb">
    <div class="row">
        <div class="col-7 align-self-center">
            <div class="d-flex align-items-center">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('home') }}" class="link">Dashboard</a>
                        </li>
                         <li class="breadcrumb-item">
                            <a href="{{ route('organizations') }}" class="link">Organizations</a>
                        </li>
                    </ol>
                </nav>
            </div>
            <h4 class="page-title">{{ $data->name }}</h4>
        </div>
        <div class="col-5 align-self-center text-right">
            <ul class="list-inline mb-0">
                <li class="list-inline-item" data-toggle="tooltip" data-placement="top" title="Back to organization">
                    <a href="{{ route('organizations') }}"> <i data-feather="arrow-left-circle"></i> </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- ============================================================== -->
<!-- End Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- Container fluid  -->
<!-- ============================================================== -->
<div class="container-fluid">
    <!-- ============================================================== -->
    <!-- Sales -->
    <!-- ============================================================== -->
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="flash-message">
                    @foreach (['danger', 'warning', 'success', 'info'] as $msg)
                      @if(Session::has('alert-' . $msg))
                        <div class="alert alert-{{ $msg }} alert-rounded">  <i class="ti-user"></i> {{ Session::get('alert-' . $msg) }}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
                        </div>
                      @endif
                    @endforeach
                </div>
                <div class="card-body">
                    <form action="" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="oname" class="control-label">Name:</label>
                            <input type="text" name="name" class="form-control @error('name') is-invalid @enderror" id="oname" value="{{ $data->name }}">
                            @error('name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="identity_no" class="control-label">Identity No.:</label>
                            <input type="text" required class="form-control @error('identity_no') is-invalid @enderror" name="identity_no" id="identity_no" value="{{ $data->identity_no }}">
                            @error('identity_no')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                       <div class="form-group">
                            <label for="class" class="control-label">Designation/Class:</label>
                            <input type="text" required class="form-control @error('designation_class') is-invalid @enderror" name="designation_class" id="class" value="{{ $data->designation_class }}">
                            @error('designation_class')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="division" class="control-label">Department/Division:</label>
                            <input type="text" required class="form-control @error('department_division') is-invalid @enderror" name="department_division" id="division" value="{{ $data->department_division }}">
                            @error('department_division')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="mobno" class="control-label">Mobile number:</label>
                            <input type="text" class="form-control @error('mobile_no') is-invalid @enderror" id="mobno" name="mobile_no" value="{{ $data->mobile_no }}">
                            @error('mobile_no')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <br>
                         <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                </div>
            </div>
        </div>

          <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <form action="" enctype="multipart/form-data" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="video" class="control-label">Upload Video:</label>
                            <div class="col-md-12 m-b-20 text-center">
                                @if(!empty($data->video_url))
                                    <video width="100%" controls>
                                        <source src="{{ env('APP_URL') }}/{{ $data->video_url }}" type="video/{{ pathinfo($data->video_url, PATHINFO_EXTENSION) }}">
                                        Your browser does not support the video tag.
                                    </video>
                                @else
                                    <i class="fas fa-hospital-alt fa-4x"></i>
                                @endif
                            </div>
                            <input type="file" name="video" class="form-control @error('video') is-invalid @enderror" id="video" required="true">
                            @error('video')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <br>
                         <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
