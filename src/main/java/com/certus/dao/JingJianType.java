package com.certus.dao;

public class JingJianType {
    private Integer id;

    private Integer detectTypeId;

    private String jingJianType;

    private String extra1;

    private String extra2;

    private String extra3;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDetectTypeId() {
        return detectTypeId;
    }

    public void setDetectTypeId(Integer detectTypeId) {
        this.detectTypeId = detectTypeId;
    }

    public String getJingJianType() {
        return jingJianType;
    }

    public void setJingJianType(String jingJianType) {
        this.jingJianType = jingJianType == null ? null : jingJianType.trim();
    }

    public String getExtra1() {
        return extra1;
    }

    public void setExtra1(String extra1) {
        this.extra1 = extra1 == null ? null : extra1.trim();
    }

    public String getExtra2() {
        return extra2;
    }

    public void setExtra2(String extra2) {
        this.extra2 = extra2 == null ? null : extra2.trim();
    }

    public String getExtra3() {
        return extra3;
    }

    public void setExtra3(String extra3) {
        this.extra3 = extra3 == null ? null : extra3.trim();
    }
}