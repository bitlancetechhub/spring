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
                            <a href="{{ route('subscriptions') }}" class="link">Subscriptions</a>
                        </li>
                    </ol>
                </nav>
            </div>
            <h4 class="page-title">{{ $data->name }}</h4>
        </div>
        <div class="col-5 align-self-center text-right">
            <ul class="list-inline mb-0">
                <li class="list-inline-item" data-toggle="tooltip" data-placement="top" title="Back to organization">
                    <a href="{{ route('subscriptions') }}"> <i data-feather="arrow-left-circle"></i> </a>
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
                            <label for="validity_days" class="control-label">Validity Days:</label>
                            <input type="number" class="form-control @error('validity_days') is-invalid @enderror" name="validity_days" id="validity_days" value="{{ $data->validity_days }}">
                            @error('validity_days')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="subscription_price" class="control-label">Subscription Price:</label>
                            <input type="text" class="form-control @error('subscription_price') is-invalid @enderror" id="subscription_price" name="subscription_price" value="{{ $data->subscription_price }}">
                            @error('subscription_price')
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