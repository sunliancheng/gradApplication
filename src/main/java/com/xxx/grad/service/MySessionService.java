package com.xxx.grad.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xxx.grad.entity.*;
import com.xxx.grad.mapper.*;
import com.xxx.grad.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import javax.servlet.http.HttpServletRequest;
import java.io.ObjectOutputStream;
import java.util.*;

@Service
public class MySessionService {

    @Autowired
    private SessionMapper sessionMapper;


    public List<Session> select(QueryWrapper<Session> queryWrapper) {
        return sessionMapper.selectList(queryWrapper);
    }

    public int delete(QueryWrapper<Session> queryWrapper) {
        return sessionMapper.delete(queryWrapper);
    }

    public int update(Session session, QueryWrapper<Session> queryWrapper) {
        return sessionMapper.update(session, queryWrapper);
    }

    public int insert(Session session) {
        QueryWrapper<Session> qw = new QueryWrapper<Session>().eq("userid", session.getUserid());
        List<Session> list = select(qw);
        if (list.size() == 0) {
            return sessionMapper.insert(session);
        } else {
            session.setLogoutdate(TimeUtils.getCurrentTime() + 15 * TimeUtils.MINUTE);
            return update(session, qw);
        }
    }

    public Session querySessionByToken(String token) {
        List<Session> sessions = select(new QueryWrapper<Session>().eq("token", token));
        if (sessions.size() == 0) return null;
        return sessions.get(0);
    }

    public boolean isValid(String token) {
        QueryWrapper<Session> qw = new QueryWrapper<Session>().eq("token", token);
        List<Session> list = select(qw);
        if (list.size() == 0) {
            // not login yet
            return false;
        }
        Session session = list.get(0);
        if (TimeUtils.checkTime(session.getLogoutdate())) {
            return true;
        }
        delete(qw);
        return false;
    }

    public Long getLogoutdate(String token) {
        if (token == null) return -1l;
        QueryWrapper<Session> qw = new QueryWrapper<Session>().eq("token", token);
        List<Session> list = select(qw);
        if (list.size() == 0) {
            // not login yet
            return -1l;
        }
        Session session = list.get(0);
        if (TimeUtils.checkTime(session.getLogoutdate())) {
            return session.getLogoutdate();
        }
        delete(qw);
        return -1l;
    }

    public Session token2Session(HttpServletRequest request) {
        String token = (String) request.getSession().getAttribute("token");
        if (token == null) return null;
        List<Session> list = select(new QueryWrapper<Session>().eq("token", token));
        if (list.size() == 0) return null;
        return list.get(0);
    }

}
