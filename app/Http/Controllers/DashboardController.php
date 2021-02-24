<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\models\User;

class DashboardController extends Controller
{
    public function index(){
        return redirect(route('attendance.today'));
    }
    public function home(){
        return redirect(route('attendance.today'));
    }
}
