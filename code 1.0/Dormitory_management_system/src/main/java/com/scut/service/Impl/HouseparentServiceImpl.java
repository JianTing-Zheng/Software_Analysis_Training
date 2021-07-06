package com.scut.service.Impl;

import com.scut.dao.HouseparentDao;
import com.scut.domain.Houseparent;
import com.scut.domain.Room;
import com.scut.domain.Student;
import com.scut.service.HouseparentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class HouseparentServiceImpl implements HouseparentService {

    @Resource
    private HouseparentDao houseparentDao;

    @Override
    public List<String> displayDormitoryInfo(Houseparent houseparent) {
        List<String> res = new ArrayList<>();
        // 添加管理的宿舍楼号
        Houseparent houseparentDetail = houseparentDao.selectHouseparentDetail(houseparent);
        res.add(houseparentDetail.getDormID());

        // 添加管理的宿舍楼包含的宿舍间数
        Room room = new Room();
        room.setDormID(houseparentDetail.getDormID());
        int roomAmount = houseparentDao.selectRoomAmount(room);
        String strRoomAmount = String.valueOf(roomAmount);
        res.add(strRoomAmount);

        // 添加管理的宿舍楼包含的空闲宿舍间数
        int freeRoomAmount = houseparentDao.selectFreeRoomAmount(room);
        String strFreeRoomAmount = String.valueOf(freeRoomAmount);
        res.add(strFreeRoomAmount);

        // 添加管理的宿舍楼包含的总床位数
        int bedAmount = houseparentDao.selectBedAmount(room);
        String strBedAmount = String.valueOf(bedAmount);
        res.add(strBedAmount);

        // 添加管理的宿舍楼包含的已入住人数
        int checkInAmount = houseparentDao.selectCheckInAmount(room);
        String strCheckInAmount = String.valueOf(checkInAmount);
        res.add(strCheckInAmount);

        return res;
    }

    @Override
    public List<Student> searchStudentInfo(String hID, Student student) {
        Houseparent hp = new Houseparent();
        hp.sethID(hID);
        Houseparent houseparent = houseparentDao.selectHouseparentDetail(hp);
        student.setDormID(houseparent.getDormID());

        List<Student> res = houseparentDao.selectStudentInfo(student);
        List<Student> students = new ArrayList<>();
        for(int i = 0; i < res.size(); i++) {
            if(student.getRoomID() != "") {
                if(student.getsID() != "") {
                    if(res.get(i).getRoomID().equals(student.getRoomID()) && res.get(i).getsID().equals(student.getsID())) {
                        students.add(res.get(i));
                        continue;
                    }
                }

                if(res.get(i).getRoomID().equals(student.getRoomID())) {
                    students.add(res.get(i));
                    continue;
                }
            }

            if(student.getsID() != "") {
                if(res.get(i).getRoomID().equals(student.getRoomID()) && res.get(i).getsID().equals(student.getsID())) {
                    students.add(res.get(i));
                    continue;
                }
            }

            students.add(res.get(i));
        }
        return students;
    }

    @Override
    public Houseparent displayHouseparentInfo(Houseparent houseparent) {
        return houseparentDao.selectHouseparentDetail(houseparent);
    }

    @Override
    public int modifyHouseparentDetail(Houseparent houseparent) {
        return houseparentDao.updateHouseparentDetail(houseparent);
    }

}
