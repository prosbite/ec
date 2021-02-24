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
Route::get('/logout', '\App\Http\Controllers\Auth\LoginController@logout');
Route::get('/', [App\Http\Controllers\DashboardController::class, 'index'])->name('welcome');
// Route::get('attendance/check', [App\Http\Controllers\AttendanceController::class, 'index'])->name('attendance.today')->middleware('auth');
Route::get('attendance/record/{id}', [App\Http\Controllers\AttendanceController::class, 'index'])->name('attendance.solo')->middleware('auth');
Route::get('attendance/today/', [App\Http\Controllers\AttendanceController::class, 'today'])->name('attendance.today')->middleware('auth');
Route::post('attendance/store', [App\Http\Controllers\AttendanceController::class, 'store'])->name('attendance.store')->middleware('auth');
Route::post('attendance/update', [App\Http\Controllers\AttendanceController::class, 'update'])->name('attendance.update')->middleware('auth');
Route::get('home', [App\Http\Controllers\DashboardController::class, 'home'])->name('home')->middleware('auth');
Route::get('activities', [App\Http\Controllers\ActivityController::class, 'index'])->name('activities')->middleware('auth');


Auth::routes();

