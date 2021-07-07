package com.scut.domain;

import java.util.Date;

public class Application {
    private String sID;
    private String applyID;
    private String applyType;
    private String applyReason;
    private String applyIntention;
    private Date applyTime;
    private String applyState;
    private Date handleTime;

    public String getsID() {
        return sID;
    }

    public void setsID(String sID) {
        this.sID = sID;
    }

    public String getApplyID(){
        return applyID;
    }

    public void setApplyID(String applyID){
        this.applyID=applyID;
    }

    public String getApplyType() {
        return applyType;
    }

    public void setApplyType(String applyType){
        this.applyType=applyType;
    }

    public String getApplyReason() {
        return applyReason;
    }

    public void setApplyReason(String applyReason) {
        this.applyReason = applyReason;
    }

    public String getApplyIntention() {
        return applyIntention;
    }

    public void setApplyIntention(String applyIntention) {
        this.applyIntention = applyIntention;
    }

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    public String getApplyState() {
        return applyState;
    }

    public void setApplyState(String applyState) {
        this.applyState = applyState;
    }

    public Date getHandleTime() {
        return handleTime;
    }

    public void setHandleTime(Date handleTime) {
        this.handleTime = handleTime;
    }
}
