<template>
  <div class="home" style="padding:10px">
    <!-- 功能区域 -->
    <div style="margin:10px 0">
    </div>

<!-- 搜索区域 -->
    <div style="margin:10px 0">
      <el-input v-model="name" placeholder="" style="width:20%" clearable />
      <el-button type="danger" style="margin:0 10px" @click="load">搜索</el-button>

      <el-button type="danger" @click="add">新增</el-button>

    </div>

    <el-table :data="tableData" border stripe style="width: 99%">
      <el-empty description="description" />
<!--      <el-table-column prop="id" label="ID" width="80" sortable />-->
      <el-table-column prop="img" label="图片" width="180">
<!--        <img :src="userImg" alt="" width="90" height="90" style="border-radius: 10px">-->

        <template #default="scope">
          <el-image
              style="width: 150px;border-radius: 10px"
              :src="scope.row.img"
          />
        </template>
      </el-table-column>
      <el-table-column prop="name" label="名称" width="110"/>
      <el-table-column prop="age" label="年龄" width="110"/>
      <el-table-column prop="gender" label="性别" width="130"/>
      <el-table-column prop="liveStyle" label="习性" width="280"/>
      <el-table-column prop="price" label="价格" width="130"/>
      <el-table-column prop="kind" label="所属品种" width="130"/>
      <el-table-column label="操作" >
        <template #default="scope">
          <el-button @click="handleEdit(scope.row)"
            >编辑</el-button
          >
          <!-- <el-button
            size="small"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)"
            >删除</el-button> -->
          <el-popconfirm title="确认删除?" type="danger" @confirm="handleDelete(scope.row.id)">
            <template #reference>
              <el-button type="danger">删除</el-button> 
            </template>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>

    <div style="margin:10px 0">
      <el-pagination
      v-model:currentPage="currentPage4"
      v-model:page-size="pageSize4"
      :page-sizes="[5,10, 20, 30, 40]"
      :small="small"
      :disabled="disabled"
      :background="background"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
    />


      <el-dialog v-model="dialogVisible"
        title="数据"
        top="3vh"
        width="50%"
      >
      <el-form :model="form" label-width="120px">

        <el-form-item style="text-align: center" label-width="0">
          <img :src="form.img" width="200" class="avatar "
               style="border-radius: 10px;margin: 10px auto">
          <el-upload
              class="avatar-uploader"
              action="http://localhost:8080/cars/upload"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              style="margin: 5px auto;width: 80%"
          >
            <el-button type="danger" > 修改图片</el-button>
          </el-upload>
        </el-form-item>


        <el-form-item label="名称">
          <el-input v-model="form.name" style="width:80%"></el-input>
        </el-form-item>
        <el-form-item label="年龄">
          <el-input v-model="form.age" style="width:80%"></el-input>
        </el-form-item>
        <el-form-item label="性别">
          <el-input v-model="form.gender" style="width:80%"></el-input>
        </el-form-item>
        <el-form-item label="习性">
          <el-input v-model="form.liveStyle" style="width:80%"></el-input>
        </el-form-item>
        <el-form-item label="价格">
          <el-input v-model="form.price" style="width:80%"></el-input>
        </el-form-item>
        <el-form-item label="所属品种">
          <el-input v-model="form.kind" style="width:80%"></el-input>
        </el-form-item>
      </el-form>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogVisible = false">取消</el-button>
            <el-button type="primary" @click="save"
              >确认</el-button
            >
          </span>
        </template>
      </el-dialog>

    </div>
  </div>
</template>

<script>
import { assertExpressionStatement } from '@babel/types'
import  request  from '@/utils/request'


export default {
  name: 'User',
  components: {
    
  },
  data() {
    return {
      form:{},
      dialogVisible: false,
      name:'',
      currentPage4:1,
      pageSize4:5,
      total:0,
      tableData:[
        
      ],
      userImg:require("@/assets/img/800014267.jpg")
    }
  },
  created() {
    this.load()
    this.checkLogin()
  },
  methods: {
    load(){
      request.get("/unit",{
        params:{
          pageNum:this.currentPage4,
          pageSize:this.pageSize4,
          name:this.name
        }
      }).then(res => {
        console.log(res);
        this.tableData = res.data.records
        this.total = res.data.total
      })
    },
    add(){
      this.dialogVisible = true
      this.form = {}
    },
    save(){
      if(this.form.id){
        request.put("/unit",this.form).then(res => {
          console.log(res)
          if(res.code == 0 ){
            this.$message.success("更新成功")
          }else{
            this.$message.error(res.msg)
          }
          this.load()
        this.dialogVisible = false
        })
      } else{
        request.post("/unit",this.form).then(res => {
          console.log(res)
          if(res.code == 0 ){
            this.$message.success("新增成功")
          }else{
            this.$message.error(res.msg)
          }
          this.load()
        this.dialogVisible = false
        })
      }
    },
    handleEdit(row){
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogVisible = true

    },
    handleDelete(id){
      console.log(id);
      request.delete("/unit/" + id).then(res => {
        if(res.code == 0 ){
            this.$message.success("删除成功")
          }else{
            this.$message.error(res.msg)
          }
        this.load()
      })

    },
    handleSizeChange(pageSize){     //改变每页数量触发
      this.pageSize4 = pageSize
      this.load()
    },
    handleCurrentChange(pageNum){  //改变当前页码触发
      this.currentPage4 = pageNum
      this.load()
    },
    pageSize4(){

    },
    handleAvatarSuccess(res) {
      this.form.img = res.data
      this.$message.success("上传成功")
      this.update()
    },
    update() {
      request.put("/unit", this.form).then(res => {
        console.log(res)
        if (res.code === '0') {
          this.$message({
            type: "success",
            message: "更新成功"
          })
          sessionStorage.setItem("user", JSON.stringify(this.form))
          // 触发Layout更新用户信息
          this.$emit("userInfo")
        } else {
          this.$message({
            type: "error",
            message: res.msg
          })
        }
      })
    },
    checkLogin(){
      request.get("/user",{}).then(res => {
        if(res.code === '-1'){
          this.$router.push("/man/login")
        }
      })
    }
  },
}
</script>
