package com.scut.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping(value = "/page_admin_StudentModel.do")
    public String admin_StudentModel() {
        return "admin_StudentModel";
    }

    @RequestMapping(value = "/page_admin_HouseparentModel.do")
    public String admin_HouseparentModel() {
        return "admin_HouseparentModel";
    }

    @RequestMapping(value = "/page_admin_lkx.do")
    public String admin_lkx() {
        return "admin_StudentModel_2";
    }

}
