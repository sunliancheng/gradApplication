package com.xxx.grad.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    @RequestMapping(value = "/test")
    public ResponseEntity<Object> demo() {
        return ResponseEntity.ok(-1);
    }

}
