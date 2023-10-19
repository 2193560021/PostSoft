package com.anyue1517.sporty.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 改件信息
 */
@Data
public class Blog {

    //id
    private Long id;

    //封面
    private String img;

    //标题
    private String title;

    //相关动物
    private String pet;

    //文章内容
    private String body;

    //发布人
    private String owner;

    //发布人ID
    private Long ownerId;

    //浏览数量
    private Integer views;


    //创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    //更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;


}
