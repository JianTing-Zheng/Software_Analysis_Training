package com.scut.service.Impl;

import com.scut.dao.AdminDao;
import com.scut.domain.Student;
import com.scut.service.AdminService;
import org.springframework.stereotype.Service;

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
}
