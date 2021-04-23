<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ActivityGrade extends Model
{
    use HasFactory;
    protected $primaryKey = 'agrade_id';

    public function student(){
        return $this->belongsTo(StudSchInfo::class, 'student_id');
    }
}
