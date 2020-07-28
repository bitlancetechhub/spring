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
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">{{ $data->name }}
                     <a href="{{ route('edit-organization',array($data->id)) }}" class="text-inverse pull-right p-r-10" data-toggle="tooltip" title="Edit"><i class="ti-marker-alt"></i></a>
                    </h3>
                    <h6 class="card-subtitle">{{ $data->email }}</h6>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-6">
                            <div class="white-box text-center">
                                @if(!empty($data->logo_url))
                                    <img src="{{ env('APP_URL') }}/{{ $data->logo_url }}" class="img-fluid">
                                @else
                                    <i class="fas fa-hospital-alt fa-4x"></i>
                                @endif
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-6">
                            <h3 class="box-title">General Info</h3>
                            <div class="table-responsive">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td width="390">Mobile number / Alt.Mobile number</td>
                                            <td> {{ $data->mobile_no }} / {{ $data->alt_mobile_no }} </td>
                                        </tr>
                                        <tr>
                                            <td width="390">Location</td>
                                            <td> {{ $data->address_line1 }}, {{ $data->address_line2 }}, {{ !empty($data->location->country)?$data->location->country:'' }}, {{ !empty($data->location->state)?$data->location->state:'' }},{{ !empty($data->location->city)?$data->location->city:'' }}, {{ $data->pincode }} </td>
                                        </tr>
                                        <tr>
                                            <td width="390">Total Members</td>
                                            <td> {{ count($members) }} </td>
                                        </tr>
                                        <tr>
                                            <td>Total Devices</td>
                                            <td> {{ count($hdevices) }} </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-7">
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
                    <h3 class="box-title">Members List <a href="#" class="pull-right" data-toggle="tooltip" data-placement="top" title="Add New Member"><button class="btn btn-primary btn-circle-sm" data-toggle="modal" data-target="#new-mem" data-whatever="@getbootstrap"> <i class="fa fa-plus"></i> </button></a></h3>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="bg-primary text-white">
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Identity No. / Designation-Class / Department-Division</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                 @if(!empty($members))
                                    @foreach($members as $p)
                                    <tr class="tab-body-tr">
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $p->name }}<br>
                                        <small>Created at {{ Helper::converToTz($p->created_at) }}</small>
                                        </td>
                                        <td>{{ $p->identity_no }} / {{ $p->designation_class }} / {{ $p->department_division }}</td>
                                        <td>
                                             <form method="post" action="{{ route('delete-member') }}" onsubmit="return confirm('Are you sure?');">
                                                @csrf
                                                <input type="hidden" name="orgid" value="{{ $data->id }}">
                                                <input type="hidden" name="memid" value="{{ $p->id }}">
                                                <a href="{{ route('edit-member',array($p->id)) }}" class="text-inverse p-r-10" data-toggle="tooltip" title="Edit"><i class="ti-marker-alt"></i></a>
                                                <button type="submit" class="btn btn-link text-inverse" title="Delete" data-toggle="tooltip"><i class="ti-trash"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                    @endforeach
                                @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

          <div class="col-md-5">
            <div class="card">
                <div class="card-body">
                    <h3 class="box-title">HDevices List <a href="#" class="pull-right" data-toggle="tooltip" data-placement="top" title="Add New Device"><button class="btn btn-primary btn-circle-sm" data-toggle="modal" data-target="#new-devmob" data-whatever="@getbootstrap"> <i class="fa fa-plus"></i> </button></a></h3>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="bg-primary text-white">
                                <tr>
                                    <th>#</th>
                                    <th>Device No.</th>
                                    <th>Start Date to Validity Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                               @if(!empty($hdevices))
                                    @foreach($hdevices as $p)
                                    <tr class="tab-body-tr" onclick=window.location.href='{{ route("organization-device-details",array($p->id)) }}'>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $p->device_number }}
                                        </td>
                                        <td>{{ $p->start_date }} to {{ $p->validity_date }}</td>
                                        <td>
                                             <form method="post" action="" onsubmit="confirm('Are you sure?');">
                                                @csrf
                                                <input type="hidden" name="orgid" value="{{ $p->id }}">
                                                <a href="{{ route('edit-device',array($p->id)) }}" class="text-inverse p-r-10" data-toggle="tooltip" title="Edit"><i class="ti-marker-alt"></i></a>
                                                <a href="{{ route('device_members',array($data->id,$p->id)) }}" class="text-inverse p-r-10" data-toggle="tooltip" title="Members"><i class="ti-user"></i></a>
                                                <button type="submit" class="btn btn-link text-inverse" title="Delete" data-toggle="tooltip"><i class="ti-trash"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                    @endforeach
                                @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="new-mem" tabindex="-1" role="dialog" aria-labelledby="new-mem">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="">New Member</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
            <form action="{{ route('new-member') }}" method="POST">
                @csrf
                <input type="hidden" value="{{ $data->id }}" name="organization_id">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="oname" class="control-label">Name:</label>
                        <input type="text" name="name" required class="form-control @error('name') is-invalid @enderror" id="oname" value="{{ old('name') }}">
                        @error('name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="identity_no" class="control-label">Identity No.:</label>
                        <input type="text" required class="form-control @error('identity_no') is-invalid @enderror" name="identity_no" id="identity_no" value="{{ old('identity_no') }}">
                        @error('identity_no')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="class" class="control-label">Designation/Class:</label>
                        <input type="text" required class="form-control @error('designation_class') is-invalid @enderror" name="designation_class" id="class" value="{{ old('designation_class') }}">
                        @error('designation_class')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="division" class="control-label">Department/Division:</label>
                        <input type="text" required class="form-control @error('department_division') is-invalid @enderror" name="department_division" id="division" value="{{ old('department_division') }}">
                        @error('department_division')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="mobno" class="control-label">Mobile number:</label>
                        <input type="text" required class="form-control @error('mobile_no') is-invalid @enderror" id="mobno" name="mobile_no" value="{{ old('mobile_no') }}">
                        @error('mobile_no')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
            </form>
        </div>
    </div>
</div>
<!-- /.modal -->


<div class="modal fade" id="new-devmob" tabindex="-1" role="dialog" aria-labelledby="new-mem">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="">New Device & Mobile</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
            <form action="{{ route('new-device') }}" method="POST">
                @csrf
                <input type="hidden" value="{{ $data->id }}" name="orgid">
                <div class="modal-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="device_number" class="control-label">H/W Device Number:</label>
                                <input type="text" name="device_number" class="form-control @error('device_number') is-invalid @enderror" id="device_number" value="{{ old('device_number') }}">
                                @error('device_number')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-md-6">
                                <label for="thermal_camera_serial_no" class="control-label">Thermal Camera Serial No.:</label>
                                <input type="text" class="form-control" name="thermal_camera_serial_no" id="thermal_camera_serial_no" value="{{ old('thermal_camera_serial_no') }}">
                            </div>
                            <div class="col-md-6">
                                <label for="sanitization_device_no" class="control-label">Sanitization Device No.:</label>
                                <input type="text" class="form-control" name="sanitization_device_no" id="sanitization_device_no" value="{{ old('sanitization_device_no') }}">
                            </div>
                            <div class="col-md-6">
                                <label for="subscription_plan" class="control-label">Subscription Plan:</label>
                                <select class="form-control" name="subscription_id" id="subscription_plan">
                                    <option value="">Select Plan</option>
                                    @if(!empty($subscrplans))
                                        @foreach($subscrplans as $p)
                                        <option value="{{ $p->id }}">{{ $p->name }}, Days-{{ $p->validity_days }}, Price-{{ $p->subscription_price }} Rs. </option>
                                        @endforeach
                                    @endif
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="organizationid" class="control-label">Organization ID:</label>
                        <input type="text" class="form-control @error('organizationid') is-invalid @enderror" id="organizationid" name="organizationid" value="{{ old('organizationid') }}">
                        @error('organizationid')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="deviceid" class="control-label">Device ID:</label>
                        <input type="text" class="form-control @error('deviceid') is-invalid @enderror" id="deviceid" name="deviceid" value="{{ old('deviceid') }}">
                        @error('deviceid')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="password" class="control-label">Password:</label>
                        <input type="password" class="form-control @error('password') is-invalid @enderror" id="password" name="password" value="{{ old('password') }}">
                        @error('password')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
            </form>
        </div>
    </div>
</div>
<!-- /.modal -->
@endsection

@section('scripts')
@parent

@if($errors->has('name') || $errors->has('identity_no') || $errors->has('designation_class') || $errors->has('department_division') || $errors->has('mobile_no'))
    <script>
    $(function() {
        $('#new-mem').modal({
            show: true
        });
    });
    </script>
@endif

@if($errors->has('device_number') || $errors->has('organization_id') || $errors->has('device_id') || $errors->has('password'))
    <script>
    $(function() {
        $('#new-devmob').modal({
            show: true
        });
    });
    </script>
@endif

@endsection
