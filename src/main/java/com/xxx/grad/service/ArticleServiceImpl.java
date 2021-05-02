package com.xxx.grad.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xxx.grad.entity.Article;
import com.xxx.grad.mapper.ArticleMapper;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleServiceInterface {
}
