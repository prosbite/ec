<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PeriodicSchedule;
use App\Models\RatePercentageSubj;

class GradesController extends Controller
{
    public function index(Request $request){
        $quarter = $request->quarter;
        $showFinal = $request->show;
        $data = (object)(new \App\models\SchedSubj())->setSched($request);
        $data->quarter = (new PeriodicSchedule())->current($data->current_sched, $request->quarter);
        $data->activities = (object)(new \App\models\Activity())->activitiesWithGrades($request, $data->current_sched, $data->quarter['current']->psched_id);
        $data->tl['ww'] = $this->TL([], $data->activities, 'activity_ww', $data);
        $data->tl['pt'] = $this->TL([], $data->activities, 'activity_pt', $data);
        $data->ws['ww'] = (new RatePercentageSubj())->wwPercentage($data->current_sched->subject->subj_id);
        $data->ws['pt'] = (new RatePercentageSubj())->ptPercentage($data->current_sched->subject->subj_id);
        $data->stud_tl = $this->TL($data->current_sched->subject_enrolled, $data->activities, 'student_tl', $data);
        $data->finalGrade = $this->calculateFinalGrade($request, $data);
        // dd($data->finalGrade);
        return view('classrecord.grades')->with([
            'nav' => ['classrecord', 'grading'],
            'data' => $data,
            'sched_id' => $request->sched,
            'quarter' => $quarter,
            'showFinal' => $showFinal,
        ]);
    }

    private function calculateFinalGrade($request, $data){
        $quarter = (new \App\models\PeriodicSchedule())->byDepartment($data->current_sched->subject->subj_type);
        $activities = [];
        $result = [];
        foreach ($data->current_sched->subject_enrolled as $skey => $svalue) {
            $stud = (object)[];
            $stud->student_id = $svalue->stud_sch_info->ssi_id;
            foreach ($quarter as $key => $value) {
                $activities[] = (object)(new \App\models\Activity())->activitiesWithGrades($request, $data->current_sched, $value->psched_id);
                if(sizeof($activities[$key]) > 0){
                    $stud->{textToVar($value->sched_name)} = $this->quarterlyGrade($svalue, $activities[$key],$data->ws['ww'],$data->ws['pt']);                 
                }else{
                    $stud->{textToVar($value->sched_name)} = 0;
                }
            }
            $result[] = $stud;
        }
        return $result;     
    }

    private function quarterlyGrade($student, $activities, $wwPercentage, $ptPercentage){
        $atlww = 0;
        $atlpt = 0;
        $stlww = 0;
        $stlpt = 0;
        $wwws = 0;
        $ptws = 0;
        $wwps = 0;
        $ptps = 0;
        foreach ($activities as $key => $value) {
            if($value->activity_type == 8 || $value->activity_type == 11){
                $atlww += $value->overall_score;
                foreach ($value->activity_grades as $skey => $svalue) {
                    if($student->ssi_id == $svalue->student_id){
                        $stlww += $svalue->score;
                    }
                }
            }
            if($value->activity_type == 9 || $value->activity_type == 12){
                $atlpt += $value->overall_score;
                foreach ($value->activity_grades as $skey => $svalue) {
                    if($student->ssi_id == $svalue->student_id){
                        $stlpt += $svalue->score;
                    }
                }
            }
        }
        $wwps = ps($stlww, $atlww);
        $ptps = ps($stlpt, $atlpt);
        $wwws = ws($wwps, $wwPercentage);
        $ptws = ws($ptps, $ptPercentage);
        return $wwws + $ptws;
    }

    private function TL($students, $activities, $type, $data){
        $tlCount = 0;
        if($type == 'activity_ww'){
            foreach ($activities as $key => $value) {
                if($value->activity_type == 8 || $value->activity_type == 11){
                    $tlCount += $value->overall_score;
                }
            }
            return $tlCount;
        }
        if($type == 'activity_pt'){
            foreach ($activities as $key => $value) {
                if($value->activity_type == 9 || $value->activity_type == 12){
                    $tlCount += $value->overall_score;
                }
            }
            return $tlCount;
        }

        if(sizeof($students) > 0){
            $grades = [];
            foreach ($students as $key => $value) {
                $studData = (object)[];
                $studData->ww['tl'] = 0;
                $studData->pt['tl'] = 0;
                $studData->student_id = $value->stud_sch_info->ssi_id;
                foreach ($activities as $key2 => $value2) {
                    if($value2->activity_type == 8 || $value2->activity_type == 11){
                        foreach ($value2->activity_grades as $key3 => $value3) {
                            if($value3->student_id == $value->stud_sch_info->ssi_id){
                                $studData->ww['tl'] += $value3->score;
                            }
                        }
                    }
                    if($value2->activity_type == 9 || $value2->activity_type == 12){
                        foreach ($value2->activity_grades as $key3 => $value3) {
                            if($value3->student_id == $value->stud_sch_info->ssi_id){
                                $studData->pt['tl'] += $value3->score;
                            }
                        }
                    }
                }
                // dd($data);
                $studData->ww['ps'] = ps($studData->ww['tl'],  $data->tl['ww']);
                $studData->pt['ps'] = ps($studData->pt['tl'],  $data->tl['pt']);
                $studData->ww['ws'] = ws($studData->ww['ps'], $data->ws['ww']);
                $studData->pt['ws'] = ws($studData->pt['ps'], $data->ws['pt']);
                $grades[] = $studData;
            }
            return $grades;
        }
    }
}
