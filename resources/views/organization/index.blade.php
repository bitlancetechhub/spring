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
                        <li class="breadcrumb-item active" aria-current="page">Organizations</li>
                    </ol>
                </nav>
            </div>
            <h4 class="page-title">Organizations</h4>
        </div>
        <div class="col-5 align-self-center text-right">
            <ul class="list-inline mb-0">
                <li class="list-inline-item" data-toggle="tooltip" data-placement="top" title="Add New Organization">
                    <button class="btn btn-primary btn-circle" data-toggle="modal" data-target="#new-org" data-whatever="@getbootstrap"> <i data-feather="plus"></i> </button>
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
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="bg-primary text-white">
                                <tr>
                                    <th>#</th>
                                    <th>Photo</th>
                                    <th>Name</th>
                                    <th>Email ID</th>
                                    <th>Mobile Number</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if(!empty($data))
                                    @foreach($data as $p)
                                    <tr class="tab-body-tr" onclick=window.location.href='{{ route("organization-details",array($p->id)) }}'>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>
                                            @if(!empty($p->logo_url))
                                                <img src="{{ env('APP_URL') }}/{{ $p->logo_url }}" width="50px">
                                            @else
                                                <i class="fas fa-hospital-alt fa-2x"></i>
                                            @endif
                                        </td>
                                        <td>{{ $p->name }}<br>
                                        <small>Created at {{ Helper::converToTz($p->created_at) }}</small>    
                                        </td>
                                        <td>{{ $p->email }}</td>
                                        <td>{{ $p->mobile_no }}</td>
                                        <td>
                                             <form method="post" action="{{ route('delete-organization') }}" onsubmit="return confirm('Are you sure?');">
                                                @csrf
                                                <input type="hidden" name="orgid" value="{{ $p->id }}">
                                                <a href="{{ route('edit-organization',array($p->id)) }}" class="text-inverse p-r-10" data-toggle="tooltip" title="Edit"><i class="ti-marker-alt"></i></a>
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
<div class="modal fade" id="new-org" tabindex="-1" role="dialog" aria-labelledby="new-org">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="">New organization</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
            <form action="{{ route('new-organization') }}" method="POST"> 
                @csrf
                <div class="modal-body">
                    <div class="form-group">
                        <label for="oname" class="control-label">Name:</label>
                        <input type="text" name="name" class="form-control @error('name') is-invalid @enderror" id="oname" value="{{ old('name') }}">
                        @error('name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="email" class="control-label">Email ID:</label>
                        <input type="email" class="form-control @error('email') is-invalid @enderror" name="email" id="email" value="{{ old('email') }}">
                        @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="mobno" class="control-label">Mobile number:</label>
                        <input type="text" class="form-control @error('mobile_no') is-invalid @enderror" id="mobno" name="mobile_no" value="{{ old('mobile_no') }}">
                        @error('mobile_no')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="address_line1" class="control-label">Address Line1:</label>
                        <input type="text" class="form-control @error('address_line1') is-invalid @enderror" id="address_line1" name="address_line1" value="{{ old('address_line1') }}">
                        @error('address_line1')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="address_line2" class="control-label">Address Line2:</label>
                        <input type="text" class="form-control @error('address_line2') is-invalid @enderror" id="address_line2" name="address_line2" value="{{ old('address_line2') }}">
                        @error('address_line2')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-6">
                                <label for="country" class="control-label">Country:</label>
                                <select class="form-control @error('country') is-invalid @enderror" id="country" name="country">
                                    @if(!empty($country))
                                        @foreach($country as $p)
                                            <option value="{{ $p->country }}">{{ $p->country }}</option>
                                        @endforeach
                                    @endif
                                </select>
                                @error('country')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-6">
                                <label for="state" class="control-label">State:</label>
                                <select class="form-control @error('state') is-invalid @enderror" id="state" name="state">
                                </select>
                                @error('state')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-md-6">
                                <label for="location_id" class="control-label">City:</label>
                                <select class="form-control @error('location_id') is-invalid @enderror" id="location_id" name="location_id">
                                </select>
                                @error('location_id')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="col-md-6">
                                <label for="pincode" class="control-label">Pincode:</label>
                                <input type="text" class="form-control @error('pincode') is-invalid @enderror" id="pincode" name="pincode" value="{{ old('pincode') }}">
                                @error('pincode')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
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

@if($errors->has('name') || $errors->has('email') || $errors->has('mobile_no'))
    <script>
    $(function() {
        $('#new-org').modal({
            show: true
        });
    });
    </script>
@endif

@endsection
