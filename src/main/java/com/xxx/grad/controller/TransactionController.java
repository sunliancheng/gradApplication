package com.xxx.grad.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xxx.grad.common.Result;
import com.xxx.grad.common.ResultUtil;
import com.xxx.grad.entity.Article;
import com.xxx.grad.entity.Session;
import com.xxx.grad.entity.Transaction;
import com.xxx.grad.entity.User;
import com.xxx.grad.mapper.TransactionMapper;
import com.xxx.grad.service.*;
import com.xxx.grad.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class TransactionController {

    @Autowired
    private TransactionService transactionService;

    @Autowired
    private UserService userService;

    @Autowired
    private TransactionServiceInterface transactionServiceInterface;

    @Autowired
    private MySessionService mySessionService;

    @RequestMapping(value = "/addTransaction")
    public ResponseEntity<Object> addTrans(HttpServletRequest request, Transaction transaction, String finishday) {

        Session session = mySessionService.token2Session(request);
        if (session == null) { return ResponseEntity.ok(-1); }
        transaction.setOwner(session.getUserid());

        int lastId = 0;
        try {
            lastId = transactionService.findLastId();
        } catch (Exception e){
            lastId = 0;
        }

        transaction.setFinishdate(TimeUtils.dateToMills(finishday));


        transaction.setId(1 + (long) lastId);
        transaction.setCreatedate(TimeUtils.getCurrentTime());

        if (transaction.getOwner() == null) return ResponseEntity.ok(-1);
        List<User> users = userService.select(new QueryWrapper<User>().eq("id", transaction.getOwner()));
        if (users.size() == 0) return ResponseEntity.ok(-1);

        transaction.setCreatedate(TimeUtils.getCurrentTime());
        if (transaction.getIsfinished() == 1) {
            transaction.setFinishdate(TimeUtils.getCurrentTime());
        }

        int result = transactionService.insert(transaction);
        if (result == 1) return ResponseEntity.ok(transaction);
        else return ResponseEntity.ok(-1);
    }

    /**
     *  分页查询
     * @param username
     * @param pageNo
     * @param pageSize
     * @return
     */
    @PostMapping("/listTrans")
    @ResponseBody
    public Result<IPage<Transaction>> list(HttpServletRequest request, @RequestParam(value = "owner", required = false) Long owner,
                                       @RequestParam(defaultValue = "1") Integer pageNo,
                                       @RequestParam(defaultValue = "8") Integer pageSize){

        Session session = mySessionService.token2Session(request);
        if (session == null) { return null; }
        owner = (session.getUserid());

        QueryWrapper<Transaction> queryWrapper = new QueryWrapper<>();
        if(owner != null){
            queryWrapper.eq("owner", owner);
            queryWrapper.orderByAsc("finishdate");
        }
        Page<Transaction> page = new Page<>(pageNo,pageSize);
        IPage<Transaction> result = transactionServiceInterface.page(page, queryWrapper);
        result.setTotal(transactionServiceInterface.count(queryWrapper));
        return ResultUtil.ok(result);
    }

    @PostMapping("/listTransByDate")
    @ResponseBody
    public Result<IPage<Transaction>> listDate(HttpServletRequest request, @RequestParam(value = "owner", required = false) Long owner,
                                           @RequestParam(value = "date", required = false) String date,
                                           @RequestParam(defaultValue = "1") Integer pageNo,
                                           @RequestParam(defaultValue = "8") Integer pageSize){

        Session session = mySessionService.token2Session(request);
        if (session == null) { return null; }
        owner = session.getUserid();

        QueryWrapper<Transaction> queryWrapper = new QueryWrapper<>();
        Long time = TimeUtils.dateToMills(date);
        if(owner != null){
            queryWrapper.eq("owner", owner);
            queryWrapper.ge("finishdate", time);
            queryWrapper.orderByAsc("finishdate");
        }
        Page<Transaction> page = new Page<>(pageNo,pageSize);
        IPage<Transaction> result = transactionServiceInterface.page(page, queryWrapper);
        result.setTotal(transactionServiceInterface.count(queryWrapper));
        return ResultUtil.ok(result);
    }


    @RequestMapping(value = "/getUserTransaction")
    public ResponseEntity<Object> getUserTrans(HttpServletRequest request, Long userid) {

        Session session = mySessionService.token2Session(request);
        if (session == null) { return ResponseEntity.ok(-1); }
        userid = (session.getUserid());

        List<Transaction> transactions = transactionService.select(new QueryWrapper<Transaction>().eq("owner", userid));
        //List<User> users = userService.select(null);
        if (transactions.size() == 0) return ResponseEntity.ok(-1);
        else return ResponseEntity.ok(transactions);
    }

    @RequestMapping(value = "/getTransaction")
    public ResponseEntity<Object> getTransaction(Long id) {
        List<Transaction> transactions = transactionService.select(new QueryWrapper<Transaction>().eq("id", id));
        if (transactions.size() == 0) return ResponseEntity.ok(-1);
        else return ResponseEntity.ok(transactions.get(0));
    }

    @RequestMapping(value = "/updateTransaction")
    public ResponseEntity<Object> updateTrans(HttpServletRequest request, Transaction transaction, String finishdate2) {

        Session session = mySessionService.token2Session(request);
        if (session == null) { return ResponseEntity.ok(-1); }
        transaction.setOwner(session.getUserid());

        Transaction transaction1 = transactionService.select(new QueryWrapper<Transaction>().eq("id", transaction.getId())).get(0);
        transaction1.setCommon(transaction.getCommon());
        transaction1.setBody(transaction.getBody());

        // 1 - 0
        if (transaction1.getIsfinished() == 1 && transaction.getIsfinished() == 0) {
            transaction1.setIsfinished(0);
            //transaction1.setFinishdate(null);
        } else if (transaction.getIsfinished() == 1 && transaction1.getIsfinished() == 0) {
            // 0 - 1
            transaction1.setIsfinished(1);
            //transaction1.setFinishdate(TimeUtils.getCurrentTime());
        }

        transaction1.setFinishdate(TimeUtils.dateToMills(finishdate2));

        int result = transactionService.update(transaction1, new QueryWrapper<Transaction>().eq("id", transaction.getId()));
        if (result == -1) return ResponseEntity.ok(-1);
        else return ResponseEntity.ok(transaction1);
    }

    @RequestMapping(value = "/deleteTransaction")
    public ResponseEntity<Object> deleteTrans(Long id) {
        int result = transactionService.delete(new QueryWrapper<Transaction>().eq("id", id));
        if (result != 1) return ResponseEntity.ok(-1);
        else return ResponseEntity.ok(result);
    }


}
