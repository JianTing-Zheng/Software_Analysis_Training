package com.scut.domain;

public class Student {

    private String sID;
    private String sName;
    private String sSex;
    private String sIDcardNo;
    private String sEnrollYear;
    private String sPassword;
    private String sPhoneNumber;
    private String sEmail;
    private String dormID;
    private String roomID;
    private String livingState;
    private String schoolState;

    public String getsID() {
        return sID;
    }

    public void setsID(String sID) {
        this.sID = sID;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getsSex() {
        return sSex;
    }

    public void setsSex(String sSex) {
        this.sSex = sSex;
    }

    public String getsIDcardNo() {
        return sIDcardNo;
    }

    public void setsIDcardNo(String sIDcardNo) {
        this.sIDcardNo = sIDcardNo;
    }

    public String getsEnrollYear() {
        return sEnrollYear;
    }

    public void setsEnrollYear(String sEnrollYear) {
        this.sEnrollYear = sEnrollYear;
    }

    public String getsPassword() {
        return sPassword;
    }

    public void setsPassword(String sPassword) {
        this.sPassword = sPassword;
    }

    public String getsPhoneNumber() {
        return sPhoneNumber;
    }

    public void setsPhoneNumber(String sPhoneNumber) {
        this.sPhoneNumber = sPhoneNumber;
    }

    public String getsEmail() {
        return sEmail;
    }

    public void setsEmail(String sEmail) {
        this.sEmail = sEmail;
    }

    public String getDormID() {
        return dormID;
    }

    public void setDormID(String dormID) {
        this.dormID = dormID;
    }

    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public String getLivingState() {
        return livingState;
    }

    public void setLivingState(String livingState) {
        this.livingState = livingState;
    }

    public String getSchoolState() {
        return schoolState;
    }

    public void setSchoolState(String schoolState) {
        this.schoolState = schoolState;
    }
}
