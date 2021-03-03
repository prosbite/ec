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

    public function studFirstName(){
        if(isset($this->stud_sch_info->stud_per_info->fname)){
            return $this->stud_sch_info->stud_per_info->fname;
        }
        return '';
    }
    public function studMiddleName(){
        if(isset($this->stud_sch_info->stud_per_info->mname)){
            return $this->stud_sch_info->stud_per_info->mname;
        }
        return '';
    }
    public function studLastName(){
        if(isset($this->stud_sch_info->stud_per_info->lname)){
            return $this->stud_sch_info->stud_per_info->lname;
        }
        return '';
    }
    public function studFullName(){
        if(isset($this->studMiddleName()[0])){
            return $this->studLastName() . ', ' . $this->studFirstName() . ' ' . $this->studMiddleName()[0] . '.';
        }
        return $this->studLastName() . ', ' . $this->studFirstName();
    }
}
