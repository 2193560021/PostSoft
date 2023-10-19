package com.anyue1517.sporty.service.Impl;

import com.anyue1517.sporty.entity.Goods;
import com.anyue1517.sporty.mapper.GoodsMapper;
import com.anyue1517.sporty.service.GoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements GoodsService {
}
