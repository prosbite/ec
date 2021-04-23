<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ActivityType extends Model
{
    use HasFactory;
    protected $primaryKey = 'atype_id';

    public function activityTypes($type){
        return $this->where('class_type', $type)->orderBy('order', 'ASC')->get();
    }
}
