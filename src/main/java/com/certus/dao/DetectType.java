package com.certus.dao;

public class DetectType {
    private Integer id;

    private Integer sampleTypeId;

    private String detectMethod;

    private String detectType;

    private String printPrefix;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSampleTypeId() {
        return sampleTypeId;
    }

    public void setSampleTypeId(Integer sampleTypeId) {
        this.sampleTypeId = sampleTypeId;
    }

    public String getDetectMethod() {
        return detectMethod;
    }

    public void setDetectMethod(String detectMethod) {
        this.detectMethod = detectMethod == null ? null : detectMethod.trim();
    }

    public String getDetectType() {
        return detectType;
    }

    public void setDetectType(String detectType) {
        this.detectType = detectType == null ? null : detectType.trim();
    }

    public String getPrintPrefix() {
        return printPrefix;
    }

    public void setPrintPrefix(String printPrefix) {
        this.printPrefix = printPrefix == null ? null : printPrefix.trim();
    }
}