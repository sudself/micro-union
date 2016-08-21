package com.certus.dao;

public class DetectResult {
    private Integer id;

    private Integer detectTypeId;

    private String content;

    private Integer index;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }
}