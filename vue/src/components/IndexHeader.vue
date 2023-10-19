0<template>
  <div>

    <el-menu
        :default-active="path"
        class="el-menu-demo"
        mode="horizontal"
        router
        background-color="#e17c7c"
        text-color="#fff"
        active-text-color="#111"
        @select="handleSelect"

    >

      <div style="width:350px;padding-left:60px;padding-top:4px;font-weight:bold;color:#343536;font-size:20px">
        <span style="color: #fff;font-size: 30px">流浪动物救助平台</span>
      </div>
      <el-menu-item index="/index"><span class="header_text">首页</span></el-menu-item>
      <el-menu-item index="/adoption"><span  class="header_text">流浪动物领养</span></el-menu-item>
      <el-menu-item index="/blog"><span  class="header_text">宠物博客</span></el-menu-item>
      <el-menu-item index="/petai"><span  class="header_text">宠物识别</span></el-menu-item>
      <el-menu-item index="/buypet"><span  class="header_text">宠物购买</span></el-menu-item>
      <el-menu-item index="/petbaike"><span  class="header_text">动物/宠物 百科</span></el-menu-item>
      <div id="ifLogin" style="width:100px;padding-left:250px;padding-top:20px;">
        <el-dropdown>
          <span class="el-dropdown-link">
            <div style="text-align: center;width: 100px;height:100%;cursor: pointer;color: #fff;font-size: 18px">
              个人管理
            </div>
            <el-icon class="el-icon--right">
              <arrow-down />
            </el-icon>
          </span>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item @click="$router.push('/userperson')">个人信息</el-dropdown-item>
              <el-dropdown-item @click="logout">退出登录</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </el-menu>
  </div>
</template>

<script>
export default {
  name: "IndexHeader",
  data(){
    return{
      path:this.$route.path,
      loginName:'未登录'
    }
  },
  created() {
    console.log(this.$route.path)
  },
  methods:{
    logout(){
      this.$router.push('/userlogin')
      sessionStorage.clear()
    },
    getLoginName(){
      if(sessionStorage.getItem("user")){

        const usermassage = sessionStorage.getItem("user")
        this.loginName = JSON.parse(usermassage).name
      }else {

      }

    }
  }
}
</script>

<style scoped>
  .header_text{
    /*font-weight: bolder;*/
    font-size: 20px
  }
  a{
    text-decoration: none;
    color: #fff;
    display: inline-block;
    width: 100%;
    height: 100%;
    line-height: 35px;
  }
</style>