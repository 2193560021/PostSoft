<template>
  <div style="width:100%;overflow: hidden ;">
    <div class="videoContainer">
<!--      <video class="fullscreenVideo" style="width: 100%;" id="bgVid" playsinline="" autoplay="" muted="" loop="">-->
<!--        <source src="../assets/img/unit/car_video/hellcat1.mp4" style="width: 100%;height: 100vh;"  type="video/mp4">-->
<!--      </video>-->
      <img src="../assets/img/pet/dog/wallhaven-9536k1_1920x1080.png" style="width: 100%;" alt="">
    </div>

    <div style="width: 100%;text-align: center;padding-top: 100px;padding-bottom: 30px">
      <span  @click="$router.push('/')" style="cursor: pointer;color: #de5c5c;font-size: 50px;font-weight: bolder">流浪动物救助平台</span>
    </div>
      <div style="opacity:0.75;background-color: #fff;width:480px;margin:0 auto;border-radius: 15px;padding: 10px 15px">
        <div style="font-size:40px;font-weight:bolder;color:#000;text-align:center;margin: 25px 0">账户登录</div>
        <el-form :model="form" ref="form" size="large" style="text-align: center" :rules="rules">
          <el-form-item style="width: 95%;margin: 20px auto" prop="name">
            <el-input placeholder="用户名" :prefix-icon="UserFilled"
            v-model="form.name" />
          </el-form-item>
          <el-form-item style="width: 95%;margin: 20px auto" prop="password">
            <el-input placeholder="密码" v-model="form.password" show-password/>
          </el-form-item>
        </el-form>
        <div style="width: 100%; float: right">
          <div style="flex: 1"></div>
          <el-button type="text" style=" float: right ;margin-right: 10px" @click="$router.push('userloginphone')">手机验证码登录</el-button>
        </div>
        <div style="text-align: center">
          <el-button type="primary" style="width: 45.2%;height:40px;font-size: 19px;margin: 14px 10px 20px 10px"
                     @click="login"
          >登录</el-button>

          <el-button type="warning" style="width: 45.2%;height:40px;font-size: 19px;margin: 14px 10px 20px 10px"
                    @click="$router.push('/userregister')"
          >注册</el-button>
        </div>
      </div>
  </div>
</template>

<script>
import request from "@/utils/request";

import {UserFilled} from '@element-plus/icons-vue'



export default {
  name:"Login",
  components:{
    UserFilled
  },
  data(){
    return{
      form:{},
      rules:{
        name:[
          {required:true,message:'请输入用户名',trigger:'blur'}
        ],
        password:[
          {required:true,message:'请输入密码',trigger:'blur'},
        ]
      },
      background: {
        // 背景图片地址
        backgroundImage: 'url(' + require('../assets/img/car/car_img/UserLoginBackImg.png') + ')',
        // 背景图片是否重复
        backgroundRepeat: 'no-repeat',
        // 背景图片大小
        backgroundSize: 'cover',
        // 背景颜色
        backgroundColor: '#000',
        // 背景图片位置
        backgroundPosition: 'center top'
      }
    }
  },
  methods:{
    login(){
      this.$refs['form'].validate((valid) => {
        if(valid){
          request.post("/user/login",this.form).then(res => {
            if(res.code == 0 ){
              this.$message.success("登录成功")
              sessionStorage.setItem("user",JSON.stringify(res.data))
              this.$router.push("/index")  //登录成功之后进行页面跳转
            }else{
              this.$message.error(res.msg)
            }
          })
        }
      })
    }
  }

}
</script>

<style>

.videoContainer{
  position: fixed;
  width: 100%;
  height: 100%;
  overflow: hidden;
  z-index: -100;
}

.videoContainer:before{
  content: "";
  position: absolute;
  width: 100%;
  height: 100%;
  display: block;
  z-index: -1;
  top: 0;
  left: 0;
  background: rgba(25,29,34,.65);
}
</style>