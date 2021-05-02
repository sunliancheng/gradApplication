package com.xxx.grad.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xxx.grad.entity.*;
import com.xxx.grad.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import java.util.*; 

@Component
public class ArticleService {

    @Autowired
    private ArticleMapper articleMapper;


    public List<Article> select(QueryWrapper<Article> queryWrapper) {
        return articleMapper.selectList(queryWrapper);
    }

    public int delete(QueryWrapper<Article> queryWrapper) {
        return articleMapper.delete(queryWrapper);
    }

    public int update(Article article, QueryWrapper<Article> queryWrapper) {
        return articleMapper.update(article, queryWrapper);
    }

    public int insert(Article article) {
        return articleMapper.insert(article);
    }

    public int findLastId() {
        return articleMapper.findLastId();
    }
}
