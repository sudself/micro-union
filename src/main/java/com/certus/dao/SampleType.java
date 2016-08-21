package com.certus.dao;

public class SampleType {
    private Integer id;

    private String sampleType;

    private Byte ifBottomcode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSampleType() {
        return sampleType;
    }

    public void setSampleType(String sampleType) {
        this.sampleType = sampleType == null ? null : sampleType.trim();
    }

    public Byte getIfBottomcode() {
        return ifBottomcode;
    }

    public void setIfBottomcode(Byte ifBottomcode) {
        this.ifBottomcode = ifBottomcode;
    }
}