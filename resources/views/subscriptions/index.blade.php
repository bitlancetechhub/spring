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
                        <li class="breadcrumb-item active" aria-current="page">Subscriptions</li>
                    </ol>
                </nav>
            </div>
            <h4 class="page-title">Subscriptions</h4>
        </div>
        <div class="col-5 align-self-center text-right">
            <ul class="list-inline mb-0">
                <li class="list-inline-item" data-toggle="tooltip" data-placement="top" title="Add New Plan">
                    <button class="btn btn-primary btn-circle" data-toggle="modal" data-target="#new-sub" data-whatever="@getbootstrap"> <i data-feather="plus"></i> </button>
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
                                    <th>Name</th>
                                    <th>Validity(Days)</th>
                                    <th>Price</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if(!empty($data))
                                    @foreach($data as $p)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $p->name }}<br>
                                        <small>Created at {{ Helper::converToTz($p->created_at) }}</small>
                                        </td>
                                        <td>{{ $p->validity_days }}</td>
                                        <td>{{ $p->subscription_price }}</td>
                                        <td>
                                             <form method="post" action="{{ route('delete-subscription') }}" onsubmit="return confirm('Are you sure?');">
                                                @csrf
                                                <input type="hidden" name="orgid" value="{{ $p->id }}">
                                                <a href="{{ route('edit-subscription',array($p->id)) }}" class="text-inverse p-r-10" data-toggle="tooltip" title="Edit"><i class="ti-marker-alt"></i></a>
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
<div class="modal fade" id="new-sub" tabindex="-1" role="dialog" aria-labelledby="new-sub">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="">New subscription plan</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
            <form action="{{ route('new-subscription') }}" method="POST"> 
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
                        <label for="validity_days" class="control-label">Validity Days:</label>
                        <input type="number" class="form-control @error('validity_days') is-invalid @enderror" name="validity_days" id="validity_days" value="{{ old('validity_days') }}">
                        @error('validity_days')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="subscription_price" class="control-label">Subscription Price:</label>
                        <input type="text" class="form-control @error('subscription_price') is-invalid @enderror" id="subscription_price" name="subscription_price" value="{{ old('subscription_price') }}">
                        @error('subscription_price')
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

@if($errors->has('name') || $errors->has('validity_days') || $errors->has('subscription_price'))
    <script>
    $(function() {
        $('#new-sub').modal({
            show: true
        });
    });
    </script>
@endif

@endsection
