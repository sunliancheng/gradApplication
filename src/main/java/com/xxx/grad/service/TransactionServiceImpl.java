package com.xxx.grad.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xxx.grad.entity.Article;
import com.xxx.grad.entity.Transaction;
import com.xxx.grad.mapper.ArticleMapper;
import com.xxx.grad.mapper.TransactionMapper;
import org.springframework.stereotype.Service;

@Service
public class TransactionServiceImpl extends ServiceImpl<TransactionMapper, Transaction> implements TransactionServiceInterface {
}
