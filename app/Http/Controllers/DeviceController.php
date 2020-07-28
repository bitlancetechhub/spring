<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Session;
use App\Hdevice;
use App\OrganizationUsers;
use App\Subscriptions;
use App\Organization;
use App\Members;
use App\DeviceMembers;
use Illuminate\Support\Str;

class DeviceController extends Controller
{
	private $apiToken;

	public function __construct()
	{
	  // Unique Token
	  $this->apiToken = uniqid(base64_encode(Str::random(60)));
	}

    public function add(Request $request){
    	$validator = Validator::make($request->all(), [
            'device_number' => 'required|unique:hdevices',
            'organizationid' => 'required|unique:organization_users',
            'deviceid' => 'required|unique:organization_users',
            'password' => 'required|min:8',
        ]);

        $orgid=$request->orgid;

        if ($validator->fails()) {
            return redirect('organization/'.$orgid.'/details')->withErrors($validator)->withInput(); 
        }

    	$device_number=$request->device_number;
    	$thermal_camera_serial_no=$request->thermal_camera_serial_no;
    	$sanitization_device_no=$request->sanitization_device_no;
    	$subscription_id=$request->subscription_id;
    	$organizationid=$request->organizationid;
    	$deviceid=$request->deviceid;
    	$password=bcrypt($request->password);

    	$validity_date=null;
    	$subscription_price=null;
    	
    	if(!empty($subscription_id)){
    		$data=Subscriptions::where(['id' => $subscription_id,'deleted_at' => null])->first();
    		if(!empty($data)){
    			$validity_days=$data->validity_days;
    			$subscription_price=$data->subscription_price;
				$validity_date = date('d-m-Y', strtotime(now().' + '.$validity_days.' days'));
    		}
    	}

    	$hdeviceid = Hdevice::insertGetId(['organization_id' => $orgid,'device_number' => $device_number,'thermal_camera_serial_no' => $thermal_camera_serial_no,'sanitization_device_no' => $sanitization_device_no,'validity_date' => $validity_date,'start_date' => date('d-m-Y'),'subscription_price' => $subscription_price]);
    	if($hdeviceid){
    		$orguser = OrganizationUsers::insert(['organization_id' => $orgid,'hdevice_id' => $hdeviceid,'organizationid' => $organizationid,'deviceid' => $deviceid,'password' => $password,'api_token' => $this->apiToken]);

    		Session::flash('alert-success', 'Device added successfully!');
        	return redirect('organization/'.$orgid.'/details');
    	}else{
    		Session::flash('alert-danger', 'Device not added!');
        	return redirect('organization/'.$orgid.'/details');
    	}
    }

    public function edit($devid){
    	$hdevice=Hdevice::findOrFail($devid);
    	$orguser=OrganizationUsers::where('hdevice_id',$devid)->first();
    	return view('organization.hdevice.edit',['hdevice' => $hdevice,'orguser' => $orguser]);
    }
    public function update(Request $request,$devid){
    	$validator = Validator::make($request->all(), [
            'device_number' => 'required',
            'organization_id' => 'required',
            'device_id' => 'required',
        ]);

        $orgid=$request->orgid;

        if ($validator->fails()) {
            return redirect('organization/device-mobile/'.$devid.'/edit')->withErrors($validator)->withInput(); 
        }

    	$device_number=$request->device_number;
    	$thermal_camera_serial_no=$request->thermal_camera_serial_no;
    	$sanitization_device_no=$request->sanitization_device_no;
    	$organizationid=$request->organization_id;
    	$deviceid=$request->device_id;
    	$features=$request->features;

    	$hdeviceid = Hdevice::where(['id' => $devid])->update(['device_number' => $device_number,'thermal_camera_serial_no' => $thermal_camera_serial_no,'sanitization_device_no' => $sanitization_device_no,'features' => $features]);
    	$orguser = OrganizationUsers::where(['organization_id' => $orgid,'hdevice_id' => $devid])->update(['organizationid' => $organizationid,'deviceid' => $deviceid]);
    	Session::flash('alert-success', 'Device updated successfully!');
        return redirect('organization/device-mobile/'.$devid.'/edit');
    }

    public function details($devid){
    	$hdevice=Hdevice::findOrFail($devid);
    	$orguser=OrganizationUsers::where('hdevice_id',$devid)->first();
    	$subscrplans=Subscriptions::where('deleted_at',null)->get();
    	return view('organization.hdevice.details',['hdevice' => $hdevice,'orguser' => $orguser,'subscrplans' => $subscrplans]);
    }

    public function purchasePlan(Request $request){
    	$subscription_id=$request->subscription_id;
    	$devid=$request->devid;
    	$validity_date=null;
    	$subscription_price=null;
    	
    	if(!empty($subscription_id)){
    		$data=Subscriptions::where(['id' => $subscription_id,'deleted_at' => null])->first();
    		if(!empty($data)){
    			$validity_days=$data->validity_days;
    			$subscription_price=$data->subscription_price;
				$validity_date = date('Y-m-d', strtotime(now().' + '.$validity_days.' days'));
    		}
    	}

    	$hdeviceid = Hdevice::where('id',$devid)->update(['start_date' => date('Y-m-d'),'validity_date' => $validity_date,'subscription_price' => $subscription_price]);
    	if($hdeviceid){
    		Session::flash('alert-success', 'Device plan purchased successfully!');
        	return redirect('organization/device/'.$devid.'/details');
    	}else{
    		Session::flash('alert-danger', 'Device not added!');
        	return redirect('organization/device/'.$devid.'/details');
    	}
    }

    public function devMembers($orgid,$did)
    {
        $members=Members::where(['organization_id' => $orgid,'deleted_at' => null])->orderBy('name','asc')->get();
        if(!empty($members)){
            foreach ($members as $p) {
                $memid=$p->id;
                $memexist=DeviceMembers::where(['member_id' => $memid,'hdevice_id' => $did])->count();
                if($memexist>0){
                    $p->status='checked';
                }else{
                    $p->status='';
                }
            }
        }
        return view('organization.hdevice.members',['members' => $members,'orgid' => $orgid,'did' => $did]);
    }

    public function saveDevMembers(Request $request,$orgid,$did)
    {
        $members=$request->get('members');
        if(!empty($members)){
            $tot=count($members);
            DeviceMembers::where('hdevice_id',$did)->delete();

            for ($i=0; $i < $tot; $i++) { 
                DeviceMembers::insert(['hdevice_id' => $did,'member_id' => $members[$i]]);
            }
        }else{
            DeviceMembers::where('hdevice_id',$did)->delete();
        }

        return redirect('organization/hdevice/members/'.$orgid.'/'.$did);
    }
}
