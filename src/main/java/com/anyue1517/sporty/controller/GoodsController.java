package com.anyue1517.sporty.controller;

import com.anyue1517.sporty.common.Result;
import com.anyue1517.sporty.entity.Goods;
import com.anyue1517.sporty.service.GoodsService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/goods")
public class GoodsController {

    private GoodsService goodsService;

    @Autowired
    public void setRefitService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    /**
     * 分页查询
     *
     * @param pageNum
     * @param pageSize
     * @param search
     * @return
     */
    @GetMapping
    public Result<?> page(@RequestParam(defaultValue = "1")int pageNum,
                          @RequestParam(defaultValue = "5")int pageSize,
                          @RequestParam(defaultValue = "")String search) {
        //构造分页构造器
        Page<Goods> pageInfo = new Page<>(pageNum, pageSize);
        //构造条件构造器
        LambdaQueryWrapper<Goods> queryWrapper = new LambdaQueryWrapper<>();
        //添加模糊查询
        queryWrapper.like(StringUtils.isNotEmpty(search), Goods::getName, search);
        //添加排序条件
        queryWrapper.orderByDesc(Goods::getUpdateTime);
        //开始分页查询
        goodsService.page(pageInfo, queryWrapper);
        return Result.success(pageInfo);
    }

    /**
     * 新增信息
     *
     * @param goods
     * @return
     */
    @PostMapping
    public Result<?> add(@RequestBody Goods goods) {

        goodsService.save(goods);
        return Result.success();
    }

    /**
     * 修改信息
     *
     * @param goods
     * @return
     */
    @PutMapping
    public Result<?> update(@RequestBody Goods goods) {

        goodsService.updateById(goods);
        return Result.success();
    }


    /**
     * 删除信息
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable long id) {
        goodsService.removeById(id);
        return Result.success();
    }
}
