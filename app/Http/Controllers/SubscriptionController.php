<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Session;
use App\Subscriptions;

class SubscriptionController extends Controller
{
    public function __construct()
    {
        HomeController::myTestAddToLog("Subscription activity");
    }

    public function index(){
    	$sub =Subscriptions::where('deleted_at',null)->get();
        return view('subscriptions.index',['data' => $sub]);
    }

    public function add(Request $request){
    	$validator = Validator::make($request->all(), [
            'name' => 'required',
            'validity_days' => 'required|numeric',
            'subscription_price' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return redirect('subscriptions')->withErrors($validator)->withInput(); 
        }

    	$data=$request->except('_token');
    	$userd = Subscriptions::updateOrCreate($data);
    	if($userd){
    		Session::flash('alert-success', 'Subscription added successfully!');
        	return redirect('subscriptions');
    	}else{
    		Session::flash('alert-danger', 'Subscription not added!');
        	return redirect('subscriptions');
    	}
    }

    public function edit($subid){
    	$data=Subscriptions::find($subid);
    	return view('subscriptions.edit',['data' => $data]);
    }

    public function update(Request $request,$subid){	
    	$name=$request->name;
    	$validity_days=$request->validity_days;
    	$subscription_price=$request->subscription_price;

    	$validator = Validator::make($request->all(), [
            'name' => 'required',
            'validity_days' => 'required|numeric',
            'subscription_price' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return redirect('subscription/'.$subid.'/edit')->withErrors($validator)->withInput(); 
        }

        $userd = Subscriptions::where('id',$subid)->update(['name' => $name,'validity_days' => $validity_days,'subscription_price' => $subscription_price]);
    	if($userd){
    		Session::flash('alert-success', 'Subscription udpated successfully!');
        	return redirect('subscription/'.$subid.'/edit');
    	}else{
    		Session::flash('alert-danger', 'Subscription not updated!');
        	return redirect('subscription/'.$subid.'/edit');
    	}
    }

    public function delete(Request $request){
    	$id=$request->subid;
    	$res=Subscriptions::find($id)->delete();
    	if($res){
    		Session::flash('alert-success', 'Subscription delete successfully!');
        	return redirect('subscriptions');
    	}else{
    		Session::flash('alert-danger', 'Subscription not deleted!');
        	return redirect('subscriptions');
    	}
    }
}
