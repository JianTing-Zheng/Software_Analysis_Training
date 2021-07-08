package com.scut.controller;

import com.scut.domain.*;
import com.scut.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

    @RequestMapping(value = "/uploadStudent.do", method = RequestMethod.POST)
    public void uploadStudent(@RequestParam(value = "file", required = false) MultipartFile file,
                              HttpServletResponse response) throws IOException {
        response.setContentType("application/text;charset=utf-8");
        String result = adminService.addStudentBatch(file);
        PrintWriter pw = response.getWriter();
        pw.println(result);
        pw.flush();
        pw.close();
    }

    @RequestMapping(value = "/searchStudentDetail.do")
    @ResponseBody
    public Student searchStudentDetail(Student student) {
        return adminService.searchStudentDetailInfo(student);
    }

    @RequestMapping(value = "/modifyStudentDetail.do")
    public void modifyStudentDetail(Student student, HttpServletResponse response) throws IOException {
        String res = "修改失败";
        int isUpdate = adminService.modifyStudentDetailInfo(student);
        if(isUpdate == 1) {
            res = "修改成功";
        }

        response.setContentType("application/text;charset=utf-8");
        PrintWriter pw = response.getWriter();
        pw.println(res);
        pw.flush();
        pw.close();
    }

    @RequestMapping(value = "/modifyAdminDetail.do")
    public void modifyAdminDetail(SuperAdmin superAdmin, HttpServletResponse response) throws IOException {
        String res = "修改失败";
        int isUpdate = adminService.modifyAdminDetailInfo(superAdmin);
        if(isUpdate == 1) {
            res = "修改成功";
        }

        response.setContentType("application/text;charset=utf-8");
        PrintWriter pw = response.getWriter();
        pw.println(res);
        pw.flush();
        pw.close();
    }

    @RequestMapping(value = "/searchAdminDetail.do")
    @ResponseBody
    public SuperAdmin searchAdminDetail() {
        return adminService.searchAdminDetailInfo();
    }

    @RequestMapping(value = "/displayHouseparent.do")
    @ResponseBody
    public List<Houseparent> displayHouseparent() {
        List<Houseparent> houseparents = adminService.searchHouseparent();
        return houseparents;
    }

    @RequestMapping(value = "/addHouseparentSeparately.do")
    @ResponseBody
    public List<String> addHouseparentSeparately(Houseparent houseparent) {
        List<String> res = new ArrayList<>();
        res.add("添加失败");
        int isInsert = adminService.addHouseparentSeparately(houseparent);
        if(isInsert == 1) {
            res.remove(0);
            res.add("添加成功");
        }
        return res;
    }

    @RequestMapping(value = "/delHouseparentSeparately.do")
    @ResponseBody
    public List<String> delHouseparentSeparately(Houseparent houseparent) {
        List<String> res = new ArrayList<>();
        res.add("删除失败");
        int isDelete = adminService.delHouseparentSeparately(houseparent);
        if(isDelete == 1) {
            res.remove(0);
            res.add("删除成功");
        }
        return res;
    }

    @RequestMapping(value = "/uploadHouseparent.do")
    @ResponseBody
    public List<String> uploadHouseparent(@RequestParam(value = "file", required = false) MultipartFile file) {
        List<String> res = new ArrayList<>();
        res.add(adminService.addHouseparentBatch(file));
        return res;
    }

    @RequestMapping(value = "/searchHouseparentDetail.do")
    @ResponseBody
    public Houseparent searchHouseparentDetail(Houseparent houseparent) {
        return adminService.searchHouseparentDetailInfo(houseparent);
    }

    @RequestMapping(value = "/modifyHouseparentDetail.do")
    @ResponseBody
    public List<String> modifyHouseparentDetail(Houseparent houseparent) {
        List<String> res = new ArrayList<>();
        res.add("修改失败");
        int isUpdate = adminService.modifyHouseparentDetailInfo(houseparent);
        if(isUpdate == 1) {
            res.remove(0);
            res.add("修改成功");
        }
        return res;
    }

    @RequestMapping(value = "/displayDormitory.do")
    @ResponseBody
    public List<Dormitory> displayDormitory() {
        List<Dormitory> dormitories = adminService.searchDormitory();
        return dormitories;
    }

    @RequestMapping(value = "/addDormitorySeparately.do")
    @ResponseBody
    public List<String> addDormitorySeparately(Dormitory dormitory) {
        List<String> res = new ArrayList<>();
        res.add("添加失败");
        int isInsert = adminService.addDormitorySeparately(dormitory);
        if(isInsert == 1) {
            res.remove(0);
            res.add("添加成功");
        }
        return res;
    }

    @RequestMapping(value = "/delDormitorySeparately.do")
    @ResponseBody
    public List<String> delDormitorySeparately(Dormitory dormitory) {
        List<String> res = new ArrayList<>();
        res.add("删除失败");
        int isDelete = adminService.delDormitorySeparately(dormitory);
        if(isDelete == 1) {
            res.remove(0);
            res.add("删除成功");
        }
        return res;
    }

    @RequestMapping(value = "/uploadDormitoryAndRoom.do")
    @ResponseBody
    public List<String> uploadDormitoryAndRoom(@RequestParam(value = "file", required = false) MultipartFile file) {
        List<String> res = new ArrayList<>();
        res.add(adminService.addDormitoryAndRoomBatch(file));
        return res;
    }

    @RequestMapping(value = "/searchDormitoryDetail.do")
    @ResponseBody
    public List<DormitoryAndRoom> searchDormitoryDetail(Dormitory dormitory) {
        List<DormitoryAndRoom> dormitoryAndRoomList = adminService.searchDormitoryDetailInfo(dormitory);
        return dormitoryAndRoomList;
    }

    @RequestMapping(value = "/addRoomSeparately.do")
    @ResponseBody
    public List<String> addRoomSeparately(Room room) {
        List<String> res = new ArrayList<>();
        res.add("添加失败");
        int isInsert = adminService.addRoomSeparately(room);
        if(isInsert == 1) {
            res.remove(0);
            res.add("添加成功");
        }
        return res;
    }

    @RequestMapping(value = "/delRoomSeparately.do")
    @ResponseBody
    public List<String> delRoomSeparately(Room room) {
        List<String> res = new ArrayList<>();
        res.add("删除失败");
        int isDelete = adminService.delRoomSeparately(room);
        if(isDelete == 1) {
            res.remove(0);
            res.add("删除成功");
        }
        return res;
    }

    @RequestMapping(value="/displayApplications.do")
    @ResponseBody
    public List<Application> displayApplication(){
        return adminService.displayApplications();
    }

    @RequestMapping(value="/handleApplication.do")
    @ResponseBody
    public List<String> handleApplication(Application application){
        List<String> res=new ArrayList<>();
        res.add("批准失败");
        int isAgree = adminService.handleApplication(application);
        if(isAgree == 1){
            res.remove(0);
            res.add("批准成功");
        }
        return res;
    }

}
