package com.anyue1517.sporty.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.time.LocalDateTime;

/**
 *
 */
@Data
public class Adoption {

    private static final long serialVersionUID = 1L;

    //id
    private Long id;

    //图片
    private String img;

    //名称
    private String name;

    //性别
    private String gender;

    //所属品种
    private String kind;

    //所属种类
    private String ani;

    //发布人
    private String finder;

    //联系电话
    private String tel;

    //领养地址
    private String address;

    //备注
    private String note;

    //状态
    private String state;

    //创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    //更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
}
