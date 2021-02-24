<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubjectEnrolled extends Model
{
    use HasFactory;
    protected $table = 'sis_main_db.subject_enrolled';
    protected $primaryKey = 'se_id';

    public function sched_subj() {
        return $this->belongsTo(SchedSubj::class, 'ss_id');
    }
    public function stud_sch_info() {
        return $this->belongsTo(StudSchInfo::class, 'ssi_id');
    }
}
