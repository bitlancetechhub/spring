<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Repositories\User\UserInterface as UserInterface;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Validator;
use Session;
use App\User;
class UserController extends Controller
{

    public function __construct(UserInterface $user)
    {
        $this->user = $user;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $users = $this->user->getAll();
        return view('user.index',['users' => $users]);
    }

    public function showChangePassword()
    {
        return view('user.change-password');
    }

    public function UpdateChangePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'current_password' => 'required',
            'password' => 'required|min:8|confirmed'
        ]);

        if ($validator->fails()) {
            return redirect('user/change-password')->withErrors($validator)->withInput(); 
        }

        $currpwd = $request->get('current_password');
        $pwd = $request->get('password');
        $hashedPassword = Auth::user()->password;

        if (\Hash::check($currpwd , $hashedPassword )) {
 
            if (!\Hash::check($pwd , $hashedPassword)) {
 
              $users =User::find(Auth::user()->id);
              $users->password = bcrypt($pwd);
              User::where( 'id' , Auth::user()->id)->update( array( 'password' =>  $users->password));
 
              Session::flash('alert-success','Password updated successfully');
              return redirect('user/change-password');
            }
            else{
                Session::flash('alert-warning','New password can not be the old password!');
                return redirect('user/change-password');
            } 
        }else{
            Session::flash('alert-danger','Old password does not matched ');
            return redirect('user/change-password');
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
     
    public function show($id)
    {
        $user = $this->user->find($id);
        return view('user.show',['user']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function delete($id)
    {
        $this->user->delete($id);
        return redirect()->route('user');
    }
}
