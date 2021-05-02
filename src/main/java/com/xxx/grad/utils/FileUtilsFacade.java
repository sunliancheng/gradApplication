package com.xxx.grad.utils;


import com.xxx.grad.utils.FileUtils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 这是一个 封装 FileUtils 方法的 api 类
 */
@Component
public class FileUtilsFacade {

    @Autowired
    private FileUtils fileUtils;

    public void generateCodeFromTable() {
        fileUtils.createBeanServiceMapper();
    }


}
