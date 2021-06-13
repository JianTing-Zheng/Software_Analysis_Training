package com.scut.dao;

import com.scut.domain.Administrator;
import com.scut.domain.Houseparent;
import com.scut.domain.Student;

public interface LoginDao {

    int correctStudent(Student student);
    int correctHouseparent(Houseparent houseparent);
    int correctAdministrator(Administrator administrator);

}
