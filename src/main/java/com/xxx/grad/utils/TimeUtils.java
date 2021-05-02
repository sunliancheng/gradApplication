package com.xxx.grad.utils;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {

    public static Long MINUTE = (long) 60000;

    public static Long SECOND = (long) 1000;

    public static Long HOUR = (long) MINUTE * 60;

    public static Long DAY = (long) HOUR * 24;

    public static Long getCurrentTime() {
        Date date = new Date();
        return date.getTime();
    }

    public static String millToDate(Long mill) {
        if (mill == null) return "";
        Date date = new Date();
        date.setTime(mill);
        String s = new SimpleDateFormat().format(date);
        return s;
    }

    public static String getCurTime() {
        return millToDate(getCurrentTime());
    }

    public static boolean checkTime(Long time) {
        if (time == null) return false;
        return time < TimeUtils.getCurrentTime();
    }

    public static boolean curTimeBiggerThanTarget(Long time) {
        if (time == null) return false;
        return time < TimeUtils.getCurrentTime();
    }

    public static Long dateToMills(String time) {
        time = time.replaceAll("-", "/");
        long parse = Time.parse(time);
        return parse;
    }


}
