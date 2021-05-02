package com.xxx.grad.factory;

import com.xxx.grad.entity.Article;
import com.xxx.grad.entity.ArticleDto;
import com.xxx.grad.utils.TimeUtils;
import org.springframework.beans.BeanUtils;

public class ArticleFactory {

    public static ArticleDto toDto(Article article) {
        ArticleDto dto = new ArticleDto();

        BeanUtils.copyProperties(article, dto);
        dto.setTime(TimeUtils.millToDate(article.getCreatedate()));

        return dto;
    }

}
