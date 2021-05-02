package com.xxx.grad.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageResolverController {

    @RequestMapping(value = "/article")
    public String showPage() {
        return "article";
    }

    @RequestMapping(value = "/main")
    public String showDemo() {
        return "main";
    }

    @RequestMapping(value = "/transaction")
    public String showTran() {
        return "transaction";
    }

    @RequestMapping(value = "/contact")
    public String showContact() {
        return "contact";
    }

    @RequestMapping(value = "/demo")
    public String demo() {
        return "demo";
    }

    @RequestMapping(value = "/")
    public String index() {
        return "main";
    }




}
