<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RatePercentageSubj extends Model
{
    protected $table = 'curriculum_final.rate_percentage_subj';
    protected $primaryKey = 'rns_id';
    use HasFactory;

    public function wwPercentage($subject_id){
        $result = $this->where('subj_id', $subject_id)->where('rn_id', 1)->first();
        if($result) {
            return $result->rate_num;
        }
        return 0;
    }
    public function ptPercentage($subject_id){
        $result = $this->where('subj_id', $subject_id)->where('rn_id', 2)->first();
        if($result) {
            return $result->rate_num;
        }
        return 0;
    }
}
