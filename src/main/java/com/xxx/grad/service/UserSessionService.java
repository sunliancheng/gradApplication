package com.xxx.grad.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xxx.grad.entity.Session;
import com.xxx.grad.mapper.SessionMapper;
import com.xxx.grad.utils.TimeUtils;
import com.xxx.grad.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.util.List;

@Service
public class UserSessionService {

    @Autowired
    private SessionMapper sessionMapper;

    /**
     * if have login, return 2
     * @param userid
     * @return
     */
    public int addLoginSession(Long userid) {
        if (checkIsLogin(userid)) return 2;
        Long time = TimeUtils.getCurrentTime();
        Session session = new Session(userid, time, time + 10 * TimeUtils.MINUTE, TokenUtils.generateToken(userid));
        return sessionMapper.insert(session);
    }

    public boolean checkIsLogin(Long userid) {
        List<Session> sessions = sessionMapper.selectList(new QueryWrapper<Session>().eq("userid", userid));
        if (sessions.size() == 0) {
            return false;
        } else {
            Session session = sessions.get(0);
            if (!TimeUtils.checkTime(session.getLogoutdate())) {
                return false;
            }
        }
        return true;
    }


}
