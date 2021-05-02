package com.xxx.grad.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xxx.grad.entity.Article;
import com.xxx.grad.entity.Contact;
import com.xxx.grad.mapper.ArticleMapper;
import com.xxx.grad.mapper.ContactMapper;
import org.springframework.stereotype.Service;

@Service
public class ContactServiceImpl extends ServiceImpl<ContactMapper, Contact> implements ContactServiceInterface {
}
