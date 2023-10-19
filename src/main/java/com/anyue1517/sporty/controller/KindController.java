package com.anyue1517.sporty.controller;

import com.anyue1517.sporty.common.Result;
import com.anyue1517.sporty.entity.Kind;
import com.anyue1517.sporty.service.KindService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/kind")
public class KindController {

    private KindService kindService;

    @Autowired
    public void setBrandService(KindService kindService) {
        this.kindService = kindService;
    }


    /**
     * 宠物信息的分页查询
     *
     * @param pageNum
     * @param pageSize
     * @param search
     * @return
     */
    @GetMapping
    public Result<?> page(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "5") Integer pageSize,
                          @RequestParam(defaultValue = "") String search) {

        //构造分页构造器
        Page<Kind> pageInfo = new Page<>(pageNum,pageSize);
        //构造条件构造器
        LambdaQueryWrapper<Kind> queryWrapper = new LambdaQueryWrapper<>();
        //添加过滤条件（用中文名进行模糊查询）
        queryWrapper.like(StringUtils.isNotBlank(search), Kind::getName, search);
        queryWrapper.orderByDesc(Kind::getUpdateTime);
        //执行查询
        Page<Kind> kindPage = kindService.page(pageInfo, queryWrapper);
        return Result.success(kindPage);

    }


    /**
     * 新增
     *
     * @param kind
     * @return
     */
    @PostMapping
    public Result<?> add(@RequestBody Kind kind) {

        kindService.save(kind);
        return Result.success();
    }


    /**
     * 修改
     *
     * @param kind
     * @return
     */
    @PutMapping
    public Result<?> update(@RequestBody Kind kind) {

        kindService.updateById(kind);
        return Result.success();
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public Result<?> del(@PathVariable long id) {
        kindService.removeById(id);
        return Result.success();
    }


}
