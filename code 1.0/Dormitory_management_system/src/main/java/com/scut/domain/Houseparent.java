package com.scut.domain;

public class Houseparent {

    private String hID;
    private String hName;
    private String hSex;
    private String hIDcardNo;
    private String hPassword;
    private String hPhoneNumber;
    private String hEmail;
    private String dormID;

    public String gethID() {
        return hID;
    }

    public void sethID(String hID) {
        this.hID = hID;
    }

    public String gethName() {
        return hName;
    }

    public void sethName(String hName) {
        this.hName = hName;
    }

    public String gethSex() {
        return hSex;
    }

    public void sethSex(String hSex) {
        this.hSex = hSex;
    }

    public String gethIDcardNo() {
        return hIDcardNo;
    }

    public void sethIDcardNo(String hIDcardNo) {
        this.hIDcardNo = hIDcardNo;
    }

    public String gethPassword() {
        return hPassword;
    }

    public void sethPassword(String hPassword) {
        this.hPassword = hPassword;
    }

    public String gethPhoneNumber() {
        return hPhoneNumber;
    }

    public void sethPhoneNumber(String hPhoneNumber) {
        this.hPhoneNumber = hPhoneNumber;
    }

    public String gethEmail() {
        return hEmail;
    }

    public void sethEmail(String hEmail) {
        this.hEmail = hEmail;
    }

    public String getDormID() {
        return dormID;
    }

    public void setDormID(String dormID) {
        this.dormID = dormID;
    }
}
