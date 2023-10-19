package com.anyue1517.sporty.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 汽车品牌
 */
@Data
public class Kind {

    private static final long serialVersionUID = 1L;

    //id
    private Long id;

    //图片
    private String img;

    //品种名称
    private String name;

    //品种介绍
    private String intro;

    //所属种类
    private String belong;

    //创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    //更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

}

