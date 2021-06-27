<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Auth;

class SchedSubj extends Model
{
    use HasFactory;
    const COLLEGE = 'College';
    const SH = 'Senior High';
    protected $table = 'curriculum_final.sched_subj';
    protected $primaryKey = 'ss_id';
    protected $sched;

    // RELATIONSHIPS
    public function subject(){
        return $this->belongsTo(Subject::class, 'subj_id');
    }

    public function subj_sched_day(){
        return $this->hasMany(SubjSchedDay::class, 'ss_id');
    }

    public function subject_enrolled(){
        return $this->hasMany(SubjectEnrolled::class, 'ss_id');
    }

    // GETTERS
    public function getSubjSchedDay(){
        return $this->subj_sched_day;
    }

    // CORE FUNCTIONS
    public function setSched($request){
        $data = [];
        $data['current_sched'] = null;
        $data['sched'] = (new \App\models\SchedSubj())->mySched(Auth::user()->employment_id);
        // dd($data['sched']);
        if(isset($request->sched)){
            $data['current_sched'] = (new \App\models\SchedSubj())->findSched($request->sched);
            $data['current_sched']->subject_enrolled = $this->studentSort((array)$data['current_sched']->subject_enrolled);
        }else{
            if(sizeof($data['sched']) > 0){
                $data['current_sched'] = $data['sched'][0];
            }
        }
        
        return $data;
    }

    public function mySched($teacher){
        return $this->with('subject_enrolled', 
                'subject_enrolled.stud_sch_info',
                'subject_enrolled.stud_sch_info.stud_per_info',  
                'subject','subj_sched_day', 
                'subj_sched_day.sched_day')->where('employee_id', $teacher)->get();
    }

    public function findSched($id) {
        return $this->with('subject_enrolled', 
                'subject_enrolled.stud_sch_info',
                'subject_enrolled.stud_sch_info.stud_per_info',  
                'subject','subj_sched_day', 
                'subj_sched_day.sched_day')->where('ss_id', $id)->first();
    }

    public function lec($format=false){
        $sched = $this->getSubjSchedDay();
        return $this->leclab('lec', $sched, $format);
    }

    public function lab($format=false){
        $sched = $this->getSubjSchedDay();
    }

    public function studentSort($students){
        usort($students, 'studentSort');
        return $students[0];
    }
      

    // UTILITY FUNCTIONS
    public function hasLab(){
        $sched = $this->getSubjSchedDay();
        foreach ($sched as $key => $value) {
            if($value->type == 'lab'){
                return true;
            }
        }
        return false;
    }

    public function hasLec(){
        $sched = $this->getSubjSchedDay();
        foreach ($sched as $key => $value) {
            if($value->type == 'lec'){
                return true;
            }
        }
        return false;
    }

    private function leclab($type, $sched, $format=true){
        $data = [];
        $days = ['M','T','W','TH','F','S'];
        foreach ($sched as $key => $value) {
            if($value->type == $type){
                $data[] = $value;
            }
        }
        if($format){
            if(sizeof($data) > 1){
                if($this->sameTime($data)){
                    $result = '';
                    foreach ($days as $key => $value) {
                        foreach ($data as $key2 => $value2) {
                            if($value == $value2->sched_day->abbreviation){
                                $result .= $value;
                            }
                        }
                    }
                    $result .= ' ' . date('h:iA', strtotime($data[0]->time_start)) . ' - ' . date('h:iA', strtotime($data[0]->time_end));
                    return $result;
                }else{
                    $result = '';
                    foreach ($data as $key => $value) {
                        if($key == 0){
                            $result .= $value->sched_day->composition . ' ' . date('h:iA', strtotime($value->time_start)) . '-' . date('h:iA', strtotime($value->time_end));
                        }else{
                            $result .= ', ' . $value->sched_day->composition . ' ' . date('h:iA', strtotime($value->time_start)) . '-' . date('h:iA', strtotime($value->time_end));
                        }
                    }
                    return $result;
                }
            } else {
                return $data[0]->sched_day->composition . ', ' . date('h:iA', strtotime($data[0]->time_start)) . ' - ' . date('h:iA', strtotime($data[0]->time_end));
            }
        }
        return $data;
    }

    private function sameTime($sched){
        if(sizeof($sched) > 0){
            $time = $sched[0]->time_start;
            foreach ($sched as $key => $value) {
                if($time != $value->time_start){
                    return false;
                }
            }
        }
        return true;
    }

}
