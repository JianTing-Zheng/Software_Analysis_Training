package com.scut.controller;

import com.scut.domain.Houseparent;
import com.scut.domain.Student;
import com.scut.service.HouseparentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/houseparent")
public class HouseparentController {

    @Resource
    private HouseparentService houseparentService;

    @RequestMapping(value = "/displayDormitoryInfo")
    @ResponseBody
    public List<String> displayDormitoryInfo(Houseparent houseparent) {
        List<String> res = houseparentService.displayDormitoryInfo(houseparent);
        return res;
    }

    @RequestMapping(value = "/searchStudentInfo")
    @ResponseBody
    public List<Student> searchStudentInfo(Student student) {
        // 用student的sEmail属性接收当前宿管hID
        List<Student> res = houseparentService.searchStudentInfo(student.getsEmail(), student);
        return res;
    }

    @RequestMapping(value = "/displayHouseparentInfo")
    @ResponseBody
    public Houseparent displayHouseparentInfo(Houseparent houseparent) {
        return houseparentService.displayHouseparentInfo(houseparent);
    }

    @RequestMapping(value = "/modifyHouseparentDetail")
    @ResponseBody
    public List<String> modifyHouseparentDetail(Houseparent houseparent) {
        List<String> res = new ArrayList<>();
        res.add("修改失败");
        int isUpdate = houseparentService.modifyHouseparentDetail(houseparent);
        if(isUpdate == 1) {
            res.remove(0);
            res.add("修改成功");
        }
        return res;
    }

}
