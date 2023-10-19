<template>
  
  <el-row>
    <el-col :span="12" :offset="4">
      <div style="width: 100%;padding: 10px 10px;border-left: #ec1111 5px solid">
        <h2>{{ title }}</h2>
        <span>相关动物：{{ pet }}</span>&nbsp;&nbsp;
        <span>发布时间：{{ createTime }}</span>&nbsp;&nbsp;
        <span>发布人：{{ owner }}</span>&nbsp;&nbsp;
      </div>
      <div style="width: 100%;height: 300px;margin-top: 20px;margin-bottom: 100px">
        <img :src="img" alt="" style="width: 100%;">

        <div style="margin-top: 20px;margin-bottom: 100px">
          <p style="line-height: 35px;font-size: 19px;margin-bottom: 100px"> &nbsp;&nbsp;&nbsp;&nbsp;{{body}}</p>
          <div style="padding-top: 100px"></div>
        </div>
      </div>
    </el-col>

    <el-col :span="6">

      <div style="margin:50px 0">
        <el-calendar v-model="value" style="height: 50px;" />
      </div>
    
    </el-col>
    
  </el-row>



</template>

<script>
import { ref } from 'vue'

import { library } from "@fortawesome/fontawesome-svg-core";
import { fas} from "@fortawesome/free-solid-svg-icons";
import { fab } from '@fortawesome/free-brands-svg-icons';
import { far } from '@fortawesome/free-regular-svg-icons';
import request from "@/utils/request";
library.add(fas,fab,far);


export default {
  name: "RefitCaseEssay",
  data(){
    return{
      path:this.$route.path,
      carCaseLeft_img:[
        require("../assets/img/car/car_img/car_Case/502993.jpg"),
        require("../assets/img/car/car_img/car_Case/bb.jpg"),
        require("../assets/img/car/car_img/car_Case/3.webp"),
        require("../assets/img/car/car_img/car_Case/4.webp")
      ],
      carCaseEssayRight_img:require("../assets/img/car/car_img/car_Case_Essay/img-right.png"),
      showEssay:[],
      title:'',
      pet:'',
      img:'',
      createTime:'',
      body:'',
      owner:''

    }
  },
  setup(){
    const value = ref(new Date());
    return value
  },
  created() {
    this.load()
  },
  methods:{
    load(){
      this.search = this.$route.query.search

      request.get("/blog",{
        params:{
          pageNum:1,
          pageSize:100,
          search:this.search
        }
      }).then(res => {
        console.log(res);
        this.title = res.data.records[0].title
        this.pet = res.data.records[0].pet
        this.img = res.data.records[0].img
        this.createTime = res.data.records[0].createTime
        this.body = res.data.records[0].body
        this.owner = res.data.records[0].owner
      })
    }
  }
}
</script>

<style scoped>
.el-row {
  margin-top:30px;
  margin-bottom: 20px;
  
}
.el-row:last-child {
  margin-bottom: 0;
}
.el-col {
  border-radius: 4px;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
.el-calendar-table .el-calendar-day{
  height: 40px;
}
</style>