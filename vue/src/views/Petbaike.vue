<template>
  <div>

    <div>
      <el-row justify="center">
        <el-col :span="4" >
          <el-image style="width: 250px; height: 250px" :src="car_logo[0]" fit="fit" />
        </el-col>
        <el-col :span="4" >
          <el-image style="width: 250px; height: 250px" :src="car_logo[1]" fit="fit" />
        </el-col>
        <el-col :span="4"  >
          <el-image style="width: 250px; height: 250px" :src="car_logo[2]" fit="fit" />
        </el-col>
        <el-col :span="4" >
          <el-image style="width: 250px; height: 250px" :src="car_logo[3]" fit="fit" />
        </el-col>
      </el-row>
    </div>
    <div>
      <el-row justify="center">
        <el-col :span="18">
          <div style="width: 100%;clear: both">
            <h1 style="display:inline-block;margin:10px 0" >动物/宠物 百科</h1>
            <div style="flex: 1"></div>
            <div style="float: right;width: 50%">

              <el-button type="danger" style="margin:0 10px;float: right" @click="load">搜索</el-button>
              <el-input v-model="search" placeholder="请输入关键字" @keyup.enter="load" style="width: 50%;float: right"  clearable />

            </div>
          </div>
          <el-table :data="tableData" style="width: 100%;margin-top:20px" >
            <el-table-column  prop="img" label="图片" width="210">

              <template #default="scope">
                <el-image
                    style="width: 180px;border-radius: 10px"
                    :src="scope.row.img"
                />
              </template>
            </el-table-column>
            <el-table-column prop="name" label="品种名称" width="124" sortable />
            <el-table-column prop="intro" label="品种介绍" width="584" sortable />
            <el-table-column prop="belong" label="所属种类" width="84" sortable />
            <el-table-column  width="284">
              <template #default="scope">
                <el-button size="large" type="danger" @click="handleOpen(scope.row.name)">查看百科></el-button>
              </template>
            </el-table-column>>
          </el-table>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import { Search } from '@element-plus/icons-vue'
import request from "@/utils/request";
import router from "@/router";
export default {
  name: "BrandSearch",
  data(){
    return{
      path:this.$route.path,

      car_logo:[
        require("../assets/img/pet/81C92628F7AE7C31B4893529CB489B57.jpg"),
        require("../assets/img/pet/3F8E7AABAFC7DBB27724DB57FDFACEAE.jpg"),
        require("../assets/img/pet/9010BC26F601586B32ACABA24A4AEDBC.jpg"),
        require("../assets/img/pet/008874E1E7E3DDD1239FDF80C8226B11.jpg"),
      ],
      tableData:[
        {
          chineseName:"哈士奇",
          englishName:"Siberian Husky",
        }
      ],
      logos_img:require("../assets/img/car/car_logo/audi.png"),
      pageNum:1,
      pageSize: 100,
      search:'',

    }
  },
  created() {
    this.load()
  },
  methods:{
    load(){
      request.get("/kind",{
        params:{
          pageNum:this.pageNum,
          pageSize:this.pageSize,
          search:this.search
        }
      }).then(res => {
        console.log(res);
        this.tableData = res.data.records
        this.total = res.data.total
      })
    },
    handleOpen(name){
      this.$router.push({
        path: '/PetSearch',
        query: {
          name: name
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




