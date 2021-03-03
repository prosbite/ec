@extends('master')

@section('content')
<!-- /////////////////////////////// SCHEDULE CONTAINER /////////////////////////////////// -->
@if($data->current_sched)
@include('inc.sched')
@endif

<div class="row">
    <div class="col-md-4">
        <div class="portlet light tasks-widget">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-share font-green-haze hide"></i>
                    <span class="caption-subject uppercase">Attendance List</span>
                    <span class="caption-helper"></span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="task-content">
                   <ul class="attendance-list">
                        <li class="today active">
                            <span class="att-num">01</span>
                            <div class="right">
                                <a href="{{route('attendance.today',['sched'=>$sched_id])}}" class="date">TODAY</a>
                                <div class="bot">
                                    <span class="present"><i class="fa fa-check"></i>{{$data->attendance->today? $data->attendance->today->totalPresent() : 0}}</span>
                                    <span class="absent"><i class="fa fa-times"></i>{{$data->attendance->today? $data->attendance->today->totalAbsent() : 0}}</span>
                                    <span class="late"><i class="fa fa-clock-o"></i>{{$data->attendance->today? $data->attendance->today->totalLate() : 0}}</span>
                                </div>
                            </div>
                        </li>
                        @foreach($data->attendance->all as $attKey => $attendance)
                        @if(formatDate($attendance->att_date, 'y-m-d') != date('y-m-d'))
                        <li>
                            <span class="att-num">{{prepZero($attKey + 2)}}</span>
                            <div class="right">
                                <a href="{{route('attendance.solo',['id'=>$attendance->att_id, 'sched'=>$attendance->att_sched])}}" class="date">{{formatDate($attendance->att_date, 'D, d M Y')}}</a>
                                <div class="bot">
                                    <span class="present"><i class="fa fa-check"></i>{{$attendance->totalPresent()}}</span>
                                    <span class="absent"><i class="fa fa-times"></i>{{$attendance->totalAbsent()}}</span>
                                    <span class="late"><i class="fa fa-clock-o"></i>{{$attendance->totalLate()}}</span>
                                </div>
                            </div>
                        </li>
                        @endif
                        @endforeach
                        <!-- <li>
                            <span class="att-num">02</span>
                            <div class="right">
                                <a href="#" class="date">Tue, 22 Aug 2020</a>
                                <div class="bot">
                                    <span class="present"><i class="fa fa-check"></i>24</span>
                                    <span class="absent"><i class="fa fa-times"></i>3</span>
                                    <span class="late"><i class="fa fa-clock-o"></i>2</span>
                                </div>
                            </div>
                        </li>

                        <li>
                            <span class="att-num">01</span>
                            <div class="right">
                                <a href="#" class="date">Mon, 21 Aug 2020</a>
                                <div class="bot">
                                    <span class="present"><i class="fa fa-check"></i>24</span>
                                    <span class="absent"><i class="fa fa-times"></i>3</span>
                                    <span class="late"><i class="fa fa-clock-o"></i>2</span>
                                </div>
                            </div>
                        </li> -->
                   </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-8">
        <div class="portlet light tasks-widget">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-share font-green-haze hide"></i>
                    <span class="caption-subject uppercase">{{date('D, d M Y')}}</span>
                    <span class="caption-helper"></span>
                </div>
                <div class="actions">
                    <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title="">
                    </a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="task-content">
                    <form style="min-height:300px;" action="{{!$data->attendance->today? route('attendance.store',['sched'=>$data->current_sched->ss_id]) : route('attendance.update',['sched'=>$data->current_sched->ss_id])}}" method="post" style="overflow:hidden">
                        @csrf
                        @if($data->attendance->today)
                        <input type="hidden" name="att_id" value="{{$data->attendance->today->att_id}}">
                        @endif
                        <attendance-check-today d_attendance="{{json_encode($data->attendance->today)}}" d_students="{{json_encode(prepAttendance($data->current_sched->subject_enrolled))}}"></attendance-check-today>
                        <button class="btn btn-warning btn-circle pull-right">Save Attendance</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- /////////////////////////////// LIST OF ATTENDANCE /////////////////////////////////// -->



@stop