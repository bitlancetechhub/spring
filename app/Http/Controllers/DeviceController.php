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
            'pid_uid' => 'required|unique:hdevices',
            'password' => 'required|min:8',
        ]);

        $orgid=$request->orgid;

        if ($validator->fails()) {
            return redirect('organization/'.$orgid.'/details')->withErrors($validator)->withInput(); 
        }

    	$device_area=$request->device_area;
    	$thermal_camera_serial_no=$request->thermal_camera_serial_no;
    	$device_serial_no=$request->device_serial_no;
    	$subscription_id=$request->subscription_id;
    	$organizationid=$request->organizationid;
    	$pid_uid=$request->pid_uid;
    	$password=bcrypt($request->password);

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

    	$hdeviceid = Hdevice::insertGetId(['organization_id' => $orgid,'device_area' => $device_area,'pid_uid' => $pid_uid,'thermal_camera_serial_no' => $thermal_camera_serial_no,'device_serial_no' => $device_serial_no,'validity_date' => $validity_date,'start_date' => date('Y-m-d'),'subscription_price' => $subscription_price]);
    	if($hdeviceid){
    		$orguser = OrganizationUsers::insert(['organization_id' => $orgid,'hdevice_id' => $hdeviceid,'organizationid' => $organizationid,'password' => $password,'api_token' => $this->apiToken]);

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
            'pid_uid' => 'required',
        ]);

        $orgid=$request->orgid;

        if ($validator->fails()) {
            return redirect('organization/device-mobile/'.$devid.'/edit')->withErrors($validator)->withInput(); 
        }

    	$device_area=$request->device_area;
    	$thermal_camera_serial_no=$request->thermal_camera_serial_no;
    	$device_serial_no=$request->device_serial_no;
    	$organizationid=$request->organization_id;
    	$pid_uid=$request->pid_uid;
    	$features=$request->features;

        if(!empty($request->password)){
            $password=bcrypt($request->password);
            $orguser = OrganizationUsers::where(['organization_id' => $orgid,'hdevice_id' => $devid])->update(['password' => $password]);
        }
        

    	$hdeviceid = Hdevice::where(['id' => $devid])->update(['device_area' => $device_area,'pid_uid' => $pid_uid,'thermal_camera_serial_no' => $thermal_camera_serial_no,'device_serial_no' => $device_serial_no,'features' => $features]);
    	$orguser = OrganizationUsers::where(['organization_id' => $orgid,'hdevice_id' => $devid])->update(['organizationid' => $organizationid]);
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

    public function delete(Request $request){
        $id=$request->devid;
        $orgid=$request->orgid;
        $res=Hdevice::find($id)->delete();
        if($res){
            Session::flash('alert-success', 'Device delete successfully!');
            return redirect('organization/'.$orgid.'/details');
        }else{
            Session::flash('alert-danger', 'Member not deleted!');
            return redirect('organization/'.$orgid.'/details');
        }
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
