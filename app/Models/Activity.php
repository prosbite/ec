<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Activity extends Model
{
    use HasFactory;
    protected $primaryKey = 'activity_id';

    public function activityType(){
        return $this->belongsTo(ActivityType::class, 'activity_type');
    }

    public function activity_grades(){
        return $this->hasMany(ActivityGrade::class, 'activity_id');
    }

    public function activities($request, $sched, $quarter){
        if($request->sched){
            return $this->with('activityType')->where('ss_id', $request->sched)->where('quarter', $quarter)->get();
        }
        return $this->with('activityType')->where('ss_id', $sched->ss_id)->where('quarter', $quarter)->get();
    }
}
