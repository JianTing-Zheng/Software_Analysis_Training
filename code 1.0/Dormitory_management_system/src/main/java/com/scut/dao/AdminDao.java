package com.scut.dao;

import com.scut.domain.Student;

import java.util.List;

public interface AdminDao {

    List<Student> selectStudent();
    int insertStudentSeparately(Student student);
    int deleteStudentSeparately(Student student);

}
