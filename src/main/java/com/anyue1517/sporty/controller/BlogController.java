package com.anyue1517.sporty.controller;

import com.anyue1517.sporty.common.Result;
import com.anyue1517.sporty.entity.Blog;
import com.anyue1517.sporty.service.BlogService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/blog")
public class BlogController {

    private BlogService blogService;
    @Autowired
    public void setRefitCaseService(BlogService blogService) {
        this.blogService = blogService;
    }
    /**
     * 客户端数据显示
     * @param pageNum
     * @param pageSize
     * @return
     */
    @GetMapping
    public Result<?> page(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "5") Integer pageSize,
                          @RequestParam(defaultValue = "") String search) {
        //构造分页构造器
        Page<Blog> pageInfo = new Page<>(pageNum, pageSize);
        //构造条件构造器
        LambdaQueryWrapper<Blog> queryWrapper = new LambdaQueryWrapper<>();
        //添加排序条件
        queryWrapper.orderByDesc(Blog::getUpdateTime);
        //添加查询条件
        queryWrapper.like(StringUtils.isNotBlank(search), Blog::getTitle,search);
        //开始分页查询
        blogService.page(pageInfo, queryWrapper);
        return Result.success(pageInfo);
    }

    @GetMapping("/ById")
    public Result<?> pageById(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "5") Integer pageSize,
                          @RequestParam(defaultValue = "") String search) {
        //构造分页构造器
        Page<Blog> pageInfo = new Page<>(pageNum, pageSize);
        //构造条件构造器
        LambdaQueryWrapper<Blog> queryWrapper = new LambdaQueryWrapper<>();
        //添加排序条件
        queryWrapper.orderByDesc(Blog::getUpdateTime);
        //添加查询条件
        queryWrapper.like(StringUtils.isNotBlank(search), Blog::getOwnerId,search);
        //开始分页查询
        blogService.page(pageInfo, queryWrapper);
        return Result.success(pageInfo);
    }

    /**
     * 更新操作
     * @param blog
     * @return
     */
    @PutMapping
    public Result<?> update(@RequestBody Blog blog){
        blogService.updateById(blog);
        return Result.success();
    }

    /**
     * 插入操作
     * @param blog
     * @return
     */
    @PostMapping
    public Result<?> insert(@RequestBody Blog blog){
        blogService.save(blog);
        return Result.success();
    }

    /**
     * 删除操作
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable long id){
        blogService.removeById(id);
        return Result.success();
    }
}
