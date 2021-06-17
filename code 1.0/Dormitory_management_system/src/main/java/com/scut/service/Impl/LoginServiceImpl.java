package com.scut.service.Impl;

import com.scut.dao.LoginDao;
import com.scut.domain.SuperAdmin;
import com.scut.domain.Houseparent;
import com.scut.domain.Student;
import com.scut.service.LoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LoginServiceImpl implements LoginService {

    @Resource
    private LoginDao loginDao;

    @Override
    public int isMatching(String id, String password, int identity) {
        int res = 0;
        if(identity == 0) {
            Student student = new Student();
            student.setsID(id);
            student.setsPassword(password);
            res = loginDao.correctStudent(student);
        }
        else if(identity == 1) {
            Houseparent houseparent = new Houseparent();
            houseparent.sethID(id);
            houseparent.sethPassword(password);
            res = loginDao.correctHouseparent(houseparent);
        }
        else if(identity == 2) {
            SuperAdmin superAdmin = new SuperAdmin();
            superAdmin.setaID(id);
            superAdmin.setaPassword(password);
            res = loginDao.correctAdministrator(superAdmin);
        }
        return res;
    }

}
