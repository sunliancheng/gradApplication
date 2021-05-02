package com.xxx.grad.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xxx.grad.entity.*;
import org.apache.ibatis.annotations.Select;

public interface ContactMapper extends BaseMapper<Contact> {

    @Select(value = "select id from contact order by id desc limit 1")
    int findLastId();
}
