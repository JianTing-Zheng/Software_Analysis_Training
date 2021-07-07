package com.scut.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping(value = "/page_admin_lkx.do")
    public String admin_lkx() {
        return "adminIndex";
    }

    @RequestMapping(value = "page_houseparent_dorm.do")
    public String page_houseparent_dorm() {
        return "houseparent_dorm";
    }

    @RequestMapping(value = "/page_student_Information")
    public String page_student_Information() {
        return "student_Information";
    }

    @RequestMapping(value = "/page_student_Apply")
    public String page_student_ChangeDorm() {
        return "student_Apply";
    }

    @RequestMapping(value = "/page_student_MoveInOrOut")
    public String page_student_MoveInOrOut() {
        return "student_MoveInOrOut";
    }

}
