<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Attendance;
use App\Models\StudentAttendance;
use App\Models\AttendanceRemark;
use Session;
use Auth;

class AttendanceController extends Controller
{
    
    public function index(Request $request, $id){
        $data = $this->setSched($request);
        $data->attendance = (new \App\Models\Attendance())->today($data->current_sched->ss_id, 'lec', $id);
        
        return view('attendance.solo')->with([
            'nav' => ['attendance', 'today'],
            'data' => $data,
            'sched_id' => $request->sched,
            'att_id' => $request->id,
        ]);
    }

    public function today(Request $request){
        $data = $this->setSched($request);
        $data->attendance = (new \App\Models\Attendance())->today($data->current_sched->ss_id, 'lec', $request->att);
        return view('attendance.today')->with([
            'sched_id' => $request->sched,
            'nav' => ['attendance', 'today'],
            'data' => $data,
        ]);
    }

    public function store(Request $request){
        $att = new Attendance;
        $att->att_sched = $request->sched;
        $att->type = 'lec';
        $att->att_date = \Carbon\Carbon::now();
        $att->save();
        
        foreach ($request->student as $key => $value) {
            $studAtt = new StudentAttendance;
            $studAtt->stud_id = $key;
            $studAtt->att_id = $att->att_id;
            $studAtt->att_status = $value;
            $studAtt->save();

            if(isset($request->remarks[$key])){
                foreach ($request->remarks[$key] as $rkey => $rvalue) {
                    $remark = new AttendanceRemark;
                    $remark->sa_id = $studAtt->sa_id;
                    $remark->remarks = $rvalue;
                    $remark->remark_date = \Carbon\Carbon::now();
                    $remark->save();
                }
             }
        }
        Session::flash('success', 'Attendance has been saved');
        return redirect(route('attendance.today',['sched'=>$request->sched]));
    }

    public function update(Request $request){
        foreach ($request->student as $key => $value) {
            $studAtt = StudentAttendance::where(['stud_id'=>$key, 'att_id'=>$request->att_id])->first();
            if($studAtt){
                $studAtt->att_status = $value;
                $studAtt->save();
                if(isset($request->remarks[$key])){
                   foreach ($request->remarks[$key] as $rkey => $rvalue) {
                        $remark = new AttendanceRemark;
                        $remark->sa_id = $studAtt->sa_id;
                        $remark->remarks = $rvalue;
                        $remark->remark_date = \Carbon\Carbon::now();
                        $remark->save();
                   }
                }
            }
        }
        Session::flash('success', 'Attendance has been updated');
        return redirect(route('attendance.today',['sched'=>$request->sched]));
    }

    public function matrix(Request $request){
        $data = $this->setSched($request);
        if(!$request->month){
            $data->attendance = (new \App\Models\Attendance())->matrix($data->current_sched->ss_id, date('m'));
        }else{
            $data->attendance = (new \App\Models\Attendance())->matrix($data->current_sched->ss_id, $request->month);
        }
        
        // foreach ($data->current_sched->subject_enrolled as $key => $value) {
        //     dd($value->studFullName());
        // }
        // dd($data);
        return view('attendance.matrix')->with([
            'nav' => ['attendance', 'matrix'],
            'data' => $data,
            'month' => $request->month? $request->month:date('m'),
            'sched_id' => $request->sched,
        ]);
    }
}
