package com.anyue1517.sporty.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 订单信息
 */
@Data
public class Orders {

    private static final long serialVersionUID = 1L;

    //id
    private Long id;

    //商品图片
    private String img;

    //商品名称
    private String name;

    //用户id
    private Long customerId;

    //联系方式
    private String tel;

    //数量
    private Integer count;

    //地址
    private String address;

    //付款金额
    private String price;

    //状态
    private String state;

    //创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    //支付时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime payTime;

    //更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
}
