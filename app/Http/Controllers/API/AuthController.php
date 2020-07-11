<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
use App\OrganizationUsers;
use App\Hdevice;
use App\Members;
use App\MemberPhotos;
use Validator;
use Illuminate\Support\Str;

class AuthController extends Controller
{
  private $apiToken;

  public function __construct()
  {
    // Unique Token
    $this->apiToken = uniqid(base64_encode(Str::random(60)));
  }
  /**
   * Client Login
   */
  public function postLogin(Request $request)
  {
    // Validations
    $rules = [
      'organizationid'=>'required',
      'deviceid' => 'required',
      'password'=>'required|min:8'
    ];
    $validator = Validator::make($request->all(), $rules);
    if ($validator->fails()) {
      // Validation failed
      return response()->json([
        'errors' => $validator->messages(),
        'status' => 0,
      ]);
    } else {

      // Fetch User
      $user = OrganizationUsers::where(['deviceid' => $request->deviceid,'organizationid' => $request->organizationid])->first();
      if($user) {
        // Verify the password
        if( password_verify($request->password, $user->password) ) {

          // Update Token
          $postArray = ['api_token' => $this->apiToken];
          $login = OrganizationUsers::where(['deviceid' => $request->deviceid,'organizationid' => $request->organizationid])->update($postArray);
          
          if($login) {
          	$currentDate = date('Y-m-d');
          	$devst=Hdevice::where(['id' => $user->hdevice_id,'deleted_at' => null])->where('validity_date', '>=', $currentDate)->where('validity_date','!=', null)->count();
          	if($devst>0){
          		$st="active";
          	}else{
          		$st="inactive";
          	}

            return response()->json([
            	'status' => 1,
              	'organizationid'         => $user->organizationid,
              	'deviceid'        => $user->deviceid,
              	'access_token' => $this->apiToken,
              	'subscription_status' => $st
            ]);
          }

        } else {
          return response()->json([
          	'status' => 0,
            'errors' => 'Invalid Password',
          ]);
        }
      } else {
        return response()->json([
        	'status' => 0,
          	'errors' => 'User not found',
        ]);
      }
    }
  }

  /**
   * Logout
   */
  public function postLogout(Request $request)
  {
    $token = $request->header('Authorization');
    $user = OrganizationUsers::where('api_token',$token)->first();
    if($user) {
      $postArray = ['api_token' => null];
      $logout = OrganizationUsers::where('id',$user->id)->update($postArray);
      if($logout) {
        return response()->json([
          'message' => 'User Logged Out',
          'status' => 1,
        ]);
      }
    } else {
      return response()->json([
        'errors' => 'Unauthorized access',
        'status' => 0,
      ]);
    }
  }

  public function memberDetails(Request $request){
  	$token = $request->header('Authorization');
    $user = OrganizationUsers::where('api_token',$token)->first();

    if(!empty($user)) {
	    $rules = [
	      'member_id' => 'required'
	    ];
	    
	    $validator = Validator::make($request->all(), $rules);
	    if ($validator->fails()) {
	      // Validation failed
	      return response()->json([
	        'errors' => $validator->messages(),
	        'status' => 0,
	      ]);
	    } else {
	    	$orgid=$user->organization_id;
  			$memid=$request->member_id;

			// Fetch User
	      	$user = Members::where(['id' => $memid,'organization_id' => $orgid,'status' => 1]);
	      	$users=$user->first();
	      	if($users) {

	            return response()->json([
	            	'status' => 1,
	            	'data' => $users
	            ]);
	         
	        } else {
	          return response()->json([
	          	'status' => 0,
	            'errors' => 'Member not found',
	          ]);
	        }
  		}

    } else {
      return response()->json([
        'errors' => 'Unauthorized access',
        'status' => 0,
      ]);
    }
  }

  public function resetPassword(Request $request){
	$token = $request->header('Authorization');
    $user = OrganizationUsers::where('api_token',$token)->first();
  	if($user){
  		
  		$rules = [
	      'organizationid'=>'required',
	      'deviceid' => 'required',
	      'new_pin'=>'required|min:8',
	      'current_pin'=>'required|min:8'
	    ];
	    
	    $validator = Validator::make($request->all(), $rules);
	    if ($validator->fails()) {
	      // Validation failed
	      return response()->json([
	        'errors' => $validator->messages(),
	        'status' => 0,
	      ]);
	    } else {
	    	$orgid=$request->organizationid;
  			$devid=$request->deviceid;
  			$current_pin=$request->current_pin;
  			$new_pin=$request->new_pin;

	      // Fetch User
	      $user = OrganizationUsers::where(['deviceid' => $devid,'organizationid' => $orgid,'status' => 1]);
	      $users=$user->first();
	      if($users) {
	        // Verify the password
	        if( password_verify($current_pin, $users->password) ) {

	          // Update Token
	          $postArray = ['password' => bcrypt($new_pin)];
	          $login = $user->update($postArray);
	          
	          if($login) {

	            return response()->json([
	            	'status' => 1,
	            	'message' => 'Pin changed successfully!'
	            ]);
	          }

	        } else {
	          return response()->json([
	          	'status' => 0,
	            'errors' => 'Current pin invalid',
	          ]);
	        }
	      } else {
	        return response()->json([
	        	'status' => 0,
	          	'errors' => 'User not found',
	        ]);
	      }
	  	}

  	}else{
  		return response()->json([
        'errors' => 'Unauthorized access',
        'status' => 0,
      ]);
  	}
  }

  public function newMember(Request $request)
  {
    $token = $request->header('Authorization');
    $user = OrganizationUsers::where('api_token',$token)->first();
    if($user) {
      	$rules = [
		    'name' => 'required',
	        'identity_no' => 'required',
	        'designation_class' => 'required',
	        'department_division' => 'required',
	        'mobile_no' => 'required|size:10',
	        'video' => 'mimes:mpeg,ogg,mp4,webm,3gp,mov,flv,avi,wmv,ts|max:100040',
	        'photos' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048'
	    ];
	    
	    $validator = Validator::make($request->all(), $rules);
	    if ($validator->fails()) {
	      // Validation failed
	      return response()->json([
	        'errors' => $validator->messages(),
	        'status' => 0,
	      ]);
	    } else {
	    	$orgid=$user->organization_id;
	    	$name=$request->name;
	    	$identity_no=$request->identity_no;
	    	$class=$request->designation_class;
	    	$division=$request->department_division;
	    	$mobile_no=$request->mobile_no;
	    	
	    	$video_url=null;

	    	if($request->file('video')){
				$file = $request->file('video');
				$destinationPath = 'uploads/organizations/members/videos/';
				$filename = time().'.'.$file->getClientOriginalExtension();
		      	$file->move($destinationPath,$filename);
		      	$video_url="uploads/organizations/members/videos/".$filename;
	    	}

	    	$userupdate = Members::insertGetId(['organization_id' => $orgid,'name' => $name,'identity_no' => $identity_no,'designation_class' => $class,'department_division' => $division,'mobile_no' => $mobile_no,'video_url' => $video_url]);
	    	if($userupdate){
	    		if ($request->file('photos')) {
	    			$files = $request->file('photos');
		            $destinationPath = 'uploads/organizations/members/';
		            $filename = time().'.'.$files->getClientOriginalExtension();
		            $files->move($destinationPath, $filename);
		            MemberPhotos::insert(['member_id' => $userupdate,'image_url' => 'uploads/organizations/members/'.$filename]);
		        }
	    		return response()->json([
	          	'status' => 1,
	            'message' => 'Member added',
	          ]);
	    	}else{
	    		return response()->json([
		          	'status' => 0,
		            'errors' => 'Something went wrong',
		          ]);
	    	}
	    }
    } else {
      return response()->json([
        'errors' => 'Unauthorized access',
        'status' => 0,
      ]);
    }
  }

  public function currentSubscriptionStatus(Request $request){
  	$token = $request->header('Authorization');
    $user = OrganizationUsers::where(['api_token' => $token,'status' => 1])->first();

    if(!empty($user)) {
	   
	   $status="";
	   $expiry_date=null;

	   $currentDate = date('Y-m-d');
      	$devst=Hdevice::where(['id' => $user->hdevice_id,'deleted_at' => null])->where('validity_date', '>=', $currentDate)->where('validity_date','!=', null);
      	if($devst->count() > 0){
      		$status="active";
      		$expiry_date=$devst->first()->validity_date;
      	}else{
      		$status="inactive";
      	}

	   return response()->json([
        'expiry_date' => $expiry_date,
        'status' => $status,
      ]);

    } else {
      return response()->json([
        'errors' => 'Unauthorized access',
        'status' => 0,
      ]);
    }
  }

  public function deviceWarning(Request $request){
	   
	   $rules = [
		    'device_number' => 'required',
	    ];
	    
	    $validator = Validator::make($request->all(), $rules);
	    if ($validator->fails()) {
	      // Validation failed
	      return response()->json([
	        'errors' => $validator->messages(),
	        'status' => 0,
	      ]);
	    } else{
	    	$status="";
	   		$expiry_date=null;

		   $currentDate = date('Y-m-d');
		  	$devst=Hdevice::where(['device_number' => $request->device_number,'deleted_at' => null])->where('validity_date', '>=', $currentDate)->where('validity_date','!=', null);
		  	if($devst->count() > 0){
		  		$status="active";
		  		$expiry_date=$devst->first()->validity_date;
		  	}else{
		  		$status="inactive";
		  	}

		   return response()->json([
		    'expiry_date' => $expiry_date,
		    'status' => $status,
		  ]);
		}
  }

}