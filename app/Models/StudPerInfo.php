<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudPerInfo extends Model
{
    use HasFactory;
    protected $table = 'sis_main_db.stud_per_info';
    protected $primaryKey = 'spi_id';

    public function stud_sch_info(){
        return $this->hasOne(StudSchInfo::class, 'spi_id');
    }
}
