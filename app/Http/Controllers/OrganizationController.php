<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Session;
use App\Organization;
use App\Members;
use App\Hdevice;
use App\Location;
use App\Subscriptions;

class OrganizationController extends Controller
{
    public function __construct()
    {
        HomeController::myTestAddToLog("Organization activity");
    }

    public function index(){
    	$org =Organization::where('deleted_at',null)->get();
        $country=Location::where('deleted_at',null)->distinct()->get('country');
        return view('organization.index',['data' => $org,'country' => $country]);
    }

    public function add(Request $request){
    	$validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'mobile_no' => 'required|size:10',
            'address_line1' => 'required'
        ]);

        if ($validator->fails()) {
            return redirect('organizations')->withErrors($validator)->withInput(); 
        }

    	$data=$request->except('_token');
    	$userd = Organization::updateOrCreate($data);
    	if($userd){
    		Session::flash('alert-success', 'Organization added successfully!');
        	return redirect('organizations');
    	}else{
    		Session::flash('alert-danger', 'Organization not added!');
        	return redirect('organizations');
    	}
    }

    public function edit($orgid){
    	$data=Organization::find($orgid);
    	return view('organization.edit',['data' => $data]);
    } 

    public function update(Request $request,$orgid){

    	if($request->file('logo')){
    		$image_url="";
			$file = $request->file('logo');
			$destinationPath = 'uploads/organizations/';
			$filename = time().'.'.$file->getClientOriginalExtension();
	      	$file->move($destinationPath,$filename);
	      	$image_url="uploads/organizations/".$filename;

	      	$userscount = Organization::where('id',$orgid)->update(["logo_url"=>$image_url]);
			if($userscount){
				Session::flash('alert-success', 'Organization image updated successfully!');
				return redirect('organization/'.$orgid.'/edit');
			}else{
				Session::flash('alert-danger', 'Organization image not updated.');
				return redirect('organization/'.$orgid.'/edit');
			}
    	}else{
	    	$name=$request->name;
	    	$email=$request->email;
	    	$mobile_no=$request->mobile_no;
            $address_line1=$request->address_line1;
            $address_line2=$request->address_line2;
            $pincode=$request->pincode;
            $location_id=$request->location_id;
            $alt_mobile_no=$request->alt_mobile_no;

	    	$validator = Validator::make($request->all(), [
	            'name' => 'required',
	            'email' => 'required|email',
	            'mobile_no' => 'required|size:10',
                'address_line1' => 'required'
	        ]);

	        if ($validator->fails()) {
	            return redirect('organization/'.$orgid.'/edit')->withErrors($validator)->withInput(); 
	        }

	        $userd = Organization::where('id',$orgid)->update(['name' => $name,'email' => $email,'mobile_no' => $mobile_no,'address_line1' => $address_line1,'address_line2' => $address_line2,'pincode' => $pincode,'location_id' => $location_id,'alt_mobile_no' => $alt_mobile_no]);
	    	if($userd){
	    		Session::flash('alert-success', 'Organization udpated successfully!');
	        	return redirect('organization/'.$orgid.'/edit');
	    	}else{
	    		Session::flash('alert-danger', 'Organization not updated!');
	        	return redirect('organization/'.$orgid.'/edit');
	    	}
	    }
    }

    public function delete(Request $request){
    	$id=$request->orgid;
    	$res=Organization::find($id)->delete();
    	if($res){
    		Session::flash('alert-success', 'Organization delete successfully!');
        	return redirect('organizations');
    	}else{
    		Session::flash('alert-danger', 'Organization not deleted!');
        	return redirect('organizations');
    	}
    }

    public function details($orgid){
    	$data=Organization::find($orgid);
    	$members=Members::where(['organization_id' => $orgid,'deleted_at' => null])->get();
    	$hdevices=Hdevice::where(['organization_id' => $orgid,'deleted_at' => null])->get();
        $subscrplans=Subscriptions::where('deleted_at',null)->get();
    	return view('organization.details',['data' => $data,'members' => $members,'hdevices' => $hdevices,'subscrplans' => $subscrplans]);
    }
}
