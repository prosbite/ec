<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $table = 'dtrps.employees';
    protected $primaryKey = 'employee_id';
    protected $casts = ['employee_id' => 'string'];
    use HasFactory;

    public function employment(){
        return $this->hasOne(Employment::class, 'employee_id');
    }
    
}
