//package com.xxx.grad;
//
//
//import com.xxx.grad.entity.User;
//import com.xxx.grad.service.UserService;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import java.util.List;
//import java.util.Map;
//
//@RunWith(SpringRunner.class)
//@SpringBootTest
//public class SampleTest {
//
//    @Autowired
//    private UserService userService;
//
//    @Test
//    public void testSelect() {
//        System.out.println(("----- selectAll method test ------"));
////        User user = new User();
////        user.setId(7L);
////        user.setName("testName");
////        user.setAge(21);
////        userService.addUser(user);
//
//        List<User> select = userService.select(null);
//        select.stream().forEach(System.out::println);
//        System.out.println(userService.findLastId());
//    }
//
//}