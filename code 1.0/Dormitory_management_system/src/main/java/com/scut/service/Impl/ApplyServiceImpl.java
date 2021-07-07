package com.scut.service.Impl;

import com.scut.dao.ApplyDao;
import com.scut.domain.Application;
import com.scut.domain.Student;
import com.scut.service.ApplyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ApplyServiceImpl implements ApplyService{

    @Resource
    private ApplyDao applyDao;

    @Override
    public List<Application> searchApplication(Student student){
        return applyDao.selectApplication(student);
    }

    @Override
    public Application searchApplicationDetail(Application application){
        return applyDao.selectApplicationDetail(application);
    }

    @Override
    public int addApplication(Application application) {
        //获取当前日期，并赋值。
        Date date = new Date();
        application.setApplyTime(date);
        return applyDao.insertApplication(application);
    }

    @Override
    public int chaApplication(Application application) {
        return applyDao.updateApplication(application);
    }

    @Override
    public int delApplication(Application application){
        return applyDao.deleteApplication(application);
    }

    @Override
    public Student searchStudentOwn(Student student) {
        return applyDao.selectStudentOwn(student);
    }

    @Override
    public int chaStudentOwn(Student student) {
        return applyDao.updateStudentOwn(student);
    }

    @Override
    public int checkInOrOut(Student student) {
        if(student.getLivingState().equals("0")) {
            return applyDao.checkInStudentOwn(student);
        }
        else {
            return applyDao.checkOutStudentOwn(student);
        }
    }

}
