<?php

namespace App\Http\Controllers;
use App\MemberPhotos;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Session;
use App\Organization;
use App\Members;
use App\Hdevice;

class MemberController extends Controller
{
    public function __construct()
    {
        HomeController::myTestAddToLog("Organization member activity");
    }

    public function add(Request $request){
    	$validator = Validator::make($request->all(), [
            'name' => 'required',
            'identity_no' => 'required',
            'designation_class' => 'required',
            'department_division' => 'required',
            'mobile_no' => 'required|size:10',
        ]);

        $orgid=$request->organization_id;

        if ($validator->fails()) {
            return redirect('organization/'.$orgid.'/details')->withErrors($validator)->withInput();
        }

    	$data=$request->except('_token');
    	$userd = Members::updateOrCreate($data);
    	if($userd){
    		Session::flash('alert-success', 'Member added successfully!');
        	return redirect('organization/'.$orgid.'/details');
    	}else{
    		Session::flash('alert-danger', 'Member not added!');
        	return redirect('organization/'.$orgid.'/details');
    	}
    }

    public function edit($memid){
    	$data=Members::find($memid);
    	return view('organization.member.edit',['data' => $data]);
    }

    public function update(Request $request,$memid){

    	if($request->file('video')){
            $validator = Validator::make($request->all(), [
                'video' => 'mimes:mpeg,ogg,mp4,webm,3gp,mov,flv,avi,wmv,ts|max:100040|required'
            ]);

            if ($validator->fails()) {
                return redirect('organization/member/'.$memid.'/edit')->withErrors($validator)->withInput();
            }

    		$image_url="";
			$file = $request->file('video');
			$destinationPath = 'uploads/organizations/members/videos/';
			$filename = time().'.'.$file->getClientOriginalExtension();
	      	$file->move($destinationPath,$filename);
	      	$image_url="uploads/organizations/members/videos/".$filename;

	      	$userscount = Members::where('id',$memid)->update(["video_url"=>$image_url]);
			if($userscount){
				Session::flash('alert-success', 'Member video updated successfully!');
				return redirect('organization/member/'.$memid.'/edit');
			}else{
				Session::flash('alert-danger', 'Member video not updated.');
				return redirect('organization/member/'.$memid.'/edit');
			}
    	}else if($request->file('image')){
            $validator = Validator::make($request->all(), [
                'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048'
            ]);

            if ($validator->fails()) {
                return redirect('organization/member/'.$memid.'/edit')->withErrors($validator)->withInput();
            }

            $image_url="";
            $files = $request->file('image');
            $destinationPath = 'uploads/organizations/members/';
            $filename = time().'.'.$files->getClientOriginalExtension();
            $files->move($destinationPath, $filename);
            $userscount=MemberPhotos::insert(['member_id' => $memid,'image_url' => 'uploads/organizations/members/'.$filename]);
            if($userscount){
                Session::flash('alert-success', 'Member image updated successfully!');
                return redirect('organization/member/'.$memid.'/edit');
            }else{
                Session::flash('alert-danger', 'Member image not updated.');
                return redirect('organization/member/'.$memid.'/edit');
            }
        }else{
	    	$name=$request->name;
	    	$identity_no=$request->identity_no;
	    	$class=$request->designation_class;
	    	$division=$request->department_division;
	    	$mobile_no=$request->mobile_no;

	    	$validator = Validator::make($request->all(), [
	            'name' => 'required',
	            'identity_no' => 'required',
	            'designation_class' => 'required',
	            'department_division' => 'required',
	            'mobile_no' => 'required|size:10',
	        ]);

	        if ($validator->fails()) {
	            return redirect('organization/member/'.$memid.'/edit')->withErrors($validator)->withInput();
	        }

	        $userd = Members::where('id',$memid)->update(['name' => $name,'identity_no' => $identity_no,'designation_class' => $class,'department_division' => $division,'mobile_no' => $mobile_no]);
	    	if($userd){
	    		Session::flash('alert-success', 'Member udpated successfully!');
	        	return redirect('organization/member/'.$memid.'/edit');
	    	}else{
	    		Session::flash('alert-danger', 'Member not updated!');
	        	return redirect('organization/member/'.$memid.'/edit');
	    	}
	    }
    }

    public function delete(Request $request){
    	$id=$request->memid;
    	$orgid=$request->orgid;
    	$res=Members::find($id)->delete();
    	if($res){
    		Session::flash('alert-success', 'Member delete successfully!');
        	return redirect('organization/'.$orgid.'/details');
    	}else{
    		Session::flash('alert-danger', 'Member not deleted!');
        	return redirect('organization/'.$orgid.'/details');
    	}
    }

    public function deleteImg(Request $request){
        $imgid=$request->imgid;
        $res=MemberPhotos::find($imgid)->delete();
        if($res){
            Session::flash('alert-success', 'Member image delete successfully!');
            return back()->withInput();
        }else{
            Session::flash('alert-danger', 'Member Image not deleted!');
            return back()->withInput();
        }
    }
}
