package com.scut.service;

import com.scut.domain.Houseparent;
import com.scut.domain.Student;

import java.util.List;

public interface HouseparentService {

    List<String> displayDormitoryInfo(Houseparent houseparent);
    List<Student> searchStudentInfo(String hID, Student student);
    Houseparent displayHouseparentInfo(Houseparent houseparent);
    int modifyHouseparentDetail(Houseparent houseparent);

}
