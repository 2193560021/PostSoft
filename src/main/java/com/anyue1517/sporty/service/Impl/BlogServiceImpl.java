package com.anyue1517.sporty.service.Impl;

import com.anyue1517.sporty.entity.Blog;
import com.anyue1517.sporty.mapper.BlogMapper;
import com.anyue1517.sporty.service.BlogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements BlogService {
}
