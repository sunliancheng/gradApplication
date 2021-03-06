package com.xxx.grad.entity;

import lombok.*;

/**
 * this class code is automatically generated by the tool "Table2Entity";
 * the tool is for fast generating entity according to Database table;
 * 
 * the purpose of the tool is to better help my girlfriend to faster finish her graduation design;
 * 
 * @Author: Simin Wang
 * @Tool_Created_Date: 4/29/2021 2:56 AM
 * @Code_Generated_Date: 4/25/21 10:17 AM 
 */

@Data
public class Article { 

    @NonNull
    private Long id;

    private String title;

    private String content;

    private Long createdate;

    private Long userid;

    private String other;

    public Article(Long id, String title, String content, Long createdate, Long userid, String other) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.createdate = createdate;
        this.userid = userid;
        this.other = other;
    }

}