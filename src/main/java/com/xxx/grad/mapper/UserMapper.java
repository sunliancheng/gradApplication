package com.xxx.grad.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xxx.grad.entity.*;
import org.apache.ibatis.annotations.Select;

public interface UserMapper extends BaseMapper<User> {
    @Select("select id from user order by id desc limit 1")
    public int findLastId();
}
