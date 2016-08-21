package com.certus.dao;

import java.util.Date;

public class Detects {
    private Integer id;

    private Integer sampleId;

    private Integer sampleTypeId;

    private Integer detectTypeId;

    private Date printTime;

    private Integer printUserId;

    private String codeNo;

    private Date dealTime;

    private Integer dealUserId;

    private String status;

    private Integer childId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSampleId() {
        return sampleId;
    }

    public void setSampleId(Integer sampleId) {
        this.sampleId = sampleId;
    }

    public Integer getSampleTypeId() {
        return sampleTypeId;
    }

    public void setSampleTypeId(Integer sampleTypeId) {
        this.sampleTypeId = sampleTypeId;
    }

    public Integer getDetectTypeId() {
        return detectTypeId;
    }

    public void setDetectTypeId(Integer detectTypeId) {
        this.detectTypeId = detectTypeId;
    }

    public Date getPrintTime() {
        return printTime;
    }

    public void setPrintTime(Date printTime) {
        this.printTime = printTime;
    }

    public Integer getPrintUserId() {
        return printUserId;
    }

    public void setPrintUserId(Integer printUserId) {
        this.printUserId = printUserId;
    }

    public String getCodeNo() {
        return codeNo;
    }

    public void setCodeNo(String codeNo) {
        this.codeNo = codeNo == null ? null : codeNo.trim();
    }

    public Date getDealTime() {
        return dealTime;
    }

    public void setDealTime(Date dealTime) {
        this.dealTime = dealTime;
    }

    public Integer getDealUserId() {
        return dealUserId;
    }

    public void setDealUserId(Integer dealUserId) {
        this.dealUserId = dealUserId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Integer getChildId() {
        return childId;
    }

    public void setChildId(Integer childId) {
        this.childId = childId;
    }
}