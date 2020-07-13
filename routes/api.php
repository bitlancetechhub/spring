<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::prefix('v1')->namespace('API')->group(function () {
  // Login
  Route::post('/login','AuthController@postLogin');
  Route::post('/device-warning','AuthController@deviceWarning');
  // Register
  // Route::post('/register','AuthController@postRegister');
  // Protected with APIToken Middleware
  Route::middleware('APIToken')->group(function () {
    // Logout
    Route::post('/logout','AuthController@postLogout');
    Route::post('/user','AuthController@user');
    Route::post('/reset-password','AuthController@resetPassword');
    Route::post('/member-details','AuthController@memberDetails');
    Route::post('/new-member','AuthController@newMember');
    Route::post('/subscription-status','AuthController@currentSubscriptionStatus');
    Route::post('/upload-report','AuthController@uploadReport');

  });
});

