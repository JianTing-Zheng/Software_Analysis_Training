package com.scut.service;

import com.scut.domain.Application;
import com.scut.domain.Student;

import java.util.List;

public interface ApplyService {

    List<Application> searchApplication(Student student);
    Application searchApplicationDetail(Application application);
    int addApplication(Application application);
    int delApplication(Application application);
    int chaApplication(Application application);

    Student searchStudentOwn(Student student);
    int chaStudentOwn(Student student);

    int checkInOrOut(Student student);
}
