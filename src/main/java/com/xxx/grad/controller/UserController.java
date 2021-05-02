package com.xxx.grad.controller;

import com.alibaba.fastjson.JSON;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xxx.grad.entity.Session;
import com.xxx.grad.entity.User;
import com.xxx.grad.mapper.UserMapper;
import com.xxx.grad.service.MySessionService;
import com.xxx.grad.service.UserService;
import com.xxx.grad.service.UserSessionService;
import com.xxx.grad.utils.StringUtils;
import com.xxx.grad.utils.TimeUtils;
import com.xxx.grad.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Controller
public class UserController {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserService userService;

    @Autowired
    private UserSessionService userSessionService;

    @Autowired
    private MySessionService mySessionService;

    @RequestMapping(value = "/getUsers")
    public String getUsers() {
        List<User> users = userMapper.selectList(null);
        //System.out.println("diao yong get Users");
        return JSON.toJSONString(users);
    }

    @RequestMapping(value = "/login")
    public String login(HttpServletResponse response) {
        return "login";
    }

    @RequestMapping(value = "/register")
    public String register(HttpServletResponse response) {
        return "register";
    }

    @RequestMapping(value = "/doLogin")
    public String doLogin(String username, String password, HttpServletRequest request) {
        if (StringUtils.isNull(username) ||StringUtils.isBlank(username) || StringUtils.isNull(password) || StringUtils.isBlank(password)) {
            return "login";
        }
        List<User> users = userService.select(new QueryWrapper<User>().eq("name", username));
        if (users.size() == 0) {
            return "login";
        } else {
            if (users.get(0).getPassword().equals(password)) {
                int i = userSessionService.addLoginSession(users.get(0).getId());
                String token = TokenUtils.generateToken(users.get(0).getId());
                Long logoutDate = TimeUtils.getCurrentTime() + TimeUtils.MINUTE * 15;
                request.getSession().setAttribute("token", token);
                request.getSession().setAttribute("logoutDate", logoutDate);
                Session session = new Session(users.get(0).getId(), logoutDate, null, token);
                int insert = mySessionService.insert(session);
                if (insert == 1) return "transaction";
            }
            else return "login";
        }
        return "login";
    }

    @RequestMapping(value = "/doRegister")
    public String doRegister(User user) {

        if (StringUtils.isNullOrBlank(user.getName()) || StringUtils.isNullOrBlank(user.getPassword())) {
            return "register";
        }
        user.setId((long) userService.findLastId() + 1);
        user.setRegisterdate(TimeUtils.getCurrentTime());
        int insert = userMapper.insert(user);
        if (insert >= 0) return "login";
        else return "register";
        //return "login";
    }

    @RequestMapping(value = "/unLogin")
    public String unLogin(HttpServletRequest request) {
        mySessionService.delete(new QueryWrapper<Session>().eq("token", request.getSession().getAttribute("token")));
        request.getSession().removeAttribute("token");
        request.getSession().removeAttribute("logoutDate");
        return "main";
    }
}
