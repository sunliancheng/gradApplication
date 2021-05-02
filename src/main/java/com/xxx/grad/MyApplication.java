package com.xxx.grad;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import java.util.concurrent.CountDownLatch;

@SpringBootApplication
@MapperScan("com.xxx.grad.mapper")
public class MyApplication {

    public static void main (String[] args) throws Exception  {
        ApplicationContext ctx = SpringApplication.run(MyApplication.class, args);
        //System.out.println(ctx.getBean("corsConfig"));
        System.out.println(ctx.getBean("mySessionService"));
        new CountDownLatch(2).await();
    }
}
