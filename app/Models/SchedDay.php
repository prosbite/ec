<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SchedDay extends Model
{
    use HasFactory;
    protected $table = 'curriculum_final.sched_day';
    protected $primaryKey = 'sd_id';
}
