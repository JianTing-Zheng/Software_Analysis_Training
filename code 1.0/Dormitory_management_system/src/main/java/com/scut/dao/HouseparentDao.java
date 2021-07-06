package com.scut.dao;

import com.scut.domain.Houseparent;
import com.scut.domain.Room;
import com.scut.domain.Student;

import java.util.List;

public interface HouseparentDao {

    // displayDormitoryInfo
    Houseparent selectHouseparentDetail(Houseparent houseparent);
    int selectRoomAmount(Room room);
    int selectFreeRoomAmount(Room room);
    int selectBedAmount(Room room);
    int selectCheckInAmount(Room room);

    // searchStudentInfo
    List<Student> selectStudentInfo(Student student);

    // modifyHouseparentDetail
    int updateHouseparentDetail(Houseparent houseparent);

}
