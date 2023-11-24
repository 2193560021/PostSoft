<template>
    <div style="height:50px; line-height:50px; background-color:#c55151; display:flex">
        <div style="width:100%; padding-left:10px; font-weight:bold; color:dodgerblue; font-size:20px; text-align: center">
            <span style="color: #fff; font-size: 30px;">流浪动物救助系统管理端</span>
        </div>
        <div style="flex:1"></div>
        <div style="width:150px; padding-right:30px; padding-top:15px">
            <el-dropdown>
          <span class="el-dropdown-link" style="width: 80px">
            <div style="width:100%; height:100%; cursor: pointer; color: white">
              {{ loginName }}
            <el-icon class="el-icon--right">
              <arrow-down/>
            </el-icon>
            </div>
          </span>
                <template #dropdown>
                    <el-dropdown-menu>
                        <el-dropdown-item @click="$router.push('/man/person')">个人信息</el-dropdown-item>
                        <el-dropdown-item @click="logout">退出登录</el-dropdown-item>
                    </el-dropdown-menu>
                </template>
            </el-dropdown>
        </div>
    </div>
</template>

<script>
import router from "@/router";
import request from "@/utils/request";
import {ArrowDown} from "@element-plus/icons";

export default {
    name: "Header",
    props: ['user'],
    components: {
        ArrowDown
    },
    data() {
        return {
            loginName: '管理员'
        }
    },
    created() {
        this.getLoginName()
    },
    methods: {
        logout() {
            this.$router.push('/man/login')
            sessionStorage.clear()
        },
        getLoginName() {
            if (sessionStorage.getItem("user")) {

                const usermassage = sessionStorage.getItem("user")
                this.loginName = JSON.parse(usermassage).name
            }
        },
    }
}
</script>
<style scoped>
</style>