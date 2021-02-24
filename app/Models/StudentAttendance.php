<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentAttendance extends Model
{
    use HasFactory;
    protected $primaryKey = 'sa_id';
    protected $table = 'student_attendance';

    public function attendance(){
        return $this->belongsTo(Attendance::class, 'att_id');
    }

    public function remarks(){
        return $this->hasMany(AttendanceRemark::class, 'sa_id');
    }
}
