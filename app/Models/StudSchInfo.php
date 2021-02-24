<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudSchInfo extends Model
{
    use HasFactory;
    protected $table = 'sis_main_db.stud_sch_info';
    protected $primaryKey = 'ssi_id';

    public function subject_enrolled(){
        return $this->hasMany(SubjectEnrolled::class, 'ssi_id');
    }

    public function stud_per_info(){
        return $this->belongsTo(StudPerInfo::class, 'spi_id');
    }
}
