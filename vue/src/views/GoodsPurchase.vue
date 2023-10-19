<template>

  <el-row class="row-bg" justify="center" gutter="20">
    <el-col :span="8">
      <el-image :src=purchaseLeft_img :fit="cover" style="height:500px"> </el-image>
      <h1 style="text-align:center"></h1>
    </el-col>
    <el-col :span="9">
      <div class="purchaseRight">
        <span class="title-text">{{ petName }}</span>

        <br>
        <br>



        <el-descriptions
            class="margin-top"
            title="数据概览"
            :column="1"
            :size="size"
            border
        >
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                名称
              </div>
            </template>
            <el-tag size="large">{{ kind }}</el-tag>

          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                生产日期
              </div>
            </template>
            {{ gender }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                保质期
              </div>
            </template>
            {{ age }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                销量
              </div>
            </template>
            {{ liveStyle }}
          </el-descriptions-item>
          <el-descriptions-item>
          <template #label>
            <div class="cell-item">
              价格
            </div>
          </template>
          <span style="color: #f00;font-weight: bolder">
            ￥{{ price }}
          </span>
        </el-descriptions-item>

          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                备注
              </div>
            </template>
            {{ note }}
          </el-descriptions-item>

        </el-descriptions>


        <div style="width: 100%;margin-top: 20px">
          <el-button @click="buy" style="font-size: 22px;width: 100%;height: 50px;" type="danger">立即支付</el-button>
        </div>




        <el-dialog v-model="dialogVisible"
                   title="订单确认"
                   top="3vh"
                   width="40%">
          <el-form  label-width="120px">

            <el-form-item style="text-align: center" label-width="0">
              <el-upload
                  class="avatar-uploader"
                  action="http://localhost:8080/files/upload"
                  :show-file-list="false"
                  :on-success="handleAvatarSuccess"
                  style="margin: 5px auto;width: 80%"
              >
                <img :src="this.purchaseLeft_img" width="200" height="300" class="avatar " style="border-radius: 10px;">
              </el-upload>
            </el-form-item>

            <el-form-item label="商品名称">
              <el-input disabled v-model="this.petName" style="width:80%"></el-input>
            </el-form-item>
            <el-form-item label="商品数量">
              <el-input v-model="this.count" style="width:80%"></el-input>
            </el-form-item>
            <el-form-item label="买家ID">
              <el-input disabled v-model="this.customerId" style="width:80%"></el-input>
            </el-form-item>
            <el-form-item label="联系电话">
              <el-input v-model="this.tel" style="width:80%"></el-input>
            </el-form-item>
            <el-form-item label="联系地址">
              <el-input v-model="this.address" style="width:80%"></el-input>
            </el-form-item>
          </el-form>
          <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogVisible = false">取消</el-button>
            <el-button type="danger" @click="save"
            >确认购买</el-button>
          </span>
          </template>
        </el-dialog>

      </div>
    </el-col>
  </el-row>



</template>

<script>

import { ref } from 'vue'
import { StarFilled } from '@element-plus/icons-vue'
import request from "@/utils/request";
import router from "@/router";
export default {
   components: {
    StarFilled,
    
  },
  name: "CarPurchase",
  data(){
    return{
      path:this.$route.path,
      purchaseLeft_img:[
        require("../assets/img/pet/5EB08B1E94952C4464CC8DD8978EA4E4.jpg"),
      ],
      petName:'',
      carPrice:'',
      optionsAddress:[],
      price:'',
      num:'',
      dialogVisible:false,
      payWay:'',
      onePrice:'',
      health:'',
      allPrice:'',
      gender:'',
      age:'',
      kind:'',
      liveStyle:'',
      customerId:'',
      count:1,
      address:'',
      what:'',
      note:''


    }
  },
  created() {

    let str = sessionStorage.getItem("user") || "{}"

    this.form = JSON.parse(str)

    this.customerId = this.form.id
    this.tel = this.form.phone
    this.load()
    this.loadCarStore()
  },
  methods:{
     save(){
       if(this.customerId !== '' &&
           this.name !== '' &&
           this.tel !== '' &&
           this.address !== '' &&
           this.price !== ''  ){
         request.post("/orders",{
           img:this.purchaseLeft_img,
           customerId:this.customerId,
           name:this.petName,
           tel:this.tel,
           count:this.count,
           address:this.address,
           price:this.price,
           state:'已购买'
         }).then(res => {
           if(res.code === '0'){
             this.dialogVisible = false
             this.$message.success("购买成功")
           }else if (res.code === '-1'){
             this.$message.error("出错了")
           }
         })
       }else {
         this.$message.error("有空没填呢")
       }
     },
     load(){
       this.petName = this.$route.query.name
         request.get("/goods",{
           params:{
             pageNum:'1',
             pageSize:'5',
             search:this.$route.query.name
           }
         }).then(res => {
           console.log(res);
           // this.tableData = res1.data.records
           // this.total = res1.data.total

           this.purchaseLeft_img = res.data.records[0].img
           this.price = res.data.records[0].price
           this.gender = res.data.records[0].date
           this.age = res.data.records[0].ddl
           this.kind = res.data.records[0].name
           this.liveStyle = res.data.records[0].sale
           this.note = res.data.records[0].note


           let str = res.data.records[0].price.indexOf('-')
           if(str !== -1){
             this.onePrice = res.data.records[0].price.split("-")[0]
             this.price = res.data.records[0].price.split("-")[0]
           }else if (str === -1) {

             this.onePrice = res.data.records[0].price.split("万")[0]
             this.price = res.data.records[0].price.split("万")[0]
           }
           // this.carCountry = res.data.records[0].country
           // this.carIntro = res.data.records[0].intro
         })
     },
    buy(){
      this.dialogVisible = true
      let str = sessionStorage.getItem("user") || "{}"
      if(str === '{}'){
        this.$message.error("请先登录")
        router.push("/userlogin")
      }
    },
     loadCarStore(){
       request.get("/carstore",{
         params:{
           pageNum:this.currentPage4,
           pageSize:this.pageSize4,
           name:''
         }
       }).then(res => {
         console.log(res);
         this.optionsAddress = res.data.records
         // this.total = res.data.total
       })
     },
    confirm(payWay){


      let str = sessionStorage.getItem("user") || "{}"
      if(str === '{}'){
        this.$message.error("请先登录")
      }else {
        this.customerId = JSON.parse(sessionStorage.getItem("user")).id
        this.payWay = payWay
        this.dialogVisible = true
      }
    },
    handleChange(){
      this.allPrice = res.data.records[0].price.split("-")[0] * 10000 * this.num

    },
    handleAvatarSuccess(){

    }
  },
  setup(){

    const title = ref("专业制造通用外置高流量改装车油泵0580254044 300LPH越野车改装");

    const value1 = ref('');
    const value2 = ref('');
    const options = [
      {
        value1: '20.00首2小时买3免1',
        label: '20.00首2小时买3免1',
      },
      {
        value1: '专区限时9折起',
        label: '专区限时9折起',
      },
      {
        value1: '￥10优惠卷，满200使用',
        label: '￥10优惠卷，满200使用',
      },
      {
        value1: '￥50优惠卷，满600使用',
        label: '￥50优惠卷，满600使用',
      },
      {
        value1: '￥100优惠卷，满1000使用',
        label: '￥100优惠卷，满1000使用',
      },
    ];

    const optionsAddress = [
      {
        value2: '北京市',
        label: '北京市',
      },
      {
        value2: '上海市',
        label: '上海市',
      },
      {
        value2: '深圳市',
        label: '深圳市',
      },
      {
        value2: '重庆市',
        label: '重庆市',
      },
      {
        value2: '广州市',
        label: '广州市',
      },
    ];

    const price = ref('200.2');


    const num = ref(1);
    const handleChange = (num) => {

    };

    const payWay = ref("")

    function ways1(){
      payWay.value = "支付宝";
      console.log("^^^"+payWay.value);
    }

    function ways2(){
      payWay.value = "微信";
      console.log("^^^"+payWay.value);
    }
    function ways3(){
      payWay.value = "银行卡";
      console.log("^^^"+payWay.value);
    }

    return {
      options,
      optionsAddress,
      num,
      handleChange,
      value1,
      value2,
      price,
      ways1,
      ways2,
      ways3,
      title,

    }
  }
}
</script>

<style scoped>
.el-row {
  margin-bottom: 20px;
  margin-top: 50px;
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

.title-text{
  font-size: 36px;
  font-weight: 800;
  font-family: 'Microsoft YaHei';
}

.title-info-number{
  position: relative;
  bottom:5px;
  font-size: 13px;
  color: #ff4000;
  font-weight: 700;
  margin:0 5px;
}
.title-info-text{
  position: relative;
  bottom:5px;
  font-size: 13px;
  color: #999;
}
.title-info-separator{
  display: inline-block;
  position: relative;
  bottom:2px;
  display: inline;
  margin:0 10px;
  border-right:2px #ddd solid;
}

.price-header{
  display: inline-block;
  width:100px;
  height: 20px;
  bottom:10px;
}
.price-text{
  display: inline-block;
  width:600px;
  font-size: 30px;
}

。ord-service-text{
    font-size: 14px;
    height: 18px;
    line-height: 18px;
    color:#333;

}

.pay-button{
  margin-top:20px;
  
}
.pay-way{
  margin-top:10px;
}
.pay-card{
  font-size: 16px;
  font-weight: 600;
}

.ord-num{
  margin:20px 0;
}

</style>