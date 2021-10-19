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

Route::get('/', function () {
    return view('welcome');
});
Route::get('/', '\App\Http\Controllers\HomeController@index')->name('home.page');
Route::get('/home', '\App\Http\Controllers\HomeController@index')->name('home.page');
// Route login logout
Route::get('/login', '\App\Http\Controllers\Auth\AuthController@showLoginForm')->middleware('guest')->name('auth.login');
Route::get('/change-password', '\App\Http\Controllers\Auth\AuthController@showChangeForm')->middleware('auth')->name('auth.change');
Route::post('/change-password', '\App\Http\Controllers\Auth\AuthController@changePass')->middleware('auth')->name('auth.change');
Route::post('/login', '\App\Http\Controllers\Auth\AuthController@login')->middleware('guest')->name('auth.login');
Route::get('/register', '\App\Http\Controllers\Auth\AuthController@showRegisterForm')->middleware('guest')->name('auth.register');
Route::post('/register', '\App\Http\Controllers\Auth\RegisterController@insert')->name('auth.create');
Route::get('/logout', '\App\Http\Controllers\Auth\AuthController@logout')->middleware('auth')->name('auth.logout');
Route::get('/list-user', '\App\Http\Controllers\ListUserController@showPage')->middleware('auth')->name('list.user');
Route::post('/create-collaborators', '\App\Http\Controllers\CollaboratorsUserController@store')->middleware('auth')->name('collaborators.store');
Route::get('/list-coupon', '\App\Http\Controllers\CouponController@showPage')->name('coupon.list');
Route::post('/choose-coupon', '\App\Http\Controllers\CouponController@chooseCoupon')->middleware('auth')->name('coupon.choose');
Route::get('/my-coupon', '\App\Http\Controllers\CouponController@myCoupon')->middleware('auth')->name('coupon.my');
Route::post('/update-ctv', '\App\Http\Controllers\CollaboratorsUserController@updateCtv')->middleware('auth')->name('collaborators.update-ctv');
Route::get('/collaborators-users/{id}/verification', '\App\Http\Controllers\CollaboratorsUserController@verificationAccount')->middleware('auth')->name('collaborators.verify');
Route::post('/collaborators-users/{id}/verification', '\App\Http\Controllers\CollaboratorsUserController@storeVerificationAccount')->middleware('auth')->name('collaborators.storeVerify');
Route::get('ctv-export', 'CollaboratorsUserController@export')->name('ctv-export');
Route::get('nang_cap', '\App\Http\Controllers\Auth\AuthController@showUpgrade')->middleware('auth')->name('show.upgrade');
Route::post('nang_cap', '\App\Http\Controllers\Auth\AuthController@upgradeRequired')->middleware('auth')->name('upgrade.required');
Route::get('tang_point', '\App\Http\Controllers\Auth\AuthController@showTransferPoint')->middleware('auth')->name('auth.transfer.point');
Route::POST('tang_point', '\App\Http\Controllers\Auth\AuthController@transferPoint')->middleware('auth')->name('auth.transfer');
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::get('/nang_cap', '\App\Http\Controllers\Auth\AuthController@upgradeAccount')->middleware('auth')->name('auth.upgrade.account');
    Route::get('/nang_cap/{id}', '\App\Http\Controllers\Auth\AuthController@upgradeAccountDetail')->middleware('auth')->name('auth.upgrade.detail');
    Route::post('/nang_cap', '\App\Http\Controllers\Auth\AuthController@upgradeUser')->middleware('auth')->name('auth.upgrade');
});
