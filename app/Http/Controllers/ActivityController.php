<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ActivityController extends Controller
{
    public function index(Request $request){
        $data = (object)(new \App\models\SchedSubj())->setSched($request);
        
        return view('classrecord.activities')->with([
            'nav' => ['classrecord', 'activities'],
            'data' => $data,
            'sched_id' => $request->sched,
        ]);
    }
}
