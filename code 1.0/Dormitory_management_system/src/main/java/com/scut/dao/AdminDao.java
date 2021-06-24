package com.scut.dao;

import com.scut.domain.Houseparent;
import com.scut.domain.Student;
import com.scut.domain.SuperAdmin;

import java.util.List;

public interface AdminDao {

    List<Student> selectStudent();
    int insertStudentSeparately(Student student);
    int deleteStudentSeparately(Student student);
    Student selectOneStudent(Student student);
    int updateStudentDetail(Student student);
    int updateAdminDetail(SuperAdmin superAdmin);
    SuperAdmin selectAdmin();
    List<Houseparent> selectHouseparent();
    int insertHouseparentSeparately(Houseparent houseparent);
    int deleteHouseparentSeparately(Houseparent houseparent);

}
