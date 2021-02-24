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
