package com.scut.controller;

import com.scut.domain.Student;
import com.scut.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Resource
    private AdminService adminService;

    @RequestMapping(value = "/displayStudent.do")
    @ResponseBody
    public List<Student> displayStudent() {
        List<Student> students = adminService.searchStudent();
        return students;
    }

    @RequestMapping(value = "/addStudentSeparately.do")
    @ResponseBody
    public int addStudentSeparately(Student student) {
        return adminService.addStudentSeparately(student);
    }

    @RequestMapping(value = "/delStudentSeparately.do")
    @ResponseBody
    public int delStudentSeparately(Student student) {
        return adminService.delStudentSeparately(student);
    }

    @RequestMapping(value = "/uploadStudent.do")
    public void uploadStudent(@RequestParam(value = "file", required = false) MultipartFile file,
                              HttpServletResponse response) throws IOException {
        response.setContentType("application/text;charset=utf-8");
        String result = adminService.addStudentBatch(file);
        PrintWriter pw = response.getWriter();
        pw.println(result);
        pw.flush();
        pw.close();
    }

}
