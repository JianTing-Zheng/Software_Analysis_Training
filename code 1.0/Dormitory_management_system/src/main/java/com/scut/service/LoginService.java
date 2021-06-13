package com.scut.service;

public interface LoginService {

    // identity: 0(student) 1(houseparent) 2(administrator)
    int isMatching(String id, String password, int identity);

}
