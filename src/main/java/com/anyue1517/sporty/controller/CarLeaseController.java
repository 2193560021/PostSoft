package com.anyue1517.sporty.controller;

import com.anyue1517.sporty.common.Result;
import com.anyue1517.sporty.entity.CarLease;
import com.anyue1517.sporty.service.CarLeaseService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/carlease")
public class CarLeaseController {

    private CarLeaseService carLeaseService;

    @Autowired
    public void setCarLeaseService(CarLeaseService carLeaseService) {
        this.carLeaseService = carLeaseService;
    }

    /**
     * 分页查询
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
        Page<CarLease> pageInfo = new Page<>(pageNum, pageSize);
        //构造条件构造器
        LambdaQueryWrapper<CarLease> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(name), CarLease::getName, name);
        //添加排序条件
        queryWrapper.orderByDesc(CarLease::getUpdateTime);

        //开始分页查询
        carLeaseService.page(pageInfo, queryWrapper);

        return Result.success(pageInfo);
    }

    /**
     * 信息添加
     *
     * @param car
     * @return
     */
    @PostMapping
    public Result<?> add(@RequestBody CarLease car) {
        carLeaseService.save(car);
        return Result.success();
    }


    /**
     * 更新信息
     *
     * @param car
     * @return
     */
    @PutMapping
    public Result<?> update(@RequestBody CarLease car) {
        carLeaseService.updateById(car);
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
        carLeaseService.removeById(id);
        return Result.success();
    }


}
