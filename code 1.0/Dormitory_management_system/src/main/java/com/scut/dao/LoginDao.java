package com.scut.dao;

import com.scut.domain.SuperAdmin;
import com.scut.domain.Houseparent;
import com.scut.domain.Student;

public interface LoginDao {

    int correctStudent(Student student);
    int correctHouseparent(Houseparent houseparent);
    int correctAdministrator(SuperAdmin superAdmin);

}
