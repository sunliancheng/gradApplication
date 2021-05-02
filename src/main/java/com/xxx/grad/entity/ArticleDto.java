package com.xxx.grad.entity;

import lombok.Data;
import lombok.NonNull;

@Data
public class ArticleDto {

    private Long id;

    private String title;

    private String content;

    private String time;
}
