<template>
  <div style="background-color: #f19595">
      <el-menu
      style="width:200px;min-height:calc(100vh - 50px);"
        :default-active="path"
        router

      background-color="#f19595"
      text-color="#fff"
      active-text-color="#111"
        class="el-menu-vertical-demo">
<!--        <el-sub-menu index="1">-->
<!--            <template #title>系统管理</template>-->
<!--          </el-sub-menu>-->

        <el-menu-item index="/man/user">
          <span>系统用户管理</span>
        </el-menu-item>
        <el-menu-item index="/man/PetKindGuanli">
          <span>动物品种信息</span>
        </el-menu-item>
        <el-menu-item index="/man/PetUnitGuanli">
          <span>动物个体信息</span>
        </el-menu-item>
        <el-menu-item index="/man/PetAdoptionGuanli">
          <span>动物领养信息</span>
        </el-menu-item>
        <el-menu-item index="/man/PetGoodsGuanli">
          <span>宠物用品信息</span>
        </el-menu-item>
        <el-menu-item index="/man/PetHealthGuanli">
          <span>宠物医疗信息</span>
        </el-menu-item>
        <el-menu-item index="/man/PetBlogGuanli">
          <span>宠物博客信息</span>
        </el-menu-item>
        <el-menu-item index="/man/PetOrdersGuanli">
          <span>系统订单管理</span>
        </el-menu-item>


      </el-menu>
  </div>
</template>

<script>
export default {
  name:"Aside",
  data(){
      return{
        path:this.$route.path
      }
  },
    created() {
      console.log(this.$route.path)
    }
}
</script>

<style>

</style>