require('./bootstrap');
import Vue from 'vue'

//Main pages

import SampleApp from './components/Sample.vue';
import SampleTwo from './components/SampleTwo.vue';
import AttendanceCheck from './components/AttendanceCheckTable.vue';
import AttendanceCheckToday from './components/AttendanceCheckToday.vue';
import AttendanceRemarks from './components/AttendanceRemarks.vue';



const app = new Vue({
    el: '#app',
    components: { SampleApp, SampleTwo, AttendanceCheck, AttendanceCheckToday, AttendanceRemarks }
});