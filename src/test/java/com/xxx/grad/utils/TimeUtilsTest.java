package com.xxx.grad.utils;

import org.junit.Test;

public class TimeUtilsTest {

    @Test
    public void test() {
        //System.out.println(TimeUtils.getCurTime());
        Long currentTime = TimeUtils.getCurrentTime();
        System.out.println(TimeUtils.millToDate(1619991536495l));
        //System.out.println(TimeUtils.millToDate(1619986234635l));
        System.out.println();

        //System.out.println(TimeUtils.dateToMills("2021/05/01"));
    }


}
