package com.xxx.grad.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xxx.grad.common.Result;
import com.xxx.grad.common.ResultUtil;
import com.xxx.grad.entity.*;
import com.xxx.grad.entity.User;
import com.xxx.grad.factory.ArticleFactory;
import com.xxx.grad.service.*;
import com.xxx.grad.service.UserService;
import com.xxx.grad.utils.StringUtils;
import com.xxx.grad.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RestController
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleServiceInterface articleServiceInterface;

    @Autowired
    private MySessionService mySessionService;

    @RequestMapping(value = "/addArticle")
    public ResponseEntity<Object> doAddArticle(HttpServletRequest request, Article article) {
        int lastId = 0;
        try {
            lastId = articleService.findLastId();
        } catch (Exception e) {
            lastId = 0;
        }
        article.setId(1 + (long) lastId);
        article.setCreatedate(TimeUtils.getCurrentTime());

        Session session = mySessionService.token2Session(request);
        if (session == null) { return ResponseEntity.ok(-1); }
        article.setUserid(session.getUserid());

        List<User> users = userService.select(new QueryWrapper<User>().eq("id", article.getUserid()));
        if (users.size() == 0) return ResponseEntity.ok(-1);

        int result = articleService.insert(article);
        if (result == 1) return ResponseEntity.ok(article);
        else return ResponseEntity.ok(-1);
    }

    @RequestMapping(value = "/getUserArticle")
    public ResponseEntity<Object> getUserArticle(HttpServletRequest request, Long userid) {

        Session session = mySessionService.token2Session(request);
        if (session == null) { return ResponseEntity.ok(-1); }
        userid = session.getUserid();

        List<Article> articles = articleService.select(new QueryWrapper<Article>().eq("userid", userid));
        //List<Article> articles = articleService.select(null);
        List<User> select = userService.select(null);
        if (articles.size() == 0) return ResponseEntity.ok(-1);
        List<ArticleDto> result = new ArrayList<>();
        for (Article article : articles) {
            result.add(ArticleFactory.toDto(article));
        }

        return ResponseEntity.ok(result);
    }

    /**
     *  分页查询
     * @param username
     * @param pageNo
     * @param pageSize
     * @return
     */
    @PostMapping("/list")
    @ResponseBody
    public Result<IPage<Article>> list(HttpServletRequest request, @RequestParam(value = "userid", required = false) Long userid,
                                    @RequestParam(defaultValue = "1") Integer pageNo,
                                    @RequestParam(defaultValue = "8") Integer pageSize){

        Session session = mySessionService.token2Session(request);
        if (session == null) { return null; }
        userid = (session.getUserid());

        // 构造查询条件
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        if(userid != null){
            queryWrapper.like("userid", userid);
            queryWrapper.orderByDesc("createdate");
        }
        Page<Article> page = new Page<>(pageNo,pageSize);

        IPage<Article> result = articleServiceInterface.page(page, queryWrapper);
        // 设置总记录数
        result.setTotal(articleServiceInterface.count(queryWrapper));

        return ResultUtil.ok(result);
    }


    @RequestMapping(value = "/updateArticle")
    public ResponseEntity<Object> updateArticle(HttpServletRequest request, Article article) {

        Session session = mySessionService.token2Session(request);
        if (session == null) { return ResponseEntity.ok(-1); }
        article.setUserid(session.getUserid());

        Article article1 = articleService.select(new QueryWrapper<Article>().eq("id", article.getId())).get(0);
        article1.setTitle(article.getTitle());
        article1.setContent(article.getContent());
        int result = articleService.update(article1, new QueryWrapper<Article>().eq("id", article.getId()));
        if (result == -1) return ResponseEntity.ok(-1);
        else return ResponseEntity.ok(article1);
    }

    @RequestMapping(value = "/deleteArticle")
    public ResponseEntity<Object> deleteArticle(Long id) {
        int result = articleService.delete(new QueryWrapper<Article>().eq("id", id));
        if (result != 1) return ResponseEntity.ok(-1);
        else return ResponseEntity.ok(result);
    }

    @RequestMapping(value = "/getArticle")
    public ResponseEntity<Object> getArticle(Long id) {
        List<Article> result = articleService.select(new QueryWrapper<Article>().eq("id", id));
        if (result.size() == 0) return ResponseEntity.ok(-1);
        else return ResponseEntity.ok(result.get(0));
    }

}
