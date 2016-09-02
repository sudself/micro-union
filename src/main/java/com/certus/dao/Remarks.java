package com.certus.dao;

public class Remarks {
    private Integer id;

    private Integer sampleTypeId;

    private String content;

    private Integer index;

    private Byte type;
    
    public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

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