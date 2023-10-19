<template>
    <div>
      <div style="height: 280px;border-bottom: 5px #f00 solid ;width: 60%;margin: 0 auto">
        <h2 style="border-bottom: 5px #ec1111 solid;
                      text-align: center;font-weight: bolder;width: 40%;margin: 20px auto">
          个人中心
        </h2>
        <div style="width: 100%;text-align: center">
          <img :src=this.userImg alt="" style="float: left;border-radius: 50%;height: 150px;">

          <div style="float: left;text-align: left;width: 50%;padding-top: 40px;margin-left: 50px">
            <h1>{{this.form.name}}</h1>
            <h6 style="padding-left: 10px">邮箱：{{this.form.email}}</h6>
            <h6 style="padding-left: 10px">联系方式：{{this.form.phone}}</h6>

          </div>
          <el-button type="danger"  @click="edit" style="margin-top: 20px;width: 100%;">编辑资料</el-button>

        </div>

      </div>
      <div style="width: 60%;margin: 0 auto">

        <div style="margin-top: 30px">

          <el-row :gutter="12">
            <el-col :span="8">
              <el-button @click="this.dialogVisible1=true" class="item" type="danger" size="large">我的求助信息</el-button>
            </el-col>
            <el-col :span="8">
              <el-button @click="this.dialogVisible2=true" class="item" type="danger" size="large">我的宠物博客</el-button>
            </el-col>
            <el-col :span="8">
              <el-button @click="this.dialogVisible3=true" class="item" type="danger" size="large">我的购买记录</el-button>
            </el-col>
          </el-row>

        </div>
      </div>

      <el-dialog v-model="dialogVisible"
                 title="修改个人信息"
                 top="3vh"
                 width="30%"
      >
        <el-form ref="form" :model="form" label-width="80px" size="large">
          <el-form-item style="text-align: center" label-width="0">
            <el-upload
                class="avatar-uploader"
                action="http://localhost:8080/files/upload"
                :show-file-list="false"
                :on-success="handleAvatarSuccess"
                style="margin: 5px auto;width: 50%;"
            >
              <img v-if="form.img" :src="form.img" class="" style="width: 100%;">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
          </el-form-item>
          <el-form-item label="用户名">
            <el-input v-model="form.name"></el-input>
          </el-form-item>
          <el-form-item label="手机号">
            <el-input v-model="form.phone"></el-input>
          </el-form-item>
          <el-form-item label="身份证">
            <el-input v-model="form.idCard"></el-input>
          </el-form-item>
          <el-form-item label="邮箱">
            <el-input v-model="form.email"></el-input>
          </el-form-item>
          <!--        <el-form-item label="密码">-->
          <!--          <el-input v-model="form.password" show-password></el-input>-->
          <!--        </el-form-item>-->

        </el-form>
        <template #footer>
          <div style="text-align: center">
            <el-button type="primary" @click="update">保存</el-button>
          </div>
        </template>
      </el-dialog>


      <el-dialog v-model="dialogVisible1"
                 title="我发布过的求助信息"
                 top="3vh"
                 width="95%"
      >
          <div style="width: 100%;margin: 15px auto">

            <el-button type="success"> 1-审核通过</el-button>
            <el-button type="danger"> 0-审核未通过</el-button>
            <div style="margin-top:40px">

              <el-row :gutter="24" style="margin:0 130px">
                <el-col :span="6" v-for="item in tableData1" :key="item">
                  <el-card style="width:280px;margin:35px 10px;cursor: pointer" @click="handleOpen(item.name)">
                    <!--          <img :src="item" class="image" style="width:250px;height:190px"/>-->
                    <div style="overflow: hidden;width:250px;" >
                      <el-image  :src="item.img" :fit="fill" class="image" style="width: 100%" />
                    </div>

                    <div style="padding: 14px">
                      <span style="font-weight: bolder;">{{ item.name }}</span>
                      <el-tag style="float: right">审核状态：{{ item.state }}</el-tag>
                      <div class="bottom" style="text-align: right">
                        <el-button text class="button">{{ item.createTime }}</el-button>
                      </div>
                    </div>
                  </el-card>
                </el-col>

              </el-row>

            </div>

          </div>
      </el-dialog>


      <el-dialog v-model="dialogVisible2"
                 title="我的宠物博客"
                 top="3vh"
                 width="95%"
      >

        <div style="width: 100%;margin: 15px auto">

          <div style="margin-top:40px">

            <el-row :gutter="24" style="margin:0 130px">
              <el-col :span="6" v-for="item in tableData2" :key="item">
                <el-card style="width:290px;margin:20px 0;cursor: pointer" @click="handleOpenBlog(item.title)">
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

          </div>

        </div>
      </el-dialog>


      <el-dialog v-model="dialogVisible3"
                 title="我的购买记录"
                 top="3vh"
                 width="95%"
      >

        <el-table :data="tableData3" border stripe style="width: 100%">

          <el-table-column prop="id" label="订单号" width="200" />
          <!--      <el-table-column prop="id" label="ID" width="80"  />-->
          <el-table-column prop="img" label="图片" width="110">
            <!--        <img :src="userImg" alt="" width="90" height="90" style="border-radius: 10px">-->


            <template #default="scope">
              <el-image
                  style="width: 80px;border-radius: 10px"
                  :src="scope.row.img"
              />
            </template>

          </el-table-column>
          <el-table-column prop="name" label="名称" width="100" sortable/>
          <el-table-column prop="count" label="数量" width="60"/>
          <el-table-column prop="price" label="付款金额" width="120"/>
          <el-table-column prop="payTime" label="支付时间" width="220"/>
          <el-table-column prop="customerId" label="买家ID" width="220"/>
          <el-table-column prop="tel" label="联系方式" width="120"/>
          <el-table-column prop="address" label="地址" width="120"/>
          <el-table-column prop="state" label="状态" width="80"/>
          <el-table-column label="操作" fixed="right" >
            <template #default="scope">
              <el-popconfirm title="确认删除?" type="danger" @confirm="handleDelete(scope.row.id)">
                <template #reference>
                  <el-button size="small" type="danger">取消订单</el-button>
                </template>
              </el-popconfirm>
            </template>
          </el-table-column>
        </el-table>

      </el-dialog>


    </div>
</template>

<script>
    import request from "@/utils/request";
    import router from "@/router";

    export default {
        name: "UserPerson",
        data() {
            return {
                form: {},
                imageUrl: '',
              dialogVisible: false,
              userImg:'',
              dialogVisible1:false,
              dialogVisible2:false,
              dialogVisible3:false,
              tableData1:{},
              tableData2:{},
              tableData3:{},
            }
        },
        created() {

          let str = sessionStorage.getItem("user") || "{}"
          if(str === '{}'){
            this.$message.error("请先登录")
            router.push("/userlogin")
          }
          this.form = JSON.parse(str)
          this.userImg = this.form.img

          request.get("/adoption/ByTel",{
            params:{
              pageNum:1,
              pageSize:1000,
              tel:this.form.phone
            }
          }).then(res => {
                console.log(res);
                this.tableData1 = res.data.records
          })


          request.get("/blog/ById",{
            params:{
              pageNum:1,
              pageSize:1000,
              search:this.form.id
            }
          }).then(res => {
            console.log(res);
            this.tableData2 = res.data.records
          })


          request.get("/orders/ById",{
            params:{
              pageNum:1,
              pageSize:1000,
              search:this.form.id
            }
          }).then(res => {
            console.log(res);
            this.tableData3 = res.data.records
          })
        },
        methods: {
            edit(){
              this.dialogVisible = true
            },
            handleAvatarSuccess(res) {

                this.form.img = res.data
                this.$message.success("上传成功")
                // this.update()
                // this.imageUrl = `/files/download?name=${res.data}`

            },
            update() {
                request.put("/user", this.form).then(res => {
                    console.log(res)
                    if (res.code === '0') {
                        this.$message({
                            type: "success",
                            message: "更新成功"
                        })
                        sessionStorage.setItem("user", JSON.stringify(this.form))
                      this.userImg = this.form.img
                        // 触发Layout更新用户信息
                        this.$emit("userInfo")
                    } else {
                        this.$message({
                            type: "error",
                            message: res.msg
                        })
                    }
                })
              this.dialogVisible = false
            },
            handleOpen(name){
              this.$router.push({
                path: '/adoptionpet',
                query: {
                  name: name
                }
              })
            },
            handleOpenBlog(title){
              this.$router.push({
                path: '/blogdetail',
                query: {
                  search: title
                }
              })
            },
          handleDelete(id){
            console.log(id);
            request.delete("/orders/" + id).then(res => {
              if(res.code == 0 ){
                this.$message.success("删除成功")
              }else{
                this.$message.error(res.msg)
              }

              request.get("/orders/ById",{
                params:{
                  pageNum:1,
                  pageSize:1000,
                  search:this.form.id
                }
              }).then(res => {
                console.log(res);
                this.tableData3 = res.data.records
              })
            })

          }
        }
    }
</script>

<style>
    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }

    .avatar-uploader .el-upload:hover {
        border-color: #409EFF;
    }

    .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 120px;
        height: 120px;
        line-height: 120px;
        text-align: center;
    }

    .avatar {
        width: 178px;
        height: 178px;
        display: block;
    }
    .item{
      width: 300px;
      height: 50px;
      font-size: 20px;
      font-weight: bolder;
    }
</style>
