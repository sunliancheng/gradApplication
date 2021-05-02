package com.xxx.grad.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xxx.grad.common.Result;
import com.xxx.grad.common.ResultUtil;
import com.xxx.grad.entity.Article;
import com.xxx.grad.entity.Contact;
import com.xxx.grad.entity.Session;
import com.xxx.grad.entity.User;
import com.xxx.grad.service.*;
import com.xxx.grad.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class ContactController {

    @Autowired
    private ContactServiceInterface contactServiceInterface;

    @Autowired
    private ContactService contactService;

    @Autowired
    private UserService userService;

    @Autowired
    private MySessionService mySessionService;
    /**
     *  分页查询
     * @param username
     * @param pageNo
     * @param pageSize
     * @return
     */
    @PostMapping("/listContact")
    @ResponseBody
    public Result<IPage<Contact>> list(HttpServletRequest request, @RequestParam(value = "userid", required = false) Long userid,
                                       @RequestParam(defaultValue = "1") Integer pageNo,
                                       @RequestParam(defaultValue = "8") Integer pageSize){

        Session session = mySessionService.token2Session(request);
        if (session == null) { return null; }
        userid = (session.getUserid());

        // 构造查询条件
        QueryWrapper<Contact> queryWrapper = new QueryWrapper<>();
        if(userid != null){
            queryWrapper.like("userid", userid);
            queryWrapper.orderByDesc("name");
        }
        Page<Contact> page = new Page<>(pageNo,pageSize);
        IPage<Contact> result = contactServiceInterface.page(page, queryWrapper);
        // 设置总记录数
        result.setTotal(contactServiceInterface.count(queryWrapper));
        return ResultUtil.ok(result);
    }

    @RequestMapping(value = "/updateContact")
    public ResponseEntity<Object> updateContact(HttpServletRequest request, Contact contact) {

        Session session = mySessionService.token2Session(request);
        if (session == null) { return ResponseEntity.ok(-1); }
        contact.setUserid(session.getUserid());

        List<Contact> ls = contactService.select(new QueryWrapper<Contact>().eq("id", contact.getId()));
        if (ls.size() == 0) return ResponseEntity.ok(-1);
        Contact original = ls.get(0);
        original.setName(contact.getName());
        original.setTelephone(contact.getTelephone());
        original.setEmail(contact.getEmail());
        original.setRemarks(contact.getRemarks());
        original.setNotes(contact.getNotes());

        int result = contactService.update(original, new QueryWrapper<Contact>().eq("id", contact.getId()));
        if (result == -1) return ResponseEntity.ok(-1);
        else return ResponseEntity.ok(contact);
    }

    @RequestMapping(value = "/deleteContact")
    public ResponseEntity<Object> deleteContact(Long id) {
        int result = contactService.delete(new QueryWrapper<Contact>().eq("id", id));
        if (result != 1) return ResponseEntity.ok(-1);
        else return ResponseEntity.ok(result);
    }

    @RequestMapping(value = "/getContact")
    public ResponseEntity<Object> getContact(Long id) {
        List<Contact> result = contactService.select(new QueryWrapper<Contact>().eq("id", id));
        if (result.size() == 0) return ResponseEntity.ok(-1);
        else return ResponseEntity.ok(result.get(0));
    }

    @RequestMapping(value = "/addContact")
    public ResponseEntity<Object> addContact(HttpServletRequest request, Contact contact) {

        Session session = mySessionService.token2Session(request);
        if (session == null) { return ResponseEntity.ok(-1); }
        contact.setUserid(session.getUserid());

        int lastId = 0;
        try {
            lastId = contactService.findLastId();
        } catch (Exception e) {
            lastId = 0;
        }
        contact.setId(1 + (long) lastId);

        if (contact.getUserid() == null) return ResponseEntity.ok(-1);
        List<User> users = userService.select(new QueryWrapper<User>().eq("id", contact.getUserid()));
        if (users.size() == 0) return ResponseEntity.ok(-1);

        int result = contactService.insert(contact);
        if (result == 1) return ResponseEntity.ok(contact);
        else return ResponseEntity.ok(-1);
    }


}
