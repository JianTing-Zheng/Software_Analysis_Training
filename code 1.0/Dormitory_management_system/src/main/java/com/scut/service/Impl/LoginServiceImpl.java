package com.scut.service.Impl;

import com.scut.dao.LoginDao;
import com.scut.domain.Administrator;
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
            student.setId(id);
            student.setPassword(password);
            res = loginDao.correctStudent(student);
        }
        else if(identity == 1) {
            Houseparent houseparent = new Houseparent();
            houseparent.setId(id);
            houseparent.setPassword(password);
            res = loginDao.correctHouseparent(houseparent);
        }
        else if(identity == 2) {
            Administrator administrator = new Administrator();
            administrator.setId(id);
            administrator.setPassword(password);
            res = loginDao.correctAdministrator(administrator);
        }
        return res;
    }

}
