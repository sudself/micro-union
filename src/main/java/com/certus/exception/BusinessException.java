package com.certus.exception;

public class BusinessException extends Exception {

	private static final long serialVersionUID = -7024986072834842549L;

	private String errorCode;

	private String errorDetail;

	protected Object[] params = null;

	public BusinessException(String errorCode, String errorDetail) {
		this.errorCode = errorCode;
		this.errorDetail = errorDetail;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorDetail() {
		return errorDetail;
	}

	public void setErrorDetail(String errorDetail) {
		this.errorDetail = errorDetail;
	}

	public Object[] getParams() {
		return params;
	}

	public void setParams(Object[] params) {
		this.params = params;
	}
}
