/**
 * 
 */
package com.certus.utils;

import java.io.Serializable;

/**
 * @author Ledkk
 *	用于页面分页,排序等vo的公共接口
 */
public class VoGridModel implements Serializable {
	private static final long serialVersionUID = 1L;

	private int page=1;// 当前页
	private int rows;// 每页显示记录数
	private String sidx;// 排序字段名
	private String sord;// 按什么排序(asc,desc)
	
	private int start;//从start开始
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	@Override
	public String toString() {
		return "VoGridModel [page=" + page + ", rows=" + rows + ", sidx="
				+ sidx + ", sord=" + sord + ", start=" + start + "]";
	}
	
	
}
