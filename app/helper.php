<?php 
function pp($result){
	echo "<pre>";
	print_r($result);
	echo "<pre>";
}

function formatDate($date, $format = "Y-m-d") {
    $date = strtotime($date);
    return date($format, $date);
}

function checkEmpty($elem){
	if(empty($elem)){
		return null;
	}
	return $elem;
}

function pickFirst($arr){
	if(!empty($arr)){
		return $arr[0];
	}
	return null;
}

function randString($count){
	$alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	$str = '';
	for($i=0; $i < $count; $i++){
		$str .= $alpha[rand(0, strlen($alpha)-1)];
	}
	return $str;
}

function getDateForSpecificDayBetweenDates($startDate,$endDate,$day_number){
	$endDate = strtotime($endDate);
	$days=array('1'=>'Monday','2' => 'Tuesday','3' => 'Wednesday','4'=>'Thursday','5' =>'Friday','6' => 'Saturday','7'=>'Sunday');
	for($i = strtotime($days[$day_number], strtotime($startDate)); $i <= $endDate; $i = strtotime('+1 week', $i))
	$date_array[]=date('Y-m-d',$i);

	return $date_array;
}

function mi($mi) {
	if(isset($mi[0])){
		return $mi[0];
	}
	return "";
}

function concat($str, $limit){
	if(strlen($str) > $limit){
		return substr($str, 0, $limit) . "...";
	}
	return $str;
}

function username($employee, $old){
	if($old){
		return $old;
	}
	if(isset($employee->employee_fname)){
		return strtolower($employee->employee_lname . $employee->employee_fname[0]);
	}
	return "";
}

function singleOut($students, $var){
	$arr = [];
	$result = [];
	foreach($students as $key => $student){
		if(!in_array($student->{$var}, $arr)){
			$arr[] = $student->{$var};
			$result[] = $student;
		}
	}
	return $result;
}

function navigate($nav1, $nav2){
	if($nav1 == $nav2){
		return 'active';
	}
	return '';
}

function studentSort($x, $y) {
	return strcasecmp($x->stud_sch_inf->stud_per_info->lname, $y->stud_sch_inf->stud_per_info->lname);
}

function prepZero($value){
	return sprintf("%02d", $value);
}

function prepAttendance($students){
	foreach ($students as $key => $value) {
		$students[$key]->attendance = (object)['att_status'=>'present'];
	}
	return $students;
}

function studentFullName($stud){
	$data = $stud->lname . ", " . $stud->fname;
	if(isset($stud->mname[0])){
		return $data . " " . strtoupper($stud->mname)[0] . ".";
	}
	return $data;
}

function fullMonth($month){
	return formatDate('2020-'.$month.'-01', 'F');
}

function ps($val1, $val2) {
	if($val2 > 0){
		return round(($val1 / $val2) * 100, 1);
	}
	return 0;
}

function ws($val1, $val2) {
	return round($val1 * ($val2 * 0.01), 1);
}

function finalGrade($val){
	return round(($val * .25), 1);
}

function calcFinalGrade($grades) {
	return round((finalGrade($grades->first_quarter) + finalGrade($grades->second_quarter) + finalGrade($grades->third_quarter) + finalGrade($grades->fourth_quarter)), 1);
}

function textToVar($text){
	return strtolower(str_replace(" ", "_", $text));
}

function transmuteGrade ($grade){
	if($grade == 100){
		return 100.0;
	}
	if($grade >= 98.40 && $grade <= 99.99){
		return 99;
	}
	if($grade >= 96.80 && $grade <= 98.39){
		return 98;
	}
	if($grade >= 95.20 && $grade <= 96.79){
		return 97;
	}
	if($grade >= 93.60 && $grade <= 95.19){
		return 96;
	}
	if($grade >= 92.00 && $grade <= 93.59){
		return 95;
	}
	if($grade >= 90.40 && $grade <= 91.99){
		return 94;
	}
	if($grade >= 88.80 && $grade <= 90.39){
		return 93;
	}
	if($grade >= 87.20 && $grade <= 88.79){
		return 92;
	}
	if($grade >= 85.60 && $grade <= 87.19){
		return 91;
	}
	if($grade >= 84.00 && $grade <= 85.59){
		return 90;
	}
	if($grade >= 82.40 && $grade <= 83.99){
		return 89;
	}
	if($grade >= 80.80 && $grade <= 82.39){
		return 88;
	}
	if($grade >= 79.20 && $grade <= 80.79){
		return 87;
	}
	if($grade >= 77.60 && $grade <= 79.19){
		return 86;
	}
	if($grade >= 76.60 && $grade <= 77.59){
		return 85;
	}
	if($grade >= 74.40 && $grade <= 75.99){
		return 84;
	}
	if($grade >= 72.80 && $grade <= 74.39){
		return 83;
	}
	if($grade >= 71.20 && $grade <= 72.79){
		return 82;
	}
	if($grade >= 69.60 && $grade <= 71.19){
		return 81;
	}
	if($grade >= 68.00 && $grade <= 69.59){
		return 80;
	}
	if($grade >= 66.40 && $grade <= 67.99){
		return 79;
	}
	if($grade >= 64.80 && $grade <= 66.39){
		return 78;
	}
	if($grade >= 63.20 && $grade <= 64.79){
		return 77;
	}
	if($grade >= 61.60 && $grade <= 63.19){
		return 76;
	}
	if($grade >= 60.00 && $grade <= 61.59){
		return 75;
	}
	if($grade >= 56.00 && $grade <= 59.99){
		return 74;
	}
	if($grade >= 52.00 && $grade <= 55.99){
		return 73;
	}
	if($grade >= 48.00 && $grade <= 51.99){
		return 72;
	}
	if($grade >= 44.00 && $grade <= 47.99){
		return 71;
	}
	if($grade >= 40.00 && $grade <= 43.99){
		return 70;
	}
	if($grade >= 36.00 && $grade <= 39.99){
		return 69;
	}
	if($grade >= 32.00 && $grade <= 35.99){
		return 68;
	}
	if($grade >= 28.00 && $grade <= 31.99){
		return 67;
	}
	if($grade >= 24.00 && $grade <= 27.99){
		return 66;
	}
	if($grade >= 20.00 && $grade <= 23.99){
		return 65;
	}
	if($grade >= 16.00 && $grade <= 19.99){
		return 64;
	}
	if($grade >= 12.00 && $grade <= 15.99){
		return 63;
	}
	if($grade >= 8.00 && $grade <= 11.99){
		return 62;
	}
	if($grade >= 4.00 && $grade <= 7.99){
		return 61;
	}
	if($grade >= 0 && $grade <= 3.99){
		return 60;
	}
}