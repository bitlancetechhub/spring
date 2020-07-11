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
                        <li class="breadcrumb-item active" aria-current="page">Settings</li>
                    </ol>
                </nav>
            </div>
            <h4 class="page-title">Settings</h4>
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
        <div class="col-12">
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
                <form class="form-horizontal" action="{{ route('settings') }}" method="POST">
                    @csrf
                    <div class="card-body">
                        <h4 class="card-title">Privacy Policy</h4>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <textarea class="form-control" rows="10" name="privacy_policy" placeholder="Write here">{!! !empty($data->privacy_policy)?$data->privacy_policy:'' !!}</textarea>
                            </div>
                        </div>
                        <hr>
                        <h4 class="card-title">Terms & Condition</h4>
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <textarea class="form-control" rows="10" name="terms_condition" placeholder="Write here">{!! !empty($data->terms_condition)?$data->terms_condition:'' !!}</textarea>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="card-body">
                        <h4 class="card-title">SMS Gateway</h4>
                        <div class="form-group row">
                            <label for="com1" class="col-sm-3 text-right control-label col-form-label">Sender ID</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" value="{{ !empty($data->sender_id)?$data->sender_id:'' }}" name="sender_id">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="com1" class="col-sm-3 text-right control-label col-form-label">Username</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" value="{{ !empty($data->sms_username)?$data->sms_username:'' }}" name="sms_username">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="com1" class="col-sm-3 text-right control-label col-form-label">Password</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" value="{{ !empty($data->sms_password)?$data->sms_password:'' }}" name="sms_password">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="abpro" class="col-sm-3 text-right control-label col-form-label">Gateway Link</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" value="{{ !empty($data->sms_gateway_link)?$data->sms_gateway_link:'' }}" name="sms_gateway_link">
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="card-body">
                        <h4 class="card-title">Email Gateway</h4>
                        <div class="form-group row">
                            <label for="com1" class="col-sm-3 text-right control-label col-form-label">Email ID</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" value="{{ !empty($data->email_id)?$data->email_id:'' }}" name="email_id">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="com1" class="col-sm-3 text-right control-label col-form-label">Password</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" value="{{ !empty($data->password)?$data->password:'' }}" name="password">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="com1" class="col-sm-3 text-right control-label col-form-label">Host</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" value="{{ !empty($data->host)?$data->host:'' }}" name="host">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="abpro" class="col-sm-3 text-right control-label col-form-label">Port</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" value="{{ !empty($data->port)?$data->port:'' }}" name="port">
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="card-body">
                        <div class="form-group m-b-0 text-right">
                            <button type="submit" class="btn btn-info waves-effect waves-light">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
