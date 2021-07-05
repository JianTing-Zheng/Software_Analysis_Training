package com.scut.domain;

public class DormitoryAndRoom {

    private String dormID;
    private String dormNumOfFloor;
    private String roomID;
    private String roomNumOfFloor;
    private String roomCapacity;
    private String roomState;

    public String getDormID() {
        return dormID;
    }

    public void setDormID(String dormID) {
        this.dormID = dormID;
    }

    public String getDormNumOfFloor() {
        return dormNumOfFloor;
    }

    public void setDormNumOfFloor(String dormNumOfFloor) {
        this.dormNumOfFloor = dormNumOfFloor;
    }

    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public String getRoomNumOfFloor() {
        return roomNumOfFloor;
    }

    public void setRoomNumOfFloor(String roomNumOfFloor) {
        this.roomNumOfFloor = roomNumOfFloor;
    }

    public String getRoomCapacity() {
        return roomCapacity;
    }

    public void setRoomCapacity(String roomCapacity) {
        this.roomCapacity = roomCapacity;
    }

    public String getRoomState() {
        return roomState;
    }

    public void setRoomState(String roomState) {
        this.roomState = roomState;
    }
}
