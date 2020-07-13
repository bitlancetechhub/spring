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
                            <label for="email" class="control-label">Email ID:</label>
                            <input type="email" class="form-control @error('email') is-invalid @enderror" name="email" id="email" value="{{ $data->email }}">
                            @error('email')
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
                        <div class="form-group">
                            <label for="alt_mobile_no" class="control-label">Alt.Mobile number:</label>
                            <input type="text" class="form-control @error('alt_mobile_no') is-invalid @enderror" id="alt_mobile_no" name="alt_mobile_no" value="{{ $data->alt_mobile_no }}">
                            @error('alt_mobile_no')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="address_line1" class="control-label">Address Line1:</label>
                            <input type="text" class="form-control @error('address_line1') is-invalid @enderror" id="address_line1" name="address_line1" value="{{ $data->address_line1 }}">
                            @error('address_line1')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="address_line2" class="control-label">Address Line2:</label>
                            <input type="text" class="form-control @error('address_line2') is-invalid @enderror" id="address_line2" name="address_line2" value="{{ $data->address_line2 }}">
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
                                    <select class="form-control @error('country') is-invalid @enderror" id="country">
                                        @if(!empty($country))
                                            @foreach($country as $p)
                                                <option value="{{ $p->country }}" {{ !empty($location) && $location->country == $p->country?'selected':'' }} >{{ $p->country }}</option>
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
                                    <select class="form-control @error('state') is-invalid @enderror" id="state">
                                        @if(!empty($states))
                                            @foreach($states as $p)
                                                <option value="{{ $p->state }}" {{ !empty($location) && $location->state == $p->state?'selected':'' }}>{{ $p->state }}</option>
                                            @endforeach
                                        @endif
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
                                        @if(!empty($cities))
                                                <option value="{{ $cities->id }}" {{ !empty($location) && $location->city == $cities->city?'selected':'' }}>{{ $cities->city }}</option>
                                        @endif
                                    </select>
                                    @error('location_id')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="col-md-6">
                                    <label for="pincode" class="control-label">Pincode:</label>
                                    <input ty2pe="text" class="form-control @error('pincode') is-invalid @enderror" id="pincode" name="pincode" value="{{ $data->pincode }}">
                                    @error('pincode')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>
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
                            <label for="logo" class="control-label">Logo:</label>
                            <div class="col-md-12 m-b-20 text-center">
                                @if(!empty($data->logo_url))
                                    <img src="{{ env('APP_URL') }}/{{ $data->logo_url }}" width="100px">
                                @else
                                    <i class="fas fa-hospital-alt fa-4x"></i>
                                @endif
                            </div>
                            <input type="file" name="logo" class="form-control @error('logo') is-invalid @enderror" id="logo" required="true">
                            @error('logo')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <br>
                         <button type="submit" class="btn btn-primary">Update Logo</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@section('scripts')
    @parent

    <script>
        $("#state").change(function () {
            var state=this.value;
            $.ajax({
                url:"{{ route('getCityByState') }}",
                method:"POST",
                data:{'state' : state, '_token' : $('meta[name="csrf-token"]').attr('content')},
                success:function (res) {
                    var no=res.cities.length;
                    // alert(no);
                    // console.log(res.cities);
                    var data="";
                    for(var i=0;i<no;i++){
                        data+="<option value="+res.cities[i].id+">"+res.cities[i].city+"</option>";
                    }
                    $("#location_id").html(data);

                }
            });
        });
    </script>

@endsection
