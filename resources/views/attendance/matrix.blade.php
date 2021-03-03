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
                        <li class="{{navigate($sched->ss_id, $data->current_sched->ss_id)}}">
                            <a href="{{route('attendance.matrix',['sched'=>$sched->ss_id,'month'=>$month])}}">
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
    <div class="col-md-12">
        <div class="portlet light tasks-widget">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-share font-green-haze hide"></i>
                    <span class="caption-subject uppercase">
                    </span>
                    <span class="caption-helper"></span>
                    <div class="btn-group">
                        <!-- <button class="btn btn-default" type="button" data-toggle="dropdown">
                        February <i class="fa fa-angle-down"></i>
                        </button> -->
                        <span style="color:#888;" type="button" data-toggle="dropdown">MONTH OF <b><a href="javascript:;" >{{strtoupper(fullMonth($month))}}</a></b></span>
                        <ul class="dropdown-menu" role="menu">
                            @foreach($data->attendance->months as $keym => $valuem)
                            <li>
                                <a href="{{route('attendance.matrix',['sched'=>$sched_id, 'month'=>$valuem->month()])}}">
                                {{strtoupper(formatDate($valuem->att_date, 'F'))}} </a>
                            </li>
                            @endforeach
                            <!-- <li>
                                <a href="javascript:;">
                                Another action </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                Something else here </a>
                            </li> -->
                        </ul>
                    </div>
                </div>
                <div class="actions">
                    <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title="">
                    </a>
                </div>
            </div>
            <div class="portlet-body">
                <table class="table table-bordered" style="font-size:13px;">
                    <thead>
                        <th style="width:50px;text-align:center">#</th>
                        <th style="">Learner's Name</th>
                        @foreach($data->attendance->all as $key1 => $value1)
                        <th style="width:75px;"><a href="{{route('attendance.solo',['sched'=>$sched_id,'id'=>$value1->att_id])}}">{{formatDate($value1->att_date, 'M d')}}</a></th>
                        @endforeach
                        <!-- <th>Feb 03</th>
                        <th>Feb 04</th>
                        <th>Feb 05</th>
                        <th>Feb 06</th>
                        <th>Feb 07</th>
                        <th>Feb 08</th>
                        <th>Feb 09</th>
                        <th>Feb 10</th>
                        <th>Feb 11</th>
                        <th>Feb 12</th>
                        <th>Feb 13</th>
                        <th>Feb 14</th> -->
                    </thead>
                    <tbody>
                        @foreach($data->current_sched->subject_enrolled as $key => $value)
                        <tr>
                            <td style="text-align:center">{{$key + 1}}</td>
                            <td>{{$value->studFullName()}}</td>
                            @foreach($data->attendance->all as $key1 => $value1)
                                @foreach($value1->student_attendances as $key2 => $value2)
                                    @if($value->stud_sch_info->ssi_id == $value2->stud_id)
                                        <td>{{$value2->att_status}}</td>
                                    @endif
                                @endforeach
                            @endforeach
                            <!-- <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td> -->
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- /////////////////////////////// LIST OF ATTENDANCE /////////////////////////////////// -->



@stop