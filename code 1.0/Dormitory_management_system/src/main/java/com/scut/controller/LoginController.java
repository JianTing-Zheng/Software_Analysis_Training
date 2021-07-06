package com.scut.controller;

import com.scut.service.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Resource
    private LoginService service;

    @RequestMapping(value = "/login.do")
    public ModelAndView login(String id, String password, String identity, HttpSession httpSession) {
        ModelAndView mv = new ModelAndView();
        if(identity.equals("student")) {
            int res = service.isMatching(id, password, 0);
            if(res == 1) {
                mv.setViewName("studentIndex");

                // 存放当前登录学生id
                httpSession.setAttribute("currentStudentID", id);
            }
            else {
                mv.setViewName("studentLoginFail");
            }
        }
        else if(identity.equals("houseparent")) {
            int res = service.isMatching(id, password, 1);
            if(res == 1) {
                mv.setViewName("houseparentIndex");

                // 存放当前登录宿管id
                httpSession.setAttribute("currentHpID", id);
            }
            else {
                mv.setViewName("houseparentLoginFail");
            }
        }
        else if(identity.equals("superAdmin")) {
            int res = service.isMatching(id, password, 2);
            if(res == 1) {
                mv.setViewName("adminIndex");
            }
            else {
                mv.setViewName("adminLoginFail");
            }
        }
        return mv;
    }

}
