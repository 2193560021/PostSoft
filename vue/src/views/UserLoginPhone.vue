<template>
  <div  style="height: 100vh;overflow: hidden ;">

    <div class="videoContainer">
<!--      <video class="fullscreenVideo" style="height: 100vh;" id="bgVid" playsinline="" autoplay="" muted="" loop="">-->
<!--        <source src="../assets/img/unit/car_video/160SX.mp4" style="width: 100%;height: 100vh;"  type="video/mp4">-->
<!--      </video>-->
      <img src="../assets/img/pet/dog/wallhaven-x199ml_1920x1080.png" style="width: 100%;" alt="">

    </div>

    <div style="width: 100%;text-align: center;padding-top: 100px;padding-bottom: 30px">
<!--      <img @click="$router.push('/')"  src="../assets/img/Sporty.png" style="cursor: pointer;width: 630px;height: 20vh;margin: 5px auto" alt="">-->
      <span  @click="$router.push('/')" style="cursor: pointer;color: #bb2d2d;font-size: 50px;font-weight: bolder">流浪动物救助平台</span>

    </div>
      <div style="opacity:0.75;background-color: #fff;width:480px;margin:0 auto;border-radius: 15px;padding: 10px 15px">
        <div style="font-size:40px;font-weight:bolder;color:#000;text-align:center;margin: 25px 0">手机登录</div>
        <el-form :model="form" ref="form" size="large" style="text-align: center" :rules="rules">
          <el-form-item style="width: 95%;margin: 20px auto" prop="phone">
            <el-input placeholder="手机号"  :prefix-icon="UserFilled"
            v-model="form.phone" >
              <template #append>
                <el-button type="text" style="color: #409EFF" @click="sendMsg">获取验证码</el-button>
              </template>
            </el-input>
          </el-form-item>
          <el-form-item style="width: 95%;margin: 20px auto" prop="code">
            <el-input placeholder="验证码" v-model="form.code" show-password/>
          </el-form-item>
        </el-form>
        <div style="width: 100%; float: right">
          <div style="flex: 1"></div>
          <el-button type="text" style=" float: right ;margin-right: 10px" @click="$router.push('userlogin')">账号密码登录</el-button>
        </div>
        <div style="text-align: center">
          <el-button type="primary" style="width: 45.2%;height:40px;font-size: 19px;margin: 14px 10px 20px 10px"
                     @click="loginByCode"
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
  name:"UserLoginPhone",
  components:{
    UserFilled
  },
  data(){
    return{
      form:{},
      rules:{
        phone:[
          {required:true,message:'请输入手机号',trigger:'blur'}
        ],
        code:[
          {required:true,message:'请输入验证码',trigger:'blur'},
        ]
      },
      background: {
        // 背景图片地址
        backgroundImage: 'url(' + require('../assets/img/car/car_img/UserLoginPhoneBackImg.jpg') + ')',
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
    sendMsg(){
      request.post("/user/sendMsg",this.form).then(res => {
        if(res.code === '0' ){
          this.$message.success("验证码已发送")
          // this.$router.push("/login")  //登录成功之后进行页面跳转
        }else{
          this.$message.error(res.msg)
        }
      })
    },
    loginByCode(){
      request.post("/user/loginByCode",this.form).then(res => {
        if(res.code === '0' ){
          this.$message.success("登录成功")
          sessionStorage.setItem("user",JSON.stringify(res.data))
          this.$router.push("/")  //登录成功之后进行页面跳转
        }else{
          this.$message.error(res.msg)
        }
      })
    },
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