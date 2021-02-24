<template>
    <table class="table table-stripped table-hover checked-attendance">
        <thead>
            <tr>
                <th>No.</th>
                <th>Learner's Name</th>
                <th>Status</th>
                <th class="text-center">Remarks</th>
            </tr>
        </thead>
        <tbody  v-if="this.attendance">
            <tr v-for="(st, i) in students" :key="i">
                <td class="stud-count">{{prepZero(i + 1)}}</td>
                <td>
                    <span class="stud-no">BTN-20199872</span>
                    {{st.stud_sch_info.stud_per_info.lname + ', ' + st.stud_sch_info.stud_per_info.fname}}
                    </td>
                <td v-if="st.attendance.att_status=='present'" class="present status">
                    <i class="fa fa-fw fa-check"></i>
                    <span>Present</span>
                </td>
                <td v-if="st.attendance.att_status=='late'" class="late status">
                    <i class="fa fa-fw fa-clock-o"></i>
                    <span>Late</span>
                </td>
                <td v-if="st.attendance.att_status=='absent'" class="absent status">
                    <i class="fa fa-fw fa-times"></i>
                    <span>Absent</span>
                </td>
                <td class="text-center">
                    <attendance-remarks d_record="1" :stud_id="st.ssi_id" :d_remarks="JSON.stringify(st.attendance.remarks)"></attendance-remarks>
                </td>
            </tr>
        </tbody>
    </table>
</template>

<script>
import AttendanceRemarks from './AttendanceRemarks.vue';
export default {
    props:['d_students', 'd_attendance'],
    components:{AttendanceRemarks},
    data(){
        return {
            students: [],
            attendance: [],
        }
    },
    methods: {
        prepZero(val){
            if(val < 10){
                return '' + '0' + val;
            }
        }
    },
    mounted(){
        this.students = JSON.parse(this.d_students);
        this.attendance = JSON.parse(this.d_attendance);

        if(this.attendance){
            for(let i = 0; i < this.students.length; i++){
                for(let j = 0; j < this.attendance.student_attendances.length; j++){
                    if(this.students[i].ssi_id == this.attendance.student_attendances[j].stud_id){
                        this.students[i].attendance = this.attendance.student_attendances[j];
                    }
                }
            }
        }
    }
}
</script>