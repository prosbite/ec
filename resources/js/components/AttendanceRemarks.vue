<template>
    <div>
        <i @click="show=!show" class="icon-bubbles"></i>
        <span>{{remarks.length + newRemarks.length}}</span>
        <div @mouseleave="show=false" v-show="show" class="remark-pane">
            <ul v-if="remarks.length > 0 || newRemarks.length > 0">
                <li v-for="(remark, i) in remarks" :key="i">
                    <img src="/assets/admin/layout2/img/avatar3_small.jpg" alt="">
                    <div class="remark-content">
                        <span class="date">{{remark.remark_date}}</span>
                        <span class="remark">{{remark.remarks}}</span>
                    </div>
                </li>
                <li v-for="(nremark, j) in newRemarks" :key="j">
                    <img src="/assets/admin/layout2/img/avatar3_small.jpg" alt="">
                    <div class="remark-content">
                        <span class="date">{{nremark.remark_date}}</span>
                        <span class="remark">{{nremark.remarks}}</span>
                        <input v-model="newRemarks[j].remarks" type="hidden" :name="'remarks[' + stud_id + '][]'">
                    </div>
                </li>
            </ul>
            <div v-if="remarks.length == 0 && newRemarks.length == 0" class="no-remarks"><center>No remarks yet</center></div>
            <input v-if="!d_record" v-model="newRemark" @keypress="addRemark($event)" class="remark-box" type="text" placeholder="Add remark here">
        </div>
    </div>
</template>

<script>
export default {
    props:['d_remarks', 'stud_id', 'd_record'],
    data(){
        return {
            remarks:[],
            newRemarks:[],
            show:false,
            newRemark:'',
        }
    },
    methods:{
        addRemark(e){
            if(e.keyCode == 13){
                e.preventDefault();
                this.newRemarks.push({remarks:this.newRemark, remark_date:'Just Now'});
                this.newRemark = '';
            }
        }
    },
    mounted(){
        this.remarks = JSON.parse(this.d_remarks);
    }
}
</script>

<style lang="scss" scoped>
    .icon-bubbles {
        cursor: pointer;
    }
    .remark-pane {
        position: absolute;
        top:40px;right:0;
        background-color: #fafafa;
        width:250px;
        padding: 10px;
        border: 1px solid #eee;
        z-index: 999;
        ul {
            padding:0;
            margin:0;
            li {
                display: flex;
                text-align: left;
                border-bottom: 1px solid #eee;
                padding: 10px 0px;
                &:last-child{
                    border:none;
                }
                img {
                    width:25px;
                    height: 25px;
                    border-radius: 25px!important;
                    margin-right: 10px;
                }
                .remark-content {
                    font-size: 11px;
                    display: flex;
                    flex-flow: column;
                    color: #555;
                    .date {
                        color: #aaa;
                    }
                }
            }
        }
        .remark-box {
            margin-top: 15px;
            border: 1px solid #ddd;
            padding: 5px 5px;
            font-size: 11px;
            width: 100%;
        }
    }
</style>