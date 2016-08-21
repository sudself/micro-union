package com.certus.vo;

public class AccountVO extends BaseVo {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8779542946310143617L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	private Integer id;
	
	private String name;
	
	public Integer getVmNumber() {
		return vmNumber;
	}

	public void setVmNumber(Integer vmNumber) {
		this.vmNumber = vmNumber;
	}

	public Integer getTempNumber() {
		return tempNumber;
	}

	public void setTempNumber(Integer tempNumber) {
		this.tempNumber = tempNumber;
	}


	private Integer vmNumber;
	
	private Integer tempNumber;
	
}
