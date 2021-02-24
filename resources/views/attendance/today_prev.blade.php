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
                        <li class="today active">
                            <span class="att-num">01</span>
                            <div class="right">
                                <a href="{{route('attendance.today')}}" class="date">TODAY</a>
                                <div class="bot">
                                    <span class="present"><i class="fa fa-check"></i>24</span>
                                    <span class="absent"><i class="fa fa-times"></i>3</span>
                                    <span class="late"><i class="fa fa-clock-o"></i>2</span>
                                </div>
                            </div>
                        </li>
                        @foreach($data->attendance->all as $attKey => $attendance)
                        <li class="{{navigate($attendance->att_id, $att_id)}}">
                            <span class="att-num">{{prepZero($attKey + 2)}}</span>
                            <div class="right">
                                <a href="{{route('attendance.today', ['sched'=>$sched_id, 'att'=>$attendance->att_id])}}" class="date">{{formatDate($attendance->att_date, 'D, d M Y')}}</a>
                                <div class="bot">
                                    <span class="present"><i class="fa fa-check"></i>24</span>
                                    <span class="absent"><i class="fa fa-times"></i>3</span>
                                    <span class="late"><i class="fa fa-clock-o"></i>2</span>
                                </div>
                            </div>
                        </li>
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
                    <span class="caption-subject uppercase">03 - Wed, 23 Aug 2020</span>
                    <span class="caption-helper"></span>
                </div>
                <div class="actions">
                    <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title="">
                    </a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="task-content">
                    @if($att_id)
                    <attendance-check d_attendance="{{json_encode($data->attendance->current)}}" d_students="{{json_encode($data->current_sched->subject_enrolled)}}"></attendance-check>
                    @else
                    <attendance-check-today d_attendance="{{json_encode($data->attendance->today)}}" d_students="{{json_encode($data->current_sched->subject_enrolled)}}"></attendance-check-today>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>

<!-- /////////////////////////////// LIST OF ATTENDANCE /////////////////////////////////// -->



@stop