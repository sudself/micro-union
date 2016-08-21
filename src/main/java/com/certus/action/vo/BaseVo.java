package com.certus.action.vo;

import java.util.Date;

/**
 * 基础Vo
 * 
 * @author zhoudr
 * 
 */
public class BaseVo {

	/** 主键 */
	private Long id;

	/** 插入时间 */
	private Date insertTime;

	/** 更新时间 */
	private Date updateTime;

	/** 回收标志位 */
	private short recycleSign;

	/** 错误 */
	private Error error;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public short getRecycleSign() {
		return recycleSign;
	}

	public void setRecycleSign(short recycleSign) {
		this.recycleSign = recycleSign;
	}

	public Error getError() {
		return error;
	}

	public void setError(String errorCode, String errorDetail) {
		this.error = new Error(errorCode, errorDetail);
	}

	@SuppressWarnings("unused")
	private class Error {
		private String errorCode;

		private String errorDetail;

		Error(String errorCode, String errorDetail) {
			this.errorCode = errorCode;
			this.errorDetail = errorDetail;
		}
	}
}
