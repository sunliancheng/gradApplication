package com.xxx.grad.utils;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class FileUtilsFacadeTest {

    @Autowired
    private FileUtilsFacade fileUtilsFacade;

    @Test
    public void test() {
        fileUtilsFacade.generateCodeFromTable();
    }
}
