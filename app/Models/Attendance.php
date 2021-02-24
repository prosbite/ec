<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Attendance extends Model
{
    use HasFactory;
    protected $primaryKey = 'att_id';

    public function today($sched_id, $type, $att){
        $data = (object)[];
        $data->all = $this->with('student_attendances', 'student_attendances.remarks')->where('att_sched', $sched_id)->where('type', $type)->orderBy('att_date','DESC')->get();
        $data->today = $this->with('student_attendances', 'student_attendances.remarks')->where('att_sched', $sched_id)->whereDate('att_date', Carbon::today())->first();
        if($att){
            $data->current = $this->with('student_attendances', 'student_attendances.remarks')->find($att);
        }
        return $data;
    }

    public function student_attendances(){
        return $this->hasMany(StudentAttendance::class, 'att_id');
    }

    public function totalPresent(){
        $count = 0;
        foreach ($this->student_attendances as $key => $value) {
            if($value->att_status == 'present'){
                $count++;
            }
        }
        return $count;
    }

    public function totalAbsent(){
        $count = 0;
        foreach ($this->student_attendances as $key => $value) {
            if($value->att_status == 'absent'){
                $count++;
            }
        }
        return $count;
    }

    public function totalLate(){
        $count = 0;
        foreach ($this->student_attendances as $key => $value) {
            if($value->att_status == 'late'){
                $count++;
            }
        }
        return $count;
    }
}
