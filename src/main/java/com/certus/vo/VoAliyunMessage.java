package com.certus.vo;

import java.io.Serializable;

public class VoAliyunMessage implements Serializable {
	private static final long serialVersionUID = 4148973599641275756L;

	private String status ="success";
	private String message;

	@Override
	public String toString() {
		return "VoAliyunMessage [status=" + status + ", message=" + message
				+ "]";
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
