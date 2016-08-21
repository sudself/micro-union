package com.certus.utils;

import java.io.Serializable;
import java.util.Arrays;

public class PaginationModel implements Serializable {

	private static final long serialVersionUID = 3492130723647355234L;
	private int page;
	private int total;
	private int records;
	private Object[] rows;
	
	private String message = "sucess";
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getRecords() {
		return records;
	}

	public void setRecords(int records) {
		this.records = records;
	}

	public Object[] getRows() {
		return rows;
	}

	public void setRows(Object[] rows) {
		this.rows = rows;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "PaginationModel [page=" + page + ", total=" + total
				+ ", records=" + records + ", rows=" + Arrays.toString(rows)
				+ ", message=" + message + "]";
	}
}
