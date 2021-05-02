package com.xxx.grad.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xxx.grad.entity.*;
import org.apache.ibatis.annotations.Select;

public interface TransactionMapper extends BaseMapper<Transaction> {

    @Select(value = "select id from transaction order by id desc limit 1")
    public int findLastId();
}
