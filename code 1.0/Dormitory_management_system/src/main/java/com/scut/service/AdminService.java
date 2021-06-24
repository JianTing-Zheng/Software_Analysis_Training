package com.scut.service;

import com.scut.domain.Houseparent;
import com.scut.domain.Student;
import com.scut.domain.SuperAdmin;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface AdminService {

    List<Student> searchStudent();
    int addStudentSeparately(Student student);
    int delStudentSeparately(Student student);
    String addStudentBatch(MultipartFile file);
    Student searchStudentDetailInfo(Student student);
    int modifyStudentDetailInfo(Student student);
    int modifyAdminDetailInfo(SuperAdmin superAdmin);
    SuperAdmin searchAdminDetailInfo();
    List<Houseparent> searchHouseparent();
    int addHouseparentSeparately(Houseparent houseparent);
    int delHouseparentSeparately(Houseparent houseparent);
    String addHouseparentBatch(MultipartFile file);

}
