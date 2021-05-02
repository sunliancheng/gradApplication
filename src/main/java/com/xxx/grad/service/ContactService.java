package com.xxx.grad.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xxx.grad.entity.*;
import com.xxx.grad.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import java.util.*; 

@Component
public class ContactService {

    @Autowired
    private ContactMapper contactMapper;


    public List<Contact> select(QueryWrapper<Contact> queryWrapper) {
        return contactMapper.selectList(queryWrapper);
    }

    public int delete(QueryWrapper<Contact> queryWrapper) {
        return contactMapper.delete(queryWrapper);
    }

    public int update(Contact contact, QueryWrapper<Contact> queryWrapper) {
        return contactMapper.update(contact, queryWrapper);
    }

    public int insert(Contact contact) {
        return contactMapper.insert(contact);
    }

    public int findLastId() {
        return contactMapper.findLastId();
    }
}
