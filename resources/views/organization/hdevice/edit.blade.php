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
                        <li class="breadcrumb-item">
                            <a href="{{ route('organization-details',array($hdevice->organization_id)) }}" class="link">{{ $hdevice->organization->name }}</a>
                        </li>
                    </ol>
                </nav>
            </div>
            <h4 class="page-title">PID/UID.:- {{ $hdevice->pid_uid }}</h4>
        </div>
        <div class="col-5 align-self-center text-right">
            <ul class="list-inline mb-0">
                <li class="list-inline-item" data-toggle="tooltip" data-placement="top" title="Back to organization">
                    <a href="{{ route('organization-details',array($hdevice->organization_id)) }}"> <i data-feather="arrow-left-circle"></i> </a>
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
        <div class="col-md-12">
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
                        <input type="hidden" value="{{ $hdevice->organization_id }}" name="orgid">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="device_area" class="control-label">H/W Device Area:</label>
                                    <input type="text" name="device_area" class="form-control @error('device_area') is-invalid @enderror" id="device_area" value="{{ $hdevice->device_area }}">
                                    @error('device_area')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="col-md-4">
                                    <label for="thermal_camera_serial_no" class="control-label">Thermal Camera Serial No.:</label>
                                    <input type="text" class="form-control" name="thermal_camera_serial_no" id="thermal_camera_serial_no" value="{{ $hdevice->thermal_camera_serial_no }}">
                                </div>
                                <div class="col-md-4">
                                    <label for="device_serial_no" class="control-label">Device Serial No.:</label>
                                    <input type="text" class="form-control" name="device_serial_no" id="device_serial_no" value="{{ $hdevice->device_serial_no }}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="organization_id" class="control-label">Organization ID:</label>
                                    <input type="text" class="form-control @error('organization_id') is-invalid @enderror" id="organization_id" name="organization_id" value="{{ $orguser->organizationid }}">
                                    @error('organization_id')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="col-md-6">
                                    <label for="pid_uid" class="control-label">PID/UID:</label>
                                    <input type="text" class="form-control @error('pid_uid') is-invalid @enderror" id="pid_uid" name="pid_uid" value="{{ $hdevice->pid_uid }}">
                                    @error('pid_uid')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="col-md-12">
                                    <label for="features" class="control-label">Features:</label>
                                    <textarea class="form-control @error('features') is-invalid @enderror" rows="5" id="features" name="features">{{ $hdevice->features }}</textarea>
                                    @error('features')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="col-md-12">
                                    <label for="password" class="control-label">Password:</label>
                                    <input type="password" class="form-control" id="password" name="password">
                                </div>
                            </div>
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