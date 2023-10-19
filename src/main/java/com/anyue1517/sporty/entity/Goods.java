package com.anyue1517.sporty.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 改件信息
 */
@Data
public class Goods {

    private static final long serialVersionUID = 1L;

    //id
    private Long id;

    //图片
    private String img;

    //用品名称
    private String name;

    //价格
    private Integer price;

    //生产日期
    private String date;

    //保质期
    private String ddl;

    //销量
    private String sale;

    //库存
    private String stock;

    //备注
    private String note;


    //创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    //更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

}
