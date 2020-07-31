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
            <h4 class="page-title"></h4>
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
                <div class="card-body">
                    <h3 class="card-title">{{ $hdevice->organization->name }}
                     <a href="{{ route('edit-device',array($hdevice->id)) }}" class="text-inverse pull-right p-r-10" data-toggle="tooltip" title="Edit"><i class="ti-marker-alt"></i></a>
                    </h3>
                    <h6 class="card-subtitle">{{ $hdevice->device_number }}</h6>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-9">
                            <h3 class="box-title">Hardware Device Info</h3>
                            <div class="table-responsive">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td width="390">H/W Device name</td>
                                            <th> {{ $hdevice->device_name }} </th>
                                        </tr>
                                        <tr>
                                            <td width="390">PID/UID</td>
                                            <th> {{ $hdevice->pid_uid }} </th>
                                        </tr>
                                        <tr>
                                            <td width="390">Thermal Camera Serial No.</td>
                                            <th> {{ $hdevice->thermal_camera_serial_no }}</th>
                                        </tr>
                                        <tr>
                                            <td width="390">Sanitization Device No.</td>
                                            <th> {{ $hdevice->sanitization_device_no }} </th>
                                        </tr>
                                        <tr>
                                            <td>Features</td>
                                            <th> {{ $hdevice->features }} </th>
                                        </tr>
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-9">
                            <h3 class="box-title">Mobile Info</h3>
                            <div class="table-responsive">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td width="390">Organization ID</td>
                                            <td> {{ $orguser->organizationid }} </td>
                                        </tr>
                                        
                                        <tr>
                                            <td width="390">Current Plan Expire Date</td>
                                            <td> {{ $hdevice->validity_date }} 
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Purchase New Plan">
                                                <button class="btn btn-primary btn-circle" data-toggle="modal" data-target="#new-plan" data-whatever="@getbootstrap"> <i data-feather="plus"></i> </button>
                                            </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="390">Current Plan Price</td>
                                            <td> {{ $hdevice->subscription_price }} </td>
                                        </tr>
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="new-plan" tabindex="-1" role="dialog" aria-labelledby="new-plan">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="">New Subscription Plan</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
            <form action="{{ route('new-device-plan') }}" method="POST"> 
                @csrf
                <input type="hidden" value="{{ $hdevice->id }}" name="devid">
                <div class="modal-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="subscription_plan" class="control-label">Subscription Plan:</label>
                                <select class="form-control" required="true" name="subscription_id" id="subscription_plan">
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
