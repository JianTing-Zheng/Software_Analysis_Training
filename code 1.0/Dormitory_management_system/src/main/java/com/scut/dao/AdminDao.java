package com.scut.dao;

import com.scut.domain.*;
import com.scut.domain.DormitoryAndRoom;

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
    Houseparent selectOneHouseparent(Houseparent houseparent);
    int updateHouseparentDetail(Houseparent houseparent);

    List<Dormitory> selectDormitory();
    int insertDormitorySeparately(Dormitory dormitory);
    int deleteDormitorySeparately(Dormitory dormitory);

    int isExistDormitory(Dormitory dormitory);
    int isExistRoom(Room room);
    int updateDormitoryDetail(Dormitory dormitory);
    int updateRoomDetail(Room room);
    int insertRoomSeparately(Room room);

    List<DormitoryAndRoom> selectDormitoryDetail(Dormitory dormitory);
    int deleteRoomSeparately(Room room);

    int handleApplication(Application application);

    List<Application> selectApplications();

    int selectionRoom(String id, String roomID, String dormID);

    void changeStudentRoom(Application application);

    void deleteStutentRoom(Application application);

    Room selectRoomState(String sID);

    void decreaseRoomState(String dormID);

}
