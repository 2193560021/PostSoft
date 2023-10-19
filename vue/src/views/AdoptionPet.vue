<template>

  <el-row class="row-bg" justify="center" gutter="20">
    <el-col :span="8">
      <el-image :src=purchaseLeft_img :fit="cover" style="width:440px;"> </el-image>
      <h1 style="text-align:center"></h1>
    </el-col>
    <el-col :span="9">
      <div class="purchaseRight">
        <span class="title-text">{{ petName }}</span>
        <span style="margin-left: 10px">品种：{{ kind }}</span>
        <span style="margin-left: 10px">性别：{{ gender }}</span>
        <br>


        <el-descriptions
            class="margin-top"
            title="详细信息"
            :column="1"
            :size="size"
            border
        >
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                品种
              </div>
            </template>
            {{ kind }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                性别
              </div>
            </template>
            {{ gender }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                种类
              </div>
            </template>
            {{ ani }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                发布人
              </div>
            </template>
            <el-tag size="large">{{ finder }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                联系电话
              </div>
            </template>
            <el-tag size="large">{{tel}}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                发现地点
              </div>
            </template>
            {{address}}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                发现时间
              </div>
            </template>
            {{time}}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <div class="cell-item">
                备注
              </div>
            </template>
            {{note}}
          </el-descriptions-item>
        </el-descriptions>

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
      name:'',
      dialogVisible:false,
      state:'',
      note:'',
      address:'',
      tel:'',
      gender:'',
      ani:'',
      kind:'',
      finder:'',
      time:''


    }
  },
  created() {
    this.load()
  },
  methods:{
     save(){
       if(this.customerId !== '' &&
           this.carName !== '' &&
           this.num !== '' &&
           this.payWay !== '' &&
           this.payWay !== '' &&
           this.health !== '' &&
           this.onePrice !== '' ){
         request.post("/order",{
           customerId:this.customerId,
           name:this.carName,
           count:this.num,
           payWay:this.payWay,
           health:this.health,
           price:this.onePrice*10000,
           totalPrice:this.price*this.num*10000
         }).then(res => {
           if(res.code === '0'){
             this.$router.push("/refitpurchasesuccess")
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
       request.get("/adoption",{
         params:{
           pageNum:'1',
           pageSize:'1',
           name:this.$route.query.name
         }
       }).then(res => {
         console.log(res);
         // this.tableData = res1.data.records
         // this.total = res1.data.total

         this.purchaseLeft_img = res.data.records[0].img
         this.price = res.data.records[0].price
         this.gender = res.data.records[0].gender
         this.ani = res.data.records[0].ani
         this.kind = res.data.records[0].kind
         this.finder = res.data.records[0].finder
         this.tel = res.data.records[0].tel
         this.address = res.data.records[0].address
         this.note = res.data.records[0].note
         this.state = res.data.records[0].state
         this.time = res.data.records[0].createTime



         // this.carCountry = res.data.records[0].country
         // this.carIntro = res.data.records[0].intro
       })
     },
    handleChange(){
      this.allPrice = res.data.records[0].price.split("-")[0] * 10000 * this.num

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