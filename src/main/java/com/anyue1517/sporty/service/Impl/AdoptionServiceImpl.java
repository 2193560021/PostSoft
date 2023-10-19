package com.anyue1517.sporty.service.Impl;

import com.anyue1517.sporty.entity.Adoption;
import com.anyue1517.sporty.mapper.AdoptionMapper;
import com.anyue1517.sporty.service.AdoptionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class AdoptionServiceImpl extends ServiceImpl<AdoptionMapper, Adoption> implements AdoptionService {
}
