<template>
  <div style="margin-top:40px;padding-bottom: 100px">
    <el-row justify="center">
      <el-col :span="11">
        <el-carousel :interval="5000" arrow="always" height="390px" style="margin-top:5px">
          <el-carousel-item v-for="item in carCaseLeft_img" :key="item">
            <el-image  :src="item" :fit="fit"  />
          </el-carousel-item>
         </el-carousel>
      </el-col>
      <el-col :span="7">
        <div style="margin-left: 20px;">
            <div class="demo-image">
              <div v-for="item in carCaseRight_img" :key="item" class="block">  
                <el-image style="width:430px;height:190px;margin-top: 5px;" :src="item" :fit="fit" />
              </div>
            </div>
        </div>
      </el-col>
    </el-row>

    <el-row :gutter="24" style="margin:0 130px">
      <div style="width: 100%;text-align: center">
        <el-button @click="write" type="danger" style="width: 90%;font-size: 22px;height: 50px;">发布博客</el-button>
      </div>

      <el-col :span="6" v-for="item in Blogs" :key="item">
        <el-card style="width:290px;margin:20px 0;cursor: pointer" @click="handleOpen(item.title)">
          <!--          <img :src="item" class="image" style="width:250px;height:190px"/>-->
          <div style="overflow: hidden;width:250px;" >
            <el-image  :src="item.img" :fit="fill" class="image" style="width: 100%" />
          </div>

          <div style="padding: 14px">
            <span style="font-weight: bolder;">{{ item.title }}</span>
            <div class="bottom" style="text-align: right">
              <el-button text class="button">{{ item.createTime }}</el-button>
            </div>
          </div>
        </el-card>
      </el-col>
  
    </el-row>


    <el-dialog v-model="dialogVisible"
               title="发布博客"
               top="1vh"
               width="70%">
      <el-form :model="form" label-width="220px">

        <el-form-item style="text-align: center" label-width="0">
          <el-upload
              class="avatar-uploader"
              action="http://localhost:8080/files/upload"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              style="margin: 5px auto;width: 80%"
          >
            <img :src="form.img" width="400" height="200" class="avatar " style="border-radius: 10px;">
          </el-upload>
        </el-form-item>

        <el-form-item label="文章标题">
          <el-input v-model="form.title" style="width:90%"></el-input>
        </el-form-item>
        <el-form-item label="所属种类">
          <el-select v-model="form.pet" placeholder="请选择种类" style="width:90%">
            <el-option label="修狗" value="狗" />
            <el-option label="修咪" value="猫" />
            <el-option label="其他动物" value="其他" />
          </el-select>
        </el-form-item>
        <el-form-item label="文章内容">
          <el-input
              v-model="form.body"
              :rows="5"
              type="textarea"
              placeholder="请输入文章内容"
              style="width:90%"
          />
        </el-form-item>
        <el-form-item label="发布者">
          <el-input disabled v-model="form.owner" style="width:90%"></el-input>
        </el-form-item>
        <el-form-item label="发布者ID">
          <el-input disabled v-model="form.ownerId" style="width:90%"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogVisible = false">取消</el-button>
            <el-button type="danger" @click="save"
            >确认发布</el-button>
          </span>
      </template>
    </el-dialog>

    

  </div>
</template>

<script>
import request from "@/utils/request";
import router from "@/router";

export default {
  name: "RefitCase",
  data(){
    return{
      path:this.$route.path,
      carCaseLeft_img:[
        require("../assets/img/pet/5EB08B1E94952C4464CC8DD8978EA4E4.jpg"),
        require("../assets/img/pet/849F2062C68EF85D8B0A6D9896A861CA.jpg"),
        require("../assets/img/pet/812701C8995A48BBBD37E0B9BFBEE971.jpg"),
        require("../assets/img/pet/B42AD997A8D159E84CD4299A5829A13C.jpg")
      ],
      carCaseRight_img:[
        require("../assets/img/pet/dog/wallhaven-1jymqv_2560x1080.png"),
        require("../assets/img/pet/dog/wallhaven-ox3l65_1920x1080.png"),
       
      ],
      Blogs:[],
      dialogVisible:false,
      form: {},
      user: {}
    }
  },
  created() {
    let str = sessionStorage.getItem("user") || "{}"

    this.user = JSON.parse(str)
    this.form.owner = this.user.name
    this.form.ownerId = this.user.id

    this.load()
  },
  methods:{
    load(){
      request.get("/blog",{
        params:{
          pageNum:1,
          pageSize:100,
          search:'',
        }
      }).then(res => {
        console.log(res);
        this.Blogs = res.data.records
        this.total = res.data.total
      })
    },
    handleOpen(title){
      this.$router.push({
        path: '/blogdetail',
        query: {
          search: title
        }
      })
    },
    handleAvatarSuccess(res){
      this.form.img = res.data
      this.$message.success("上传成功")
    },
    write(){
      let str = sessionStorage.getItem("user") || "{}"
      if(str === '{}'){
        this.$message.error("请先登录")
        router.push("/userlogin")
      }
      this.dialogVisible = true
    },
    save(){
      request.post("/blog",this.form).then(res => {
        console.log(res)
        if(res.code == 0 ){
          this.$message.success("发布成功")
          this.load()
          this.dialogVisible = false
        }else{
          this.$message.error(res.msg)
        }
      })
    }

  }
}
</script>

<style scoped>
.el-carousel__item h3 {
  color: #475669;
  opacity: 0.75;
  line-height: 300px;
  margin: 0;
  text-align: center;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}

.time {
  font-size: 12px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.button {
  padding: 0;
  min-height: auto;
}

.image {
  width: 100%;
  display: block;
}
</style>