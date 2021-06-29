<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PeriodicSchedule extends Model
{
    use HasFactory;
    protected $primaryKey = 'psched_id';
    protected $table = 'periodic_schedule';

    public function current($sched, $quarter){
        $data = (object)[];
        $subj = SchedSubj::with('subject')->find($sched->ss_id);
        $psched = $this->byDepartment($subj->subject->subj_type);
        $activities = Activity::where('ss_id', $sched->ss_id)->orderBy('activity_date', 'DESC')->get();
        $data->quarters = $psched;
        // dd($data);
        if(!$quarter){
            if(sizeof($activities) == 0){
                $data->current = $psched[0];
            }else{
                $data->current = $this->find($activities[0]->quarter);
            }
        }else{
            $data->current = $this->find($quarter);
        }    
        return (array)$data;
    }

    public function byDepartment($dep){
        return $this->where('department', $dep)->orderBy('sort', 'ASC')->get();
    }
}
