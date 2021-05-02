package com.xxx.grad.utils;

import java.util.UUID;

public class TokenUtils {

    public static String generateToken(Long userid) {
        StringBuilder sb = new StringBuilder();
        sb.append(UUID.randomUUID().toString());
        sb.append('-');
        sb.append(userid);
        return sb.toString();
    }

}
