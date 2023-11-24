<template>
    <div style="padding:20px; width: 80%">
        <!-- 功能区域 -->
        <div style="margin:10px 0">
            <el-input v-model="name" placeholder="请输入关键字" style="width:20%" clearable></el-input>
            <el-button type="danger" style="margin-left: 10px" @click="load">搜索</el-button>
            <el-button type="danger" @click="add">新增</el-button>
        </div>
        <!--表格区域-->
        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="img" label="图片" width="200px">
                <template #default="scope">
                    <el-image style="width: 120px;border-radius: 10px" :src="scope.row.img"></el-image>
                </template>
            </el-table-column>
            <el-table-column prop="name" label="服务名称" width="150px"/>
            <el-table-column prop="price" label="价格" width="150px"/>
            <el-table-column prop="sale" label="销量" width="150px"/>
            <el-table-column prop="note" label="备注" width="200px"/>
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
                           :page-sizes="[5,10,20]" :small="true" :background="true"
                           layout="total, sizes, prev, pager, next, jumper" :total="total"
                           @size-change="handleSizeChange"
                           @current-change="handleCurrentChange">
            </el-pagination>
            <!--对话框-->
            <el-dialog v-model="dialogVisible" top="3vh" title="宠物医疗数据" width="40%">
                <el-form :model="form" label-width="120px">
                    <el-form-item style="text-align: center" label-width="10px">
                        <el-upload class="avatar-uploader" action="http://localhost:8080/files/upload"
                                   :show-file-list="false" :on-success="handleAvatarSuccess"
                                   style="margin: 5px auto; width: 80%">
                            <img class="avatar " :src="form.img" width="100" height="100" style="border-radius: 10px"/>
                        </el-upload>
                    </el-form-item>
                    <el-form-item label="服务名称">
                        <el-input v-model="form.name" style="width:90%"></el-input>
                    </el-form-item>
                    <el-form-item label="价格">
                        <el-input v-model="form.price" style="width:90%"></el-input>
                    </el-form-item>
                    <el-form-item label="销量">
                        <el-input v-model="form.sale" style="width:90%"/>
                    </el-form-item>
                    <el-form-item label="备注">
                        <el-input v-model="form.note" :rows="3" type="textarea" style="width:90%"/>
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
    name: 'PetHealthGuanli',
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
            request.get("/health", {
                params: {
                    pageNum: this.currentPage,
                    pageSize: this.pageSize,
                    search: this.name
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
                request.put("/health", this.form).then(res => {
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
                request.post("/health", this.form).then(res => {
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
            request.delete("/health/" + id).then(res => {
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
            request.put("/health", this.form).then(res => {
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
