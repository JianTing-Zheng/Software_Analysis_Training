package com.scut.service.Impl;

import com.scut.dao.AdminDao;
import com.scut.domain.*;
import com.scut.service.AdminService;
import com.scut.domain.DormitoryAndRoom;
import com.scut.utils.ReadExcel_DormitoryAndRoom;
import com.scut.utils.ReadExcel_Houseparent;
import com.scut.utils.ReadExcel_Student;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminDao adminDao;

    @Override
    public List<Student> searchStudent() {
        return adminDao.selectStudent();
    }

    @Override
    public int addStudentSeparately(Student student) {
        return adminDao.insertStudentSeparately(student);
    }

    @Override
    public int delStudentSeparately(Student student) {
        return adminDao.deleteStudentSeparately(student);
    }

    @Override
    public String addStudentBatch(MultipartFile file) {
        String result = "";

        // 创建处理Excel的类
        ReadExcel_Student readExcel_student = new ReadExcel_Student();

        // 解析Excel
        List<Student> studentList = readExcel_student.getExcelInfo(file);
        if(studentList != null && !studentList.isEmpty()) {
            for(int i = 0; i < studentList.size(); i++) {
                Student student = studentList.get(i);
                adminDao.insertStudentSeparately(student);
            }
            result = "上传成功";
        }
        else {
            result = "上传失败";
        }

        return result;
    }

    @Override
    public Student searchStudentDetailInfo(Student student) {
        return adminDao.selectOneStudent(student);
    }

    @Override
    public int modifyStudentDetailInfo(Student student) {
        return adminDao.updateStudentDetail(student);
    }

    @Override
    public int modifyAdminDetailInfo(SuperAdmin superAdmin) {
        return adminDao.updateAdminDetail(superAdmin);
    }

    @Override
    public SuperAdmin searchAdminDetailInfo() {
        return adminDao.selectAdmin();
    }

    @Override
    public List<Houseparent> searchHouseparent() {
        return adminDao.selectHouseparent();
    }

    @Override
    public int addHouseparentSeparately(Houseparent houseparent) {
        return adminDao.insertHouseparentSeparately(houseparent);
    }

    @Override
    public int delHouseparentSeparately(Houseparent houseparent) {
        return adminDao.deleteHouseparentSeparately(houseparent);
    }

    @Override
    public String addHouseparentBatch(MultipartFile file) {
        String res = "";

        // 创建处理Excel的类
        ReadExcel_Houseparent readExcel_houseparent = new ReadExcel_Houseparent();

        // 解析Excel
        List<Houseparent> houseparentList = readExcel_houseparent.getExcelInfo(file);
        if(houseparentList != null && !houseparentList.isEmpty()) {
            for(int i = 0; i < houseparentList.size(); i++) {
                Houseparent houseparent = houseparentList.get(i);
                adminDao.insertHouseparentSeparately(houseparent);
            }
            res = "上传成功";
        }
        else {
            res = "上传失败";
        }

        return res;
    }

    @Override
    public Houseparent searchHouseparentDetailInfo(Houseparent houseparent) {
        return adminDao.selectOneHouseparent(houseparent);
    }

    @Override
    public int modifyHouseparentDetailInfo(Houseparent houseparent) {
        return adminDao.updateHouseparentDetail(houseparent);
    }

    @Override
    public List<Dormitory> searchDormitory() {
        return adminDao.selectDormitory();
    }

    @Override
    public int addDormitorySeparately(Dormitory dormitory) {
        return adminDao.insertDormitorySeparately(dormitory);
    }

    @Override
    public int delDormitorySeparately(Dormitory dormitory) {
        return adminDao.deleteDormitorySeparately(dormitory);
    }

    @Override
    public String addDormitoryAndRoomBatch(MultipartFile file) {
        String res = "";

        // 创建处理Excel的类
        ReadExcel_DormitoryAndRoom readExcel_dormitoryAndRoom = new ReadExcel_DormitoryAndRoom();

        // 解析Excel
        List<DormitoryAndRoom> dormitoryAndRoomList = readExcel_dormitoryAndRoom.getExcelInfo(file);
        if(dormitoryAndRoomList != null && !dormitoryAndRoomList.isEmpty()) {
            for(int i = 0; i < dormitoryAndRoomList.size(); i++) {
                DormitoryAndRoom dormitoryAndRoom = dormitoryAndRoomList.get(i);
                Dormitory dormitory = new Dormitory();
                dormitory.setDormID(dormitoryAndRoom.getDormID());
                dormitory.setNumOfFloor(dormitoryAndRoom.getDormNumOfFloor());
                int isExistDormitory = adminDao.isExistDormitory(dormitory);
                if(isExistDormitory == 1) {
                    adminDao.updateDormitoryDetail(dormitory);
                }
                else {
                    adminDao.insertDormitorySeparately(dormitory);
                }

                Room room = new Room();
                room.setRoomID(dormitoryAndRoom.getRoomID());
                room.setDormID(dormitoryAndRoom.getDormID());
                room.setNumOfFloor(dormitoryAndRoom.getRoomNumOfFloor());
                room.setRoomCapacity(dormitoryAndRoom.getRoomCapacity());
                room.setRoomState(dormitoryAndRoom.getRoomState());
                int isExistRoom = adminDao.isExistRoom(room);
                if(isExistRoom == 1) {
                    adminDao.updateRoomDetail(room);
                }
                else {
                    adminDao.insertRoomSeparately(room);
                }
            }
            res = "上传成功";
        }
        else {
            res = "上传失败";
        }

        return res;
    }

    @Override
    public List<DormitoryAndRoom> searchDormitoryDetailInfo(Dormitory dormitory) {
        return adminDao.selectDormitoryDetail(dormitory);
    }

    @Override
    public int addRoomSeparately(Room room) {
        return adminDao.insertRoomSeparately(room);
    }

    @Override
    public int delRoomSeparately(Room room) {
        return adminDao.deleteRoomSeparately(room);
    }

    @Override
    public int handleApplication(Application application) {
        Date date = new Date();
        application.setHandleTime(date);
        String state = application.getApplyState();
        String applytype = application.getApplyType();
        //同意申请
        if (state.equals("1")) {
            //入住申请或调宿申请
            if (!applytype.equals("3")) {
                String sID = application.getsID();
                String intention = application.getApplyIntention();
                String dormID = intention.substring(0, intention.indexOf("-"));
                String roomID = intention.substring(dormID.length() + 1, intention.length());
                int roomState = adminDao.selectionRoom(dormID, roomID, sID);
                if (roomState == 4) {
                    //申请意向满人了，直接返回
                    application.setApplyState("2");
                } else {
                    //没满，改宿舍，再返回
                    if (applytype.equals("2")) {
                        //如果是调宿
                        Room preRoomState = adminDao.selectRoomState(sID);
                        String preRoomID = preRoomState.getRoomID();
                        if (preRoomID != null) {
                            //宿舍状态删去，并且按意愿
//                            adminDao.decreaseRoomState();
                            adminDao.deleteStutentRoom(application);
                        }
                    }
                    adminDao.changeStudentRoom(application);
                }
            }
            //不同意
        }
        return adminDao.handleApplication(application);
    }


    @Override
    public List<Application> displayApplications() {
        return adminDao.selectApplications();
    }

}
