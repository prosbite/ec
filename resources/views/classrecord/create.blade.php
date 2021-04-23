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
                            <a href="{{route('activity.create',['sched'=>$sched->ss_id])}}">
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



<!-- /////////////////////////////// LIST OF ATTENDANCE /////////////////////////////////// -->
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-equalizer font-red-sunglo"></i>
                    <span class="caption-subject font-red-sunglo bold uppercase">ADD NEW ACTIVITY</span>
                </div>
            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form method="post" action="{{route('activity.store',['ss_id'=>$data->current_sched->ss_id])}}" class="form-horizontal">
                    @csrf
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label">Type of Activity</label>
                            <div class="col-md-4">
                                <select name="activity_type" id="atype" class="form-control">
                                    @foreach($data->activity_type as $atype)
                                        <option value="{{$atype->atype_id}}">{{$atype->atype_name}}</option>
                                    @endforeach
                                    <!-- <option value="Exam">Exam</option> -->
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Date of Activity</label>
                            <div class="col-md-4">
                                <input type="date" name="activity_date" class="form-control" required placeholder="Activity Date">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Period / Quarter</label>
                            <div class="col-md-4">
                                <select name="quarter" id="atype" class="form-control">
                                    @foreach($data->quarter as $quarter)
                                        <option value="{{$quarter->psched_id}}">{{$quarter->sched_name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Overall Score</label>
                            <div class="col-md-4">
                                <input type="number" name="overall_score" id="overallScore" class="form-control" required placeholder="Overall Score">
                            </div>
                        </div>
                    </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <th style="padding-top:25px;padding-bottom:25px;">#</th>
                                        <th style="padding-top:25px;padding-bottom:25px;">Learner's Name</th>
                                        <th style="padding-top:25px;padding-bottom:25px;width:75px!important;">Score</th>
                                    </thead>
                                    <tbody id="studentScores">
                                        @foreach($data->current_sched->subject_enrolled as $key => $student)
                                        <tr>
                                            <td style="width:75px!important;">{{prepZero($key + 1)}}</td>
                                            <td>{{$student->studFullName()}}</td>
                                            <td style="width:75px!important;"><input name="student[{{$student->stud_sch_info->ssi_id}}]" style="width:75px!important;text-align:center;" type="number" class="form-control input-sm student-input" required></td>
                                        </tr>
                                        @endforeach
                                        <!-- <tr>
                                            <td>02</td>
                                            <td>Anduyan, Gian Carl D.</td>
                                            <td style="width:75px!important;"><input style="width:75px!important;text-align:center;" type="number" class="form-control input-sm"></td>
                                        </tr> -->
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green">Save Activity</button>
                                <a href="{{route('activities',['sched'=>$sched_id])}}" class="btn default">Go Back</a>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>
</div>


@stop


@section('script')

<script>
    $(document).ready(function(){
        $('#studentScores').keyup(function(e){
            if(e.target.className == 'form-control input-sm student-input'){
                let overall = $('#overallScore').val();
                if(!overall){
                    alert('Overall Score has not been set.');
                }
                if(e.target.value > overall){
                    e.target.value = overall;
                }
                if(e.target.value < 0){
                    e.target.value = 0;
                }
            }
        });
    });
</script>

@stop