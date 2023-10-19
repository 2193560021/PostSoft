package com.anyue1517.sporty.service.Impl;

import com.anyue1517.sporty.entity.CarLease;
import com.anyue1517.sporty.mapper.CarLeaseMapper;
import com.anyue1517.sporty.service.CarLeaseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class CarLeaseServiceImpl extends ServiceImpl<CarLeaseMapper, CarLease> implements CarLeaseService {
}
