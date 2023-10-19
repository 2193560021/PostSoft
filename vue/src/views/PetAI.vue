<template>

  
  <div>
    <h1 class="title" style="border-bottom: 5px solid #000 ;margin: 20px 600px">宠物识别</h1>
    <el-row justify="center">
      <el-col :span="16" style="text-align: center">

<!--        <el-upload-->
<!--            class="avatar-uploader"-->
<!--            action="http://localhost:8080/carai/upload"-->
<!--            :show-file-list="false"-->
<!--            :on-success="handleAvatarSuccess"-->
<!--            style="margin: 5px auto;width: 100%;"-->
<!--        >-->
<!--          <img  :src="car_img" id="imgshow" class="" style="width: 650px;"/>-->
<!--        </el-upload>-->
        <img :src="car_img" style="height: 400px;margin: 10px auto" alt="">

        <el-upload
            class="avatar-uploader"
            action="http://localhost:8080/petai/upload"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            style="margin: 5px auto;width: 100%;">
          <el-button type="success" size="large"  
          style="font-size: 19px;margin: 5px auto;width: 100%;">上传图片</el-button>
        </el-upload>

        <el-button type="primary" size="large" @click="PetAI" style="font-size: 19px;margin: 5px auto;width: 100%;">开始识别</el-button>

      </el-col>


      <el-dialog v-model="dialogVisible"
                 title="识别结果"
                 width="60%"
      >
        <div style="width: 100%;">
          <div style="text-align: center">
            <img :src="car_img" class="avatar " style="border-radius: 10px;height: 200px">
          </div>
          <h4>识别结果为：{{name}}</h4>
          <h6>相关介绍：{{description}}</h6>
        </div>


        <template #footer>
          <span class="dialog-footer">
            <el-button type="danger" @click="open(name)"
            >去百度搜索&nbsp;<span style="font-weight: bolder;">{{name}}</span></el-button
            >
          </span>
        </template>
      </el-dialog>


    </el-row>
  </div>

</template>

<script>
import { Search } from '@element-plus/icons-vue'
import request from "@/utils/request";
import router from "@/router";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas} from "@fortawesome/free-solid-svg-icons";
import { fab } from '@fortawesome/free-brands-svg-icons';
import { far } from '@fortawesome/free-regular-svg-icons';
library.add(fas,fab,far);
export default {
  name: "RefitCulture",
  data(){
    return{
      path:this.$route.path,
      tableData:[],
      pageNum:1,
      pageSize: 100,
      search:'',
      car_img:require("../assets/img/pet/dog/wallhaven-1jymqv_2560x1080.png"),
      CarResult:[],
      CarResultInfo:[],
      CarResultInfoBaikeUrl:'https://baike.baidu.com/item/',
      dialogVisible:false,
      name:'',
      description:''
    }
  },
  created() {
    this.load()
  },
  methods:{
    load(){
      // request.get("/culture",{
      //   params:{
      //     pageNum:this.pageNum,
      //     pageSize:this.pageSize,
      //     search:this.search
      //   }
      // }).then(res => {
      //   console.log(res);
      //   this.tableData = res.data.records
      //   this.total = res.data.total
      // })
    },
    handleAvatarSuccess(res) {

      this.car_img = res.data
      this.$message.success("上传成功")
      // console.log(json)
      // this.update()
      // this.imageUrl = `/files/download?name=${res.data}`

    },
    PetAI(){
      request.post("/petai",{

        }).then(res => {
          this.dialogVisible = true
          var json =  JSON.parse(res.data);//转换为json对象
          console.log(json);
          this.name = json.result[0].name
          this.description =  json.result[0].baike_info.description
        })

    },
    open(name){
      window.open("https://www.baidu.com/s?wd=" + name)
    }



  },
  

  
}
</script>

<style scoped>
.title{
  text-align: center;
  margin:30px 0;
}
.el-table .warning-row {
  --el-table-tr-bg-color: var(--el-color-warning-light-9);
}
.el-table .success-row {
  --el-table-tr-bg-color: var(--el-color-success-light-9);
}
.show-kind{
  display: inline-block;
  margin:25px 40px;
  color:black;
  font-weight: 500;
  font-family: STHeiti  ;
}

.show-info{
  color:#4e5969;
  margin:20px 10px;
  font-family: STKaiti;

  font-size: large;
}
</style>