<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Session;
use App\Help;
use App\OrganizationNotificationLog;
use App\Organization;


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

    public function notifications(Request $request)
    {
        $res=OrganizationNotificationLog::where('deleted_at',null);
        if($request->organization=="" && $request->start=="" && $request->end==""){
            $data=$res->orderBy('id','desc')->paginate(10);
        }else{
            if($request->organization!=""){
                $res->where('organization_id',$request->organization);
            }
            if($request->start!="" && $request->end!=""){
                $res->whereBetween('created_at', [date('Y-m-d',strtotime($request->start)),date('Y-m-d',strtotime($request->end))]);
            }
            $data=$res->orderBy('id','desc')->paginate(10);
        }
        $org =Organization::where('deleted_at',null)->get();
        
        return view('organization.notifications',['data' => $data,'organizations' => $org]);
    }
}
