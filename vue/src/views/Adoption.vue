<template>
  <div>

    <div>
      <el-row justify="center">
        <div style="overflow:hidden;height: 500px;">
          <img src="../assets/img/pet/dog/wallhaven-ox3l65_1920x1080.png" style="width: 100%;" alt="">
        </div>
        <div  style="width: 75%;margin: 0 auto">
          <el-button @click="handleFabu" style="float: right;margin:20px 100px 0;font-size: 18px;font-weight: bolder" size="large" type="danger">发布救助信息</el-button>
        </div>
        <div style="width: 100%;margin: 15px auto">

          <h2 style="border-bottom: 5px #ec1111 solid;
                      text-align: center;font-weight: bolder;width: 40%;margin: 20px auto">
            流浪修狗
          </h2>

          <div style="margin-top:40px">

            <el-row :gutter="24" style="margin:0 130px">
              <el-col :span="6" v-for="item in tableData_LG" :key="item">
                <el-card style="width:290px;margin:20px 0;cursor: pointer" @click="handleOpen(item.name)">
                  <!--          <img :src="item" class="image" style="width:250px;height:190px"/>-->
                  <div style="overflow: hidden;width:250px;" >
                    <el-image  :src="item.img" :fit="fill" class="image" style="width: 100%" />
                  </div>

                  <div style="padding: 14px">
                    <span style="font-weight: bolder;">{{ item.name }}</span>
                    <div class="bottom" style="text-align: right">
                      <el-button text class="button">{{ item.createTime }}</el-button>
                    </div>
                  </div>
                </el-card>
              </el-col>

            </el-row>

          </div>

        </div>


        <div style="width: 100%;height: 800px;margin: 15px auto">
          <h2 style="border-bottom: 5px #ec1111 solid;
                      text-align: center;font-weight: bolder;width: 40%;margin: 20px auto">
            流浪修咪
          </h2>

          <div style="margin-top:40px">

            <el-row :gutter="24" style="margin:0 130px">
              <el-col :span="6" v-for="item in tableData_SC" :key="item">
                <el-card style="width:290px;margin:20px 0;cursor: pointer" @click="handleOpen(item.name)">
                  <!--          <img :src="item" class="image" style="width:250px;height:190px"/>-->
                  <div style="overflow: hidden;width:250px;" >
                    <el-image  :src="item.img" :fit="fill" class="image" style="width: 100%" />
                  </div>

                  <div style="padding: 14px">
                    <span style="font-weight: bolder;">{{ item.name }}</span>
                    <div class="bottom" style="text-align: right">
                      <el-button text class="button">{{ item.createTime }}</el-button>
                    </div>
                  </div>
                </el-card>
              </el-col>

            </el-row>
          </div>

        </div>



      </el-row>

      <el-dialog v-model="dialogVisible"
                 title="发布救助信息"
                 top="1vh"
                 width="35%">
        <el-form :model="form" label-width="120px">

          <el-form-item style="text-align: center" label-width="0">
            <el-upload
                class="avatar-uploader"
                action="http://localhost:8080/files/upload"
                :show-file-list="false"
                :on-success="handleAvatarSuccess"
                style="margin: 5px auto;width: 80%"
            >
              <img :src="form.img" width="200" height="150" class="avatar " style="border-radius: 10px;">
            </el-upload>
          </el-form-item>

          <el-form-item label="动物名称">
            <el-input v-model="form.name" style="width:80%"></el-input>
          </el-form-item>
          <el-form-item label="性别">
            <el-input v-model="form.gender" style="width:80%"></el-input>
          </el-form-item>
          <el-form-item label="所属品种">
            <el-input v-model="form.kind" style="width:80%"></el-input>
          </el-form-item>
          <el-form-item label="所属种类">
            <el-select v-model="form.ani" placeholder="请选择种类" style="width:80%">
              <el-option label="修狗" value="狗" />
              <el-option label="修咪" value="猫" />
              <el-option label="其他动物" value="其他" />
            </el-select>
          </el-form-item>
          <el-form-item label="救助地址">
            <el-input v-model="form.address" style="width:80%"></el-input>
          </el-form-item>
          <el-form-item label="备注">
            <el-input v-model="form.note" style="width:80%"></el-input>
          </el-form-item>
          <el-form-item label="发布人">
            <el-input v-model="form.finder" style="width:80%"></el-input>
          </el-form-item>
          <el-form-item label="电话">
            <el-input v-model="form.tel" style="width:80%"></el-input>
          </el-form-item>
          <el-form-item label="状态">
            <el-input v-model="form.state" disabled style="width:80%"></el-input>
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




  </div>
</template>

<script>
import { Search } from '@element-plus/icons-vue'
import request from "@/utils/request";
import router from "@/router";


export default {
  name: "RefitSearch",
  data(){
    return{
      path:this.$route.path,
      dialogVisible:false,
      form: {},
      tableData_LG: {},
      tableData_SC: {},
      tableData_BZ: {},
      logos_img:require("../assets/img/car/car_logo/audi.png"),
      pageNum:1,
      pageSize: 100,
      search:'',
      user:{}
    }
  },
  created() {

    this.load()
    let str = sessionStorage.getItem("user") || "{}"

    this.user = JSON.parse(str)
    this.form.finder = this.user.name
    this.form.tel = this.user.phone
    this.form.state = 0

  },
  methods:{
    load(){
      // this.carName = this.$route.query.chineseName
      request.get("/adoption",{
        params:{
          pageNum:1,
          pageSize:1000,
          search:this.search
        }
      }).then(res => {
        console.log(res);
        delete (this.tableData_LG)
        let lg=0,sc=0
        for(let i = 0;i < res.data.records.length;i++){
          if(res.data.records[i].ani === '狗' && res.data.records[i].state == 1){
            this.tableData_LG[lg] = res.data.records[i]
            lg++
          }else if(res.data.records[i].ani === '猫' && res.data.records[i].state == 1){
            this.tableData_SC[lg] = res.data.records[i]
            lg++
          }else if( res.data.records[i].state === 1) {
            this.tableData_BZ[lg] = res.data.records[i]
            lg++
          }
        }
      })
    },
    handleOpen(name){
      this.$router.push({
        path: '/adoptionpet',
        query: {
          name: name
        }
      })
    },
    handleFabu(){
      let str = sessionStorage.getItem("user") || "{}"
      if(str === '{}'){
        this.$message.error("请先登录")
        router.push("/userlogin")
      }
      this.dialogVisible = true
    },
    handleAvatarSuccess(res) {
      this.form.img = res.data
      this.$message.success("上传成功")
      this.update()
    },
    save(){
      request.post("/adoption",this.form).then(res => {
        console.log(res)
        if(res.code == 0 ){
          this.$message.success("发布成功，请等待管理员审核")
        }else{
          this.$message.error(res.msg)
        }
        this.load()
        this.dialogVisible = false
      })
    }
  }
}
</script>

<style scoped>
.header_refit_logo{
  width: 47.5%;
  margin: 5px;
  border-radius: 6px;
}

.el-carousel__item h3 {
  color: #475669;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
  text-align: center;
}
.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}


.el-row {
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


.demo-image .block {
  padding: 30px 0;
  text-align: center;
  border-right: solid 1px var(--el-border-color);
  display: inline-block;
  width: 20%;
  box-sizing: border-box;
  vertical-align: top;
}
.demo-image .block:last-child {
  border-right: none;
}
.demo-image .demonstration {
  display: block;
  color: var(--el-text-color-secondary);
  font-size: 14px;
  margin-bottom: 20px;
}

.el-row {
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
</style>




