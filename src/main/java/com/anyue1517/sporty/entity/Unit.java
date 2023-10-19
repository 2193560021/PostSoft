package com.anyue1517.sporty.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 汽车
 */
@Data
public class Unit {

    private static final long serialVersionUID = 1L;

    //id
    private Long id;

    //图片
    private String img;

    //名称
    private String name;

    //年龄
    private Integer age;

    //性别
    private String gender;

    //习性
    private String liveStyle;

    //价格
    private String price;


    //所属品种
    private String kind;

    //创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    //更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
}
