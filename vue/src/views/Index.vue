<template>
  <div>
    <div class="block text-center">
      <el-carousel height="550px">
        <el-carousel-item v-for="item in car_img" >
          <img :src="item" class="small justify-center" style="width: 100%;"/>
        </el-carousel-item>
      </el-carousel>
    </div>





    <el-row justify="center" style="margin-top:20px">
      <el-col :span="10">

        <h1 class="display-4">Love & Peace</h1>
        <p class="text-info-two">&nbsp;&nbsp;&nbsp;&nbsp;随着我国经济与科技的不断飞速发展，人民的生活质量逐日提升。在追求丰富的物质生活同时，人们也一直在寻求精神上的寄托，其精神寄托方式也越来越多样化，不再局限于伴侣、亲人、朋友等同类人身上，而是将视线凝聚在伴侣动物身上。现如今，越来越多的人开始喜欢饲养宠物，把宠物作为自己的家庭成员，陪伴自己一起生活，并从中获取乐趣。然而大量的宠物饲养，随之带来的诸多问题也逐步显露出来，比如随着宠物饲养数量的不断增加，遭到遗弃的犬猫数量也在逐年递增。据统计，全球流浪动物数量约为2亿，而中国的流浪动物数量为4000万，占全球流浪动物总量的四分之一，然而它们的生存情况却异常艰辛。</p>
      </el-col >
      <el-col :span="10">
        <el-image  :src="right_img" style="padding:0 10px;margin-top:10px">
        </el-image>
      </el-col>
    </el-row>


    <el-row justify="center" style="margin-top:60px">
      <el-col :span="10">
        <el-image  :src="left_img" style="padding:0 10px;margin-top:10px;">
        </el-image>
      </el-col>
      <el-col :span="10">
        <p class="text-info-two">&nbsp;&nbsp;&nbsp;&nbsp;为了更好的让人们关心宠物和流浪动物，本课题将会开发一款基于SSM的流浪动物救助与宠物售卖平台，其功能模块主要包括宠物及用品售卖、宠物百科、流浪动物救助、宠物博客、宠物种类图像识别等。本系统具有个性化推荐和图像识别等创新点，满足用户对其关注动物基本信息的了解，同时也可以满足对不知品种动物基本信息的了解。适用于各类喜爱动物保护动物人群，极大的方便了用户，提升用户体验。</p>
      </el-col >
    </el-row>

  </div>
</template>

<script>
import { ref } from 'vue'
export default {
  name: "Index",
  data(){
    return{
      path:this.$route.path,
      car_img:[
        require("../assets/img/pet/dog/wallhaven-1jymqv_2560x1080.png"),
        require("../assets/img/pet/dog/wallhaven-ox3l65_1920x1080.png"),
        require("../assets/img/pet/dog/20140715112356630.jpg.source.jpg"),
        require("../assets/img/pet/dog/20140715112350436.jpg.source.jpg")
      ],
      show_img:[
        {
          path:require("../assets/img/pet/5EB08B1E94952C4464CC8DD8978EA4E4.jpg"),
          message:"可爱猫猫",
        },
         {
          path:require("../assets/img/pet/849F2062C68EF85D8B0A6D9896A861CA.jpg"),
          message:"可爱猫猫",
        },
         {
          path:require("../assets/img/pet/812701C8995A48BBBD37E0B9BFBEE971.jpg"),
          message:"可爱猫猫",
        },
        
        {
          path:require("../assets/img/pet/B42AD997A8D159E84CD4299A5829A13C.jpg"),
          message:"可爱猫猫",
        },

         {
          path:require("../assets/img/pet/CC7AB3EC644EB57C92B5FC5A38EAAEE2.jpg"),
          message:"可爱猫猫",
        },
        {
          path:require("../assets/img/pet/E311D57F60CE95DD8A9E3864A6F56250.jpg"),
          message:"可爱猫猫",
        },
        {
          path:require("../assets/img/pet/EE75D9D769474895E409C3C0015ECF41.jpg"),
          message:"可爱猫猫",
        },
      ],
      right_img:require("../assets/img/pet/849F2062C68EF85D8B0A6D9896A861CA.jpg"),
      left_img:require("../assets/img/pet/dog/wallhaven-9536k1_1920x1080.png"),
      
    }
  },
  created() {
    console.log(this.$route.path)
  },
  setup(){
    const currentDate = ref(new Date());
    return {
      currentDate,
    }
  }
}
</script>

<style scoped>
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
  color:#57A9FB;
  padding:2px 5px;
}

.image {
  width: 100%;
  display: block;
 
}

.unit-text{
  font-size:14px;
  font-weight: 600;
  font-family:Arial, sans-serif;
}

.show-info{
 
}
.text-info-one{
  color:#6b7785;
  font-family:sans-serif;

}
.text-info-two{
  margin:30px 10px;
  color:#6b7785;
  font-family:sans-serif;
}
</style>