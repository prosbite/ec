<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttendanceRemark extends Model
{
    use HasFactory;
    protected $primaryKey = 'ar_id';
    protected $dates = ['remark_date'];

    public function student_attendance(){
        return $this->belongsTo(StudentAttendance::class, 'sa_id');
    }

    public function getRemarkDateAttribute($value){
        return \Carbon\Carbon::parse($value)->diffForHumans();
    }
}
