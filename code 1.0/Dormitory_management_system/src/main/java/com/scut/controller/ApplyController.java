package com.scut.controller;

import com.scut.domain.Application;
import com.scut.domain.Student;
import com.scut.service.ApplyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value= "/apply")
public class ApplyController {

    @Resource
    private ApplyService applyService;

    //申请处理区域
    @RequestMapping(value="/displayApplication")
    @ResponseBody
    //查询某个学生发出的请求，根据传来的学生id查询他的发出的申请
    public List<Application> displayApplication(Student student){
        List<Application> applications;
        applications = applyService.searchApplication(student);
        return applications;
    }

    @RequestMapping(value="/displayApplicationDetail.do")
    @ResponseBody
    //查询某个申请的具体信息，根据传来的applyID查询
    public Application displayApplicationDetail(Application application){
        Application applicationDetail;
        applicationDetail=applyService.searchApplicationDetail(application);
        return applicationDetail;
    }

    @RequestMapping(value="/addApplication")
    @ResponseBody
    //根据传过来的sID, 申请类型, 申请理由, 申请意向添加申请
    public List<String> addApplication(Application application){
        application.setApplyState("0");

        List<String> res = new ArrayList<>();
        res.add("发起申请失败");
        int isAdd = applyService.addApplication(application);
        if(isAdd == 1){
            res.remove(0);
            res.add("发起申请成功");
        }
        return res;
    }

    @RequestMapping(value="/chaApplication.do")
    @ResponseBody
    //根据传来的新的appID, applyType, applyReason, applyIntention修改申请
    public List<String> chaApplication(Application application){
        List<String> res = new ArrayList<>();
        res.add("修改申请失败");
        int isChange = applyService.chaApplication(application);
        if(isChange == 1){
            res.remove(0);
            res.add("修改申请成功");
        }
        return res;
    }

    @RequestMapping(value = "/delApplication")
    @ResponseBody
    //根据传过来的applyID, 学生取消申请
    public List<String> delApplication(Application application){
        List<String> res = new ArrayList<>();
        res.add("取消申请失败");
        int isDelete = applyService.delApplication(application);
        if(isDelete == 1){
            res.remove(0);
            res.add("取消申请成功");
        }
        return res;
    }

    //学生信息处理区域
    @RequestMapping(value="/displayStudentOwn.do")
    @ResponseBody
    //根据传来的sID，查看学生信息
    public Student displayStudentOwn(Student student){
        Student studentOwn;
        studentOwn = applyService.searchStudentOwn(student);
        return studentOwn;
    }

    //根据学生传来的信息，更改学生信息
    @RequestMapping(value="/chaStudentOwn.do")
    @ResponseBody
    public List<String> chaStudenOwn(Student student){
        List<String> res=new ArrayList<>();
        res.add("修改信息失败");
        int isChange=applyService.chaStudentOwn(student);
        if(isChange==1){
            res.remove(0);
            res.add("修改信息成功");
        }
        return res;
    }

    //学生办理入住、离校处理区域
    @RequestMapping(value = "/checkInOrOut")
    @ResponseBody
    public List<String> checkInOrOut(Student student) {
        List<String> res = new ArrayList<>();
        if(student.getLivingState().equals("0")) {
            int isCheckIn = applyService.checkInOrOut(student);
            if(isCheckIn == 1) {
                res.add("办理入住成功");
            }
            else {
                res.add("办理入住失败");
            }
        }
        else if(student.getLivingState().equals("1")) {
            int isCheckOut = applyService.checkInOrOut(student);
            if(isCheckOut == 1) {
                res.add("办理离校成功");
            }
            else {
                res.add("办理离校失败");
            }
        }
        return res;
    }

}


