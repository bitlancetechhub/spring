<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Settings;
use Session;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->myTestAddToLog("Log activity");
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function settings()
    {
        $set=Settings::latest()->first();
        return view('settings',['data' => $set]);
    }

    public function saveSettings(Request $request)
    {
        $input = $request->except('_token');
        $userd = Settings::updateOrCreate($input);
        Session::flash('alert-success', 'Settings Updated...');
        return redirect('settings');
    }

    public static function myTestAddToLog($sub)
    {
        \LogActivity::addToLog($sub);
        // dd('log insert successfully.');
    }


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function logActivity()
    {
        // $logs = \LogActivity::logActivityLists();
        // return view('logActivity',compact('logs'));
        return phpinfo();
    }
}
