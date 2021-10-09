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
Route::post('/login', '\App\Http\Controllers\Auth\AuthController@login')->middleware('guest')->name('auth.login');
Route::get('/register', '\App\Http\Controllers\Auth\AuthController@showRegisterForm')->middleware('guest')->name('auth.register');
Route::post('/register', '\App\Http\Controllers\Auth\RegisterController@insert')->name('auth.create');
Route::get('/logout', '\App\Http\Controllers\Auth\AuthController@logout')->middleware('auth')->name('auth.logout');
Route::get('/list-user', '\App\Http\Controllers\ListUserController@showPage')->middleware('auth')->name('list.user');
Route::post('/create-collaborators', '\App\Http\Controllers\CollaboratorsUserController@store')->middleware('auth')->name('collaborators.store');
Route::get('/list-coupon', '\App\Http\Controllers\CouponController@showPage')->name('coupon.list');
Route::post('/choose-coupon', '\App\Http\Controllers\CouponController@chooseCoupon')->middleware('auth')->name('coupon.choose');
Route::post('/update-ctv', '\App\Http\Controllers\CollaboratorsUserController@updateCtv')->middleware('auth')->name('collaborators.update-ctv');
Route::get('/collaborators-users/{id}/verification', '\App\Http\Controllers\CollaboratorsUserController@verificationAccount')->middleware('auth')->name('collaborators.verify');
Route::post('/collaborators-users/{id}/verification', '\App\Http\Controllers\CollaboratorsUserController@storeVerificationAccount')->middleware('auth')->name('collaborators.storeVerify');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
