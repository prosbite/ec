<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employment extends Model
{
    protected $table = 'dtrps.employment';
    protected $primaryKey = 'employment_id';
    use HasFactory;

    public function employee(){
        return $this->belongsTo(Employee::class,'employee_id');
    }
}
