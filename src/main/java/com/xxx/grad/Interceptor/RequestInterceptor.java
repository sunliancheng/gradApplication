package com.xxx.grad.Interceptor;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xxx.grad.entity.Session;
import com.xxx.grad.service.MySessionService;
import com.xxx.grad.utils.TimeUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

public class RequestInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


        String servletPath = request.getServletPath();
        HttpSession session = request.getSession();

        if (servletPath.equals("/main")) return true;

        String token = (String) session.getAttribute("token");
        System.out.println(TimeUtils.millToDate(TimeUtils.getCurrentTime()) + "******调用了拦截器****** token = " + token + " Session过期时间: " + session.getAttribute("logoutDate") + " " + TimeUtils.millToDate((Long) session.getAttribute("logoutDate")));

        if ((!checkToken(token) || TimeUtils.curTimeBiggerThanTarget((Long) session.getAttribute("logoutDate"))) && (!servletPath.contains("ogin") && !servletPath.contains("egister"))) {
            response.sendRedirect("main");
            return false;
        }

        return super.preHandle(request, response, handler);
    }

    private boolean checkToken(String token) {
        if (token == null || token.equals("")) return false;
        return true;
    }

}
