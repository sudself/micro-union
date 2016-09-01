package com.certus.bo;

import java.util.Date;

public class SampleBo extends BaseBo {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1422952730956932432L;

	private Integer start;
	
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	private Integer id;

    private String hospitalCode;

    private String bottleCode;

    private Integer sampleType;

    private String patientInfo;

    private Date receiveTime;

    private String status;

    private Integer userid; 
    
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getHospitalCode() {
		return hospitalCode;
	}
	public void setHospitalCode(String hospitalCode) {
		this.hospitalCode = hospitalCode;
	}
	public String getBottleCode() {
		return bottleCode;
	}
	public void setBottleCode(String bottleCode) {
		this.bottleCode = bottleCode;
	}
	public Integer getSampleType() {
		return sampleType;
	}
	public void setSampleType(Integer sampleType) {
		this.sampleType = sampleType;
	}
	public String getPatientInfo() {
		return patientInfo;
	}
	public void setPatientInfo(String patientInfo) {
		this.patientInfo = patientInfo;
	}
	public Date getReceiveTime() {
		return receiveTime;
	}
	public void setReceiveTime(Date receiveTime) {
		this.receiveTime = receiveTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	@Override
	public void setPage(int page) {
		super.setPage(page);
		this.start = (page-1)*this.getRows();
	}
	@Override
	public void setRows(int rows) {
		super.setRows(rows);
		this.start = (this.getPage()-1)*this.getRows();
	}
}
