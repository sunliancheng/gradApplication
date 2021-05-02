package com.xxx.grad.utils;

import org.junit.Test;

import java.util.UUID;

public class TokenUtilsTest {

    @Test
    public void test() {
        System.out.println(TokenUtils.generateToken((long) 33));
    }

}

