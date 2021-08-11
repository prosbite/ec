<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PeriodicSchedule;
use Session;
use App\Models\Activity;

class ActivityController extends Controller
{
    public function index(Request $request){
        $data = (object)(new \App\models\SchedSubj())->setSched($request);
        $data->quarter = (new PeriodicSchedule())->current($data->current_sched, $request->quarter);
        $data->activities = (object)(new \App\models\Activity())->activities($request, $data->current_sched, $data->quarter['current']->psched_id);
        // dd($data);
        return view('classrecord.activities')->with([
            'nav' => ['classrecord', 'activities'],
            'data' => $data,
            'sched_id' => $request->sched,
            'activity' => $request->activity,
        ]);
    }

    public function create(Request $request){
        $data = (object)(new \App\models\SchedSubj())->setSched($request);
        $data->activity_type = (new \App\models\ActivityType())->activityTypes($data->current_sched->subject->subj_type);
        $data->quarter = (new \App\models\PeriodicSchedule())->byDepartment($data->current_sched->subject->subj_type);
        // dd($data);
        return view('classrecord.create')->with([
            'nav' => ['classrecord', 'create'],
            'data' => $data,
            'sched_id' => $request->sched,
        ]);
    }

    public function edit(Request $request){
        $data = (object)(new \App\models\SchedSubj())->setSched($request);
        $data->activity_type = (new \App\models\ActivityType())->activityTypes($data->current_sched->subject->subj_type);
        $data->quarter = (new \App\models\PeriodicSchedule())->byDepartment($data->current_sched->subject->subj_type);
        // dd($data);
        return view('classrecord.create')->with([
            'nav' => ['classrecord', 'create'],
            'data' => $data,
            'sched_id' => $request->sched,
        ]);
    }

    public function store(Request $request){
        // dd($request->all());
        $activity = new \App\models\Activity;
        $activity->activity_type = $request->activity_type;
        $activity->activity_date = $request->activity_date;
        $activity->quarter = $request->quarter;
        $activity->overall_score = $request->overall_score;
        $activity->ss_id = $request->ss_id;
        $activity->save();

        foreach ($request->student as $key => $value) {
            $agrade = new \App\models\ActivityGrade;
            $agrade->activity_id = $activity->activity_id;
            $agrade->student_id = $key;
            $agrade->score = $value;
            $agrade->save();
        }
        Session::flash('success', 'Activity has been saved');
        return redirect(route('activities',['sched'=>$request->ss_id]));
    }

    public function show(Request $request, $id){
        $data = (object)(new \App\models\SchedSubj())->setSched($request);
        $data->quarter = (new PeriodicSchedule())->current($data->current_sched, $request->quarter);
        $data->activities = (object)(new \App\models\Activity())->activities($request, $data->current_sched, $data->quarter['current']->psched_id);
        $data->activity = Activity::with(['activity_grades', 'activity_grades.student', 'activity_grades.student.stud_per_info'])->find($id);
        // dd($data);
        return view('classrecord.show')->with([
            'nav' => ['classrecord', 'activities'],
            'data' => $data,
            'sched_id' => $request->sched,
            'activity' => $request->activity,
        ]);
    }

}
