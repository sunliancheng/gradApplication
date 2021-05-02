package com.xxx.grad.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xxx.grad.entity.*;
import com.xxx.grad.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import java.util.*; 

@Component
public class TransactionService {

    @Autowired
    private TransactionMapper transactionMapper;


    public List<Transaction> select(QueryWrapper<Transaction> queryWrapper) {
        return transactionMapper.selectList(queryWrapper);
    }

    public int delete(QueryWrapper<Transaction> queryWrapper) {
        return transactionMapper.delete(queryWrapper);
    }

    public int update(Transaction transaction, QueryWrapper<Transaction> queryWrapper) {
        return transactionMapper.update(transaction, queryWrapper);
    }

    public int insert(Transaction transaction) {
        return transactionMapper.insert(transaction);
    }

    public int findLastId() {
        return transactionMapper.findLastId();
    }
}
