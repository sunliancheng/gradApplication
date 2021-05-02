package com.xxx.grad.utils;

public class StringUtils {

    public static boolean isNull(String str) {return str == null;}

    public static boolean isBlank(String str) {return str.equals("");}

    public static boolean isNullOrBlank(String str) {
        return isNull(str) && isBlank(str);
    }
}
