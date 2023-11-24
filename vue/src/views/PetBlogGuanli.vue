<template>
    <div style="padding:20px; width: 80%">
        <!-- 功能区域 -->
        <div style="margin:10px 0">
            <el-input v-model="name" placeholder="请输入关键字" style="width:20%" clearable></el-input>
            <el-button type="danger" style="margin-left: 10px" @click="load">搜索</el-button>
            <el-button type="danger" @click="add">新增</el-button>
        </div>
        <!--表格区域-->
        <el-table :data="tableData" border style="width: 98%">
            <el-table-column prop="img" label="博客封面" width="200px">
                <template #default="scope">
                    <el-image style="width: 120px;border-radius: 10px" :src="scope.row.img"></el-image>
                </template>
            </el-table-column>
            <el-table-column prop="title" label="标题" width="210px"/>
            <el-table-column prop="pet" label="相关动物" width="140px"/>
            <el-table-column prop="owner" label="发布人" width="140px"/>
            <el-table-column prop="ownerId" label="发布人ID" width="220px"/>
            <el-table-column prop="createTime" label="发布时间" width="200px" sortable/>
            <el-table-column prop="views" label="浏览量" width="80px"/>
            <el-table-column label="操作">
                <template #default="scope">
                    <el-button size="normal" @click="handleEdit(scope.row)">编辑</el-button>
                    <el-popconfirm title="确认删除?" type="danger" @confirm="handleDelete(scope.row.id)">
                        <template #reference>
                            <el-button type="danger" size="normal">删除</el-button>
                        </template>
                    </el-popconfirm>
                </template>
            </el-table-column>
        </el-table>
        <!--主体区域-->
        <div style="margin:10px 0">
            <!--分页栏-->
            <el-pagination v-model:currentPage="currentPage" v-model:page-size="pageSize"
                           :page-sizes="[5,10,20]" :small="true" :background="true" :total="total"
                           layout="total, sizes, prev, pager, next, jumper"
                           @size-change="handleSizeChange"
                           @current-change="handleCurrentChange">
            </el-pagination>
            <!--对话框-->
            <el-dialog v-model="dialogVisible" top="3vh" title="宠物博客数据" width="40%">
                <el-form :model="form" label-width="120px">
                    <el-form-item style="text-align: center" label-width="10px">
                        <el-upload class="avatar-uploader" action="http://localhost:8080/files/upload"
                                   :show-file-list="false" :on-success="handleAvatarSuccess"
                                   style="margin: 5px auto; width: 80%">
                            <img class="avatar " :src="form.img" width="100" height="100" style="border-radius: 10px"/>
                        </el-upload>
                    </el-form-item>
                    <el-form-item label="文章标题">
                        <el-input v-model="form.title" style="width:90%"></el-input>
                    </el-form-item>
                    <el-form-item label="相关动物">
                        <el-input v-model="form.pet" style="width:90%"></el-input>
                    </el-form-item>
                    <el-form-item label="发布人">
                        <el-input v-model="form.owner" style="width:90%"></el-input>
                    </el-form-item>
                    <el-form-item label="发布人ID">
                        <el-input v-model="form.ownerId" style="width:90%"></el-input>
                    </el-form-item>
                    <el-form-item label="发布时间">
                        <el-date-picker v-model="form.createTime" value-format="YYYY-MM-DD HH:mm:ss" type="createTime"
                                        style="width: 90%" clearable disabled>
                        </el-date-picker>
                    </el-form-item>
                    <el-form-item label="文章内容">
                        <el-input v-model="form.body" :rows="8" type="textarea" placeholder="请输入文章内容" style="width:90%"/>
                    </el-form-item>
                </el-form>
                <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogVisible = false">取消</el-button>
            <el-button type="primary" @click="save">确认</el-button>
          </span>
                </template>
            </el-dialog>
        </div>
    </div>
</template>
<script>

import request from '@/utils/request'

export default {
    name: 'PetBlogGuanli',
    components: {},
    data() {
        return {
            form: {},
            dialogVisible: false,
            name: '',
            currentPage: 1,
            pageSize: 10,
            total: 0,
            tableData: [],
            userImg: require("@/assets/img/800014267.jpg")
        }
    },
    created() {
        this.load()
        this.checkLogin()
    },
    methods: {
        load() {
            request.get("/blog", {
                params: {
                    pageNum: this.currentPage,
                    pageSize: this.pageSize,
                    name: this.name
                }
            }).then(res => {
                console.log(res);
                this.tableData = res.data.records
                this.total = res.data.total
            })
        },
        add() {
            this.dialogVisible = true
            this.form = {}
        },
        save() {
            if (this.form.id) {
                request.put("/blog", this.form).then(res => {
                    console.log(res)
                    if (res.code == 0) {
                        this.$message.success("更新成功")
                    } else {
                        this.$message.error(res.msg)
                    }
                    this.load()
                    this.dialogVisible = false
                })
            } else {
                request.post("/blog", this.form).then(res => {
                    console.log(res)
                    if (res.code == 0) {
                        this.$message.success("新增成功")
                    } else {
                        this.$message.error(res.msg)
                    }
                    this.load()
                    this.dialogVisible = false
                })
            }
        },
        handleEdit(row) {
            this.form = JSON.parse(JSON.stringify(row))
            this.dialogVisible = true

        },
        handleDelete(id) {
            console.log(id);
            request.delete("/blog/" + id).then(res => {
                if (res.code == 0) {
                    this.$message.success("删除成功")
                } else {
                    this.$message.error(res.msg)
                }
                this.load()
            })

        },
        handleSizeChange(pageSize) {     //改变每页数量触发
            this.pageSize = pageSize
            this.load()
        },
        handleCurrentChange(pageNum) {  //改变当前页码触发
            this.currentPage = pageNum
            this.load()
        },
        pageSize() {

        },
        handleAvatarSuccess(res) {
            this.form.img = res.data
            this.$message.success("上传成功")
            this.update()
        },
        update() {
            request.put("/blog", this.form).then(res => {
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
        checkLogin() {
            request.get("/user", {}).then(res => {
                if (res.code === '-1') {
                    this.$router.push("/man/login")
                }
            })
        }
    },
}
</script>
