package com.anyue1517.sporty.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 汽车4s店信息
 */
@Data
public class Health {

    private static final long serialVersionUID = 1L;

    //id
    private Long id;

    //图片
    private String img;

    //服务名称
    private String name;

    //价格
    private String price;

    //销量
    private String sale;

    //备注
    private String note;

    //创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    //更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
}
