<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Session;
use App\Help;
use App\OrganizationNotificationLog;


class HelpController extends Controller
{
    public function index(){
    	$sub =Help::where('deleted_at',null)->get();
        return view('help.index',['data' => $sub]);
    }

    public function delete(Request $request){
    	$id=$request->helpid;
    	$res=Helps::find($id)->delete();
    	if($res){
    		Session::flash('alert-success', 'Help delete successfully!');
        	return redirect('helps');
    	}else{
    		Session::flash('alert-danger', 'Help not deleted!');
        	return redirect('helps');
    	}
    }

    public function notifications()
    {
        $res=OrganizationNotificationLog::orderBy('id','desc')->paginate(10);
        return view('organization.notifications',['data' => $res]);
    }
}
