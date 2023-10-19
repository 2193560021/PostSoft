package com.anyue1517.sporty.service.Impl;

import com.anyue1517.sporty.entity.Kind;
import com.anyue1517.sporty.mapper.KindMapper;
import com.anyue1517.sporty.service.KindService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class KindServiceImpl extends ServiceImpl<KindMapper, Kind> implements KindService {
}
