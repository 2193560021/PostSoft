<template>
  <div>

    <div>
      <el-row justify="center">
        <div style="border-bottom: 5px solid #e17c7c;width: 100%;clear: both;margin: 0 auto;float: left;padding: 40px 210px 30px">
          <div style="width: 100%; margin:0 20px;float: left;border: 5px solid #000;" >

            <div style="width: 100%;text-align: center">

              <img :src="img" style="background-color: #fff;border-radius: 10px;
          margin: 10px auto" width="630" :alt="carName">
            </div>
<!--          <div style="width: 17%; margin:0 20px;float: left" >-->
<!--            <p style="padding: 0 5px;font-size: 20px">{{ carEngName }}</p>-->
<!--            <p style="padding: 0 5px;font-size: 17px">{{ carCountry }}</p>-->
<!--          </div>-->
          <div style="width: 100%; margin:0 20px;float: left;height: 100%" >
            <h1 style="font-weight: bolder;margin-bottom: 20px">{{ name }}</h1>
            <p style="font-family: 'HarmonyOS Sans SC',serif;font-size: 17px">
              {{intro}}
            </p>
          </div>
        </div>
        </div>
        <el-col :span="18">



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
      tableData:[],
      logos_img:require("../assets/img/car/car_logo/audi.png"),
      pageNum:1,
      pageSize: 100,
      search:'',
      name:'',
      img:'',
      intro:''
    }
  },
  created() {
    this.load()
    this.loadCar()
  },
  methods:{
    load(){
      this.name = this.$route.query.name
      request.get("/kind",{
        params:{
          pageNum:'',
          pageSize:'',
          search:this.name
        }
      }).then(res => {
        console.log(res);
        // this.tableData = res.data.records
        // this.total = res.data.total

        this.img = res.data.records[0].img
        this.name = res.data.records[0].name
        this.belong = res.data.records[0].belong
        this.intro = res.data.records[0].intro
      })

    },
    loadCar(){

      request.get("/unit",{
        params:{
          pageNum:'1',
          pageSize:'5',
          name:this.$route.query.chineseName
        }
      }).then(res1 => {
        console.log(res1);
        this.tableData = res1.data.records
        // this.total = res1.data.total

        // this.carLogo = res.data.records[0].logo
        // this.carEngName = res.data.records[0].englishName
        // this.carCountry = res.data.records[0].country
        // this.carIntro = res.data.records[0].intro
      })
    },
    handleOpen(name){
      this.$router.push({
        path: '/carpurchase',
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




