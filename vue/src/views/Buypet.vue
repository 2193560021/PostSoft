<template>
  <div style="margin-top:10px">


    <div style="text-align: center;margin: 10px 0 10px">
      <div style="font-size: 35px;font-weight: bolder;margin: 10px auto;width: 20%;border-bottom: #000 solid 5px">宠物购买</div>
    </div>
    <el-row :gutter="24" style="margin:0 130px">
      <el-col :span="6" v-for="item in Pets" :key="item"  style="">
        <el-card style="width:290px;margin:20px 0;cursor: pointer" @click="handleOpen(item.name)">
          <div style="overflow: hidden;width:250px;height:160px" >
            <img  :src="item.img"  class="image" style="width: 100%;height: 100%;"  alt=""/>
          </div>

          <div style="padding: 14px">
            <span>{{item.name}} </span>
            <span style="float: right;color: #f00">￥{{ item.price }}</span>
          </div>
        </el-card>
      </el-col>


    </el-row>


    <div style="text-align: center;margin: 10px 0 10px">
      <div style="font-size: 35px;font-weight: bolder;margin: 10px auto;width: 20%;border-bottom: #000 solid 5px">宠物用品</div>
    </div>
    <el-row :gutter="24" style="margin:0 130px">

      <el-col :span="6" v-for="item in Goods" :key="item"  style="">
        <el-card style="width:290px;margin:20px 0;cursor: pointer" @click="handleOpenGoods(item.name)">
          <!--                    <img src="../assets/img/pet/5EB08B1E94952C4464CC8DD8978EA4E4.jpg" class="image" style="width:250px;height:190px"/>-->
          <div style="overflow: hidden;width:250px;height:160px" >
            <img  :src="item.img"  class="image" style="width: 100%;height: 100%;"  alt=""/>
          </div>

          <div style="padding: 14px">
            <span>{{item.name}} </span>
            <span style="float: right;color: #f00">￥{{ item.price }}</span>
          </div>
        </el-card>
      </el-col>

    </el-row>

    <div style="text-align: center;margin: 10px 0 10px">
      <div style="font-size: 35px;font-weight: bolder;margin: 10px auto;width: 20%;border-bottom: #000 solid 5px">医疗用品</div>
    </div>
    <el-row :gutter="24" style="margin:0 130px">

      <el-col :span="6" v-for="item in Health" :key="item"  style="">
        <el-card style="width:290px;margin:20px 0;cursor: pointer" @click="handleOpenHealth(item.name)">
          <!--                    <img src="../assets/img/pet/5EB08B1E94952C4464CC8DD8978EA4E4.jpg" class="image" style="width:250px;height:190px"/>-->
          <div style="overflow: hidden;width:250px;height:160px" >
            <img  :src="item.img"  class="image" style="width: 100%;height: 100%;"  alt=""/>
          </div>

          <div style="padding: 14px">
            <span>{{item.name}} </span>
            <span style="float: right;color: #f00">￥{{ item.price }}</span>
          </div>
        </el-card>
      </el-col>

    </el-row>

  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "CarNews",
  data(){
    return{
      path:this.$route.path,
      carCaseLeft_img:[
        require("../assets/img/car/car_img/car_News/CarNews_1.jpg"),
        require("../assets/img/car/car_img/car_News/CarNews_2.png"),
        require("../assets/img/car/car_img/car_News/CarNews_3.jpg"),
        require("../assets/img/car/car_img/car_News/CarNews_4.jpg")
      ],
      carCaseRight_img:[
        require("../assets/img/car/car_img/car_News/CarNews_right_1.jpg"),
        require("../assets/img/car/car_img/car_News/CarNews_right_2.gif"),

      ],
      Pets:[],
      Goods:[],
      Health:[],

    }
  },
  created() {
    this.load()
  },
  methods:{
    load(){
      request.get("/unit",{
        params:{
          pageNum:1,
          pageSize:1000,
          search:''
        }
      }).then(res => {
        console.log(res);
        this.Pets = res.data.records
        this.total = res.data.total
      })

      request.get("/goods",{
        params:{
          pageNum:1,
          pageSize:1000,
          search:''
        }
      }).then(res => {
        console.log(res);
        this.Goods = res.data.records
        this.total = res.data.total
      })

      request.get("/health",{
        params:{
          pageNum:1,
          pageSize:1000,
          search:''
        }
      }).then(res => {
        console.log(res);
        this.Health = res.data.records
        this.total = res.data.total
      })
    },
    handleOpen(name){
      this.$router.push({
        path: '/PetPurchase',
        query:{
          name:name,
        }
      })
    },
    handleOpenGoods(name){
      this.$router.push({
        path: '/GoodsPurchase',
        query:{
          name:name
        }
      })
    },
    handleOpenHealth(name){
      this.$router.push({
        path: '/HealthPurchase',
        query:{
          name:name
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