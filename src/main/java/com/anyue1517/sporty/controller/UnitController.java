package com.anyue1517.sporty.controller;

import com.anyue1517.sporty.common.Result;
import com.anyue1517.sporty.entity.Unit;
import com.anyue1517.sporty.service.UnitService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/unit")
public class UnitController {

    private UnitService unitService;

    @Autowired
    public void setCarService(UnitService unitService) {
        this.unitService = unitService;
    }

    /**
     * 动物个体信息的分页查询
     *
     * @param pageNum
     * @param pageSize
     * @param name
     * @return
     */
    @GetMapping
    public Result<?> page(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "5") Integer pageSize,
                          @RequestParam(defaultValue = "") String name) {

        //构造分页构造器
        Page<Unit> pageInfo = new Page<>(pageNum, pageSize);
        //构造条件构造器
        LambdaQueryWrapper<Unit> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(name), Unit::getName, name);
        //添加排序条件
        queryWrapper.orderByDesc(Unit::getUpdateTime);

        //开始分页查询
        unitService.page(pageInfo, queryWrapper);

        return Result.success(pageInfo);
    }

    /**
     * 信息添加
     *
     * @param unit
     * @return
     */
    @PostMapping
    public Result<?> add(@RequestBody Unit unit) {
        unitService.save(unit);
        return Result.success();
    }


    /**
     * 更新信息
     *
     * @param unit
     * @return
     */
    @PutMapping
    public Result<?> update(@RequestBody Unit unit) {
        unitService.updateById(unit);
        return Result.success();
    }


    /**
     * 删除信息
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public Result<?> del(@PathVariable long id) {
        unitService.removeById(id);
        return Result.success();
    }


}
