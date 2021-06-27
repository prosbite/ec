<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PeriodicSchedule;

class GradesController extends Controller
{
    public function index(Request $request){
        $quarter = $request->quarter;
        $data = (object)(new \App\models\SchedSubj())->setSched($request);
        $data->quarter = (new PeriodicSchedule())->current($data->current_sched, $request->quarter);
        $data->activities = (object)(new \App\models\Activity())->activitiesWidthGrades($request, $data->current_sched, $data->quarter['current']->psched_id);
        // foreach ($data->activities as $key => $value) {
        //     $data->activities[$key]->grades = \App\models\Activity::with(['activity_grades', 'activity_grades.student', 'activity_grades.student.stud_per_info'])->find($value->activity_id);
        // }
        // dd($data);
        return view('classrecord.grades')->with([
            'nav' => ['classrecord', 'grading'],
            'data' => $data,
            'sched_id' => $request->sched,
            'quarter' => $quarter,
        ]);
    }
}
