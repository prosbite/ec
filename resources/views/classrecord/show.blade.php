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
                            <a href="{{route('activities',['sched'=>$sched->ss_id])}}">
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

        <div class="quarter-dd">
            <div class="btn-group">
                </button>
                <span type="button" data-toggle="dropdown"><i class="fa fa-clock-o"></i>{{$data->quarter['current']->sched_name}} <i class="fa fa-caret-down"></i></span>
                <ul class="dropdown-menu" role="menu">
                    @foreach($data->quarter['quarters'] as $quarter)
                    <li>
                        <a href="{{route('activities',['sched'=>$sched_id,'quarter'=>$quarter->psched_id])}}">
                        {{$quarter->sched_name}} </a>
                    </li>
                    @endforeach
                    <!-- <li>
                        <a href="javascript:;">
                        Another action </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                        Something else here </a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="javascript:;">
                        Separated link </a>
                    </li> -->
                </ul>
            </div>
        </div>
    </div>
</div>
@endif



<!-- /////////////////////////////// LIST OF ATTENDANCE /////////////////////////////////// -->
<div class="row">
    <div class="col-md-4">
        <div class="portlet light tasks-widget">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-share font-green-haze hide"></i>
                    <span class="caption-subject uppercase">Graded Activities</span>
                    <span class="caption-helper"></span>
                </div>
                <div class="actions">
                    <a class="btn btn-circle btn-icon-only btn-default" href="{{route('activity.create',['sched'=>$sched_id])}}" data-original-title="" title=""><i class="fa fa-plus"></i>
                    </a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="task-content">
                    @if(sizeof($data->activities) > 0)
                   <ul class="attendance-list">
                        @foreach($data->activities as $akey => $activity)
                        <li class="">
                            <span class="att-num">{{prepZero($akey + 1)}}</span>
                            <div class="right">
                                <a href="{{route('activity.show',['id'=>$activity->activity_id,'sched'=>$sched_id,'quarter'=>$activity->quarter])}}" class="date">{{$activity->activityType->atype_name}}</a>
                                <div class="bot">
                                   <span>{{formatDate($activity->activity_date, 'D, d M Y')}}</span>
                                </div>
                            </div>
                        </li>
                        @endforeach
                   </ul>
                   @else
                    <center><h4>No activities yet.</h4></center>
                   @endif
                </div>
            </div>
        </div>
    </div>
    @if($activity)
    <div class="col-md-8">
        <div class="portlet light tasks-widget">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-share font-green-haze hide"></i>
                    <span class="caption-subject uppercase">QUIZ - {{date('D, d M Y')}}</span>
                    <span class="caption-helper"></span>
                </div>
                <div class="actions">
                    <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;" data-original-title="" title=""><i class="fa fa-pencil"></i>
                    </a>
                    <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title="">
                    </a>
                </div>
            </div>
            <div class="portlet-body">
                <table class="table table-stripped table-hover">
                    <thead>
                        <th>#</th>
                        <th>Learner's Name</th>
                        <th>Score</th>
                    </thead>
                    <tbody>
                        @foreach($data->current_sched->subject_enrolled as $key => $enrolled)
                        <tr>
                            <td>{{prepZero($key + 1)}}</td>
                            <td>{{studentFullName($enrolled->stud_sch_info->stud_per_info)}}</td>
                            <td>
                                @foreach($data->activity->activity_grades as $agrades)
                                    @if($agrades->student_id == $enrolled->stud_sch_info->ssi_id)
                                        <span>{{$agrades->score}}</span>/{{$data->activity->overall_score}}
                                    @endif
                                @endforeach
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @endif
</div>


@stop