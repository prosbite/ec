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
                            <a href="{{route('grades',['sched'=>$sched->ss_id, 'quarter'=>$quarter])}}">
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
                    @foreach($data->quarter['quarters'] as $squarter)
                    <li>
                        <a href="{{route('grades',['sched'=>$sched_id,'quarter'=>$squarter->psched_id])}}">
                        {{$squarter->sched_name}} </a>
                    </li>
                    @endforeach
                </ul>
            </div>
        </div>
        @if(!$showFinal)
        <a href="{{route('grades',['sched'=>$data->current_sched->ss_id, 'quarter'=>$quarter, 'show'=>'final'])}}" style="margin-left:auto">Show Final Grade</a>
        @else
        <a href="{{route('grades',['sched'=>$data->current_sched->ss_id, 'quarter'=>$quarter])}}" style="margin-left:auto">Show Quarterly Grade</a>
        @endif
    </div>
</div>
@endif



<!-- /////////////////////////////// LIST OF GRADES /////////////////////////////////// -->
<div class="row">
    <div class="col-md-12">
        @if($showFinal)
        <table class="table table-bordered grade-table">
            <thead>
                <th>#</th>
                <th>Learner's Name</th>
                <th>First Quarter</th>
                <th>Second Quarter</th>
                <th>Third Quarter</th>
                <th>Fourth Quarter</th>
                <th>Initial Grade</th>
                <th>Final Grade</th>
            </thead>
            <tbody>
                @foreach($data->current_sched->subject_enrolled as $key => $enrolled)
                <tr>
                    <td>{{prepZero($key + 1)}}</td>
                    <td>{{studentFullName($enrolled->stud_sch_info->stud_per_info)}}</td>
                    @foreach($data->finalGrade as $fkey => $fvalue)
                        @if($fvalue->student_id == $enrolled->ssi_id)
                            <td>{{$fvalue->first_quarter}}</td>
                            <td>{{$fvalue->second_quarter}}</td>
                            <td>{{$fvalue->third_quarter}}</td>
                            <td>{{$fvalue->fourth_quarter}}</td>
                            <td>{{calcFinalGrade($fvalue)}}</td>
                            <td>{{transmuteGrade(calcFinalGrade($fvalue))}}</td>
                        @endif
                    @endforeach
                </tr>
                @endforeach
            </tbody>
        </table>
        @else
        <table class="table table-bordered grade-table">
            <tbody>
                <tr>
                    <td rowspan="2" colspan="2" class="col-md-3">Learner's Name</td>
                    <td colspan="10">WRITTEN WORKS</td>
                    <td colspan="10">PERFORMANCE TASKS</td>
                    <td colspan="3">ASSESSMENT</td>
                    <td colspan="2" class="col-md-1">Grade</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
                    <td>7</td>
                    <td>TL</td>
                    <td>PS</td>
                    <td>WS</td>

                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
                    <td>7</td>
                    <td>TL</td>
                    <td>PS</td>
                    <td>WS</td>

                    <td>1</td>
                    <td>PS</td>
                    <td>WS</td>
                    <td>Initial Grade</td>
                    <td>Quarterly Grade</td>
                    
                    
                </tr>
                <tr style="background-color:#eee;">
                    <td>#</td>
                    <td style="font-size:10px;text-align:center;">HIGHEST POSSIBLE SCORE</td>
                    <?php $wwCount = 0; $ptCount = 0; ?>
                    @foreach($data->activities as $akey => $avalue)
                        @if($avalue->activity_type == 8 || $avalue->activity_type == 11)
                        <?php $wwCount++; ?>
                            <td>{{$avalue->overall_score}}</td>
                        @endif
                    @endforeach

                    <!-- Empty sets -->
                    @for($i = 0; $i < 7 - $wwCount; $i++ )
                        <td style="color:#aaaaaa;">0</td>
                    @endfor
                    <!-- <td>10</td>
                    <td>20</td>
                    <td>30</td>
                    <td>40</td>
                    <td>50</td>
                    <td>60</td>
                    <td>70</td> -->
                    <td>{{$data->tl['ww']}}</td>
                    <td>100</td>
                    <td>{{$data->ws['ww']}}%</td>

                    @foreach($data->activities as $akey => $avalue)
                        @if($avalue->activity_type == 9 || $avalue->activity_type == 12)
                        <?php $ptCount++; ?>
                            <td>{{$avalue->overall_score}}</td>
                        @endif
                    @endforeach

                    <!-- Empty sets -->
                    @for($i = 0; $i < 7 - $ptCount; $i++ )
                        <td style="color:#aaaaaa;">0</td>
                    @endfor
                    <td>{{$data->tl['pt']}}</td>
                    <td>100</td>
                    <td>{{$data->ws['pt']}}%</td>

                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>100%</td>
                    <td>100</td>
                </tr>
                @foreach($data->current_sched->subject_enrolled as $key => $enrolled)
                <tr>
                    <td>{{prepZero($key + 1)}}</td>
                    <td style="text-align:left;">{{studentFullName($enrolled->stud_sch_info->stud_per_info)}}</td>
                    
                    @foreach($data->activities as $sakey => $savalue)
                        @if($savalue->activity_type == 8 || $savalue->activity_type == 11)
                            @foreach($savalue->activity_grades as $sagkey => $sagvalue)
                                @if($sagvalue->student_id == $enrolled->stud_sch_info->ssi_id)
                                    <td>{{$sagvalue->score}}</td>
                                @endif
                            @endforeach
                        @endif
                    @endforeach
                    <!-- Empty sets -->
                    @for($i = 0; $i < 7 - $wwCount; $i++ )
                        <td style="color:#aaaaaa;">0</td>
                    @endfor
                    <!-- Student total ww score -->
                    @foreach($data->stud_tl as $key4 => $value4)
                        @if($value4->student_id == $enrolled->stud_sch_info->ssi_id)
                            <td>{{$value4->ww['tl']}}</td>
                            <td>{{$value4->ww['ps']}}</td>
                            <td>{{$value4->ww['ws']}}</td>
                        @endif
                    @endforeach

                    @foreach($data->activities as $sakey => $savalue)
                        @if($savalue->activity_type == 8 || $savalue->activity_type == 12)
                            @foreach($savalue->activity_grades as $sagkey => $sagvalue)
                                @if($sagvalue->student_id == $enrolled->stud_sch_info->ssi_id)
                                    <td>{{$sagvalue->score}}</td>
                                @endif
                            @endforeach
                        @endif
                    @endforeach

                    <!-- Empty sets -->
                    @for($i = 0; $i < 7 - $ptCount; $i++ )
                        <td style="color:#aaaaaa;">0</td>
                    @endfor

                    <!-- Student total ww score -->
                    @foreach($data->stud_tl as $key4 => $value4)
                        @if($value4->student_id == $enrolled->stud_sch_info->ssi_id)
                            <td>{{$value4->pt['tl']}}</td>
                            <td>{{$value4->pt['ps']}}</td>
                            <td>{{$value4->pt['ws']}}</td>
                        @endif
                    @endforeach
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    @foreach($data->stud_tl as $key4 => $value4)
                        @if($value4->student_id == $enrolled->stud_sch_info->ssi_id)
                            <td>{{$value4->ww['ws'] + $value4->pt['ws']}}</td>
                            <td>{{transmuteGrade($value4->ww['ws'] + $value4->pt['ws'])}}</td>
                        @endif
                    @endforeach
                </tr>
                @endforeach
            </tbody>
        </table>
        @endif
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