@extends('layouts.web')
@section('style')
<link rel="stylesheet" type="text/css" href="{{ asset('assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css') }}">
@endsection
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
                        <li class="breadcrumb-item active" aria-current="page">Notifications</li>
                    </ol>
                </nav>
            </div>
            <h4 class="page-title">Notifications</h4>
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
                    <div class="row">
                        <form action="" method="get" style="width: 100%">
                            <div class="col-md-4" style="float: left;">
                                <label for="com1" class="text-right control-label col-form-label">Select Organization</label>
                                <div class="">
                                    <select class="form-control" name="organization">
                                        <option value="">Select Organization</option>
                                        @if(!empty($organizations))
                                            @foreach($organizations as $p)
                                            <option value="{{ $p->id }}">{{ $p->name }}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4"  style="float: left;">
                                <label for="com1" class="text-right control-label col-form-label">Duration</label>
                                <div class="">
                                   <div class="input-daterange input-group" id="date-range">
                                        <input type="text" class="form-control" name="start" />
                                        <div class="input-group-append">
                                            <span class="input-group-text bg-info b-0 text-white">TO</span>
                                        </div>
                                        <input type="text" class="form-control" name="end" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4"  style="float: left;">
                                <button class="btn btn-primary m-t-40" style="margin-top: 37px;" type="submit">Filter</button>
                            </div>
                        </form>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="bg-primary text-white">
                                <tr>
                                    <th>#</th>
                                    <th>Organization Name</th>
                                    <th>Member Name</th>
                                    <th>Message</th>
                                    <th>DateTime</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if(!empty($data))
                                    @foreach($data as $p)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ !empty($p->organization->name)?$p->organization->name:'' }}
                                        </td>
                                        <td>{{ !empty($p->member->name)?$p->member->name:'' }}
                                            <br>>>{{ !empty($p->member->mobile_no)?$p->member->mobile_no:'' }}
                                        </td>
                                        <td>{{ $p->message }}</td>
                                        <td>{{ $p->created_at }}</td>
                                    </tr>    
                                    @endforeach
                                @endif
                            </tbody>
                        </table>
                        {{ $data->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
@section("scripts")
    <script src="{{ asset('assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
    <script>
        // Date Picker
        jQuery('.mydatepicker, #datepicker, .input-group.date').datepicker();
        jQuery('#datepicker-autoclose').datepicker({
            autoclose: true,
            todayHighlight: true
        });
        jQuery('#date-range').datepicker({
            toggleActive: true
        });
        jQuery('#datepicker-inline').datepicker({
            todayHighlight: true
        });
    </script>
@endsection