package com.scut.dao;

import com.scut.domain.Application;
import com.scut.domain.Student;

import java.util.List;

public interface ApplyDao {

    List<Application> selectApplication(Student student);
    Application selectApplicationDetail(Application application);
    int insertApplication(Application application);
    int deleteApplication(Application application);
    int updateApplication(Application application);

    Student selectStudentOwn(Student student);
    int updateStudentOwn(Student student);

    int checkInStudentOwn(Student student);
    int checkOutStudentOwn(Student student);
}
