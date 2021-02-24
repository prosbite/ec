@extends('master')

@section('content')
<!-- /////////////////////////////// SCHEDULE CONTAINER /////////////////////////////////// -->
@if($data->current_sched)
<div class="schedule-container">
    <div class="top">
        <span class="c-type">{{$data->current_sched->subject->subj_type}}</span>
    </div>
    <div class="mid">
        <div class="btn-group">
            <span class="dropdown-toggle subject-name" data-toggle="dropdown" aria-expanded="false">{{$data->current_sched->subject->subj_name}}</span>
            <ul class="dropdown-menu">
                @if((sizeof($data->sched)) > 0)
                    @foreach($data->sched as $sched)
                        <li>
                            <a href="{{route('attendance.today',['sched'=>$sched->ss_id])}}">
                            <b><span class="subj">{{$sched->subject->subj_name}}</span></b>
                            <span class="sched">{{$sched->lec(true)}}</span>
                            @if(isset($sched->subj_sched_day[0]))
                                @if($sched->subj_sched_day[0]->today())
                                <span class="today">Today</span>
                                @endif
                            @endif
                            </a>
                        </li>
                    @endforeach
                @endif
                <!-- <li>
                    <a href="javascript:;">
                    <span class="subj">Database Management 2</span>
                    <span class="sched">WS 8:00 - 9:30 AM</span>
                    </a>
                </li> -->
            </ul>
        </div>
    </div>
    <div class="bot">
        <!-- BEGIN lab or lec dropdown -->
        @if($data->current_sched->hasLab())
        <div class="btn-group">
            <button class="btn blue btn-xs dropdown-toggle leclab-btn" type="button" data-toggle="dropdown">
            Lec <i class="fa fa-angle-down"></i>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li>
                    <a href="javascript:;">
                    Lab </a>
                </li>
            </ul>
        </div>
        @endif
        <!-- END lec or lab dropdown -->
        <!-- BEGIN day & time schedule -->
        <div class="daytime">
            <span><i class="fa fa-calendar"></i>{{$data->current_sched->lec(true)}}</span>
        </div>
         <!-- BEGIN day & time schedule -->
         <div class="student-count">
            <span><i class="fa fa-user"></i>{{sizeof($data->current_sched->subject_enrolled)}}</span>
        </div>
    </div>
</div>
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
                        <li class="today">
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
                        @if(formatDate($attendance->att_date, 'y-m-d') != date('y-m-d'));
                        <li class="{{navigate($attendance->att_id, $data->attendance->current->att_id)}}">
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
                    <span class="caption-subject uppercase">{{formatDate($data->attendance->current->att_date,'D, d M Y')}}</span>
                    <span class="caption-helper"></span>
                </div>
                <div class="actions">
                    <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title="">
                    </a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="task-content">             
                    <attendance-check d_attendance="{{json_encode($data->attendance->current)}}" d_students="{{json_encode(prepAttendance($data->current_sched->subject_enrolled))}}"></attendance-check>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- /////////////////////////////// LIST OF ATTENDANCE /////////////////////////////////// -->



@stop