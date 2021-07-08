package com.scut.service;

import com.scut.domain.*;
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
    Houseparent searchHouseparentDetailInfo(Houseparent houseparent);
    int modifyHouseparentDetailInfo(Houseparent houseparent);

    List<Dormitory> searchDormitory();
    int addDormitorySeparately(Dormitory dormitory);
    int delDormitorySeparately(Dormitory dormitory);
    String addDormitoryAndRoomBatch(MultipartFile file);

    List<DormitoryAndRoom> searchDormitoryDetailInfo(Dormitory dormitory);
    int addRoomSeparately(Room room);
    int delRoomSeparately(Room room);

    int handleApplication(Application application);

    List<Application> displayApplications();

}
