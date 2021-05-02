package com.xxx.grad.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xxx.grad.entity.*;
import com.xxx.grad.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import java.util.*; 

@Component
public class UserService {

    @Autowired
    private UserMapper userMapper;


    public List<User> select(QueryWrapper<User> queryWrapper) {
        return userMapper.selectList(queryWrapper);
    }

    public int delete(QueryWrapper<User> queryWrapper) {
        return userMapper.delete(queryWrapper);
    }

    public int update(User user, QueryWrapper<User> queryWrapper) {
        return userMapper.update(user, queryWrapper);
    }

    public int insert(User user) {
        return userMapper.insert(user);
    }

    public int findLastId() {
        return userMapper.findLastId();
    }

}
