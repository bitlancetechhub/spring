<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('add-to-log', 'HomeController@myTestAddToLog');
Route::get('logActivity', 'HomeController@logActivity');

Auth::routes();

Route::group(['middleware' => 'auth'], function () {

	Route::get('/home', 'HomeController@index')->name('home');
	Route::get('/settings', 'HomeController@settings')->name('settings');
	Route::post('/settings', 'HomeController@saveSettings')->name('settings');

	Route::get('/users', 'UserController@index')->name('users');

	Route::get('/user/change-password', 'UserController@showChangePassword')->name('change-password');
	Route::post('/user/change-password', 'UserController@UpdateChangePassword')->name('change-password');

	Route::get('/organizations', 'OrganizationController@index')->name('organizations');
	Route::post('/organizations/add', 'OrganizationController@add')->name('new-organization');
	Route::get('/organization/{orgid}/edit', 'OrganizationController@edit')->name('edit-organization');
	Route::post('/organization/{orgid}/edit', 'OrganizationController@update')->name('edit-organization');
	Route::post('/organization/delete', 'OrganizationController@delete')->name('delete-organization');
	Route::get('/organization/{orgid}/details', 'OrganizationController@details')->name('organization-details');

	Route::post('/organizations/member/add', 'MemberController@add')->name('new-member');
	Route::get('/organization/member/{memid}/edit', 'MemberController@edit')->name('edit-member');
	Route::post('/organization/member/{memid}/edit', 'MemberController@update')->name('edit-member');
	Route::post('/organization/member/delete', 'MemberController@delete')->name('delete-member');
    Route::post('/member-img/delete', 'MemberController@deleteImg')->name('delete-memimg');

	Route::get('/subscriptions', 'SubscriptionController@index')->name('subscriptions');
	Route::get('/subscription/{subid}/edit', 'SubscriptionController@edit')->name('edit-subscription');
	Route::post('/subscription/{subid}/edit', 'SubscriptionController@update')->name('edit-subscription');
	Route::post('/subscription/add', 'SubscriptionController@add')->name('new-subscription');
	Route::post('/subscription/delete', 'SubscriptionController@delete')->name('delete-subscription');

	Route::get('/helps', 'HelpController@index')->name('helps');
	Route::post('/help/delete', 'HelpController@delete')->name('delete-help');

	Route::post('/device/add', 'DeviceController@add')->name('new-device');
	Route::get('/organization/device-mobile/{devid}/edit', 'DeviceController@edit')->name('edit-device');
	Route::post('/organization/device-mobile/{devid}/edit', 'DeviceController@update')->name('edit-device');
	Route::get('/organization/device/{devid}/details', 'DeviceController@details')->name('organization-device-details');
	Route::post('/organization/device/delete', 'DeviceController@delete')->name('delete-device');
	Route::post('/device/plan/add', 'DeviceController@purchasePlan')->name('new-device-plan');

	Route::post('getCityByState','UserController@getCitiesByState')->name('getCityByState');
	Route::get('/notifications', 'HelpController@notifications')->name('notifications');
	Route::get('/organization/hdevice/members/{orgid}/{did}', 'DeviceController@devMembers')->name('device_members');
	Route::post('/organization/hdevice/members/{orgid}/{did}', 'DeviceController@saveDevMembers')->name('device_members');

	Route::get('/notifications/{organization?}/{start?}/{end?}', 'HelpController@notifications')->name('notifications');
});
