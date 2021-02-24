<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubjSchedDay extends Model
{
    use HasFactory;
    protected $table = 'curriculum_final.subj_sched_day';
    protected $primaryKey = 'ssd_id';

    public function sched_day(){
        return $this->belongsTo(SchedDay::class, 'sd_id');
    }

    public function getSchedDay(){
        return $this->sched_day;
    }

    public function today(){
        $day = $this->getSchedDay();
        if(date('l') == $day->composition){
            return true;
        }
        return false;
    }
}
