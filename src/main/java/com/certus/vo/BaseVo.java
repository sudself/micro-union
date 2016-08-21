package com.certus.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class BaseVo implements Serializable {
	private static final long serialVersionUID = -8708006995487588756L;
	private int rows;
	private int page;
	private String sortName;
	private String sortType;

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
