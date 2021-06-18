package com.scut.service.Impl;

import com.scut.dao.AdminDao;
import com.scut.domain.Student;
import com.scut.service.AdminService;
import com.scut.utils.ReadExcel_Student;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminDao adminDao;

    @Override
    public List<Student> searchStudent() {
        return adminDao.selectStudent();
    }

    @Override
    public int addStudentSeparately(Student student) {
        return adminDao.insertStudentSeparately(student);
    }

    @Override
    public int delStudentSeparately(Student student) {
        return adminDao.deleteStudentSeparately(student);
    }

    @Override
    public String addStudentBatch(MultipartFile file) {
        String result = "";

        // 创建处理Excel的类
        ReadExcel_Student readExcel_student = new ReadExcel_Student();

        // 解析Excel
        List<Student> studentList = readExcel_student.getExcelInfo(file);
        if(studentList != null && !studentList.isEmpty()) {
            for(int i = 0; i < studentList.size(); i++) {
                Student student = studentList.get(i);
                adminDao.insertStudentSeparately(student);
            }
            result = "上传成功";
        }
        else {
            result = "上传失败";
        }

        return result;
    }

    @Override
    public Student searchStudentDetailInfo(Student student) {
        return adminDao.selectOneStudent(student);
    }

    @Override
    public int modifyStudentDetailInfo(Student student) {
        return adminDao.updateStudentDetail(student);
    }
}
