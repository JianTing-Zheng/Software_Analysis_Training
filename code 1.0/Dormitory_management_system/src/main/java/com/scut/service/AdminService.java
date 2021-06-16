package com.scut.service;

import com.scut.domain.Student;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface AdminService {

    List<Student> searchStudent();
    int addStudentSeparately(Student student);
    int delStudentSeparately(Student student);
    String addStudentBatch(MultipartFile file);

}
