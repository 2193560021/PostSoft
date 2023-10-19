package com.anyue1517.sporty.service.Impl;

import com.anyue1517.sporty.entity.Health;
import com.anyue1517.sporty.mapper.HealthMapper;
import com.anyue1517.sporty.service.HealthService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class HealthServiceImpl extends ServiceImpl<HealthMapper, Health> implements HealthService {
}
